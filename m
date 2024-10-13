Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE659CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/jTDX+7O0s0C1nzOWVEkFl+nOrYzHK0gi2J/aQ3w10=; b=hU/7fbgMZbbIslhlEAHYYQi6wA
	PvJeF4KXZWhm7Rir+EEbQtPmx3u7aDX0e0b2/38DmgegykGmlTEQDnZ3/iYUsxPR8xNehhe43Wk8N
	S05WSjeX+m+qesU1Bdn8b6Bi15KhORATg32ylY56bmxv+xv1vc6ZsULMtKrVDNmOWkz/2Q+gT/Dpf
	wipFxUYz6CokE6wDD3MhVUkt5JREAaP4HvpbfRE6htXuBgQQyC4cl8o+xjXNC6WvCXQBZ8HePK2f5
	TTxMVID4nK5J8XS79a7hegOGRHZn+bFQpkiKzqbuj/Aek2TLc1r0DzKkMUay6T/y0TASUfJDnK9KE
	rJnUWpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03u8-0000000369L-03WB;
	Sun, 13 Oct 2024 19:05:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kk-000000034Zj-1Uaz;
	Sun, 13 Oct 2024 18:55:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9944c4d5d4so524625166b.0;
        Sun, 13 Oct 2024 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845740; x=1729450540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/jTDX+7O0s0C1nzOWVEkFl+nOrYzHK0gi2J/aQ3w10=;
        b=NHpuVOD0SodI+JzDziOxaDohwF8AlGMMnuKzdAF4KDMyEJQpyrUfC7Fu+BY1P0448g
         2f3bmw6ulyLHAOB2M1P5h4k9jYmUgs6LVKTq1xNVoWyeKNemyGesCQYPa7hDej27wWwP
         aV1nHlfpcLGGnJ/X3NOtCEl0eTiKrsbsTTa0VECfMG5rjc1jZpK3VolCaEco8X/HchNe
         KwK8iHD5faHErL0x1pMctVlJDIIsFe0Rd2Cro7FU3PuqS423m1ernt0SrSyvcyAqL5ps
         xTV5knyI0iiPQmqUFH98miObPFbfHv+OjdhuGEAcW0F9Ox0lRuBMoP6i+Fur37jrCQHb
         7Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845740; x=1729450540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/jTDX+7O0s0C1nzOWVEkFl+nOrYzHK0gi2J/aQ3w10=;
        b=Cz/hDZ8fH5qcvSj05T6jDFDSocgYnu73qG2nAjW+DXxUK+KtpdK8GW8ZzQ7ZQbWeFe
         lj21TQplhLEgxGHUaDIJOwVgL80DKlZbFTOfu7wLHdo0SQgCiK3E/7gLRhfU72dn+xtr
         7gI/eM//QVV1h/kLbGeKMUv31uUsCO6T3P5K/O4BEO8qPexTNvJkp4paIoBfjJOMtOfj
         h86t1cFnw9y+2ulHaVa6wiSBKnKQKMy5MJFFyKFrsko0ACs1SFXPxQq6D6cZoGfxAwzs
         USeUKed0h0mDtvIDwlqV5JFJMIiSrTWeOx1FVMo+3E5w3rWbWGRTdwayvA+MXf3s5+bZ
         +Nqw==
X-Forwarded-Encrypted: i=1; AJvYcCU76zVr5pclwABwSxGODK5Uc+kNwztQrk4GWQNtY3oLx+maS9kpoA/H48p4nXUSspPAAx2MVNoFMkykqMQrRYc=@lists.infradead.org, AJvYcCUwgQyfZd3Jpk1SUW7oFVfoYzsTtARfNplYFqUtPp7VOK/wtBeoGqnuG68gGlVcaEGimXixjeRFZsa75Ehsm6AK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94n4XcDbz0iz2XDQBxysEBsAo9GIFlMYzdXZWzfFtDVkGC7K4
	cWmgn703FuEXQewHsufo58HLbVR9XcqB0ECzGynp8gRGEg9Df/ot
X-Google-Smtp-Source: AGHT+IF5ckEcH2Maqlc37cAezXjDdy5PfJSuqGGD7BCfFPOKEOulLZNTMAaU6eD/aTsuVoJCroKnXA==
X-Received: by 2002:a17:907:7b9e:b0:a9a:11cf:2a73 with SMTP id a640c23a62f3a-a9a11cf3a9fmr36014066b.64.1728845740471;
        Sun, 13 Oct 2024 11:55:40 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:39 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next 06/12] net: core: dev: Add dev_fill_bridge_path()
Date: Sun, 13 Oct 2024 20:55:02 +0200
Message-ID: <20241013185509.4430-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115542_415492_89049988 
X-CRM114-Status: GOOD (  16.93  )
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

New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
It handles starting from a bridge port instead of the bridge master.
The structures ctx and nft_forward_info need to be already filled in with
the (vlan) encaps.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h |  2 +
 net/core/dev.c            | 77 ++++++++++++++++++++++++++++++++-------
 2 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index e87b5e488325..9d80f650345e 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3069,6 +3069,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index cd479f5f22f6..49959c4904fc 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -713,44 +713,95 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
-			  struct net_device_path_stack *stack)
+static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
+					struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
-	stack->num_paths = 0;
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
+
+	return ret;
+}
+
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack)
+{
+	const struct net_device *last_dev, *br_dev;
+	struct net_device_path *path;
+	int ret = 0;
+
+	stack->num_paths = 0;
+
+	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
+		return -1;
+
+	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
+	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
+		return -1;
+
+	last_dev = ctx->dev;
+	path = dev_fwd_path(stack);
+	if (!path)
+		return -1;
+
+	memset(path, 0, sizeof(struct net_device_path));
+	ret = br_dev->netdev_ops->ndo_fill_forward_path(ctx, path);
+	if (ret < 0)
+		return -1;
+
+	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
+		return -1;
+
+	if (!netif_is_bridge_master(ctx->dev))
+		return dev_fill_forward_path_common(ctx, stack);
+
+	path = dev_fwd_path(stack);
+	if (!path)
+		return -1;
+	path->type = DEV_PATH_ETHERNET;
+	path->dev = ctx->dev;
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
+
+int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+			  struct net_device_path_stack *stack)
+{
+	struct net_device_path_ctx ctx = {
+		.dev	= dev,
+	};
+
+	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
+
+	stack->num_paths = 0;
+
+	return dev_fill_forward_path_common(&ctx, stack);
+}
 EXPORT_SYMBOL_GPL(dev_fill_forward_path);
 
 /**
-- 
2.45.2


