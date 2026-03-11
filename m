Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55237FD88D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 00:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ATRiGzqYc/km5OI3xmsPtelJTLro5lPbW2iw0ZmTlE=; b=BdRGM3xRAWCZHjqTuZOnHHTIAS
	PlpGemByLukYuSdB+2x1eN400tWWSpXufWlAumUdXk+8WpNVqgmQNbDT2dX9UF0LgNkGA0PaIeHbc
	j2icLvDEhUdEtk86jI4iJxtlLfTLp92J8NaQfbb+Yj9ZHYcX0aGx7Ixbr+2XcswSNa1+vNKOeWG5J
	yG+4/BWyP/wZzimwN5J/YuPbXzOPXzs83x4zuxfcxrmj3mI49Ht6/H1/iTfv7D13/0TorAAKfAZoD
	Htgty9lOPlhWBqxHUa3Sl1Si/vRe2XAxHJ1pnjQdlISU82quTbm6lhhUHiyMGWW16BV5EIFghIGNl
	27WHEYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07RA-0000000ARJ6-4AFi;
	Wed, 11 Mar 2026 00:28:32 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07R8-0000000ARIi-3Cwg
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 00:28:31 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-464bc03efd8so7998877b6e.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 17:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188909; x=1773793709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ATRiGzqYc/km5OI3xmsPtelJTLro5lPbW2iw0ZmTlE=;
        b=FqvOsc2XR4C/loznHzNpb4m+h560dOQjM1suViyduBMFu/jyKn7FqTojLuzaMp8eJR
         oLZx1KtpxH/kno0UqHpK2Aiog1DDklDZdiAlPHhEK4DPjOC6lMfQkJVQ9/GvH1aunTfH
         303+cEySnNMEBXBqykt1zPWM2yHDSWolk9lyCUGFgVY4GZ+lBMQKxQNvFEHrqsMDz1ed
         9Py8sYx42uyT/jJBoqGbew1zK3bhIdEceZKiHvEebWFNQd3niWoJ5cZpWUjt1yWTriXe
         ZbWVhSPM0LhdjvYS5jDzGtAKw/JLuoXnXs7oJ+9gVX6jYRgNd8n66/BAaFx38+1XJ2ld
         FT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWS6E2Vv5Z/NUV/ndNMxmaPdG5pUjOHVi8a/twa6VjHfslA4qQIj2cPoJFF0kJN111vJQ0g1mqcI1JJ7m7Saw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk/wNwzKJ1LKX6HYI85134CkN+rmWRPEHVGIMJONKkM1rw9uRj
	Rncld4MUpiGQWcZdFzytcpUPBa+zLpZonWyRiyjReawiMTpPPCYpmHjj
X-Gm-Gg: ATEYQzwdoo+hulhP6HP57+cGAUqVV8ChFb9AQKToQNiQL/KzskDsdvsq6zWU2hb3vpF
	+nUyXBukj2hhiTMVD+b6GDJv89Tsqy9EcnVNhWbO76VXb/9CwAkLxS8zumizugxu1x3q4L987NA
	0lh8oqWj9eUOJq+QBRA0/zqijMdVf8a7gsx87UZwOYSmqo3/esLW+s4vTILpaQQYrE1SFGsvwuj
	B+H8N19SiHtHQjS4E3rmTt5iiARHKjET9qRdDXhDIpG5yZ7MVmKwQXNW+AH5icf5ApH1l6XlYB0
	Q/7XEO0N8MaMhvms+mTP1nMt5YlBMZItBAXB9WaaNtpzNs8X6E4DVqiCZ6SzVjjpw5/8ayaCSKK
	JX2cFymHiFVdKLQUZPg44Gk2uRB8rX7LwIhbJVtilekd//i/qgQIPothS1LE+rrUfRJ8t99cOr0
	VZQ+t/P/8FiRyvoUzwVIRCIavVtIB0OwIdyBjv2n2gE2FXnPE=
X-Received: by 2002:a05:6808:13c1:b0:450:d471:dce5 with SMTP id 5614622812f47-467333f0844mr413343b6e.6.1773188908872;
        Tue, 10 Mar 2026 17:28:28 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e72b40asm516497fac.20.2026.03.10.17.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:28:28 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt792x: describe USB WFSYS reset with a descriptor
Date: Tue, 10 Mar 2026 19:28:24 -0500
Message-ID: <20260311002825.15502-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_172830_808183_8CA779A6 
X-CRM114-Status: GOOD (  11.26  )
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

Prepare mt792xu_wfsys_reset() for chips that share the same USB WFSYS
reset flow but use different register definitions.

This is a pure refactor of the current mt7921u path and keeps the reset
sequence unchanged.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 40 +++++++++++++++----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 552808458138..a92e872226cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -206,6 +206,24 @@ static void mt792xu_epctl_rst_opt(struct mt792x_dev *dev, bool reset)
 	mt792xu_uhw_wr(&dev->mt76, MT_SSUSB_EPCTL_CSR_EP_RST_OPT, val);
 }
 
+struct mt792xu_wfsys_desc {
+	u32 rst_reg;
+	u32 done_reg;
+	u32 done_mask;
+	u32 done_val;
+	u32 delay_ms;
+	bool need_status_sel;
+};
+
+static const struct mt792xu_wfsys_desc mt7921_wfsys_desc = {
+	.rst_reg = MT_CBTOP_RGU_WF_SUBSYS_RST,
+	.done_reg = MT_UDMA_CONN_INFRA_STATUS,
+	.done_mask = MT_UDMA_CONN_WFSYS_INIT_DONE,
+	.done_val = MT_UDMA_CONN_WFSYS_INIT_DONE,
+	.delay_ms = 0,
+	.need_status_sel = true,
+};
+
 int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
 {
 	int err;
@@ -236,25 +254,31 @@ EXPORT_SYMBOL_GPL(mt792xu_dma_init);
 
 int mt792xu_wfsys_reset(struct mt792x_dev *dev)
 {
+	const struct mt792xu_wfsys_desc *desc = &mt7921_wfsys_desc;
 	u32 val;
 	int i;
 
 	mt792xu_epctl_rst_opt(dev, false);
 
-	val = mt792xu_uhw_rr(&dev->mt76, MT_CBTOP_RGU_WF_SUBSYS_RST);
+	val = mt792xu_uhw_rr(&dev->mt76, desc->rst_reg);
 	val |= MT_CBTOP_RGU_WF_SUBSYS_RST_WF_WHOLE_PATH;
-	mt792xu_uhw_wr(&dev->mt76, MT_CBTOP_RGU_WF_SUBSYS_RST, val);
+	mt792xu_uhw_wr(&dev->mt76, desc->rst_reg, val);
 
-	usleep_range(10, 20);
+	if (desc->delay_ms)
+		msleep(desc->delay_ms);
+	else
+		usleep_range(10, 20);
 
-	val = mt792xu_uhw_rr(&dev->mt76, MT_CBTOP_RGU_WF_SUBSYS_RST);
+	val = mt792xu_uhw_rr(&dev->mt76, desc->rst_reg);
 	val &= ~MT_CBTOP_RGU_WF_SUBSYS_RST_WF_WHOLE_PATH;
-	mt792xu_uhw_wr(&dev->mt76, MT_CBTOP_RGU_WF_SUBSYS_RST, val);
+	mt792xu_uhw_wr(&dev->mt76, desc->rst_reg, val);
+
+	if (desc->need_status_sel)
+		mt792xu_uhw_wr(&dev->mt76, MT_UDMA_CONN_INFRA_STATUS_SEL, 0);
 
-	mt792xu_uhw_wr(&dev->mt76, MT_UDMA_CONN_INFRA_STATUS_SEL, 0);
 	for (i = 0; i < MT792x_WFSYS_INIT_RETRY_COUNT; i++) {
-		val = mt792xu_uhw_rr(&dev->mt76, MT_UDMA_CONN_INFRA_STATUS);
-		if (val & MT_UDMA_CONN_WFSYS_INIT_DONE)
+		val = mt792xu_uhw_rr(&dev->mt76, desc->done_reg);
+		if ((val & desc->done_mask) == desc->done_val)
 			break;
 
 		msleep(100);
-- 
2.43.0


