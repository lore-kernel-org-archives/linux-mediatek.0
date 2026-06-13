Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9520CD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JzYLemSnfpa43nsfLDikr6xBCtsyqtawVe9WOQngZw=; b=UMh8R5mngfrpvD6ITHkfDQVtW/
	sYj5S2odckIz9OSUkEbHPaNyQSism7bRAkwbXAlyxNfz0BkF0GlVvg1Ssu/h2wDpcreVOphHd8Otu
	eA5rYm5Q7MNkm3ZrXgLNdIE4DRhigfhD910MWrCrbQEbbedinjmSnzpU73EkKL6d/i+pUApIIqUoU
	sOjf+sNKBOUcDEMm+jm8Cr6d5GHhbpL8EEW2VclFO7EPNTuPNeB90B5k4SDyq+G42lN/8KDL6i3ub
	1Ma4CYKk9+4IgpjMkfNs0yDV7nSzUedV8KzQpaFyhqR2gmfExn2EAf14S2PH1Pmt3AyhWeZps9ue6
	68E9H+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3n-0000000Ca6G-2q9U;
	Sat, 13 Jun 2026 22:42:39 +0000
Received: from mail-dy1-f180.google.com ([74.125.82.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3k-0000000Ca5f-2HaQ
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:42:38 +0000
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso4688401eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390556; x=1781995356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4JzYLemSnfpa43nsfLDikr6xBCtsyqtawVe9WOQngZw=;
        b=WhlXxnPIFiqMi5umtrs4CVXkLNOcQ2GxtV7RGPaM6wwLX7I24GqHj/xNf54iMvAEh7
         UwUPRFhqXIC95rmPnuP38mvpaeXWHEAlrZfBIF3UMU4/Za6Il3SDnOh6bsegbTuFJLCc
         oZ4o+P0jOM4SJ6uw9mEK1YK6wmn6X9CZrKzYWJxMWe7tVqE0uVJI1kmN4JfMwO8fOd5x
         etFq3IuYCtL41NTBT35c3OuX5Vl+E71n3M7xhk9/MKnFZM73AkSBDEY2EV4v8h2rkq0T
         BybpKLn8PlLxthMpgiJ7okBXqPYYOjRhT3rDzUq9Ku1C+WlPooUmelApAeF5Bs5w+TEB
         pUZw==
X-Forwarded-Encrypted: i=1; AFNElJ95AljyEiYELOuVBWNYqzgUcL4ygWfAUeBhb9kQru4QPj2KmqDjDCJBw29Sx3vJC/0VgbUa0NpARwWz7Scn4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIUF1x7+UQEHuq0HO9pdEuvC4HqmMEXs9OSywoEycMe8LtAEYZ
	Y/kK57LMw7f/F+WL1FwuCl/MIYZOyw/D/HRJbfFyLv0ugfgcPPTBjuDB
X-Gm-Gg: Acq92OHUA2SeOVBRrla1dhTZ2ZcrgVDQ5XVQMI+dDYtVOEHoDsY0SkHhz6zXo1Rcuvl
	p9NAFREtBjdsUt5VGrR6tAh7/iyUjVjF62t+wBAryRJMe8ZIEtC29Ri/Xq5gIJ+oAz6MAJBQ2gS
	0W5E213GpZ4TYOFID8bsMi3386T8AFIysXlZMV0eCJvEvxPIIJf8SCLHccvxWpJeY7smclJIu5o
	+Tbk+6xTie8JIAQl9sDnd2gpCTxBUM3pBO4xw91NFbJ5hLSMrIUD8pPuD2jyaVHS3xrPbrX2KkZ
	rg+NNFphvS/26wntxHmS49dTk7kSnNaj2HwKjRR0KyLLVDPDfgZ95p4eCJn6ZihzUAzC3Xg75QI
	qvUMk+g2anPw03sfcYxWLawu7hC1wzQbgsmfFteypnGx3BHePAV6ctg/WO+pv361yDofleDfdgR
	Ks4/J9RdhKkXgTSsROnNNZERYf2T2pRDKVcWtp+Ui7za6lD5SEJhO81mDj5Vwvtlw11klT1LJAL
	HdqwO9Vx7f7enO2fXLjGGHkK6Hk1OVlJVQwB9D6
X-Received: by 2002:a05:693c:65d1:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30ae52fa5d4mr1028861eec.10.1781390555746;
        Sat, 13 Jun 2026 15:42:35 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:42:35 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 4/6] wifi: mt76: mt792x: drain USB UDMA before WFSYS reset
Date: Sat, 13 Jun 2026 17:41:29 -0500
Message-ID: <20260613224131.2396026-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224131.2396026-1-sean.wang@kernel.org>
References: <20260613224131.2396026-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154236_582244_72541563 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

Stop USB UDMA RX/TX and wait for idle before WFSYS reset.
Warn if the engine remains busy.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index d86b0918c2f8..43191a8a9ea4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -11,6 +11,8 @@
 #include "mt792x.h"
 #include "mt76_connac2_mac.h"
 
+#define MT792X_USB_UDMA_IDLE_TIMEOUT	1000
+
 static int mt792xu_read32(struct mt76_dev *dev, u32 addr, void *buf)
 {
 	return __mt76u_vendor_request(dev, MT_VEND_READ_EXT,
@@ -339,6 +341,23 @@ static void mt792xu_epctl_rst_opt(struct mt792x_dev *dev, bool reset)
 	mt792xu_uhw_wr(&dev->mt76, MT_SSUSB_EPCTL_CSR_EP_RST_OPT, val);
 }
 
+static void mt792xu_wait_udma_idle(struct mt792x_dev *dev)
+{
+	u32 mask = MT_WL_RX_BUSY | MT_WL_TX_BUSY;
+	u32 val;
+
+	mt76_set(dev, MT_UDMA_WLCFG_0, MT_WL_RX_FLUSH);
+
+	if (mt76_poll_msec(dev, MT_UDMA_WLCFG_0, mask, 0,
+			   MT792X_USB_UDMA_IDLE_TIMEOUT))
+		return;
+
+	val = mt76_rr(dev, MT_UDMA_WLCFG_0);
+
+	dev_warn(dev->mt76.dev,
+		 "UDMA busy before WFSYS reset: WLCFG0=0x%08x\n", val);
+}
+
 struct mt792xu_wfsys_desc {
 	u32 rst_reg;
 	u32 done_reg;
@@ -405,6 +424,7 @@ int mt792xu_wfsys_reset(struct mt792x_dev *dev)
 	if (atomic_read(&dev->mt76.bus_hung))
 		return -EIO;
 
+	mt792xu_wait_udma_idle(dev);
 	mt792xu_epctl_rst_opt(dev, false);
 
 	val = mt792xu_uhw_rr(&dev->mt76, desc->rst_reg);
-- 
2.43.0


