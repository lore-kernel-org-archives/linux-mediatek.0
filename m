Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9779AFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKvYGV4TMUrux9536qByVnjjRcmL717VnswYtd09SmM=; b=4CQX6qyrBqRGpWHBVZEivXMOo+
	fdx4qS1t81BgBdF2lQmoeCOnanB8X22qoa5zg+e++s9fo4gvH7mqPD17i0IQUofRic+F32jGr51iD
	ebhyAcfRjRH8N5bCojKWM33NJrJ6q+WFxgC2L5DsM69x+atVkuDD36yYGDACNtD9IONRpPL+N5qMb
	4cQK0ypSvfERR88NFe4/chhReRKO+fZgrmYij8mYs6Zz3e1asliufEe/584ViClK2OrxxDGpgc4ej
	CDv1HULTB1Qh7bJWSEZt8+4vgSQb06Ndhrk1e9xPFOjEe+E7vuJs6GwuADFbRTHoMwq1I+iaSmOx9
	fniFSl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2O-0000000EmRu-2t4b;
	Sat, 25 Apr 2026 19:51:36 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2M-0000000EmQb-15Lv
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:35 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dcdca9dd6cso4891984a34.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146693; x=1777751493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKvYGV4TMUrux9536qByVnjjRcmL717VnswYtd09SmM=;
        b=ES/LamyL9lYzvby81+n/ieDmaWCrSBWNu3ln9hH8cw8v7eRNqZtXCSp9Z/uCdP7N5u
         YSx4OkHZTH8ukX06i5C0PmrNo949bnIoph7qYaslK85olS0vyvzI1XLZyMp0VTa5VQk3
         kSdUgVF0tErNV6VYrTowk0SNawJ7Ihp2q+Iqv+j+Ccod+teW0E6vmg0ZzDpP45pX+20F
         ygfvmjFlR7EzEokNhuLiiLb9ZYca5q+xL0idHYnGkeMY7HGqbQ1Jz5nORJqh1OE5QYzj
         2yLawVxKG7WN5fRkaKxlhybPFjHm7ivFoPoP8zG2wmqXGw0AWEkENyEZb1l0J9POf7Bg
         4O+A==
X-Forwarded-Encrypted: i=1; AFNElJ8ZPpTsxhjFM9XTe81I6AhPjvbxibFmX+qNlrATXw6Ckr1h6i+eJ+8hKC1dhMULQbVbqptJg+oLPZP+3o+EZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk0sHC9tvGTMkjJ/1Ij7fX72WPpXjas/P/wH3DEGyGSjRvzMlh
	oNRWf1qx9LmHeXhVutrRmojUtJ4ox6WdluTNOjA143D6qbpbBWscWLIL
X-Gm-Gg: AeBDieu958MrIMPL19VqArvSJzQ1qQKP3IPZMnSxbVq/mRHPb3pl0ELw/Sso75DKejK
	nEEMdenVb+geEptbndDsZyI1wv1pA2IPrd5ZQk6XpeFUMcoofgdgnxj92ZNzOw1v5NZG7h/j+vt
	mSAlmIrg5nv0hMghroBgaFOG0HkQrWJejk/OuWmyhyXiKKHL8DUMSxPuCR8Wb989/f2EY8JnGin
	7+d3wZag8tcLPl8qxgy4arENzq78/yFR1UfdnPLHgotH6kIqudUa8rXnFZEAT2fcYw5YxOH0fna
	0+FPxH9R4yiE8MBzaGzD4WHf3eit+8yXYZOyVJCblhMtxNFiNcvKHqsQNytHBAJagjGV0A4S6ER
	h7ZgogE3CFhMscA7dfAlCvl5pnr5AoqTT7UDYIfejVm+e64vFhDhnkfN5p9xhlU1Rc41TIDPCeo
	v4gSmKsHSXe0+RZE5HsrzUOb0Mn+k0aVTYnYpDN4ezcu6gPZuNpePU2jhy87Xqi8MaYsxSMYsLv
	g==
X-Received: by 2002:a05:6830:4392:b0:7de:298:5332 with SMTP id 46e09a7af769-7de029856acmr10430239a34.27.1777146693226;
        Sat, 25 Apr 2026 12:51:33 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:31 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 13/21] wifi: mt76: mt792x: add MT7927 WFSYS reset support
Date: Sat, 25 Apr 2026 14:50:03 -0500
Message-ID: <20260425195011.790265-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125134_308056_C0379885 
X-CRM114-Status: GOOD (  13.41  )
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

Add a dedicated MT7927 WFSYS reset path in mt792x_wfsys_reset().

Unlike the existing connac2/connac3 reset flow that toggles the WFSYS
software reset bit and waits for init-done, MT7927 reset is driven
through CBInfra and requires polling ROMCODE_INDEX until the MCU returns
to the idle value after reset.

Keep this dormant for now: no MT7927 PCI IDs are added by this patch, so
it only prepares the reset logic without making the driver bind to MT7927
hardware yet.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 57 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt792x_regs.h  | 11 ++++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 002aece857b2..2835bf273154 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -370,7 +370,54 @@ int mt792x_poll_rx(struct napi_struct *napi, int budget)
 }
 EXPORT_SYMBOL_GPL(mt792x_poll_rx);
 
-int mt792x_wfsys_reset(struct mt792x_dev *dev)
+static void mt7927_sema_status_read(struct mt792x_dev *dev, u32 addr)
+{
+	u32 remap;
+
+	remap = mt76_rr(dev, MT7927_PCIE2AP_REMAP_WF_0_54);
+	mt76_wr(dev, MT7927_PCIE2AP_REMAP_WF_0_54,
+		(remap & ~MT7927_PCIE2AP_REMAP_WF_0_54_MASK) |
+		MT7927_PCIE2AP_REMAP_WF_0_54_VAL);
+	usleep_range(10, 20);
+
+	mt76_rr(dev, addr);
+
+	mt76_wr(dev, MT7927_PCIE2AP_REMAP_WF_0_54, remap);
+	usleep_range(10, 20);
+}
+
+static int mt7927_wfsys_reset(struct mt792x_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 val;
+
+	mt7927_sema_status_read(dev, MT7927_SEMA_OWN_STA);
+
+	mt76_set(dev, MT7927_CBINFRA_RGU_WF_RST,
+		 MT7927_CBINFRA_RGU_WF_RST_WF_SUBSYS);
+	usleep_range(1000, 2000);
+
+	mt76_clear(dev, MT7927_CBINFRA_RGU_WF_RST,
+		   MT7927_CBINFRA_RGU_WF_RST_WF_SUBSYS);
+	usleep_range(5000, 10000);
+
+	mt76_wr(dev, MT7927_CBINFRA_MCU_OWN_SET, BIT(0));
+
+	if (!__mt76_poll_msec(mdev, MT7927_ROMCODE_INDEX, 0xffff,
+			      MT7927_MCU_IDLE_VALUE, 200)) {
+		val = mt76_rr(dev, MT7927_ROMCODE_INDEX);
+		dev_err(mdev->dev,
+			"MT7927 WFSYS reset timeout (ROMCODE_INDEX=0x%04x)\n",
+			val & 0xffff);
+		return -ETIMEDOUT;
+	}
+
+	mt7927_sema_status_read(dev, MT7927_SEMA_OWN_STA_REP);
+
+	return 0;
+}
+
+static int mt792x_wfsys_reset_default(struct mt792x_dev *dev)
 {
 	u32 addr = is_connac2(&dev->mt76) ? 0x18000140 : 0x7c000140;
 
@@ -384,5 +431,13 @@ int mt792x_wfsys_reset(struct mt792x_dev *dev)
 
 	return 0;
 }
+
+int mt792x_wfsys_reset(struct mt792x_dev *dev)
+{
+	if (is_mt7927(&dev->mt76))
+		return mt7927_wfsys_reset(dev);
+
+	return mt792x_wfsys_reset_default(dev);
+}
 EXPORT_SYMBOL_GPL(mt792x_wfsys_reset);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index 20d27ae89aca..17504ef8e80d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -493,4 +493,15 @@
 #define WFSYS_SW_RST_B			BIT(0)
 #define WFSYS_SW_INIT_DONE		BIT(4)
 
+/* CBInfra registers - MT7927 combo chip */
+#define MT7927_CBINFRA_RGU_WF_RST		0x1f8600
+#define MT7927_CBINFRA_RGU_WF_RST_WF_SUBSYS	BIT(4)
+#define MT7927_CBINFRA_MCU_OWN_SET		0x1f5034
+#define MT7927_ROMCODE_INDEX			0xc1604
+#define MT7927_MCU_IDLE_VALUE			0x1d1e
+#define MT7927_PCIE2AP_REMAP_WF_0_54		0x21008
+#define MT7927_PCIE2AP_REMAP_WF_0_54_MASK	GENMASK(15, 0)
+#define MT7927_PCIE2AP_REMAP_WF_0_54_VAL	0x00001807
+#define MT7927_SEMA_OWN_STA			0x40000
+#define MT7927_SEMA_OWN_STA_REP			0x40400
 #endif /* __MT792X_REGS_H */
-- 
2.43.0


