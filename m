Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4D7CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLdtf9AkfZZtftPmO+QTmZhKFxRRSQewBGWvAuWXxX0=; b=gxWwM2mwRu5YOBliEbX5knESrq
	n4OIwcZQPWmhJD3Q7tSwqbAnYzdSqiNYCS5IRelcE1/QFMG2iTCgD5iu2Emqsg2jD7sTUo9kDH/6M
	sMb8DrtkNooCf0Ut8jwyJ+40PDjoFb+BuZSTme/OwYIJmayMh/2vRZExRz3+5IXqBQ3kDZIaBooGW
	oF5g29wJ9KTYbS61m/G8mbu8Df6ullhWSDiHtInDWt5/QffvenOoRN18apeDGaeNNi++pAssri3er
	mHpSZOY+ePohVFQXi0Qe3OWAHg0FNROCEP+d+XRTEs3xCyJ7RNJV97tj4uy7aVDV/80cdTTDHA/qq
	/aag5HjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03sn-0000000362N-0Whk;
	Sun, 13 Oct 2024 19:04:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kj-000000034ZY-1NrV;
	Sun, 13 Oct 2024 18:55:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a99ea294480so159782966b.2;
        Sun, 13 Oct 2024 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845739; x=1729450539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLdtf9AkfZZtftPmO+QTmZhKFxRRSQewBGWvAuWXxX0=;
        b=b0ao2SQPI6t/KSVRWJyPFnIqPSBYJfGPXewn9/gU+Wi7OPEEujdSX2ISx7ggjXG6V5
         za5kLg4GBcVBh0mvVKZusDGNluDgMP6ohxG6poBvZpiGuIUPiKyFt8gGUM+Gl0EzKcdk
         hQYg9DMqcSj+NwSN9+aObNKU2XMG/cBU2ETWAsxhogbdF/GEloCETwv7z9q91+kYSYDL
         YpyZ0ask+1bpo6wvaJAsyWA9HbCDx4ROURD+i1XKCryFSYbzu1VgTqpHVPN3U6MU6Dnr
         0A7w/6eNVtKVdfduHrJkYr+tBUrafOVCmavqqpozGSdYdfJ17ELOYUd1hccRLQbwB/I5
         rq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845739; x=1729450539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLdtf9AkfZZtftPmO+QTmZhKFxRRSQewBGWvAuWXxX0=;
        b=TP/hmoFVBxlIey3RnG1xDjqXdCIK7sQ3K78iafkS3jKYunTiiJ/xOREyp3uIsWZebG
         wFLXD+6EaFNsE+LT8BT2KbLDdZNTayC85rL0pgf/kr++dHLY+WbsaA84FKnRpL+4lQxu
         R8Go4X06zv1HtIOqHY5nBmrNGk2+IYnFEIijGyky8xYIyH5FV8xqFQ3/GuBPeer9VFBe
         vZNoJnCcIg9t4lN2un2SSfwJ0nT4FRGYUH06oDcwD6bkhyR2CiUrvLYEm2A+qwK+SZ0A
         sDZ1xkn+QxfAxjUNdi+jFA6+sMZPTd+ZEzSySGGrbhrMDHXrUWGtM848PjnRVX1hluEf
         Cw/A==
X-Forwarded-Encrypted: i=1; AJvYcCU7BgV1vBy+Fo4pz4Pf63QRv4jiJs6SsiniPUQqk/+wUgbKlH4+hr0leZSmXLjSnpA9JaFaPdtOr0wJ9szqBjo=@lists.infradead.org, AJvYcCWGv1ryJNqjTSjEvlJrcCiyIWO2sUAW4ILsoMMhwKz1RvQDrk7qhaVegHV1vxgtX0SW7s4vT8UrZUMy5U38iIre@lists.infradead.org
X-Gm-Message-State: AOJu0YzcYTG/XYTWO+z01b/KOUO2Qxm/BiXW/eYyHyL6TzrqNvLOuhuU
	goQ7pjmGQNBANAGxkjlkBGBDZvq6ks7mzq+8dT2y9wCPTrA1BISP
X-Google-Smtp-Source: AGHT+IFGmTnwONoCtYAAkw85QCQZ49i2r3KEyVZKqIg/rOT96DkANV9Cgr1YZGISZ8fGwYKHbFWZBA==
X-Received: by 2002:a05:6402:51cd:b0:5c9:492c:f7fa with SMTP id 4fb4d7f45d1cf-5c95ac09939mr9913132a12.1.1728845739130;
        Sun, 13 Oct 2024 11:55:39 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:37 -0700 (PDT)
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
Subject: [PATCH RFC v1 net-next 05/12] bridge: br_fill_forward_path add port to port
Date: Sun, 13 Oct 2024 20:55:01 +0200
Message-ID: <20241013185509.4430-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115541_388207_CC5FCAF8 
X-CRM114-Status: GOOD (  12.72  )
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

If handed a bridge port, use the bridge master to fill the forward path.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_device.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 26b79feb385d..e242e091b4a6 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -384,15 +384,25 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 				struct net_device_path *path)
 {
 	struct net_bridge_fdb_entry *f;
-	struct net_bridge_port *dst;
+	struct net_bridge_port *src, *dst;
+	struct net_device *br_dev;
 	struct net_bridge *br;
 
-	if (netif_is_bridge_port(ctx->dev))
-		return -1;
+	if (netif_is_bridge_port(ctx->dev)) {
+		br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
+		if (!br_dev)
+			return -1;
+
+		br = netdev_priv(br_dev);
 
-	br = netdev_priv(ctx->dev);
+		src = br_port_get_rcu(ctx->dev);
 
-	br_vlan_fill_forward_path_pvid(br, ctx, path);
+		br_vlan_fill_forward_path_pvid(br, src, ctx, path);
+	} else {
+		br = netdev_priv(ctx->dev);
+
+		br_vlan_fill_forward_path_pvid(br, NULL, ctx, path);
+	}
 
 	f = br_fdb_find_rcu(br, ctx->daddr, path->bridge.vlan_id);
 	if (!f)
-- 
2.45.2


