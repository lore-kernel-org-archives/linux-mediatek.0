Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105A3CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWLGv9Y4GK+/8ohbMRbqe5K8I5e8cq8oVoD3eATBTI4=; b=XbCXVhsxokHXFIzsouX2qKQUfV
	Q0PFMMj5cW2jp6MlTci1aVZMNEHDH09QdDNX+dHj2fDTAXvY6TvAawaD4NnQIn1/i1fELodIaNGFQ
	U5qYWp3ujsn94Nm3kLPyGNhZmiUh3xcQVVwD9KlzuIpYYn0DeXPwAoVByZ0J6OQvNXmFCjIgzaWd4
	gCLToIv7bqNb8U/KpgYBSG0+aOBZeCCtUzpBe9sRtldC1C7miqt121bBsQsxLrQyxIqxWTuuztXGV
	KO5v7PAsUB1HYNxa3Yp/re6Y7LOGWUlr94w0pmkFlz80b4OE7YoLXA2yaQHA/rpmYe4EXF6dxPMJT
	oV+11IVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLzx-0000000EmwQ-13zR;
	Wed, 10 Sep 2025 14:40:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLzs-0000000Emql-2oiG;
	Wed, 10 Sep 2025 14:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41EDC4387D;
	Wed, 10 Sep 2025 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A29C4CEF9;
	Wed, 10 Sep 2025 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757515232;
	bh=taUPWVbgxBMKNOUuvqW/XXyWoCI/+h6dzXA1uLqvJGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iIKmwhDQuH6Y22e1S1IwR90PbM6YE1ekez584C73n7Th6peFPX6lar8wwSlb6bvtr
	 YTglKglegUbNnx5I29qFNUt8/JoFmkeD7pWYp97BB3wl4pYTRO1ZMPy6R7hrJKBE9A
	 0b67c1Jx4a13z0uWbK9DaatMgv9wOxHKoCMlkPP1shD6J5EbQIRnjjb+FgIQWmFov4
	 fcfpOJurPxZupwMQJYdfUqZU5xkMsL4sbtk7HSMkE1ijGaQpA4k1lIb1Vjkr/r4jOI
	 pzVaPbN+jiUvZ/Dm+R4LKSOxOnDeyCmzG+dVeadICLa/Wrf7mczOXhwLfO2p9kDFzY
	 WCTABe+A+wTHg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 10 Sep 2025 16:40:04 +0200
Subject: [PATCH mt76 3/5] wifi: mt76: Add the capability to set TX token
 start ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-mt76-npu-devel-v1-3-dbde4a37b9c0@kernel.org>
References: <20250910-mt76-npu-devel-v1-0-dbde4a37b9c0@kernel.org>
In-Reply-To: <20250910-mt76-npu-devel-v1-0-dbde4a37b9c0@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_074032_734663_43E2582D 
X-CRM114-Status: GOOD (  11.36  )
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

This is a preliminary patch to enable traffic forward offloading via the
Airoha NPU module available on the Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 drivers/net/wireless/mediatek/mt76/tx.c   | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d14baea02c48b6c40cd9fc45178aa4eba3e297f1..1b5aa311b192d78660bf2e9649d890c4b8c4fa46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -944,6 +944,7 @@ struct mt76_dev {
 	struct idr token;
 	u16 wed_token_count;
 	u16 token_count;
+	u16 token_start;
 	u16 token_size;
 
 	spinlock_t rx_token_lock;
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index e6cf16706667e783168dbd7fefe3254f0797ae67..823386e83cd004d5c8eaa256699cb543d8f1bc8c 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -846,8 +846,10 @@ int mt76_token_consume(struct mt76_dev *dev, struct mt76_txwi_cache **ptxwi)
 
 	spin_lock_bh(&dev->token_lock);
 
-	token = idr_alloc(&dev->token, *ptxwi, 0, dev->token_size, GFP_ATOMIC);
-	if (token >= 0)
+	token = idr_alloc(&dev->token, *ptxwi, dev->token_start,
+			  dev->token_start + dev->token_size,
+			  GFP_ATOMIC);
+	if (token >= dev->token_start)
 		dev->token_count++;
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED

-- 
2.51.0


