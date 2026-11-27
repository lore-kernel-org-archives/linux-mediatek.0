Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931B606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTIURGxd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXXnunj5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JGaD5PI/66uiCbIuMTU+Efr4PnsGJjUp9yJer0SVIlg=; b=GTIURGxda0oFP4GvNcB275SzP+
	vpSt0B9PnL3zH8ADwkDcuTWnEsfbKS7a0+jZ0tyLYIfSEsDcRYdGa6uVeV3kHVYlse0j9qfMUC7lU
	BRG5h7krT6WCNvxxWuaz/yd9Nxw31r2YNTOaEKF/MJCzIl8J/ei91raV2DVCcP/HhTyrYcg8LCX6L
	KWIvPG5JMqu6D7DkVujSpTyr8MW2vRjGfx/nw0zKOz+wYqn/XQj2g8o0RWpxnmGthaydoRthp/YBG
	e7pMUgUKtDPk/+N8VRnMg+hMUBDDxLRcItgTyp5V7ZCawtn+KnGRUKLi//MROhOFviGreK+fk3Zin
	FsB5IywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrRO-0000000FGYT-3BOO;
	Fri, 27 Nov 2026 08:36:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQt-0000000FGCx-3if5;
	Fri, 27 Nov 2026 08:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2DB84555D;
	Fri, 27 Nov 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768551;
	b=j9O6uFD4CGzK0jmuSQ9J1Tfr0TBcJdaF/6Q0Z5P7ohV2RDZACetWnboPeXLL9rOahJ2L
	 kEK41fop4RgkDR6exX3wTq4sokG+eS8BeLZx5dywldIxnXx1bDFnm2oJxCSRSzB6q/Jby
	 uPooQubXCZ4qWFXejM4TbheLabDpvAZ8XXx1FMsn+oC91O8dRbIXAv74DKsmW45f3orFd
	 hnEbzrkI0eMs7NvLWMTgZclgD8SiT6HVxMV0V1zQJg9eWZbuvqd1I7/14/tt5f7UsUw2i
	 YTU/ZfA+V4pVETe+fcXlyLrmfdFrgKoUAu4qYmGtGm6lEMC4n8u3cEH0jfOXvZaqHig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768551;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JGaD5PI/66uiCbIuMTU+Efr4PnsGJjUp9yJer0SVIlg=;
	b=qoQUzf4xtDDui0RJIb+kdiz9tvfsYrAo/avBn+QG5hMnjyowqTvHshk/4JJeNoDKZA/0
	 cGUGJTkc8JVcEMTotGeqmgoxWLVa/cA10A0KBk2Ml8PWC2gRGvrZpzmzArOY2T/b7EVC/
	 qdTIeIYN2x5oE+jS9RhtjCQBgNs1D38nwMkJXFr6bVFGCaEn78z3hm7FUCuzWk1V8yAoE
	 QZ1sbh0PuGCMpTKejEj3zjAuir+GM9MPR2AUKKU6Avaf86XDnDEMq9hiquhB+8q9wdoQ1
	 EgzwQnGdvmC6Climr28vrqCdJvlTcAHr6cbwg59pSiuWbhflA5S84YqDceja7Ce2hUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16E2D1F00898;
	Fri, 27 Nov 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768551;
	bh=JGaD5PI/66uiCbIuMTU+Efr4PnsGJjUp9yJer0SVIlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AXXnunj54tXP2WApne5SjvZlQ0UZKZ5WgsgSt/stkn2jTOaFewSNybnJGsu1qDqS7
	 nDZth4Z6QUvuqSpznBH8XTF/F39MQvYUz64dEYpTyFNAv2MwJGf006jQzruI6QtjpY
	 Cxb13goe6P+sk+dwtPe7W5Hw3AhGTGi/gPCIGcVpxVRXTaQkaD+dCzEb36opDYYo3Q
	 M8xa1zuUNLeae3UK8uhyj0BP7IUpN4PL6GDs9KsQZ4iZftAz4cScjNAQjkCqSl9zS9
	 lxLluP73JsaznFvLfbVdmPXi/jJ+ekK13rqTl/JyouLEGXO4B5IVdfEiABvuHYLEah
	 2/3byLMv77e2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 950C04B642;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:13 +0300
Subject: [PATCH 02/10] wifi: mt76: mt7603: make mcu message helpers usable
 by other buses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-2-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=3594;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=g4XUtnuymEQFvCt7ERD1/Ld0HSmrdfs2a5Zn8j72UIc=;
 b=7yGr8Rc1ykiw5mywD+Anw9WR0oSNt5gEclop42dkuG8NvN8OqjDkKfsLCic9jrFhIG4THeD/M
 BxV59VgExixBWtcXkOZ8a1WLfBNc0ohm+t8h+IgBfQXNHjD3++zhO4Z
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Murad Dadashev <llamapersonaltv@gmail.com>

Split filling in the MCU TXD out of mt7603_mcu_skb_send_msg() into
mt7603_mcu_fill_msg(), and make mt7603_mcu_parse_response() and
mt7603_load_firmware() non-static.

A USB driver needs to send the same MCU messages and download the same
firmware, but over a bulk endpoint instead of the MCU DMA ring.

No functional change.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c    | 23 ++++++++++++++--------
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  5 +++++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
index e432cce97640d631d91a088ec5a5a07721b03a94..bbc8402fc98e3c99a9073cc70c3c492e21b761cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
@@ -13,9 +13,8 @@ struct mt7603_fw_trailer {
 	__le32 dl_len;
 } __packed;
 
-static int
-mt7603_mcu_parse_response(struct mt76_dev *mdev, int cmd,
-			  struct sk_buff *skb, int seq)
+int mt7603_mcu_parse_response(struct mt76_dev *mdev, int cmd,
+			      struct sk_buff *skb, int seq)
 {
 	struct mt7603_dev *dev = container_of(mdev, struct mt7603_dev, mt76);
 	struct mt7603_mcu_rxd *rxd;
@@ -34,11 +33,10 @@ mt7603_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 	return 0;
 }
 
-static int
-mt7603_mcu_skb_send_msg(struct mt76_dev *mdev, struct sk_buff *skb,
-			int cmd, int *wait_seq)
+void mt7603_mcu_fill_msg(struct mt7603_dev *dev, struct sk_buff *skb,
+			 int cmd, int *wait_seq)
 {
-	struct mt7603_dev *dev = container_of(mdev, struct mt7603_dev, mt76);
+	struct mt76_dev *mdev = &dev->mt76;
 	int hdrlen = dev->mcu_running ? sizeof(struct mt7603_mcu_txd) : 12;
 	struct mt7603_mcu_txd *txd;
 	u8 seq;
@@ -71,6 +69,15 @@ mt7603_mcu_skb_send_msg(struct mt76_dev *mdev, struct sk_buff *skb,
 
 	if (wait_seq)
 		*wait_seq = seq;
+}
+
+static int
+mt7603_mcu_skb_send_msg(struct mt76_dev *mdev, struct sk_buff *skb,
+			int cmd, int *wait_seq)
+{
+	struct mt7603_dev *dev = container_of(mdev, struct mt7603_dev, mt76);
+
+	mt7603_mcu_fill_msg(dev, skb, cmd, wait_seq);
 
 	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[MT_MCUQ_WM], skb, 0);
 }
@@ -113,7 +120,7 @@ mt7603_mcu_restart(struct mt76_dev *dev)
 	return mt76_mcu_send_msg(dev, -MCU_CMD_RESTART_DL_REQ, NULL, 0, true);
 }
 
-static int mt7603_load_firmware(struct mt7603_dev *dev)
+int mt7603_load_firmware(struct mt7603_dev *dev)
 {
 	const struct firmware *fw;
 	const struct mt7603_fw_trailer *hdr;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 5b0ecd01aad95a11f641ca41f8a9206882c54c28..f91968a63b6497460a26fed7d775f3745269bfa7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -186,6 +186,11 @@ int mt7603_eeprom_init(struct mt7603_dev *dev);
 int mt7603_dma_init(struct mt7603_dev *dev);
 void mt7603_dma_cleanup(struct mt7603_dev *dev);
 int mt7603_mcu_init(struct mt7603_dev *dev);
+int mt7603_load_firmware(struct mt7603_dev *dev);
+void mt7603_mcu_fill_msg(struct mt7603_dev *dev, struct sk_buff *skb,
+			 int cmd, int *wait_seq);
+int mt7603_mcu_parse_response(struct mt76_dev *mdev, int cmd,
+			      struct sk_buff *skb, int seq);
 void mt7603_init_debugfs(struct mt7603_dev *dev);
 
 static inline void mt7603_irq_enable(struct mt7603_dev *dev, u32 mask)

-- 
2.47.3



