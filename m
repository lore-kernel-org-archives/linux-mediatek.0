Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FE7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyFPIsGK0PfA0AZdCvK3NI+4ZhBa0PXiuPUH7CqDdXQ=; b=ZcH9YfKWom2jCU
	6gQvNNK0Biy/1tYoVhwmKy0tPC1HaBt5A0utnSiWJsHkDIElMJVawZNCiZWspTmAb7UDdzdsUMXge
	jNpZofpgjV9ho78qf9L5QODUo3r+Tn3P/sSYUclzM5hGWV++RpyX8j8lMUHU1WWuUR3lpT9xyKBBg
	ItPjmVlHR4lqWNL5qnOvZbYofsqiiF4TU9KHwWxdDFo1b6EgL4poQjsj/iXspyms9E5I9O+A5XacF
	DDsPD49ic0yuNmSjbjAOh+xsRXMHU0RtEL3oo2GGLJVybTh3JPT9BIQzMHMIbJ9ifI/zbb6ngyle5
	Ff1new/HGQXJ8rvFsJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmHwL-00Bg1y-CS; Wed, 04 May 2022 16:33:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmHwI-00Bg08-Ke
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 16:33:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F8C36173C;
 Wed,  4 May 2022 16:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20801C385B1;
 Wed,  4 May 2022 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651682000;
 bh=1b32rzGazO9pHfwZeTeTHbpy2Na8Yj3Jvnfqlt+8Gg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kdO3jEW4iB7+/+PyYMLFe0n8xrFtanyrlOs/35RgmBgqsnVL5NZz28A3vM45uxZ9E
 XuZTsVI2UaWfhwz3KsPhRrV+cPwqc8MwPs5X4YbPgBkbnrd8FrifrC7n2bKwOCWRUm
 InRtsrf9JsumWh33aALOQOywoDCrisgBJGUD9gwxEfbqFKhXXPiX7Q/PIvR8MA6lG/
 7bgNPDKOvvPuJGUls4OSNXAe3vpyCw9kKehOYL59eOBc9Lp+DbNWJ7SOFIfz/kgE/A
 4n/fkqVzKLffyN650LJ/tYs5Z4w2CB4EiozgzhVGTsCLmCsKtVnhs2sx2httXlBm8q
 nq/CNUrEBR3Vg==
From: Jakub Kicinski <kuba@kernel.org>
To: kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH wireless-next 2/3] wifi: mt76: switch to netif_napi_add_tx()
Date: Wed,  4 May 2022 09:33:15 -0700
Message-Id: <20220504163316.549648-3-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504163316.549648-1-kuba@kernel.org>
References: <20220504163316.549648-1-kuba@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_093322_799304_99E5BF0F 
X-CRM114-Status: GOOD (  10.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Switch to the new API not requiring passing in NAPI_POLL_WEIGHT.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: nbd@nbd.name
CC: lorenzo@kernel.org
CC: ryder.lee@mediatek.com
CC: shayne.chen@mediatek.com
CC: sean.wang@mediatek.com
CC: kvalo@kernel.org
CC: matthias.bgg@gmail.com
CC: Bo.Jiao@mediatek.com
CC: sujuan.chen@mediatek.com
CC: linux-wireless@vger.kernel.org
CC: linux-mediatek@lists.infradead.org
---
 drivers/net/wireless/mediatek/mt76/mt7603/dma.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7615/dma.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/dma.c   | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index 37b092e3ea51..2c1c79dc7fda 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -223,8 +223,8 @@ int mt7603_dma_init(struct mt7603_dev *dev)
 	if (ret)
 		return ret;
 
-	netif_tx_napi_add(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
-			  mt7603_poll_tx, NAPI_POLL_WEIGHT);
+	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt7603_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
index 00aefea1bf61..95dbb413678a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
@@ -284,8 +284,8 @@ int mt7615_dma_init(struct mt7615_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_tx_napi_add(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
-			  mt7615_poll_tx, NAPI_POLL_WEIGHT);
+	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt7615_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
 	mt76_poll(dev, MT_WPDMA_GLO_CFG,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index 8bcd8afa0d3a..23d2864d37fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -230,8 +230,8 @@ int mt76x02_dma_init(struct mt76x02_dev *dev)
 	if (ret)
 		return ret;
 
-	netif_tx_napi_add(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
-			  mt76x02_poll_tx, NAPI_POLL_WEIGHT);
+	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt76x02_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 49b4d8ade16b..75678aabff32 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -434,8 +434,8 @@ int mt7915_dma_init(struct mt7915_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_tx_napi_add(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
-			  mt7915_poll_tx, NAPI_POLL_WEIGHT);
+	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt7915_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
 	mt7915_dma_enable(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index ca7e20fb5fc0..34b3effe14f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -296,8 +296,8 @@ int mt7921_dma_init(struct mt7921_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	netif_tx_napi_add(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
-			  mt7921_poll_tx, NAPI_POLL_WEIGHT);
+	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt7921_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
 	return mt7921_dma_enable(dev);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
