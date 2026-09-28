Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EAECA5FA6
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbIAcFETs7Fo7Fiw9hweWROaB2K6gpG5L37UCuTLIIU=; b=ZSUY84Kbd92kDh4ksJsxnktiH/
	fWxCtr/Y7MG/4WWQlb8Au4s0pmX5EKkgv3cAlM/8WOPADEUJ2QGE2jQqwsRtEFujejaJViX6evOm/
	Pico2NxBViaEaBGZUoX5nsxSGiol68GHS/FD03ciYR2pQ0ZMg1QoE5LLFCz48YuTLpca7EJwrZi9y
	w9IDq6dcf4r3qjLeiE/jhP5jN2woBfV+vrXy6iojQUEa5mOVcJ6Dd7MJm70a5LsFMIV9gMe2DoGGa
	WE5jcy4WiP2J8lkIUhDtAVAF5Ng6bx7PqiqD7TYDoMJUBqKU+9zcQfgax0W2Lp4wD7+iuEJgmPj4L
	lXFi/mpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHJH-00000001Uwi-0qLF;
	Mon, 28 Sep 2026 19:46:47 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIf-00000001UXn-1igu
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:10 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887d06c669so2653904f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624768; x=1791229568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbIAcFETs7Fo7Fiw9hweWROaB2K6gpG5L37UCuTLIIU=;
        b=jolvIjZHJMwgr4+AqopzYwCc9ekf4Ed2JbFPf8h0JExf1Lk2Sc+KyYrfUm+0xeK5hT
         cOOqRTmfQoBfRwI3w5e63WFM0Ny4CyII7zTyIJxS7RWYnC7H6q1N19fLzX52cFbklgef
         9vWL97HVVtI7Cl0/WEnODi9hd38osRsGScbPwmYttWbtOHvSez7SXouHlbLUJWdO88kR
         Yq+ihQXUtKBQ63XpCZBcBGaVZNCwGqRzH1NEyFx+7z2/Ax4KJobdpQ/tTWaIZ3dDqPqZ
         wvINe4aawiSMYX3c6GszZrh4hXB64bSGaIun2Es4KAniDmO2YMuAijklw037nI2d0hRV
         IFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624768; x=1791229568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbIAcFETs7Fo7Fiw9hweWROaB2K6gpG5L37UCuTLIIU=;
        b=NnDW0WM8sztGCkd/62mHJhq9l8Jzb/qzLLhl7NALK8KbJF73wBfsSUUF+eEy8k/0KF
         ksMKSrw0W1UVSzq/auHYAdhrGdGAGdVBd9vYchkXkUTej/tE9u1oQ/7gntIQcRjYAXVA
         AvLjuHjcXImze/opyu9j210xc/HYef96sk9oO7bZiuJGUGfcIbJKBJDSHna2UmKc01xs
         j6fEya2Zn2XnjntgZim1U0gktTMulckWKy709Ig0GUPmH+3QsOCJHFwd8x58Ji134cHz
         71M1ZAaYg3oG2rvfyxAeVOL+wWb6+hwMhLf0Z61AD9CixyspzaWDGtY4iZWFHh8dR0kc
         SMVg==
X-Forwarded-Encrypted: i=1; AKwUvBzMmNIXnxC2GlESDr6KuKblc8hvRWDoHiagvCXiNEZjKrVLDyLM3acOpgHzVEfIiFdJwRa1QmJJk7hXELsNYg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJITI5R2ozUtrz4O/nKCQ5IlgWOHBkdY3e/dU8RGgbDHHr06qhM
	+euZMYHYjm226OIXO1WLB2XmxNl+W3obmcTi1KEGKz1K3t6txqKTmlUK
X-Gm-Gg: AYBFou0Gd4fBAtZFNSJbF8zJh+/9aq9MeuMyvmSJQmqPRN6bmJM5R/2BWwu8IWW8EIi
	Go/tJTMa28qvVyWn6LmaCzACiH4AtcGhGHlJOxdc7HgTd0wf/2yvhQrwcrkVSuSKj4lZJOf5D7J
	EWk7BQGw3SCtBzV1Lb0eXCmRge22kDQUbN1xscgB0UNFlJHEXPvNcv/K+FH10/3bHOaRJCrrcrw
	Z5j6GkCQRj4Uw/rV26HxArziUbT/p8stXt0L0XUvncGRMOIgq5d59SOHFeQ6Xu7kKtD9uAkgNJj
	qTlQ6NP+FnZ2nhyruv9UmxFAlchEuwMDMt4AVbmSM9u/g9s+8SnsIzLEvb7ZsJb1gKVw6ucmsJa
	8Jb01NqjA5wokembnDfuh3ThvrjUDgLRSrevEoCOESFfPwK5YHI3tpsPiofOpXmK3/aojLAZONz
	y/nm7g2IVQGKvoiy7AEUkxkzAQfh74vT2dWqy0aKf5CjyFYJuTy6LKG7ik0c/THxUerWzh1ME+b
	E9Fncg6ZkZ2gCOeQhD7arfBjXjKwOkFGldwQPe9+/y5ru4tiFYmbqeodJgSqGJa
X-Received: by 2002:a05:6000:40d9:b0:487:342:d148 with SMTP id ffacd0b85a97d-48872ac7199mr23494967f8f.38.1790624767700;
        Mon, 28 Sep 2026 12:46:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:46:07 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v24 06/10] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Mon, 28 Sep 2026 21:45:05 +0200
Message-ID: <20260928194511.41878-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124609_494906_322B83E8 
X-CRM114-Status: GOOD (  18.52  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 include/net/dsa.h |  2 ++
 net/dsa/Kconfig   | 11 +++++++++++
 net/dsa/Makefile  |  2 +-
 net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..9824c63ad50b 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -62,6 +62,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
+#define DSA_TAG_PROTO_AIROHA_VALUE		37
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -76,6 +77,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 4f44bf3ede23..28a249f04a43 100644
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
@@ -104,8 +111,12 @@ config NET_DSA_TAG_MT7628
 	  Say Y or M if you want to enable support for tagging frames for the
 	  switch embedded in the MT7628 SoC.
 
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
index 1f9cc30e9988..7ccaa528a989 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -29,7 +29,7 @@ obj-$(CONFIG_NET_DSA_TAG_KS8995) += tag_ks8995.o
 obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
 obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
 obj-$(CONFIG_NET_DSA_TAG_MT7628) += tag_mt7628.o
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
2.55.0


