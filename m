Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F771EEB56D
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXENFV3YdG2kEJbuzop9IAzLmkzs2BGMWhaYbaOcnwo=; b=QraMhkeWwRz+3AzcgaOLUkeKzk
	jX9r48AikbVFgfyzfdZ15/B6ofYSRM+QMbflZltrEW0sSdMZ5w26lfXyh4rm0za4SROBHUwoZymzl
	AMuid64VfuL1K9EmAjsJP/MfrNyAd8UVYATxZOQdUTgM4fs/RD8TuuLmS/VZ1Ydy5KPVDAa64ovKU
	IsNBRpYAhJhsFnXVlRdoaOSi45xsoY4+eyv6U5wOXNGOk4odW9a8ftxkgtvJxm0h7friFprq40sUP
	Xk/f9DahpI+crcU+kXsF7/Zr8lnI5NnlNnRcOSKe6ZCveZlIpcUFhsd8saruk06zkEmZM2fziEW06
	0xazPz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg3z-00EGUa-0e;
	Fri, 08 Sep 2023 18:18:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg3x-00EGTQ-02;
	Fri, 08 Sep 2023 18:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zXENFV3YdG2kEJbuzop9IAzLmkzs2BGMWhaYbaOcnwo=; b=MrQSIksynvmv/xraFt2G9TTRW3
	7yNXWnFrDwTe7ahpycHRTbP7Yn3ayA7S7S3BTayqp1LT5JoUh1SqfZIVbSBOq1t7OIdr1WBvGEzJ4
	qnrWtnarHh3q15nvzy4Hojlvm9Cevfj1zlmOjqPaV0OiVkfMoCId+L9PXNHYxMgKTaelIfV+/q2i5
	9uoUKUWkxjSxZzhhxBn0XV7X1pZIs4qc1UaPfUfYT9KjLjP8bYCwSlvfqCIHZctCP/LKziVNNeOD/
	5Ii86dxTPwd0k33cKtf2/12qZ9kPqI2EEDn4iPPqXo76///bUcRkmZAli+hjTAJMokikcbh2/Y/Tk
	diJ2sKRg==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg3p-002ffL-2Y;
	Fri, 08 Sep 2023 18:18:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 20BEACE1C50;
	Fri,  8 Sep 2023 18:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1E5C116A2;
	Fri,  8 Sep 2023 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694197103;
	bh=D7Hhn7eX7ypSQhNUqsnuhXgXBdBd0/PnJ6FI6P7C9VQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N39dU3jensqMgTLP6UjMcXIGkFviwwjjO5Q6p6wEvPoM4uvsnoOlx2EVnhdYHf6yi
	 hsDy2n36MW7iAoDw1s994WW10AVIhX0vNpvIbsgsNMN0EdVKs7xX+y0Wo1SCZywl9k
	 O1jSAGfCHwGy7IYgeQoTfzY+z2w15IhZ/S3SCJvgPM/2qgOhofWwVbjfx/TI7BbjOB
	 3SrJw2wRlN0SagoqmP4n6Kx6njLtIz8lFOer7qoj/rjiT/kfN/IQys3UAD14A7uCmD
	 ZRAVhOc0IgfLe8f6FiPIKCZi/tYGKmRgbxnAukzMP8BbWQ8HPOgjZ7RUApftPnCDSc
	 SmgbfcI/WV9/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matt Whitlock <kernel@mattwhitlock.name>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	deren.wu@mediatek.com,
	sean.wang@mediatek.com,
	horms@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 07/26] mt76: mt7921: don't assume adequate headroom for SDIO headers
Date: Fri,  8 Sep 2023 14:17:45 -0400
Message-Id: <20230908181806.3460164-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181806.3460164-1-sashal@kernel.org>
References: <20230908181806.3460164-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_191832_022890_17FCFA6A 
X-CRM114-Status: GOOD (  14.21  )
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

From: Matt Whitlock <kernel@mattwhitlock.name>

[ Upstream commit 98c4d0abf5c478db1ad126ff0c187dbb84c0803c ]

mt7921_usb_sdio_tx_prepare_skb() calls mt7921_usb_sdio_write_txwi() and
mt7921_skb_add_usb_sdio_hdr(), both of which blindly assume that
adequate headroom will be available in the passed skb. This assumption
typically is satisfied when the skb was allocated in the net core for
transmission via the mt7921 netdev (although even that is only an
optimization and is not strictly guaranteed), but the assumption is
sometimes not satisfied when the skb originated in the receive path of
another netdev and was passed through to the mt7921, such as by the
bridge layer. Blindly prepending bytes to an skb is always wrong.

This commit introduces a call to skb_cow_head() before the call to
mt7921_usb_sdio_write_txwi() in mt7921_usb_sdio_tx_prepare_skb() to
ensure that at least MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE bytes can be
pushed onto the skb.

Without this fix, I can trivially cause kernel panics by bridging an
MT7921AU-based USB 802.11ax interface with an Ethernet interface on an
Intel Atom-based x86 system using its onboard RTL8169 PCI Ethernet
adapter and also on an ARM-based Raspberry Pi 1 using its onboard
SMSC9512 USB Ethernet adapter. Note that the panics do not occur in
every system configuration, as they occur only if the receiving netdev
leaves less headroom in its received skbs than the mt7921 needs for its
SDIO headers.

Here is an example stack trace of this panic on Raspberry Pi OS Lite
2023-02-21 running kernel 6.1.24+ [1]:

 skb_panic from skb_push+0x44/0x48
 skb_push from mt7921_usb_sdio_tx_prepare_skb+0xd4/0x190 [mt7921_common]
 mt7921_usb_sdio_tx_prepare_skb [mt7921_common] from mt76u_tx_queue_skb+0x94/0x1d0 [mt76_usb]
 mt76u_tx_queue_skb [mt76_usb] from __mt76_tx_queue_skb+0x4c/0xc8 [mt76]
 __mt76_tx_queue_skb [mt76] from mt76_txq_schedule.part.0+0x13c/0x398 [mt76]
 mt76_txq_schedule.part.0 [mt76] from mt76_txq_schedule_all+0x24/0x30 [mt76]
 mt76_txq_schedule_all [mt76] from mt7921_tx_worker+0x58/0xf4 [mt7921_common]
 mt7921_tx_worker [mt7921_common] from __mt76_worker_fn+0x9c/0xec [mt76]
 __mt76_worker_fn [mt76] from kthread+0xbc/0xe0
 kthread from ret_from_fork+0x14/0x34

After this fix, bridging the mt7921 interface works fine on both of my
previously problematic systems.

[1] https://github.com/raspberrypi/firmware/tree/5c276f55a4b21345cd4d6200a504ee991851ff7a

Link: https://github.com/openwrt/openwrt/issues/11796
Signed-off-by: Matt Whitlock <kernel@mattwhitlock.name>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 1c0d8cf19b8eb..49ddca84f7862 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1167,6 +1167,10 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (unlikely(tx_info->skb->len <= ETH_HLEN))
 		return -EINVAL;
 
+	err = skb_cow_head(skb, MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE);
+	if (err)
+		return err;
+
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
 
-- 
2.40.1


