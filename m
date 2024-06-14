Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDECC27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j41Weqp75RphGFqrj1Kspbcz878tK8UuoQ8p5OS9G6Y=; b=nfe8x/dSWzkNFBAodUmf9D/d7c
	V6YnT+4LjiLxZ2F0oeuYo8lK7INsKPZmPxNUeCeMejg7LKbGFxatPSsmeAA1cIBkMnVsY1UQp8I+u
	h1eouIQkdnVGZ0seYjdPpw14tW/hMAEf8jJMk528UClaFCKuzxStxUlKnUVAewvPVprgHRK4m1hZW
	iLRw0bJ0mqa7yeg1ndrZO7PoJK2v/tZ50h6/923XZK5upMWVyh+dTPVkPOByp10Hf1m3LbqLwN+N3
	GbMfwbVhhN+0ibpz93rRhShwEtROWKjeNofhC2g0FZqv/TbJ8CFFCkB34p6JEtheTx7kfDbxwIgDb
	w7/6kocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5WR-00000002ev9-01DM;
	Fri, 14 Jun 2024 11:55:11 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5WN-00000002etM-16vf;
	Fri, 14 Jun 2024 11:55:09 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so2228141a12.1;
        Fri, 14 Jun 2024 04:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718366104; x=1718970904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j41Weqp75RphGFqrj1Kspbcz878tK8UuoQ8p5OS9G6Y=;
        b=OoPxq1/hRZkaZXlOUB2+7+R083RZiZBPjqVMnf7tt56U2GW5w0y/8KFYyDZiDlaOkw
         UGDVCk/bWYo9dZZsfuSb5XK4wfqdWcRNLSf3pxAWkG3AtYqScW3Ohqy2FXhF1+toYfnO
         TKmCKFgkMUtQxmgVdqSz3iAdoW4mkvSlTMtTCdxffCN9hAjc49y5o/uDp2B85h+oHqlj
         b6Wbk1OO8UpKXvEGjM47lx07pLuTBJOODocpVF2lWr541uw2FNYAqJcUFThA+D7eD0VG
         cfb7v+LKH3q10xluyXeRSDRqW1OYGeiSECzoql1WP8U3kCJxZ+mjZ9ZvIkLxIebdF3T4
         /LQA==
X-Forwarded-Encrypted: i=1; AJvYcCXG2YEUV8E3fWjLW8Y+dS0L2FHHW6VK32LfmOzv04+wlvRgtgd+TB1U+YSM/Aqxv07cuuulW43cQqwuMmg8C4cwyqhVpa/PZ584ktpMk+CalwDT5LxGtw+M0gPboDp5OgC2RHp6GamcNsrxpyGeEqzeLuK0qY5dPxY=
X-Gm-Message-State: AOJu0YzWunFyTrbz7pzti779+feIy6YC0XpgrxmdQE8DscwZRoFG0lzF
	2wde3klGjgefYss6Ge7EvSpU6fGB22FuOG17af1kcT7XECv3seod
X-Google-Smtp-Source: AGHT+IGDv+rRVYXWIZxDXGLLU+IncjYEVdIVPKRohIoNGMvyTkPIIyHCi73g3GoJ8mJ678jlzTSVRw==
X-Received: by 2002:a17:906:6c9a:b0:a6e:57ff:7700 with SMTP id a640c23a62f3a-a6f60d421aamr138247566b.42.1718366103309;
        Fri, 14 Jun 2024 04:55:03 -0700 (PDT)
Received: from localhost (fwdproxy-lla-000.fbsv.net. [2a03:2880:30ff::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3fe5sm181083866b.18.2024.06.14.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 04:55:02 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	horms@kernel.org,
	kees@kernel.org,
	kuba@kernel.org,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ingo Rohloff <lundril@gmx.de>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] wifi: mt76: un-embedd netdev from mt76_dev
Date: Fri, 14 Jun 2024 04:52:42 -0700
Message-ID: <20240614115317.657700-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_045507_330266_09609C0B 
X-CRM114-Status: GOOD (  15.99  )
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

Embedding net_device into structures prohibits the usage of flexible
arrays in the net_device structure. For more details, see the discussion
at [1].

Un-embed the net_devices from struct mt76_dev by converting them
into pointers, and allocating them dynamically. Use the leverage
alloc_netdev_dummy() to allocate the net_device object at
mt76_dma_init().

The free of the device occurs at mt76_dma_cleanup().

Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---

PS: Due to the lack of hardware, this patch was not tested on a real
hardware, unfortunately.

PS2: this is the last driver that is still using embedded netdevices.

 drivers/net/wireless/mediatek/mt76/debugfs.c  |  6 ++--
 drivers/net/wireless/mediatek/mt76/dma.c      | 31 +++++++++++++++----
 drivers/net/wireless/mediatek/mt76/dma.h      |  5 +++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  4 +--
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |  6 ++--
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt792x_dma.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   |  2 +-
 12 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/wireless/mediatek/mt76/debugfs.c
index ae83be572b94..b6a2746c187d 100644
--- a/drivers/net/wireless/mediatek/mt76/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
@@ -33,8 +33,8 @@ mt76_napi_threaded_set(void *data, u64 val)
 	if (!mt76_is_mmio(dev))
 		return -EOPNOTSUPP;
 
-	if (dev->napi_dev.threaded != val)
-		return dev_set_threaded(&dev->napi_dev, val);
+	if (dev->napi_dev->threaded != val)
+		return dev_set_threaded(dev->napi_dev, val);
 
 	return 0;
 }
@@ -44,7 +44,7 @@ mt76_napi_threaded_get(void *data, u64 *val)
 {
 	struct mt76_dev *dev = data;
 
-	*val = dev->napi_dev.threaded;
+	*val = dev->napi_dev->threaded;
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f4f88c444e21..bf67b1f2348a 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -916,7 +916,7 @@ int mt76_dma_rx_poll(struct napi_struct *napi, int budget)
 	struct mt76_dev *dev;
 	int qid, done = 0, cur;
 
-	dev = container_of(napi->dev, struct mt76_dev, napi_dev);
+	dev = mt76_from_netdev(napi->dev);
 	qid = napi - dev->napi;
 
 	rcu_read_lock();
@@ -940,18 +940,35 @@ static int
 mt76_dma_init(struct mt76_dev *dev,
 	      int (*poll)(struct napi_struct *napi, int budget))
 {
+	struct mt76_dev **priv;
 	int i;
 
-	init_dummy_netdev(&dev->napi_dev);
-	init_dummy_netdev(&dev->tx_napi_dev);
-	snprintf(dev->napi_dev.name, sizeof(dev->napi_dev.name), "%s",
+	dev->napi_dev = alloc_netdev_dummy(sizeof(struct mt76_dev *));
+	if (!dev->napi_dev)
+		return -ENOMEM;
+
+	/* napi_dev private data points to mt76_dev parent, so, mt76_dev
+	 * can be retrieved given napi_dev
+	 */
+	priv = netdev_priv(dev->napi_dev);
+	*priv = dev;
+
+	dev->tx_napi_dev = alloc_netdev_dummy(sizeof(struct mt76_dev *));
+	if (!dev->tx_napi_dev) {
+		free_netdev(dev->napi_dev);
+		return -ENOMEM;
+	}
+	priv = netdev_priv(dev->tx_napi_dev);
+	*priv = dev;
+
+	snprintf(dev->napi_dev->name, sizeof(dev->napi_dev->name), "%s",
 		 wiphy_name(dev->hw->wiphy));
-	dev->napi_dev.threaded = 1;
+	dev->napi_dev->threaded = 1;
 	init_completion(&dev->mmio.wed_reset);
 	init_completion(&dev->mmio.wed_reset_complete);
 
 	mt76_for_each_q_rx(dev, i) {
-		netif_napi_add(&dev->napi_dev, &dev->napi[i], poll);
+		netif_napi_add(dev->napi_dev, &dev->napi[i], poll);
 		mt76_dma_rx_fill(dev, &dev->q_rx[i], false);
 		napi_enable(&dev->napi[i]);
 	}
@@ -1019,5 +1036,7 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 
 	mt76_free_pending_txwi(dev);
 	mt76_free_pending_rxwi(dev);
+	free_netdev(dev->napi_dev);
+	free_netdev(dev->tx_napi_dev);
 }
 EXPORT_SYMBOL_GPL(mt76_dma_cleanup);
diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 1de5a2b20f74..6454a5eca13e 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -116,4 +116,9 @@ mt76_dma_should_drop_buf(bool *drop, u32 ctrl, u32 buf1, u32 info)
 	}
 }
 
+static inline struct mt76_dev *mt76_from_netdev(struct net_device *dev)
+{
+	return *(struct mt76_dev **)netdev_priv(dev);
+}
+
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 11b9f22ca7f3..15f83b5adac7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -831,8 +831,8 @@ struct mt76_dev {
 
 	struct mt76_mcu mcu;
 
-	struct net_device napi_dev;
-	struct net_device tx_napi_dev;
+	struct net_device *napi_dev;
+	struct net_device *tx_napi_dev;
 	spinlock_t rx_lock;
 	struct napi_struct napi[__MT_RXQ_MAX];
 	struct sk_buff_head rx_skb[__MT_RXQ_MAX];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index 14304b063715..ea017f22fff2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -242,7 +242,7 @@ int mt7603_dma_init(struct mt7603_dev *dev)
 	if (ret)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt7603_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
index e7135b2f1742..966e3d2c295f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
@@ -67,7 +67,7 @@ static int mt7615_poll_tx(struct napi_struct *napi, int budget)
 {
 	struct mt7615_dev *dev;
 
-	dev = container_of(napi, struct mt7615_dev, mt76.tx_napi);
+	dev = (struct mt7615_dev *)mt76_from_netdev(napi->dev);
 	if (!mt76_connac_pm_ref(&dev->mphy, &dev->pm)) {
 		napi_complete(napi);
 		queue_work(dev->mt76.wq, &dev->pm.wake_work);
@@ -89,7 +89,7 @@ static int mt7615_poll_rx(struct napi_struct *napi, int budget)
 	struct mt7615_dev *dev;
 	int done;
 
-	dev = container_of(napi->dev, struct mt7615_dev, mt76.napi_dev);
+	dev = (struct mt7615_dev *)mt76_from_netdev(napi->dev);
 
 	if (!mt76_connac_pm_ref(&dev->mphy, &dev->pm)) {
 		napi_complete(napi);
@@ -282,7 +282,7 @@ int mt7615_dma_init(struct mt7615_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt7615_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index e5ad635d3c56..35b7ebc2c9c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -239,7 +239,7 @@ int mt76x02_dma_init(struct mt76x02_dev *dev)
 	if (ret)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt76x02_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 0baa82c8df5a..0c62272fe7d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -578,7 +578,7 @@ int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2)
 	if (ret < 0)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt7915_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index f768e9389ac6..e75e7b6d3aaf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -219,7 +219,7 @@ static int mt7921_dma_init(struct mt792x_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt792x_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 07b74d492ce1..577574fb7a1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -254,7 +254,7 @@ static int mt7925_dma_init(struct mt792x_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt792x_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 5cc2d59b774a..45aed1e1b1a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -340,7 +340,7 @@ int mt792x_poll_rx(struct napi_struct *napi, int budget)
 	struct mt792x_dev *dev;
 	int done;
 
-	dev = container_of(napi->dev, struct mt792x_dev, mt76.napi_dev);
+	dev = (struct mt792x_dev *)mt76_from_netdev(napi->dev);
 
 	if (!mt76_connac_pm_ref(&dev->mphy, &dev->pm)) {
 		napi_complete(napi);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 73e633d0d700..69a7d9b2e38b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -641,7 +641,7 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
 			  mt7996_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
-- 
2.43.0


