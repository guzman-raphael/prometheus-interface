FROM alpine:3.11
RUN \
    apk add curl && \
    # KUBECTL
    mkdir ${HOME}/.kube && \
    curl -L $(echo "https://storage.googleapis.com/kubernetes-release/release/\
		$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)\
		/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl | tr -d '\n' | tr -d '\t') && \
    chmod +x /usr/local/bin/kubectl
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["reconnect_dashboard"]