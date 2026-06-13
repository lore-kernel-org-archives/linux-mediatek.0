Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B169FCD8CA8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LAVcEQDdglp6OEtODuDMvvqd/PwbISrhunyPv7tH68=; b=ngZHUx4E6BiZsi+rhT11/GkBwI
	kyz3rjtHqwwM9kiePSIBE5PKVDlXJ/EdmpO2aFczIc7UBet9j4ZkGR9tXGR+LwUXslDvEPfP7po/4
	rP3n0D7p/Lw//BZ1rP/qZ/wP0XUgCTLNVU7FZwPWrf0Qi6NRIiRd2kVguB/FA5eU+IcD6r2Vuc5vy
	G1heQf/p5ZZduvwas/Sfx+y6fp9sIctT6pbdO8aTASE/Z2TipLJhy8XzCZyNU1KjYVXum5t0C52O3
	7DMQpE9fKSXJ87+HKE1zUZzjZNzVKQUT5hEqjqZ3JHIytW5vJjvRs/RU52+8iFtuM02Fdm4vbWztm
	LbbqDJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8Q-0000000CaQM-3m3T;
	Sat, 13 Jun 2026 22:47:26 +0000
Received: from mail-dl1-f48.google.com ([74.125.82.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8O-0000000CaOh-1rAp
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:47:26 +0000
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-138501f8c04so807318c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390844; x=1781995644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LAVcEQDdglp6OEtODuDMvvqd/PwbISrhunyPv7tH68=;
        b=CxLe8NebbkFrPa72gwWEp9UGHiRYtcWmTVbNN9WrBa/KuH4mM26zJM+lxx5rq2Ntr2
         mxQz+OG6fKVCaRijtWZD9246CSTez9qAOKFt6Y965n/bEH7jdjA0vTOVb9re1JtGowS/
         lnSGHa55kaxpQRLnxNBQ4r2W9BM8ob8ZaQe/IqLARAQsvATUCens2lbrE9Zy6a+725qO
         elWg3LQ2uT7wdh9w7TOSEdIQ60GcJ/jEkXo7ixyQhQnzZDLKlfY7VrANrZDEy1+ecVct
         +2uBAaQncRSdePMHQ8UeljZA1gKUM8R2e7JLM81RNI2CI5Gdwy6ZfV+HH57zPTSfeqWM
         g97w==
X-Forwarded-Encrypted: i=1; AFNElJ/D5K82BG/dtIkinS60CqsNxRypF8tJc/kaN3InJlS+p84k6t0MG/ychh99wPa1rWHK4H4BdwZawp3wHBXlSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/e7KCFaanb5G5hHK8FgzMRgIbtPTi8vsuFklYJLxXibkkrTK
	gnY0kiEIZLMMj7Q0eRqc2bl3E7hitsdIsCuu6ITtOx2k7waHWajBxf+l
X-Gm-Gg: Acq92OHR7A5UWoahEyAHxVZb70fljJvZIk3AMC0/WPZYcPN5VS26YXWt3Ckxi6O0tPb
	+VDDEiJlWKvTsqanLHRCiYtyTc6cQMiU2lCJ8HImooSwt+ED+xVZQA44UHLT7VwwDFl14ziOa2Y
	XPKBoGkQeUvDx3PdBuMEsf+SzdVuaS8e+tDY9pM3MlVffxJ44VD64KSwljGUD7/+Xa7BoGb/dHq
	WZy0EmvA3NR0/k38MHscX6qKCcWi4iPlNI3o8LuPvhQ4guFVrRht5eG6fq9nIoXtkN8ZhjiP+Ct
	kGkYuQ4J5J1Wk9boG69giUyiFJCSGYtS5SRnnbwhZG7kchiokydtpVC8KPqseSbBjbwXzycClBw
	YiL5hl9W41Yr3yiAWW3fvqNfo/EIPX+IiWR1nGzdCmMuHmtWXGQU81TebDbU5xmmzXz9/Mwgin6
	fF52sa8y87OPAQD20su2qz9oNj8QfAYLdUA2/xjP+IbPE4Bex08p+/+0I8CtAZ9jAwzxkWqf3WI
	KVV8nCgzmwIxrzMi2lEr3OwcSdqEEtafYgVGxv3
X-Received: by 2002:a05:7022:43a4:b0:138:3613:dbb with SMTP id a92af1059eb24-1386f240408mr2221497c88.5.1781390843584;
        Sat, 13 Jun 2026 15:47:23 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm6345380c88.14.2026.06.13.15.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:47:23 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 5/5] wifi: mt76: mt7927u: enable USB RX aggregation
Date: Sat, 13 Jun 2026 17:46:55 -0500
Message-ID: <20260613224655.2405686-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224655.2405686-1-sean.wang@kernel.org>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154724_484647_505C4A8E 
X-CRM114-Status: GOOD (  11.15  )
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

Enable USB RX aggregation on MT7927u with vendor driver parameters for
alignment, padding and buffer size. According to the vendor driver, the
hardware should run RX aggregation with USB SG disabled.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c |  6 +++++-
 drivers/net/wireless/mediatek/mt76/usb.c        | 11 +++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index a0bfe6f09ae4..42d13bc6ebbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -5,7 +5,6 @@
 #include <linux/module.h>
 #include <linux/sizes.h>
 #include <linux/usb.h>
-
 #include "mt7925.h"
 #include "mcu.h"
 #include "mac.h"
@@ -235,6 +234,11 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 		mdev->rev = (0x7927 << 16) | (mdev->rev & 0xff);
 	}
 
+	if (is_mt7927(mdev))
+		mt76u_enable_rx_aggr(mdev, MT7927_USB_RX_AGGR_ALIGN,
+				     MT7927_USB_RX_AGGR_PADDING,
+				     MT7927_USB_RX_AGGR_BUF_SIZE);
+
 	if (mt76_get_field(dev, MT_CONN_ON_MISC, MT_TOP_MISC2_FW_N9_RDY)) {
 		ret = mt792xu_wfsys_reset(dev);
 		if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 10ad2b024985..f0df510904c5 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1300,6 +1300,17 @@ static const struct mt76_queue_ops usb_queue_ops = {
 	.kick = mt76u_tx_kick,
 };
 
+void mt76u_enable_rx_aggr(struct mt76_dev *dev, int align, int padding,
+			  int buf_size)
+{
+	dev->usb.sg_en = false;
+	dev->usb.rx_aggr.enable = true;
+	dev->usb.rx_aggr.align = align;
+	dev->usb.rx_aggr.padding = padding;
+	dev->usb.rx_aggr.buf_size = buf_size;
+}
+EXPORT_SYMBOL_GPL(mt76u_enable_rx_aggr);
+
 int __mt76u_init(struct mt76_dev *dev, struct usb_interface *intf,
 		 struct mt76_bus_ops *ops)
 {
-- 
2.43.0


