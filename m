Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AECCD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsMgY2EJgIXW9akcAvoEYiqLT3dQNyDwGK85vWbbGj8=; b=dcDbh25nQbjMLjk+injOQy3ijq
	mjpypJBGJUgbAqMGVsYtI8ef7h2rgS82WycomgSPlirVwiZCC0g4t4s7UGAgPz0aV1XQzb7EBo90k
	BP9HFQMHfV6/vt90wVMXh03sJiKslE1zmLv1kEXGIr5R63BHPWwl+QJkZpJy5N+Z2K0XYg8CdYcHc
	uxHlDj8rmeDgMpv+eFkfgYDb9VS/tCEPWi7S5Pq9HSC4jxCmNcs+LaLt5Te1GPabikdDGIA3s0PwE
	KjFGUy1EN3YU9E9gxSbtrPYx8LAkRI5Ee+4R0jkB6qoCUAm3ar0HgDo58fLqv90DMbqeEhCNW5O70
	x0AflYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3s-0000000Ca7X-36yl;
	Sat, 13 Jun 2026 22:42:44 +0000
Received: from mail-dy1-f179.google.com ([74.125.82.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3p-0000000Ca6g-2LLc
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:42:43 +0000
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-307631dbfedso4719689eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390561; x=1781995361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BsMgY2EJgIXW9akcAvoEYiqLT3dQNyDwGK85vWbbGj8=;
        b=H/jvajB16EPTUvKguAe+5z4pL36rYXtQ3H/XjDDv5GKJRylE1SjOaex1AAU1DomXE6
         H+Fz/szcpRwJdFgKfedVwLS5NbOPR5FMhEv5h9kKeThl8bEJcDAnvzHvst+ly8XjKSLY
         g6kEewsvTsqyMGpC9maDkEbtu10BZ2rHjJr2Z/FNAj6C9XMUdDCyBHVFmG3BtgZ4H+hN
         3vlEQmHBNZ9OY3srZPiIao0U7xaQZUFbJlTScQqWlvBPnnZC3YgTRI2rSa60I8w9ZEFU
         SUQLtBl1q4KfqWid4oHvWgcdVb5iUm2gUzfg+Gvf8RbAqAf9dWkB9rPh9sld9DtW9+Wc
         SjCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eg42n66eCbq1aOAMqe4xnw6eWg8MPfV/NQ1INq9y65KuHnNl0WLkNRmGgWs796AF9LyYI26pedHi0yXzn7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPo/cH/ol3i+BWFemKX3zJ+VomDU5IIm+7geYa1elBl8iu+NXj
	+316l7AotsiqWbFy6F2LJuv8HfLrukuHPmql9zRa2oWPjthQf1dn09iM
X-Gm-Gg: Acq92OFyTbM3tDWOfgTXDBEgsqpViGVHcKAWaAc9qKFVWPnbu5AzcfIlYQONGuDZcC1
	BGmiJHpFeKmLxj0MkzVRonVCN+sWWB732ztbMqdD7AgcJcdvnhv0yQnxseM4Z8Rz/MzJx9b9I2/
	iOQWvTiHfv2EVQ3QWCiiTahyBJsivXg63Q/PORbcRpm6jk4cYS5hpj0aO0jJqeeS8mYvq5rbIdE
	1/RTlaCJQ3O8U+xaEQ47hSaGkXbbsHICkCbjooD0SquUuGowJ4H68IIH0pdIcKSXGWRR/4GpGFO
	PudxmorzdAlvDUHglZI+JSt/wS8Q43aDHSibhrgJErVkXZZdyJEn1C+6IUyJGRQ8bN3M3EwPphk
	3Bw8nVQfhw+S/CE6VCBHKVhqbzksuZGWaJuIt/OoHcGjDNs81zPEQvh79VTcKagLktQ23gfwqC3
	LFIwVOpZIl06ssB1GuiP0w8I2D4kMcvIYaMjEFAn9fJ4JVxjhqPe4xv/KVAEUDNh+naytGFDqa8
	e9UijoU/O+Fjad8J3GyvhQr0T5SKajex+88KV0q
X-Received: by 2002:a05:7300:e68b:b0:304:18be:55a5 with SMTP id 5a478bee46e88-30820056b92mr5093064eec.22.1781390560742;
        Sat, 13 Jun 2026 15:42:40 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:42:40 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 5/6] wifi: mt76: mt792x: enable USB UDMA TX timeout
Date: Sat, 13 Jun 2026 17:41:30 -0500
Message-ID: <20260613224131.2396026-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224131.2396026-1-sean.wang@kernel.org>
References: <20260613224131.2396026-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154241_597253_84152869 
X-CRM114-Status: UNSURE (   7.64  )
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

Configure the USB UDMA TX timeout limit and enable timeout detection
during DMA initialization, matching the vendor driver setup. Use a
longer timeout to avoid false alarms.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 43191a8a9ea4..c4da1b900d47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -11,6 +11,7 @@
 #include "mt792x.h"
 #include "mt76_connac2_mac.h"
 
+#define MT792X_USB_TX_TIMEOUT_LIMIT	50000
 #define MT792X_USB_UDMA_IDLE_TIMEOUT	1000
 
 static int mt792xu_read32(struct mt76_dev *dev, u32 addr, void *buf)
@@ -396,6 +397,10 @@ int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
 	mt76_set(dev, MT_UDMA_WLCFG_0,
 		 MT_WL_RX_EN | MT_WL_TX_EN |
 		 MT_WL_RX_MPSZ_PAD0 | MT_TICK_1US_EN);
+	mt76_rmw(dev, MT_UDMA_WLCFG_1, MT_WL_TX_TMOUT_LMT,
+		 FIELD_PREP(MT_WL_TX_TMOUT_LMT,
+			    MT792X_USB_TX_TIMEOUT_LIMIT));
+	mt76_set(dev, MT_UDMA_WLCFG_0, MT_WL_TX_TMOUT_FUNC_EN);
 	mt76_clear(dev, MT_UDMA_WLCFG_0,
 		   MT_WL_RX_AGG_TO | MT_WL_RX_AGG_LMT);
 	mt76_clear(dev, MT_UDMA_WLCFG_1, MT_WL_RX_AGG_PKT_LMT);
-- 
2.43.0


