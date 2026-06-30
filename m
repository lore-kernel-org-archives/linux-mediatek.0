Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB7AC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=; b=uyGOXoNXDYaynBN5c9jLIltn7t
	BgLmMv8bYbabFIGGRdJztBzzSzg0OpIpH8iVRhW0u9hn1dmKOmZqFAt3LvqRYaJO3CRKtqejmgAX1
	BzzyxhY/TfUyyr9p9AvlsAT4lE+doyXnnIv+PI/XVi8p/9VoxZpoQxjJtxiamLReKqS+NVfEoBuYT
	AgupJuag16dhZ27T7Ix2uPVO1+/NAPp5AxDPIA9alposfF4JAq1oDJduG/nb13aM/r/u+v5NOYXw7
	24sjgYE63u4ywIojqlVmqD9NqOiXQfMO/JnmjR9QBKpvb9OdThYZXwa5er4doExvOVwyZc/Itspid
	GGY5FvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQH-0000000G37A-3kcq;
	Tue, 30 Jun 2026 06:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQA-0000000G31Z-1wRr
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=; b=Xk5wDZ1GV/+1tSySE34OLz85fl
	x0RYvPQVwYYiKWeBcB/FEFL3T/bPrYxN6CQwHUSX9brb2SQB5iiMNxQ3nGpy3KOHE25zCVBD1L3CF
	GE8oZyxkBmCgazqtGFTgtETeB47jBX8mzFDYWXXwhRX4gRpUF9Jas/IZvFd4tXaJoGzIbL/dGIoDN
	1WPWx0V0pMCOguSTHms1Xji1unTMe30s2Paaj0szXeNZD9fuFbqT6oheFhpAUBTly8Yz2wXPrYObA
	i9vqLNtCLfHJoOxLZkrHRaGHwigPwLc7SP64hwVvoPxys1GgzgfrFoCZrC/CaccJjZNwU4/nyfGE1
	FuBqymfA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weSPw-00000001aG1-1xeG
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so611568f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802678; x=1783407478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=ZFuaEO9Pt6PvJctUH0dnIyOG/zbNudo5Auzu3WTZ88LGD+yFjRsNNrRwhHbQyxAC10
         IQgiCCvlApUqtofaD9VcazQK8FuC6BdCiGxUqDhRlxy5UbS7x5SSSRgxg0K9CzLdlNg7
         /3hEzrIIZ8sYciYm3XXESx4T83G2lRTw2hex77ZrZqsIpFF/CneaN/Ji+Uh+1va/gE1u
         mxKHiQPrL9+wZHQmDNax6erBoEbY2sk/N6nFtVPypyuUmC+L76Vr3QUyC69UMUU9EZFN
         bBO2Li6tm5I5JCGP4qQTu+coHlhGi/88klhR2z+hI4GspNpO2J+f4ruZGcZ1DnrzSBNI
         wgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802678; x=1783407478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=A62kKkCGEGVJURXo7XUH4RssgFLWYHMh7TIHy4WOIXUfxQrgkEz5tShBPnn+0KK1AW
         XGh2ALvENWuh/4Q24pIK4XOJiVsvEPdbUIJPfFRVHJkn6ZA264GxVa1FN9Mac5JTziZU
         6Nfo8z5QA8T6qPBNawsbl93pT8WkS4LUvNV46EdBJUztjd+mgcRQFLvjkqpY0fEiAHED
         u4lWYiEcdlxwvmiKvdTKQua9G7vS1fOg1IfJMPFdIIuqhDxnGDuEZAUo6fmLBayFsdrX
         DU5BaYiCsq9ZnDgTP5A9T8ZcRt3t982deNQA0DVfXKrKJ9HdmyGLPaqkyTQsGnoh7gbv
         BSfA==
X-Forwarded-Encrypted: i=1; AFNElJ9+hclHsSFDqKtNNCqzFOjuy6hKa/qDNAXMBbuDBTxtc3ylYtPKTsK81siMDPCS6tBWnyZvjsdLMasn9DDLHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybqQBo1vv3C8xuAQQMqWnwSw/SucRzmGp3UU1hY8LCmLlatzyF
	PfG9FKp2l45914kEsJFPyZtJA0tjXs7NLkVtK9L5Y7TF/6Cpsr6NcnMD
X-Gm-Gg: AfdE7cmyO+uhY17aL0EoFg8kYaw6sZogN1TsDEXI2ClBJWOY2MbQRgqQ+6AMGFS7F+N
	5vgRh3BKARMbSU1yHilQn8PSVuiXCQP4iqIl3ej0BI0RESoW5dKoW2moM3J6d236ipsT57yyrM6
	N5hDsMvuuIlHxMWygQYJy9VhuXfzaQqoSiuPnZh477ILfBLc4PBMFcjvu3cJx7gJynjjqJlVlox
	2yuLSZaQZw4A/LbkekyFWRQ9d0tK1aLYaeBJr8BuYeoeXlWvYQqcyOPZQZ96E7f8pbx9SsFdcQD
	Wu/ABya5d6bTxOAn8NPucTtntrhqE4qp7L/Hhf/BynZUrojxZk1034SrlOluh358/W2xkIhx280
	eS3dglmNKmfZw9ju7kA/r6tbZmqZS5OdLheW4BMMtbHmUOs77r5Yg7bnao90UHQ6S4ALI7Sd3ug
	aqiOG1hdU=
X-Received: by 2002:a05:600c:c4a8:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-493b82b556emr34781705e9.28.1782802678147;
        Mon, 29 Jun 2026 23:57:58 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:57:57 -0700 (PDT)
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
Date: Tue, 30 Jun 2026 08:57:31 +0200
Message-ID: <20260630065735.3341614-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075809_451237_6D791A88 
X-CRM114-Status: GOOD (  14.43  )
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


