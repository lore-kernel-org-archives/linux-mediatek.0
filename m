Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E51CC98328
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLKc66fcC+JNVwgHdi/2vbRPcicTKmn6g9qNXOjPoho=; b=VDb1mIzYkqOimAIDknbAjmo8vh
	DACimPVWr0CI1RhYg9cfPPIeVS5VAO9g4KJ+aI6uPFeiuAJhqz2ShjijFBTz5sNNos1+L2GRv4kEJ
	T1imzWlEngPVEpT4InVm2mCwjH3tgDkXtxRkIMpifqlSpt8NgstY/4aV0zXyImegp8DswgcwGMo9L
	qP2qdi/dgfS7iq8kpBf5K5l4blwGLJbwOlHHartvD1AJBIMHsJs1upP0DtYmitvhkRhijA8jsPGf7
	CkL/vW00M6Z9zyXSB3zRT81cbrUT+mMeEyVlLL1o+7H1RQeWoanjY+wbWKf/HaGmTIjbCrceUV9XZ
	1LQ/2CGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAc4-0000000E8Z9-47Nh;
	Fri, 25 Sep 2026 18:25:36 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbc-0000000E8D1-2bd1
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 18:25:09 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so7352585e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360707; x=1790965507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RLKc66fcC+JNVwgHdi/2vbRPcicTKmn6g9qNXOjPoho=;
        b=JsUhnN5AQdL1Xjc3Xjt7nBfU1+I7oWaobwUJf0V1ncBq0JQgjAIW8WZ+OBorH/hOQ2
         iiaBq7wUHeXF6jRGKiqcwKP/mDI7hWNLUazdXzECU8OG+8jFhFeOxzEEuR9Uznsu+A/u
         QxVK9TtwCNCdgpG6wkIACgJrA29Ti95GxnC5CJWAFsFeHSmoeLwTdGnG9j3gTDfSnVhu
         7EosN+vyOPJuMsGmjWZSsGzoeLqBZAEGKyOi/n1aivK91qkjaXrHPN5d7RlBwPU9PI+9
         igPsGxYoxi6LjrLkR/5Inb+9pxAuPFUgXncRG8PGo9OuDIoiU1dS3M9RkswYhjowfswh
         ywUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360707; x=1790965507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RLKc66fcC+JNVwgHdi/2vbRPcicTKmn6g9qNXOjPoho=;
        b=HZqjGRg62FsMKOE3ndfma32aDwsXS0n969/lPc5vaaRsF62/WDQ4+AAvdDcyjmr4lQ
         E2fhxd1XVYe+H5ckbBhlq6hkQasiLPJOVoKNv/swuMzq8P9Sry84EbE1oDSLrkL/fcyH
         /YTUl2O3K0Lx5GRfBp1YRzYwohn1Aygwj0puXwFpVs8NzIpD5y1jJpxLadO6dPspVx00
         psSVo0CWV95LYPSaeDKU1o4OLvCOSgi44lvgme597z/aAny3wL1BROI8Zg1vmCxBu2WK
         YAHXYgNI7qvM8ta76cgh7pK5h69iNYTs4TwIWCJuzONtkkSp83vZuGXYYJV58PM0ft4a
         kczA==
X-Forwarded-Encrypted: i=1; AKwUvBxsTgwSPuJekgQd2eznL8dPthIVYd4/aoFBmJFygKFQwOdhGDX95Yy1hfZEjvmsT10UTe4ctF5kZKxJxMgkXg==@lists.infradead.org
X-Gm-Message-State: AFuF++n6AK+OjYPK02u4mT3ZU+Rz1EseqRpnY6OqDgZpE9dMBMMrzAf+
	/kjhn/9rrDQ+kbHaeUPBhDSAP6iMfcYuDfV+lnL13/UtO8fmz2MoD/Vg
X-Gm-Gg: AYBFou3Ar/D3J/ocTv5ZLNZIbRhGgMjcsPmZ1p0XTMlT3t++JrBb4KXAceKLRIoc4ux
	p+CMwJcwFoINA3ZzVfZR1ZvC+GZrNG+sc0OLSDAXraQPSuvTX1D1SMtAJodYnwTC0LQXe5EHlBD
	Q+wT9APQ3J06eYWrZlHig77Orxs+vv9ChjksOuWyXceojpdEg3qyMb+J0HhI1L4eeKCWAAIefux
	3ZtBzEXa0m9nA2haulieC0zGDmxdtYq6Hmwwiv7RTfUIsHyi17SmZcI/3NH3c8cvnHhA4dqTE2a
	W2225oxL+6ARwhBI7u5atGtzg0t/usGmutD0SFZeHAS40LQ0pMb/7AAWMlSeSvqXkIWITnbBIHg
	1unRfpIE7+FsRZUKuKw2vIhz9ElcGIAjqlNRcddtr+Jlm62QcRV0najXOx8LyWZmFs5cPDOJNyR
	F1Kazzi+VvfySMBx2k90m6CdN8wqxPd4rQhwx005YIM1FM/jJ9jpvNXkcNqJHTQdLvSwwYa3+h7
	+1byz1m3fWPEBUIsDwXHfFnZm1667p+4Fzo4GiiS31ythcT420+XhVlTtuWdoVzQBQY25Xa7W8=
X-Received: by 2002:a05:600c:3107:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ff06e502dmr57684725e9.16.1790360706918;
        Fri, 25 Sep 2026 11:25:06 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:25:06 -0700 (PDT)
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
Subject: [PATCH net-next v23 6/9] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Fri, 25 Sep 2026 20:24:28 +0200
Message-ID: <20260925182435.21207-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112508_708548_064566E2 
X-CRM114-Status: GOOD (  18.03  )
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


