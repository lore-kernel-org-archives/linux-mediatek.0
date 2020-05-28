Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF1CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 12:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF0A206F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 12:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alqHu4lW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="agYjZQeO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDF0A206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SShY9imG3kElCvIJZxbwyZ4QWrzt+mrOSONXP4JlkaM=; b=alqHu4lWdItanS
	B26YQFL3fArWACMd1YfFFqjqCK82kVxOBPbSx2MYvmDGgZTsRo0p5keyWAZLMNdFf59eMU9qNRjYI
	lY1x6vukwQy5dTuB99i1Nj0brrWcSt0a6pqjWA9ApcggnTYVAPxsCvfRc0D7XK1vsqj6EFo8bN9+E
	o3rauproCbLy7oqXEwxKW2hzqlvP6PwPptM6ynaqv/tpAeUbWdxZIEq/EJqY/tnQuTD9BneGxQIQV
	ldOxEEdxMcwLqZ7I/GOPWhQsIYIIbW1Pt4Ouzr0IehtfxK5bcZhLvz0ybzm8Rb3yUyucTl+czhChy
	iIga1oEBRUahXkIe1TxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeHlf-0008LL-JG; Thu, 28 May 2020 12:36:15 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHkj-0007kT-CB
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 12:35:21 +0000
Received: by mail-wm1-f65.google.com with SMTP id d128so1856463wmc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 05:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+G7RdtEM9Tjyup1qpXdvSxuTiPiV2T/6Xv3zi3kgdqw=;
 b=agYjZQeOyZ2AKf60nZ90apYgp7Yv0o1BklkIQFUjoNOenWr/OvSkdORC94vYkhfcDg
 DOgAqd08KF2s8QEItyJuayobS5m2gdfgojHTRwjSc76k3rYZRkYNCq0Nx3J3GJaWT4bK
 kdogL5Yhno/HKBQkDHpHts1NCAqaAAA4jKFfAvVRsCiNRWwlvHPJfCqZhA2Z7FKnjNuR
 0mvQ3Io3RUeLuTVB8Xr8qE0+xDqRa9fM/iBCjtm7/UZmGsaliTfUEM2/gjVayPouAnzc
 7j8kyvWhtcMo4s0q+rMEKcpzWijxVxRGraJHOVVEqcSU7eJy/B4sXAn7rzn/HPHrF/a3
 5w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+G7RdtEM9Tjyup1qpXdvSxuTiPiV2T/6Xv3zi3kgdqw=;
 b=qSZm1M/bAc/2dqtm6q45/PHtskslkHTLwGp6Zc39qpJ07G71lkVhYGnDchz1dmIkfw
 h/EMazz63mYg2IvzDhXe8vPLE8Gvu3CXne5OsikLuLhu6mqa79rIoUqxFvrsk5a645Ml
 aV0jNeZ5e+RRiYCCdbBKhMzmqxLZ3taF8HyEOTBpEY6x4tRytgxKDPWofHkJ7zw994pi
 ogtwaLXgcCACC5uQ+jHARLZLEN1YNsUDuk4nDqibJUSDrBDEYsZZJAU7lk+7Q+hTVy4U
 QBdEzte169/PkNHhZQT11FNIxGGdT1HZmk3DoGHXOD52iaslg4VrAUYBYNVPhZM6MSzg
 hi0A==
X-Gm-Message-State: AOAM530NkHa3PnOuJcpZogP/3sO+sq0z77PFI79SlqNMmj/T8fqJ3BSb
 NTXsq0Bx6ZNvtiOlsyXk+lurqQ==
X-Google-Smtp-Source: ABdhPJx9Jl9dNfglp38Fbyofob3ykhPOc3lBvfMMdzC7r7DXwkN65ZMkM1MkCvyFFas/ZyzprY7Siw==
X-Received: by 2002:a1c:2d14:: with SMTP id t20mr3308643wmt.28.1590669314028; 
 Thu, 28 May 2020 05:35:14 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id c140sm6027306wmd.18.2020.05.28.05.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:35:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] net: ethernet: mtk-star-emac: use regmap bitops
Date: Thu, 28 May 2020 14:34:59 +0200
Message-Id: <20200528123459.21168-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200528123459.21168-1-brgl@bgdev.pl>
References: <20200528123459.21168-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_053517_449973_4F965C9D 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Shrink the code visually by replacing regmap_update_bits() with
appropriate regmap bit operations where applicable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 80 ++++++++-----------
 1 file changed, 35 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 8596ca0e60eb..326ac792a4a0 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -413,8 +413,8 @@ static void mtk_star_dma_unmap_tx(struct mtk_star_priv *priv,
 
 static void mtk_star_nic_disable_pd(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_MAC_CFG,
-			   MTK_STAR_BIT_MAC_CFG_NIC_PD, 0);
+	regmap_clear_bits(priv->regs, MTK_STAR_REG_MAC_CFG,
+			  MTK_STAR_BIT_MAC_CFG_NIC_PD);
 }
 
 /* Unmask the three interrupts we care about, mask all others. */
@@ -434,41 +434,38 @@ static void mtk_star_intr_disable(struct mtk_star_priv *priv)
 
 static void mtk_star_intr_enable_tx(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			   MTK_STAR_BIT_INT_STS_TNTC, 0);
+	regmap_clear_bits(priv->regs, MTK_STAR_REG_INT_MASK,
+			  MTK_STAR_BIT_INT_STS_TNTC);
 }
 
 static void mtk_star_intr_enable_rx(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			   MTK_STAR_BIT_INT_STS_FNRC, 0);
+	regmap_clear_bits(priv->regs, MTK_STAR_REG_INT_MASK,
+			  MTK_STAR_BIT_INT_STS_FNRC);
 }
 
 static void mtk_star_intr_enable_stats(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			   MTK_STAR_REG_INT_STS_MIB_CNT_TH, 0);
+	regmap_clear_bits(priv->regs, MTK_STAR_REG_INT_MASK,
+			  MTK_STAR_REG_INT_STS_MIB_CNT_TH);
 }
 
 static void mtk_star_intr_disable_tx(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			   MTK_STAR_BIT_INT_STS_TNTC,
-			   MTK_STAR_BIT_INT_STS_TNTC);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_INT_MASK,
+			MTK_STAR_BIT_INT_STS_TNTC);
 }
 
 static void mtk_star_intr_disable_rx(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			   MTK_STAR_BIT_INT_STS_FNRC,
-			   MTK_STAR_BIT_INT_STS_FNRC);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_INT_MASK,
+			MTK_STAR_BIT_INT_STS_FNRC);
 }
 
 static void mtk_star_intr_disable_stats(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			   MTK_STAR_REG_INT_STS_MIB_CNT_TH,
-			   MTK_STAR_REG_INT_STS_MIB_CNT_TH);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_INT_MASK,
+			MTK_STAR_REG_INT_STS_MIB_CNT_TH);
 }
 
 static unsigned int mtk_star_intr_read(struct mtk_star_priv *priv)
@@ -524,12 +521,10 @@ static void mtk_star_dma_init(struct mtk_star_priv *priv)
 
 static void mtk_star_dma_start(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_TX_DMA_CTRL,
-			   MTK_STAR_BIT_TX_DMA_CTRL_START,
-			   MTK_STAR_BIT_TX_DMA_CTRL_START);
-	regmap_update_bits(priv->regs, MTK_STAR_REG_RX_DMA_CTRL,
-			   MTK_STAR_BIT_RX_DMA_CTRL_START,
-			   MTK_STAR_BIT_RX_DMA_CTRL_START);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_TX_DMA_CTRL,
+			MTK_STAR_BIT_TX_DMA_CTRL_START);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_RX_DMA_CTRL,
+			MTK_STAR_BIT_RX_DMA_CTRL_START);
 }
 
 static void mtk_star_dma_stop(struct mtk_star_priv *priv)
@@ -553,16 +548,14 @@ static void mtk_star_dma_disable(struct mtk_star_priv *priv)
 
 static void mtk_star_dma_resume_rx(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_RX_DMA_CTRL,
-			   MTK_STAR_BIT_RX_DMA_CTRL_RESUME,
-			   MTK_STAR_BIT_RX_DMA_CTRL_RESUME);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_RX_DMA_CTRL,
+			MTK_STAR_BIT_RX_DMA_CTRL_RESUME);
 }
 
 static void mtk_star_dma_resume_tx(struct mtk_star_priv *priv)
 {
-	regmap_update_bits(priv->regs, MTK_STAR_REG_TX_DMA_CTRL,
-			   MTK_STAR_BIT_TX_DMA_CTRL_RESUME,
-			   MTK_STAR_BIT_TX_DMA_CTRL_RESUME);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_TX_DMA_CTRL,
+			MTK_STAR_BIT_TX_DMA_CTRL_RESUME);
 }
 
 static void mtk_star_set_mac_addr(struct net_device *ndev)
@@ -845,8 +838,8 @@ static int mtk_star_hash_wait_ok(struct mtk_star_priv *priv)
 		return ret;
 
 	/* Check the BIST_OK bit. */
-	regmap_read(priv->regs, MTK_STAR_REG_HASH_CTRL, &val);
-	if (!(val & MTK_STAR_BIT_HASH_CTRL_BIST_OK))
+	if (!regmap_test_bits(priv->regs, MTK_STAR_REG_HASH_CTRL,
+			      MTK_STAR_BIT_HASH_CTRL_BIST_OK))
 		return -EIO;
 
 	return 0;
@@ -880,12 +873,10 @@ static int mtk_star_reset_hash_table(struct mtk_star_priv *priv)
 	if (ret)
 		return ret;
 
-	regmap_update_bits(priv->regs, MTK_STAR_REG_HASH_CTRL,
-			   MTK_STAR_BIT_HASH_CTRL_BIST_EN,
-			   MTK_STAR_BIT_HASH_CTRL_BIST_EN);
-	regmap_update_bits(priv->regs, MTK_STAR_REG_TEST1,
-			   MTK_STAR_BIT_TEST1_RST_HASH_MBIST,
-			   MTK_STAR_BIT_TEST1_RST_HASH_MBIST);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_HASH_CTRL,
+			MTK_STAR_BIT_HASH_CTRL_BIST_EN);
+	regmap_set_bits(priv->regs, MTK_STAR_REG_TEST1,
+			MTK_STAR_BIT_TEST1_RST_HASH_MBIST);
 
 	return mtk_star_hash_wait_ok(priv);
 }
@@ -1016,13 +1007,13 @@ static int mtk_star_enable(struct net_device *ndev)
 		return ret;
 
 	/* Setup the hashing algorithm */
-	regmap_update_bits(priv->regs, MTK_STAR_REG_ARL_CFG,
-			   MTK_STAR_BIT_ARL_CFG_HASH_ALG |
-			   MTK_STAR_BIT_ARL_CFG_MISC_MODE, 0);
+	regmap_clear_bits(priv->regs, MTK_STAR_REG_ARL_CFG,
+			  MTK_STAR_BIT_ARL_CFG_HASH_ALG |
+			  MTK_STAR_BIT_ARL_CFG_MISC_MODE);
 
 	/* Don't strip VLAN tags */
-	regmap_update_bits(priv->regs, MTK_STAR_REG_MAC_CFG,
-			   MTK_STAR_BIT_MAC_CFG_VLAN_STRIP, 0);
+	regmap_clear_bits(priv->regs, MTK_STAR_REG_MAC_CFG,
+			  MTK_STAR_BIT_MAC_CFG_VLAN_STRIP);
 
 	/* Setup DMA */
 	mtk_star_dma_init(priv);
@@ -1204,9 +1195,8 @@ static void mtk_star_set_rx_mode(struct net_device *ndev)
 	int ret;
 
 	if (ndev->flags & IFF_PROMISC) {
-		regmap_update_bits(priv->regs, MTK_STAR_REG_ARL_CFG,
-				   MTK_STAR_BIT_ARL_CFG_MISC_MODE,
-				   MTK_STAR_BIT_ARL_CFG_MISC_MODE);
+		regmap_set_bits(priv->regs, MTK_STAR_REG_ARL_CFG,
+				MTK_STAR_BIT_ARL_CFG_MISC_MODE);
 	} else if (netdev_mc_count(ndev) > MTK_STAR_HASHTABLE_MC_LIMIT ||
 		   ndev->flags & IFF_ALLMULTI) {
 		for (i = 0; i < MTK_STAR_HASHTABLE_SIZE_MAX; i++) {
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
