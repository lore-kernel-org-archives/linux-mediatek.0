Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE62C5DF70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+Mvy67q6/dC+Gf4rHVcYavXLL8OqK8NuZ1lfl7xWvo=; b=KnwosF8gSZBYrfS1xAYi1E7Iwg
	C5oexUV1bYvCmqX6GV4tKQbWmS06J9e4KrJbkMXUqvyEydQ8kdf5jYuTCb6cUZrJHoZYubF0tbHNz
	UF3J5Y2XnDTmqaz8si494sjXQRz6+znPWiZU5/7gC97QYwj+GSez4MTI1GVh2Ncge+2N6XbYQXJzi
	ppktX5AgzZAjIjY4l9R5sC1hpJCt07U70SHIfk1vO19PYRzsu6tEFy+ALMo80top14l/5lxSx+dO+
	otWfwdD716H6dfIQSIax+HK6gTksgKSpjd7ml/IEe86kTUL0ftAYO5vzpBHdTE51sn6Y45KfO47m0
	DefCuthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsae-00000005ejF-3Kdm;
	Mon, 17 Aug 2026 08:21:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaX-00000005eYe-1s0q
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so22774135e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954856; x=1787559656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+Mvy67q6/dC+Gf4rHVcYavXLL8OqK8NuZ1lfl7xWvo=;
        b=SMaGI7L9xFqn/5T1zVD1m73T3axqjEVnumAsEJDrVWjAzY5qRosSeJZbIiJJjFpyrN
         x1RX8HphAa/9qlVia3PS5XrSjE55ZEPHJX7wRbWUjIecZDKdh4YIA9hv/wEMIcO3a6Qi
         ElqZaoqgh29Crdlp+2sQ0hm3MCJfqYPDjlWN2/0ZL5hNkHR2ZvwW/WlcSZ7OrVtnue/r
         hPsukZdowdqaV8Np1/gYL+PqjTDHO1a+j07WK9egn7bDsjkLduVVfM1Ou1HVSQgGYLuS
         fx4G2dHv23WpPKTj1+bxk5Atr0/9NKSQLFGeCwnCgHihR7C7AuJcLQm8zGEnKxC5xd/p
         jedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954856; x=1787559656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+Mvy67q6/dC+Gf4rHVcYavXLL8OqK8NuZ1lfl7xWvo=;
        b=YwmV+Rblfmwy12+NajclVuWh/qLT68V2JtLd01D7tUCig5ptw6rZpK650cm/UGdUrX
         YrdxnrbdDLwoQnJAhZoMog1NjJXWzWW8KkdRorAGsdt2Zcn45rHAGQhmDuwJHCBcgd37
         hWubbJswEPWnHXTHgQoFiX+wyx/xbU0pD9NSQ33LoVZrAO/0U1gKBaXS8ezWVXfKpcMW
         pFsZCk2IzkhWxnG6IAB76XrYwJ9p4Eec2aOFcTCiB+2JBzYMspvYebXLhmVhZhue5PJ2
         OqpcH0gGf4UCiIQwdaHAyg2CJxiiOgltjLv8D9sDzBAKHpHYYnB8FBrxVcve2XevL8F+
         nSnw==
X-Forwarded-Encrypted: i=1; AHgh+RoE4r955OLmo9wZ05LIeNtKE0l+uyn3ymN7ZWunByfsJ4Z7bpfb+eXU7wGCtCZO8LY5HaDetFRrHNrWepGONw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP47YhwaZq5pBD/BEODJBATdWo9lL8jIFRnqkP+iKSzCDMI5Yv
	Y4bLDS5LkB00iegsjjXaeIh8DfuE5eAD7XVctX2cS5LRUo+6BJzxgTCu
X-Gm-Gg: AR+sD11Gvbg0jfCyXng1byxtkUwnIA3bKT8nah47sBM5nPJh1HgGEL4G88+u5kFOfom
	KRvD3icYpcmNDadQ6CLZyCw+0/TWHuQEgzXrHW93me6TJPkBsiMJmRHsUoCNzwEVxJVO0MRkK9E
	MWg3b544Xu1LeLLyRkZk2Gw38UhJwwgprhc1IFx8tMFMHmB+U65Krom5c/8LIZhtdTq7/Uc3Yj6
	idqGJ+r4wCKx2URACCNhQ0t7/askuyaBGmPj9SKoJWyuuRy8rLyg2G2Ai/GwWBJD2VkH7bOJtu3
	y3vtrB0/bQWI4F9jY3bm9PTPRucuNiltuJCMqfIAa67KHrS+X4WvLPfmFnGs0jp2G8tVUG5x3D2
	sIZD8IQgpEV1duRNN60vQ//pVpw+h93oyKKhQwhsHCW083xlA8ZCky9Z4cukheJVaBjEFYe+L6t
	61GrI3K5d1bp4IO02Y3WLByHmNEE/a+XR8+JKQIVFjezjj2PdWBgivixbFTOivR2kZwPmmN/wL9
	leqkK8WCdlTrbambsq3ggX3+Lel+y2zDFv15+Z7Hlgflt2CjcbHv0YL
X-Received: by 2002:a05:600c:6749:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-4999a2ef9b6mr62184645e9.2.1786954855688;
        Mon, 17 Aug 2026 01:20:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 06/10] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Mon, 17 Aug 2026 10:20:28 +0200
Message-ID: <20260817082034.20326-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012057_528986_D5D81960 
X-CRM114-Status: GOOD (  17.90  )
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

Add variant of the MTK TAG for Airoha Switch and comments about difference
between Airoha AN8855 and Mediatek tag bitmap.

Airoha AN8855 doesn't support controlling SA learning and Leaky VLAN
from tag. Although these bits are not used (and even not defined for
Leaky VLAN), it's worth to add comments for these difference to prevent
any kind of regression in the future if ever these bits will be used.

Rework the makefile, config and tag driver to better report to
external tool (like libpcap) the usage of this variant with a dedicated
"Airoha" name.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/net/dsa.h |  2 ++
 net/dsa/Kconfig   | 11 +++++++++++
 net/dsa/Makefile  |  2 +-
 net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 6f7f5c17b532..396c1e520852 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -60,6 +60,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_MXL862_VALUE		32
 #define DSA_TAG_PROTO_NETC_VALUE		33
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
+#define DSA_TAG_PROTO_AIROHA_VALUE		35
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -74,6 +75,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index d5e725b90d78..510055d7b1f3 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -24,6 +24,13 @@ config NET_DSA_TAG_NONE
 	  Say Y or M if you want to enable support for switches which don't tag
 	  frames over the CPU port.
 
+config NET_DSA_TAG_AIROHA
+	tristate "Tag driver for Airoha switches"
+	select NET_DSA_TAG_MTK_COMMON
+	help
+	  Say Y or M if you want to enable support for tagging frames for
+	  Airoha switches.
+
 config NET_DSA_TAG_AR9331
 	tristate "Tag driver for Atheros AR9331 SoC with built-in switch"
 	help
@@ -98,8 +105,12 @@ config NET_DSA_TAG_EDSA
 	  Say Y or M if you want to enable support for tagging frames for the
 	  Marvell switches which use EtherType DSA headers.
 
+config NET_DSA_TAG_MTK_COMMON
+	tristate
+
 config NET_DSA_TAG_MTK
 	tristate "Tag driver for Mediatek switches"
+	select NET_DSA_TAG_MTK_COMMON
 	help
 	  Say Y or M if you want to enable support for tagging frames for
 	  Mediatek switches.
diff --git a/net/dsa/Makefile b/net/dsa/Makefile
index b8c2667cd14a..fb8c359d6ef9 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_NET_DSA_TAG_GSWIP) += tag_gswip.o
 obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
 obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
 obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
-obj-$(CONFIG_NET_DSA_TAG_MTK) += tag_mtk.o
+obj-$(CONFIG_NET_DSA_TAG_MTK_COMMON) += tag_mtk.o
 obj-$(CONFIG_NET_DSA_TAG_MXL_862XX) += tag_mxl862xx.o
 obj-$(CONFIG_NET_DSA_TAG_MXL_GSW1XX) += tag_mxl-gsw1xx.o
 obj-$(CONFIG_NET_DSA_TAG_NETC) += tag_netc.o
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index c7dc7731675e..f8087d768da6 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -11,6 +11,7 @@
 #include "tag.h"
 
 #define MTK_NAME		"mtk"
+#define AIROHA_NAME		"airoha"
 
 #define MTK_HDR_LEN		4
 #define MTK_HDR_XMIT_UNTAGGED		0
@@ -18,6 +19,9 @@
 #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
+/* AN8855 doesn't support SA_DIS and Leaky VLAN
+ * control in tag as these bits doesn't exist.
+ */
 #define MTK_HDR_XMIT_SA_DIS		BIT(6)
 
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
@@ -99,6 +103,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
 	return skb;
 }
 
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
 static const struct dsa_device_ops mtk_netdev_ops = {
 	.name		= MTK_NAME,
 	.proto		= DSA_TAG_PROTO_MTK,
@@ -107,8 +112,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
 	.needed_headroom = MTK_HDR_LEN,
 };
 
-MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
-MODULE_LICENSE("GPL");
+DSA_TAG_DRIVER(mtk_netdev_ops);
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
+#endif
 
-module_dsa_tag_driver(mtk_netdev_ops);
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
+static const struct dsa_device_ops airoha_netdev_ops = {
+	.name		= AIROHA_NAME,
+	.proto		= DSA_TAG_PROTO_AIROHA,
+	.xmit		= mtk_tag_xmit,
+	.rcv		= mtk_tag_rcv,
+	.needed_headroom = MTK_HDR_LEN,
+};
+
+DSA_TAG_DRIVER(airoha_netdev_ops);
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
+#endif
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
+	&DSA_TAG_DRIVER_NAME(mtk_netdev_ops),
+#endif
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
+	&DSA_TAG_DRIVER_NAME(airoha_netdev_ops),
+#endif
+};
+
+module_dsa_tag_drivers(dsa_tag_driver_array);
+
+MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
+MODULE_LICENSE("GPL");
-- 
2.53.0


