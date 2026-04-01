Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4759510FCAC9
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bbbtUfPpmMH6eFM76akrOLWA1LQMByWmMa0q4rif0s=; b=djVo+6HnBA5cqIPrRmidMAxfMi
	GY9d63CxTqAbZSI+quromeZjKc+RN23ZkAb2uK2bOlhUOb3OCiElBmrTb5WbRXK6lAwmglH7uMBXd
	c/cWddpQJ2s+40kBoaMmDLrgvTQUU+xmXmBuQxMvlA6Y7FZQvsOqEG+SE0tM+TQYBntio4co40J1l
	7LP8bO7fMlEmuHhS2zHBfEfwrVcI1GNUnPafKKyChJOmRmOwxxA37dVnmeweKtWqGXHS9QxdoDbqb
	0/SXwzR+64FXwd9BhIkE6e6W5GSwa4qCguft+kuMeNz3Pi83xjFV5azj5gdO0CB3e+LAEQUkNJ08R
	yIPsZzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80tx-0000000G05Q-0cwd;
	Wed, 01 Apr 2026 19:06:53 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80tu-0000000G045-0YzE
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 19:06:51 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d91f82d819so96007a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 12:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070409; x=1775675209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/bbbtUfPpmMH6eFM76akrOLWA1LQMByWmMa0q4rif0s=;
        b=rsSwUK0Y3vf99OMBGr/DWxv+4xCLWxL8UyAEuD1ciJxaNSFfB8L9fjUQxkuEULC3Uv
         6KNittvPJUSErplpaZDb/iEYyX65RW2aaGqKSJ7NmTdqqV6vpp2lfVpLKHEXIVYr6pz8
         GYNm2UxF1aqzcHtnwSprp+WlM8QIn+u8MKaLGRupDneGZYOxPThBTqXVntXTWuVfJLiw
         ZVEwTUdPXK5I4qKTMHQ5BqOiZXwchnxQDBdtoV+MOw+RElKOH7KYShEY5bpP5BPgpZeb
         2XPCvaE+sP0CeYYkO8XbjO6KwbsVcN1SxHqzbX6aitq4jaz9BPEHrZ/zwRzojtS8zFAc
         YTxg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Sk6d8ajWfnxIemCUjRor+91ejKZn/9rRhJR1rljRKyNbXwwU1DTFLbjeCE47DJwe8q7JLmny+qQpxvU89g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMmzlvyT8WFfdCd1+7hUmNePQXGiyMBz4nUH0iqATsalF/uRyL
	2tDMGxHZpXm8666OyWlb8V4StQtBgPoa2j9nz19UZ3Z+iHaal4u8Hbcp
X-Gm-Gg: ATEYQzw0Mhp+bIhvTLUoDVPDZCq4wmFTikPB+yrdejXr+jYP2i5Nep4GFOGVnKoJDQQ
	LN6iWJUz1Rm1xD3yyiB+LVBlvxL08SB2bbTMQKwTDtReLU/V40gPQlIy3No5kTGAidXg3BAKJ3o
	N+lPSmRolD3zzmgCEi3utXQRWtk6/J2xCGPBtHDuV2RyyLeOBVwBK8/C1+69KPsOKAc9Y5kHN2G
	TfdlM8k325AGq64/K0VJIRtKzBzEO22eSShcgdXxK86EuwH/XEzdEASm9oIDO+9CjoQq5oJsWlF
	NmVga+tCkBAtdSKvfrP8j2poSaJxJ1gJ/jYesxSp75Ottop9JrNJfgkzWDFN2i/KGHpY/cnaD3s
	pAyxJ7uRjGqHgbApUQ/4/u02MN1WXrjs+usJ67LoxS/sw31yQ1Q9SzVpOuTTiPy1RDtdIm4O5WK
	uw5Lqy+HvK0wMOq+t5gpndQCiYirCkXomFkfBWkYorga2T1Tc=
X-Received: by 2002:a05:6820:4dcb:b0:67e:367c:998b with SMTP id 006d021491bc7-67fabd207eemr2654797eaf.59.1775070409001;
        Wed, 01 Apr 2026 12:06:49 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eaf2c780sm551867fac.6.2026.04.01.12.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:06:48 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Bryam Vargas <bryamestebanvargas@gmail.com>
Subject: [PATCH v2 2/2] wifi: mt76: mt7921u: escalate broken USB transport to device reset
Date: Wed,  1 Apr 2026 14:06:32 -0500
Message-ID: <20260401190632.147042-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401190632.147042-1-sean.wang@kernel.org>
References: <20260401190632.147042-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_120650_178852_AEC83CCD 
X-CRM114-Status: GOOD (  15.71  )
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

Check the USB control path before running the normal WFSYS reset flow.

If USB access is no longer reliable, stop the WFSYS-only reset path,
mark the device as bus_hung, and queue a USB device reset instead.

Reuse the existing bus_hung state to represent transport-level failure,
keeping the semantics consistent with the SDIO path.

Also initialize bus_hung explicitly during probe for consistency.

Reported-by: Bryam Vargas <bryamestebanvargas@gmail.com>
Closes: https://lore.kernel.org/r/CANAPQziOh3sB7B8G+U3AZsFfeFN1uAg4munhwA_feZi56D7W+Q@mail.gmail.com
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
- Rebased onto the latest mt76 tree
- Added the proper Reported-by tag
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  4 ++-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |  5 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 26 +++++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db73f..d27dbee8df1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -675,7 +675,9 @@ void mt7921_mac_reset_work(struct work_struct *work)
 		if (!ret)
 			break;
 	}
-	if (mt76_is_sdio(&dev->mt76) && atomic_read(&dev->mt76.bus_hung))
+
+	if ((mt76_is_sdio(&dev->mt76) || mt76_is_usb(&dev->mt76)) &&
+	    atomic_read(&dev->mt76.bus_hung))
 		return;
 
 	if (i == 10)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 6be28f4152ed..8c0f0e4ef87b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -88,6 +88,10 @@ static int mt7921u_mac_reset(struct mt792x_dev *dev)
 {
 	int err;
 
+	mt792xu_reset_on_bus_error(dev);
+	if (atomic_read(&dev->mt76.bus_hung))
+		return 0;
+
 	mt76_txq_schedule_all(&dev->mphy);
 	mt76_worker_disable(&dev->mt76.tx_worker);
 
@@ -196,6 +200,7 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &hif_ops;
+	atomic_set(&dev->mt76.bus_hung, false);
 	mt792xu_reset_work_init(dev);
 
 	udev = usb_get_dev(udev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 5f06074591ca..74222c507b81 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -494,6 +494,7 @@ int mt792xu_init_reset(struct mt792x_dev *dev);
 void mt792xu_reset_work_init(struct mt792x_dev *dev);
 void mt792xu_reset_work_cleanup(struct mt792x_dev *dev);
 int mt792xu_check_bus(struct mt792x_dev *dev);
+int mt792xu_reset_on_bus_error(struct mt792x_dev *dev);
 u32 mt792xu_rr(struct mt76_dev *dev, u32 addr);
 void mt792xu_wr(struct mt76_dev *dev, u32 addr, u32 val);
 u32 mt792xu_rmw(struct mt76_dev *dev, u32 addr, u32 mask, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 2558d87b1e0f..6b10d035bcbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -60,6 +60,32 @@ int mt792xu_check_bus(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792xu_check_bus);
 
+int mt792xu_reset_on_bus_error(struct mt792x_dev *dev)
+{
+	int err = 0;
+
+	if (!atomic_read(&dev->mt76.bus_hung))
+		err = mt792xu_check_bus(dev);
+
+	if (err) {
+		atomic_set(&dev->mt76.bus_hung, true);
+
+		if (!atomic_xchg(&dev->usb_reset_pending, 1)) {
+			dev_warn(dev->mt76.dev,
+				 "USB transport access failed (%d), queueing device reset\n",
+				 err);
+
+			schedule_work(&dev->usb_reset_work);
+		}
+
+		return err;
+	}
+
+	atomic_set(&dev->mt76.bus_hung, false);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792xu_reset_on_bus_error);
+
 u32 mt792xu_rr(struct mt76_dev *dev, u32 addr)
 {
 	u32 ret;
-- 
2.43.0


