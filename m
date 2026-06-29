Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71D0C43602
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=; b=ETHeJtaW123rHG8w+PdzC4STrp
	rd0A9ytoYy0k8g4cPVDo2zrKeLrzAza9C1QvQojdw9H8p/H0OEXlH4+10ZmIaO3PCewBg1vvsnEx6
	cSc8mZH9ZUkBbr6KKI6czB69PlOk/ckXjDZqECYu5cweLdLW8qC1lXpZhZTAZJrekS+Uw1x+ob4NK
	Ej22PNGKkiSIpAyo8XHZsr30EdCtokFawwai+WeBRQextlr8H3+rbgyZbZjXY8Oq3yXUIgiH2b7Zg
	QoTDyIIuv4dzjfa4zFH+5weabCmSVyIyHWxPEMXpdSh2JPVf6RM9obtKf8kKzcQ5o5OMXF6T4+Zxo
	D/LCWrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAr-0000000EZ5y-3mZA;
	Mon, 29 Jun 2026 12:33:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAp-0000000EZ3Z-22s7
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso6086805a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736394; x=1783341194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=EAaGjOoddTSMf0yva/EnSZ3dm0n7tg/KD0zy+EBYokV6vczoGBqZpxdHsxRurhxvhs
         aiw6TxPHaZ+mKrbxQs+PyxjLTRPzp7yHKu2LHiYwwnGvA7TKDkFkpAWlcM0DgOEx4i1k
         N2pqH3EbKLLA2lpEfqZ2sVjpYInWElo0PQcNd23VDT/FKjWoTMFuQyhyJlbbIE/vDr7A
         lrx1jGU/8JcHY3B78C7oWNjL/LOqDxAAMhEcxTXotegH9zmmnGX3AcvmfsPQwlLBkMwF
         zodR128wJeeVg3cefAKhtojYWJrpsMs/TSD7rbR/SrwahCfTF05TEXCaeYHH06jaxMJM
         8mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736394; x=1783341194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=W4sBIdu/ChBHlGG93FLNN7pZRvwyai8O3vgOZLC5pm4g55hEtQisz+xVMVFF6RqVj9
         UzpWgJdU3YiVg+vWbJiGtLMQO1F2Yza3bPfIL8KZSk1dg4WwO2B3YtFyIfSTqCOmzv4E
         zerZDkWyG8K24iR2sHTrmOsWpZ1OmGhrgiD5KL/3+wxhmi0NvK9ylsHOcKOZswSimVHg
         blQPxwJv80QeiRVJO/qyw90W38tiYzkqUO2hC1TLuI8//KzVqTID982zWNKBsgAfDPiz
         O3NNZabKE9q/8LjHUqXv/BF67q+a/k67fPZt1wBCmHzuB72+S9/pTAz6rj6OelEtm42L
         0wNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6N88X+wMjWPWpwnzVMUy/xUSSM1nmJi0bq/lC5PnpJognxuUWnaAwUEDoWKbHZBc3RklkTWdYWEe1svuvzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YytFLaD/sYAaJXh6oUQfI2zrZEhszwBsXTpPmL0PAYH2zsLhRMT
	9Tg7fbF3eGLDUZM/blKJ+vi5joje5PiqOIjU4bg0xAqNUakPywGd7FR7
X-Gm-Gg: AfdE7cnl1z68t9Y8sGJ7IWnVx/y1rpCwQ1a31OHoLLI5ClFer4tJBapydvswgM7bPjJ
	/D1CM0AxgN2EhCzTDim5qoDaIRLjMOCLco6fw/x8oU6v+HUQVDs+2cjtWq/97Ca8SuiKyIfS3Se
	te4Sh5VTzqmSopyDPkoX8Ay48tTMYTS9W2iMAvevaqXpBiONwyGR6FnvEIkO+48rDaGE6dKUxpJ
	En7J83O/aAv0UpXxEJUXewN++3HksIRxJimRC51WfsX9jea1mcOXwYEpBRG95loROiPBehV6aDW
	BPrX3KqQX5nNlbQKep6AYZNo/FNaI4XGWEHsWVHf+NVP9qeoom103RYiuLOU5QuUe9RuFBNa0UM
	zIRectXpp9xwj9JFVblsTaLct0mYiQ2+Rr+m2LmG2YT1klGemqCiTtCo9OQbKxGErkJSp6fSUZK
	KHdM6OAoE=
X-Received: by 2002:a17:906:fd86:b0:c12:717a:1d79 with SMTP id a640c23a62f3a-c12813744d6mr19854666b.5.1782736393241;
        Mon, 29 Jun 2026 05:33:13 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:10 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 1/5] net: export __dev_fill_forward_path
Date: Mon, 29 Jun 2026 14:32:49 +0200
Message-ID: <20260629123253.1912621-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053315_538525_310212D2 
X-CRM114-Status: GOOD (  14.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryan Chen <rchen14b@gmail.com>

Export __dev_fill_forward_path() which accepts a caller-supplied
net_device_path_ctx, allowing callers to pre-populate context (e.g.
VLAN state) before the forward path walk. The existing
dev_fill_forward_path() is refactored to call it.

This is a prerequisite for nft_flow_offload bridge offload, which needs
to supply a pre-populated ctx for bridge port devices.

Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 32 ++++++++++++++++++++------------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9981d637f8b5..c1d0b897de95 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3422,6 +3422,8 @@ int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
+int __dev_fill_forward_path(struct net_device_path_ctx *ctx, const u8 *daddr,
+			    struct net_device_path_stack *stack);
 struct net_device *dev_get_by_name(struct net *net, const char *name);
 struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
 struct net_device *__dev_get_by_name(struct net *net, const char *name);
diff --git a/net/core/dev.c b/net/core/dev.c
index 4b3d5cfdf6e0..62f1d0b64c76 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -750,44 +750,52 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
-			  struct net_device_path_stack *stack)
+int __dev_fill_forward_path(struct net_device_path_ctx *ctx, const u8 *daddr,
+			    struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
+	memcpy(ctx->daddr, daddr, sizeof(ctx->daddr));
 	stack->num_paths = 0;
-	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
-		last_dev = ctx.dev;
+	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
+		last_dev = ctx->dev;
 		path = dev_fwd_path(stack);
 		if (!path)
 			return -1;
 
 		memset(path, 0, sizeof(struct net_device_path));
-		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
+		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
 		if (ret < 0)
 			return -1;
 
-		if (WARN_ON_ONCE(last_dev == ctx.dev))
+		if (WARN_ON_ONCE(last_dev == ctx->dev))
 			return -1;
 	}
 
-	if (!ctx.dev)
+	if (!ctx->dev)
 		return ret;
 
 	path = dev_fwd_path(stack);
 	if (!path)
 		return -1;
 	path->type = DEV_PATH_ETHERNET;
-	path->dev = ctx.dev;
+	path->dev = ctx->dev;
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__dev_fill_forward_path);
+
+int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+			  struct net_device_path_stack *stack)
+{
+	struct net_device_path_ctx ctx = {
+		.dev	= dev,
+	};
+
+	return __dev_fill_forward_path(&ctx, daddr, stack);
+}
 EXPORT_SYMBOL_GPL(dev_fill_forward_path);
 
 /* must be called under rcu_read_lock(), as we dont take a reference */
-- 
2.54.0


