Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E79C63798
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:46:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9EA52137B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aUHVVquP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puwQs1Jg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9EA52137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uh4hhKxLWmmtPero0cmklozCQ3YVZikj59YRXE2DK+A=; b=aUHVVquP5VTwVtJclk6MUpVjjG
	Ais+UXvYKYhKMgKSvO7A4oZcI4zXewPd+z00j+LS61umYajlza5IqGL08lOCqdQlx4qAKPjgsn9Aw
	sLITHU6ObekmfrURUVWV46XC93ZOx7gq63eNZU6P5Rg9JJsVuW8ltg0n7U78w0w7V2wOAfSMphrrT
	WDDkAH0Ecm8MOzSMsGFoP51R0tw6amxNnL5rH9ct/73UkYNT0pte74zcFdIrxtF3jtSQXgQvd/VWh
	nClBXb1bJyC4apn9awqpXE/F2RoZbUGBHnHCmdyeth2N7xDLkFkSm76x3zzZjcBv2L/J7QvKMjhf0
	+Ro/x3eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh2nX-0001Eo-SM; Mon, 23 Nov 2020 03:45:51 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh2nT-0001DJ-6f; Mon, 23 Nov 2020 03:45:48 +0000
Received: by mail-lj1-x244.google.com with SMTP id y10so1005820ljc.7;
 Sun, 22 Nov 2020 19:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UU8EP5wBKEQP6da8/PNv0YuofmsT1cYlYb+MrY2uJNM=;
 b=puwQs1JgTJ5JRiyxJapv349RmvdEYM882XwnQgxN1WO1XZ/4rIpFptI3nk84L3L1Hf
 5i95Ku69I51Zru18c78/2JpAew8jGPCHz3QlT/eR+0SLwEBh3tjxGlwlsy7GiXXI7rzo
 78cdYl1p0ca4UiXeWwQbXaWYL6cmT38E9KXNOhWmNqYXoePp7Re01tF478Yki+Y9n5SH
 /ttTph36ZcidX5kH2moF64VDHZin68Cklzmq7ckt7FP6L3PTO39iW5XOBEvvQESErIT1
 zqPoEnqjtZzhb4hbvk1E4ZFxy634LaqtNXgrq2iFjb+6aegWMriXDKar/YuMiyCN58eP
 6+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UU8EP5wBKEQP6da8/PNv0YuofmsT1cYlYb+MrY2uJNM=;
 b=PQYwDAcObQNn+UX7taECNip1yt2LicAkMlfjR25AfT09Q35SaZnuy3WG5my1xuX1PK
 9MtzgcvUN8sl5X19PJbfdoYdDzWDZ+eRVlcyDVFUukET8A1KDVrx3Gm0D38EP8IpjRYX
 J/7gYeHk1xZtosRepu58JrIAlJ6CtMN1v9HUgEblXwP5E0SvcaNE/+szdhQWHVvXLtsY
 SZuhi4Mi+1F32Tb1ROEfqijt7T2NxiZhuUo+kJQfSuhEXnRDmMDad0lNPMaye3XKyNfF
 Vzo7cAGy8mvjzSjnsFrLoPlbrQf4YNKMUqDQCBznTFXvFv+JeQdQ5mrz1PfwGamyNOrK
 RHNQ==
X-Gm-Message-State: AOAM531hnlG5/xzpPlF053EyZyGfVnf5h5+D4OEU7lUk4UiIpdU/bc8W
 CFjbugyizKKB0nCj5rYQVMhmu+vNUVGt3A==
X-Google-Smtp-Source: ABdhPJzETsKeKiB7E7nu5SY0i/2zCu1rLnuLi1ddHAgRWYuzzweN0a3lkVu3pPJN0YV6HGYMWrWaMg==
X-Received: by 2002:a05:651c:203:: with SMTP id
 y3mr11499902ljn.66.1606103144192; 
 Sun, 22 Nov 2020 19:45:44 -0800 (PST)
Received: from container-ubuntu.lan ([240e:398:25da:d530::d2c])
 by smtp.gmail.com with ESMTPSA id f10sm780378ljf.26.2020.11.22.19.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 19:45:43 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mediatek: support setting MTU
Date: Mon, 23 Nov 2020 11:45:22 +0800
Message-Id: <20201123034522.1268-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_224547_317372_E2BBE2FD 
X-CRM114-Status: GOOD (  16.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rene van Dorst <opensource@vdorst.com>, Andrew Lunn <andrew@lunn.ch>,
 David Woodhouse <dwmw2@infradead.org>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT762x HW, except for MT7628, supports frame length up to 2048
(maximum length on GDM), so allow setting MTU up to 2030.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 36 ++++++++++++++++++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 +++++--
 2 files changed, 43 insertions(+), 4 deletions(-)

Changes RFC -> v1:
	Exclude MT7628

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6d2d60675ffd..27cae3f43972 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -353,7 +353,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 	/* Setup gmac */
 	mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
 	mcr_new = mcr_cur;
-	mcr_new |= MAC_MCR_MAX_RX_1536 | MAC_MCR_IPG_CFG | MAC_MCR_FORCE_MODE |
+	mcr_new |= MAC_MCR_IPG_CFG | MAC_MCR_FORCE_MODE |
 		   MAC_MCR_BACKOFF_EN | MAC_MCR_BACKPR_EN | MAC_MCR_FORCE_LINK;
 
 	/* Only update control register when needed! */
@@ -2499,6 +2499,39 @@ static void mtk_uninit(struct net_device *dev)
 	mtk_rx_irq_disable(eth, ~0);
 }
 
+static int mtk_change_mtu(struct net_device *dev, int new_mtu)
+{
+	int length = new_mtu + MTK_RX_ETH_HLEN;
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_eth *eth = mac->hw;
+	u32 mcr_cur, mcr_new;
+
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
+		if (length > 1536)
+			return -EINVAL;
+	} else {
+		mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
+		mcr_new = mcr_cur & ~MAC_MCR_MAX_RX_LEN_MASK;
+
+		if (length <= 1518)
+			mcr_new |= MAC_MCR_MAX_RX_LEN(MAC_MCR_MAX_RX_LEN_1518);
+		else if (length <= 1536)
+			mcr_new |= MAC_MCR_MAX_RX_LEN(MAC_MCR_MAX_RX_LEN_1536);
+		else if (length <= 1552)
+			mcr_new |= MAC_MCR_MAX_RX_LEN(MAC_MCR_MAX_RX_LEN_1552);
+		else
+			mcr_new |= MAC_MCR_MAX_RX_LEN(MAC_MCR_MAX_RX_LEN_2048);
+
+		/* Only update control register when needed! */
+		if (mcr_new != mcr_cur)
+			mtk_w32(mac->hw, mcr_new, MTK_MAC_MCR(mac->id));
+	}
+
+	dev->mtu = new_mtu;
+
+	return 0;
+}
+
 static int mtk_do_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
@@ -2795,6 +2828,7 @@ static const struct net_device_ops mtk_netdev_ops = {
 	.ndo_set_mac_address	= mtk_set_mac_address,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_do_ioctl		= mtk_do_ioctl,
+	.ndo_change_mtu		= mtk_change_mtu,
 	.ndo_tx_timeout		= mtk_tx_timeout,
 	.ndo_get_stats64        = mtk_get_stats64,
 	.ndo_fix_features	= mtk_fix_features,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 454cfcd465fd..cfc11654ccd6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -17,12 +17,12 @@
 #include <linux/phylink.h>
 
 #define MTK_QDMA_PAGE_SIZE	2048
-#define	MTK_MAX_RX_LENGTH	1536
+#define MTK_MAX_RX_LENGTH	2048
 #define MTK_TX_DMA_BUF_LEN	0x3fff
 #define MTK_DMA_SIZE		256
 #define MTK_NAPI_WEIGHT		64
 #define MTK_MAC_COUNT		2
-#define MTK_RX_ETH_HLEN		(VLAN_ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN)
+#define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
 #define MTK_RX_HLEN		(NET_SKB_PAD + MTK_RX_ETH_HLEN + NET_IP_ALIGN)
 #define MTK_DMA_DUMMY_DESC	0xffffffff
 #define MTK_DEFAULT_MSG_ENABLE	(NETIF_MSG_DRV | \
@@ -320,7 +320,12 @@
 
 /* Mac control registers */
 #define MTK_MAC_MCR(x)		(0x10100 + (x * 0x100))
-#define MAC_MCR_MAX_RX_1536	BIT(24)
+#define MAC_MCR_MAX_RX_LEN_MASK	GENMASK(25, 24)
+#define MAC_MCR_MAX_RX_LEN(_x)	(MAC_MCR_MAX_RX_LEN_MASK & ((_x) << 24))
+#define MAC_MCR_MAX_RX_LEN_1518	0x0
+#define MAC_MCR_MAX_RX_LEN_1536	0x1
+#define MAC_MCR_MAX_RX_LEN_1552	0x2
+#define MAC_MCR_MAX_RX_LEN_2048	0x3
 #define MAC_MCR_IPG_CFG		(BIT(18) | BIT(16))
 #define MAC_MCR_FORCE_MODE	BIT(15)
 #define MAC_MCR_TX_EN		BIT(14)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
