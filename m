Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39576FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKK1TQu05IOvJzqk2ZSwsaHyP8UgKdpSWF9oEwSI2Ks=; b=a6EDHzNuwHku4LE8D/C5Kp9srV
	Xdu855sBXk/z1gFheRtcQVSQNXZ/L2aZtKrwr0JV6i8N0AEyDJk6OVSX2T4z6sNH/jp+lFnKlUPPK
	hjJkHdexkmg08hfTQ26cAzgMiokffKCt6u3N2rywT6ojwYEWTTZ1UWq1SWMdM3fJ6aYbILpk1JU2l
	TS7Z48pw699bs/qrmKkbb/FAvIJoKBw6CauI+5XSgr/lzC22UHP1B858VvccxHEVq3BvwMnw4niSH
	YBjxgNxhMWj+OV2IStAYclJoifNLLTgSSzmsFn5hpDE2bF9u07N2SAYrqG/zz/7aIYOhA1aSICNl+
	nDXd0Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2Q-0000000EmT5-3tZ3;
	Sat, 25 Apr 2026 19:51:38 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2O-0000000EmRo-4AAM
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:38 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7de5badb627so1000016a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146696; x=1777751496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKK1TQu05IOvJzqk2ZSwsaHyP8UgKdpSWF9oEwSI2Ks=;
        b=gCfBMJ9WGz5B1O305QmKdyTSc7GjjusepNjDR3oA3/LsGY6gTifpCyZe6EcruIpYuJ
         qc3vauAtescNAkUHo1SxIo6YVPRI7Bk6SJxhZv73sKbnGspN91MEOve6hH9U9p02Fm51
         //D26c8re8zKQUWkn/ssmCQD3NEojJ37Hhp+rixAfiH8MBb9TUSlQMkuhV5eznHKzdcm
         ZR2SI8PgqvQ6jY/YNmN3MRnLSXr1cUhBJNXxlw2ZTAYhnQ6Pp13rCu+VkgsxvPKwzd6J
         s2wjnjY2EBby5MxQ7kJAxN0GuebQT2r2Fyhxg45WQS3gcf1JIVFuU1cWXGZP3JSX7oXB
         AaMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VeIencJlroLTe/XfkjEeDQqc01QDCM8TxbZsa1y5BzbFtIOhKKSIPJT1c7kJXt9wGYm0/zz3ovrqDX3d+Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGYjpTB++S12J6cQ7TcaPwlwygAWV2TDcH1oEgqXxBjfUfMl2o
	JJf+f778cERwNON4Wy2eSNWL9mdmJGzxWGcKQH3QSo6+KEtJTjdVrv+O
X-Gm-Gg: AeBDieuKyvJiavywlhmiL+CMe+MDE+1eTlsU0B7waWPrLue6lLkayWfDWNd5bRacoRX
	OflcLF2rCj6TDYp1+pwU66GFDgSInKwpQ6QSpy/2NcSmwB2d4TxqtPxDKZyhvbSo+7QBFtz8ahR
	BQm4xPxW+UgZlL0rHPs2w2qKItF037hkDat0pnnoFWbFnflG55DPXyXunIF5d0rqrsw7PQ4LBbu
	SMv+9ZCr+EPXHZIa6JCSEj0n8eu+lDtjbhJZoTuX4x/VTxKu4MzzVeR/50yYqQSrV4kw6UZkRU1
	NgL8Im51XfM5bn4CCj3yTgbgBPYpMvdbXY+iq01iJgX/RAw/gnqVGka50WEqhkGhCzBL/93Og8x
	SJMTc2gFGIxaJTSORk5jiHaMGhmQP3+SPsMiuD58KL3C8wSPVrXPkHSwdIghXlBFez0COyyqh/N
	lfR3K3oVfMFX/HtutjtFJ0Hp/q54cpf3OBkCZ7qcSsDTu3S/chCnVPDFcDhc4sW8cpqjTF4xaTm
	w==
X-Received: by 2002:a05:6830:3883:b0:7dc:db04:d30b with SMTP id 46e09a7af769-7dcdb04db39mr12370327a34.9.1777146695928;
        Sat, 25 Apr 2026 12:51:35 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:35 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 14/21] wifi: mt76: mt792x: factor out common DMA queue allocation
Date: Sat, 25 Apr 2026 14:50:04 -0500
Message-ID: <20260425195011.790265-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125137_037770_06132593 
X-CRM114-Status: GOOD (  11.53  )
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

From: Sean Wang <sean.wang@mediatek.com>

The mt792x PCIe DMA setup uses the same standard queue allocation
sequence for data, MCU, firmware download and RX rings.

Factor this part out into a small common helper so later chip support
can reuse the existing flow without duplicating the queue setup logic.

This keeps the common DMA skeleton in one place and makes follow-up
chip-specific DMA changes smaller and easier to review.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 19 +++++++
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 56 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 09840483fe2a..59562567cc13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -206,6 +206,23 @@ struct mt792x_irq_map {
 	} rx;
 };
 
+struct mt792x_dma_ring {
+	u8 qid;
+	u16 n_desc;
+	u32 ring_base;
+};
+
+struct mt792x_dma_layout {
+	struct mt792x_dma_ring tx_data0;
+	struct mt792x_dma_ring tx_mcu;
+	struct mt792x_dma_ring tx_fwdl;
+	struct mt792x_dma_ring rx_data;
+	struct mt792x_dma_ring rx_mcu;
+};
+
+#define mt792x_dma_ring(_qid, _n_desc, _ring_base) \
+	{ .qid = (_qid), .n_desc = (_n_desc), .ring_base = (_ring_base) }
+
 #define mt792x_init_reset(dev)		((dev)->hif_ops->init_reset(dev))
 #define mt792x_dev_reset(dev)		((dev)->hif_ops->reset(dev))
 #define mt792x_mcu_init(dev)		((dev)->hif_ops->mcu_init(dev))
@@ -421,6 +438,8 @@ void mt792x_sta_statistics(struct ieee80211_hw *hw,
 void mt792x_set_coverage_class(struct ieee80211_hw *hw, int radio_idx,
 			       s16 coverage_class);
 void mt792x_dma_cleanup(struct mt792x_dev *dev);
+int mt792x_dma_alloc_queues(struct mt792x_dev *dev,
+			    const struct mt792x_dma_layout *layout);
 int mt792x_dma_enable(struct mt792x_dev *dev);
 int mt792x_wpdma_reset(struct mt792x_dev *dev, bool force);
 int mt792x_wpdma_reinit_cond(struct mt792x_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 2835bf273154..c52d0c85913c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -87,6 +87,62 @@ void mt792x_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q)
 }
 EXPORT_SYMBOL_GPL(mt792x_rx_poll_complete);
 
+int mt792x_dma_alloc_queues(struct mt792x_dev *dev,
+			    const struct mt792x_dma_layout *layout)
+{
+	int ret;
+
+	mt76_dma_attach(&dev->mt76);
+
+	ret = mt792x_dma_disable(dev, true);
+	if (ret)
+		return ret;
+
+	/* init tx queue */
+	ret = mt76_connac_init_tx_queues(dev->phy.mt76, layout->tx_data0.qid,
+					 layout->tx_data0.n_desc,
+					 layout->tx_data0.ring_base,
+					 NULL, 0);
+	if (ret)
+		return ret;
+
+	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, 0x4);
+
+	/* command to WM */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WM,
+				  layout->tx_mcu.qid,
+				  layout->tx_mcu.n_desc,
+				  layout->tx_mcu.ring_base);
+	if (ret)
+		return ret;
+
+	/* firmware download */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_FWDL,
+				  layout->tx_fwdl.qid,
+				  layout->tx_fwdl.n_desc,
+				  layout->tx_fwdl.ring_base);
+	if (ret)
+		return ret;
+
+	/* rx event */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
+			       layout->rx_mcu.qid,
+			       layout->rx_mcu.n_desc,
+			       MT_RX_BUF_SIZE,
+			       layout->rx_mcu.ring_base);
+	if (ret)
+		return ret;
+
+	/* rx data */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN],
+			       layout->rx_data.qid,
+			       layout->rx_data.n_desc,
+			       MT_RX_BUF_SIZE,
+			       layout->rx_data.ring_base);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mt792x_dma_alloc_queues);
+
 #define PREFETCH(base, depth)	((base) << 16 | (depth))
 static void mt792x_dma_prefetch(struct mt792x_dev *dev)
 {
-- 
2.43.0


