Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F8C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51tKyP36tDuGpcEaNaaGVAIec2B8UojDAEaCdV7fQHs=; b=1plKaGEUqBhHoZvYSm/twEQOVX
	Xwj6S+s3TGkXLSRFsQYSPLThOXZJiJ6hea/YcFT8KyWuvUCBaAYt7OYkU2UWfOlRDvLtdNmEy+vc6
	oRSq2t6Aj3ttJPvwAbIH+CijNzgi71vU7XTUSMhp0NFK7FnPIyM0C5OzFrVVW6Ya4K43gSWbcIOcl
	Ip+vQa0/RFsdZGhoK/Y9MDXk702Ekp4UoP4snlqFD63eR6YL58yA9IUoQFwLTHmIlfzHweGz5fhC2
	M89I80qcMY47cnBFdbXQqfj4V/7dxiN1v4oK48dEMUo0DgZyKIMm2P8NeV4K2xz4PyP/oS2AZG2ue
	QLBfoC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8F-0000000Gs29-2wVB;
	Sun, 27 Sep 2026 21:09:59 +0000
Received: from mail-oa2-f35.google.com ([74.125.231.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8D-0000000Gs1p-2RKu
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:09:58 +0000
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-491c13d63d9so1740099fac.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543397; x=1791148197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=51tKyP36tDuGpcEaNaaGVAIec2B8UojDAEaCdV7fQHs=;
        b=OUAZgOHi2O7MIDQtKcMpC6Yc6kTBKMF8Uja38/E+Gn+meRXc/H3CiGsfRC2JrBumdq
         gLlm6m3hH1Yr18KT0O0TdOJiXuxICiNzj3wsw/rgZdIkabJaCy+nrIcNQAOCie3KqIbC
         ZKcuL6OEIpzdG9TR/Ldmnogx5ClE/s1O4TvPCggO8t6qtZostPTL9q2bbwnkTNrIu0ig
         Mf0UyhcySuSnYdNNdc2zLWSvoL3Vkr2o10Far4yXmZqwmKCQfK+5ocKmbTf6R7gRsIzl
         8W9leQH7OqAdQMc8vEydCNwDFVCbl5y0p/fadfBGfwgU3K2SPWZ4VKhlpbmUmjYd7kFg
         wDfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd46nw9Wi1mRsFoy5H77LlbmPfNJPsvbcSVCCaDmwQ2QEZox/pTHAuoXFyu6izcyZ1G8bGa7cYDWAF/u8KVw==@lists.infradead.org
X-Gm-Message-State: AFuF++nsMZPRlMNhFTUK4wC1pDSRlcvoN4uYcR6kghybeLUkbVRW5J3d
	FEyBtACNwX67t/fYF+iPuZWAwCfuuBv5XTakg5mqvDSgqVlJ10naxcF+0NkTURAq
X-Gm-Gg: AYBFou2I8PleZmYuEZAyC9IJ+R3FH9gSiyebCm7l6v6+GY7w9qFo8sGebnMBDZnbLnw
	3g1WNVYfG0oVwFzmAIhMQpDHDRGU3chSY4ymc30eiy2inK8ezeCxAHoMztRw/NyDYZZzowZAEm7
	H9UWXNhgjuVQZicynqvwLzdqOexugGVGJosrGlGpTnTvgpvzlTWwchVGeOKfZsmPv3ubTgvNlHa
	Qp33gBlmoJ0pWuSn3hcxMWGt7yyyp9HU5z1MDsJ4ZIhw0niYw/lfoSe6yKKeYSh1XB20UYixpK3
	CO1ZAvE9DaNaCFQTQ57I0PIzCawpV0gtMPaX+aAWyPH8q7WDcRKrFrnNitK9eC5HuxCepaR2936
	XqhpwRI7MbxNxwceDHgi+T+C0DrGzizLIxc7WkZXz90zHpVf9oC68ssk8luGSLqabKI/J8tarzF
	RVxApQomD/rgW0lxxyWi74cqIJ/dudyfV6bDLIvdT2n+Z8XhjivQMZ+GYAXRCZe3XmPsgtW1kzf
	KzpoqfhrdRcK9KiGf787mJsjTzAxLZg9ATngeV2frFAjTy+yxwupCClTwcrjbrTKgeayw==
X-Received: by 2002:a05:690c:8f:b0:884:c7c1:31c3 with SMTP id 00721157ae682-8a64bb0003cmr58968007b3.10.1790543067107;
        Sun, 27 Sep 2026 14:04:27 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:25 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 20/23] wifi: mt76: mt7925: disable only the RX NAPI instances that exist
Date: Sun, 27 Sep 2026 16:03:02 -0500
Message-ID: <20260927210306.737669-21-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140957_650164_9D5475EE 
X-CRM114-Status: GOOD (  15.06  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

mt7925e_mac_reset() picks the RX NAPI instances to disable from the
interrupt masks, but the instances themselves are created per allocated
RX queue by mt76_dma_init(). On mt7925 the two do not agree: the tx-done
ring is only described by the mt7928 DMA layout, so q_rx[MT_RXQ_MCU_WA]
is never allocated and never gets a NAPI, while mt7925_irq_map still
carries rx.wm2_complete_mask.

A MAC reset therefore calls napi_disable() on an instance whose
net_device pointer is NULL. The fault happens inside napi_disable()
while the reset work holds the RTNL, so networking goes down with it and
the machine is left answering ping with no usable userspace; only a
power cycle recovers it. Repeated NAN data path setup and teardown hits
this reliably on a busy channel, where MAC resets are frequent.

Iterate the RX queues instead, the same way the restore path further
down re-enables them, so only instances that were actually added are
touched.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 6e9daf96da88..32463ef30ebb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -127,12 +127,19 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	mt76_txq_schedule_all(&dev->mphy);
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	if (irq_map->rx.data_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
-	if (irq_map->rx.wm_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
-	if (irq_map->rx.wm2_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+
+	/*
+	 * Disable the RX NAPI instances that were actually created. They are
+	 * added per allocated RX queue by mt76_dma_init(), while the interrupt
+	 * masks describe what the hardware is able to raise - on mt7925 the
+	 * tx-done queue is never allocated (only mt7928 defines that ring), so
+	 * its NAPI has no net_device and napi_disable() faults on it while
+	 * holding the RTNL, wedging the whole machine. Iterate the queues, the
+	 * same way the restore path below re-enables them.
+	 */
+	mt76_for_each_q_rx(&dev->mt76, i)
+		napi_disable(&dev->mt76.napi[i]);
+
 	if (irq_map->tx.all_complete_mask)
 		napi_disable(&dev->mt76.tx_napi);
 
-- 
2.43.0


