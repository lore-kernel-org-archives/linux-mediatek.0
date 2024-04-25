Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF29C19F4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDeY9bcalP61bq7Yrea1EZ8X+JxvOuN8Y2tqOpBrKaI=; b=LpjAZHHBk2zFg5QBpOjO360UAq
	VIuIWpmL6CI3HAdpCJ9hYK7UmYSj0A1NKncxYRQ3RSXBLhuQRtGQN/+tyAqYWvImDbYKH4+q5juYI
	PK5g0PxTLVpOa4rsNZc5bLD/dFDH/xaKPDNHR1Zm4W3REaSrsAqwflXX6dk4Gavec3buh5YPeKtUA
	Lb8UucPVkeHMYmAN523KHufwh4krM/B+kfBBD5CKkyjFtQjwV8PfndpAqj6s6c8C6Uz2cEsizlkjW
	ltVw4kE+iXWoi2h/Z3xjs+xTIvpkAu3+QksRAsKWLHJW80ggRPy8rHI995ZuSzGrdO+5os98jrDrB
	tQKYOHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FS-0000000APIT-1uQt;
	Thu, 25 Apr 2024 22:07:22 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FN-0000000APEE-2kwJ
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 22:07:18 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5acf5723325so406750eaf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Apr 2024 15:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714082836; x=1714687636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDeY9bcalP61bq7Yrea1EZ8X+JxvOuN8Y2tqOpBrKaI=;
        b=HPqnIJhzlm+BRjwIv3FkT64dlgT7jnRNOelRLuBLts6kvgk0b6ncmRGKQqEWeabm8L
         RMP1PFysTRB+2TifBv6dMZh6EQncqC9ovR5L3Ml4CSgQmN1bqRBq7B97LEB4QQGwCyj6
         sZcpaWipDV8kw9F80PnJweiSm2I4S48+0w6sxc/hgzptQ8baBrtLBRYiHj14vHbH7rnb
         hRH1+GwtxSsJZKJRUUAbdwu15dviKoAW+GFpMwtDoO+S/xPTW2wYhe1s/BK5o/6KdCtw
         Rz7XnEfxurzWSFCuoL31W4VYVggUross3uzL1Z0XGkJf4CPNYkZhVP+kEQ1/R/2hNz5O
         5guA==
X-Forwarded-Encrypted: i=1; AJvYcCVNlftv0BEeoo8+9JYJUIIDf45QzWZz5oj7kTxv2NjuOZYOyXvH49f12PBG3m9hmuAVcgfYUZQ1bRQ67TJgK7C1FbiIT3oUasV81Ka7VS8VvY9r
X-Gm-Message-State: AOJu0YxKfLzeO5phIOuKefdgIYEkKNrsCvzuUNSEJRKUzjw/oY8DOVRg
	agZzxLUcsx4c30pB4eHiogGRw8suNLDn3g6EAsyao3AGEcWkgB9h
X-Google-Smtp-Source: AGHT+IFX6ngfhSp/W7LZ7JR+f93Nfg4mCIdoKo+WNIvi95e0Bl/AV+9Q/L5kQJNxPBNf+UiZSKodcA==
X-Received: by 2002:a05:6808:1a26:b0:3c8:4b12:107b with SMTP id bk38-20020a0568081a2600b003c84b12107bmr1180386oib.2.1714082836118;
        Thu, 25 Apr 2024 15:07:16 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id a9-20020aca1a09000000b003c76f98321esm1514421oia.41.2024.04.25.15.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 15:07:14 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v3 3/5] Bluetooth: btusb: mediatek: refactor the function btusb_mtk_reset
Date: Thu, 25 Apr 2024 15:06:29 -0700
Message-Id: <2eeb87a4360356fbf2496bd0567f6432edf818ca.1714082459.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
References: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_150717_728545_D66E28EF 
X-CRM114-Status: GOOD (  12.40  )
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

From: Hao Qin <hao.qin@mediatek.com>

Extract the function btusb_mtk_subsys_reset from the btusb_mtk_reset
for the future handling of resetting bluetooth controller without
the USB reset.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
v3: refine the git message
---
 drivers/bluetooth/btusb.c | 45 +++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index bad6a9888dca..a25543ff6472 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2996,28 +2996,13 @@ static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
 	return val & MTK_BT_RST_DONE;
 }
 
-static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
+static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
-	struct btmediatek_data *mediatek;
 	u32 val;
 	int err;
 
-	/* It's MediaTek specific bluetooth reset mechanism via USB */
-	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
-		bt_dev_err(hdev, "last reset failed? Not resetting again");
-		return -EBUSY;
-	}
-
-	err = usb_autopm_get_interface(data->intf);
-	if (err < 0)
-		return err;
-
-	btusb_stop_traffic(data);
-	usb_kill_anchored_urbs(&data->tx_anchor);
-	mediatek = hci_get_priv(hdev);
-
-	if (mediatek->dev_id == 0x7925) {
+	if (dev_id == 0x7925) {
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
 		val |= (1 << 5);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
@@ -3061,8 +3046,32 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	if (!val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
 
-	usb_queue_reset_device(data->intf);
+	return err;
+}
 
+static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	struct btmediatek_data *mtk_data;
+	int err;
+
+	/* It's MediaTek specific bluetooth reset mechanism via USB */
+	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
+		bt_dev_err(hdev, "last reset failed? Not resetting again");
+		return -EBUSY;
+	}
+
+	err = usb_autopm_get_interface(data->intf);
+	if (err < 0)
+		return err;
+
+	btusb_stop_traffic(data);
+	usb_kill_anchored_urbs(&data->tx_anchor);
+	mtk_data = hci_get_priv(hdev);
+
+	err = btusb_mtk_subsys_reset(hdev, mtk_data->dev_id);
+
+	usb_queue_reset_device(data->intf);
 	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
 
 	return err;
-- 
2.25.1


