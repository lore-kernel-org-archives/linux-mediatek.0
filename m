Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C4EC25B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 23:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFGLv+/W/92QSc/vAIXNlWmURdmlafsCOBe70BkQWmk=; b=A+UUTyv6HV9OxOQppyDIMaokLa
	Bb3kPkM+rnzJFU9MwAW0V47m0TnaVHERMm5TZRONYPRr9e5D6r+YL1Cj9YXplvqU8AOLx/e6PINbK
	vPuSrYRwoLR4AvFaLX/F+sdmGJbsvPWpHiDyo1oHUDjiA6mpz37zT5wnXOU3maBtW/MZL8touKrZQ
	v7T8qiqTnQ3Q7mLgsAe2tzbm4DlD78iIZkW7hdm1cH7qY7XzE/veaLQBbL/cIZB/Nb7eITrJc1yTO
	jNDXadqNuj59WI36THhTNapX216BDOdzfbmWv5P14c52KDSgTb/LmREFOfHXhkUYPuiGfvQsQ/025
	nqlz2dnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Nqa-0000000386z-2oCN;
	Wed, 15 May 2024 23:15:47 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NqU-0000000383z-3BCv
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 23:15:41 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c9b5776fbfso359027b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 16:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814937; x=1716419737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFGLv+/W/92QSc/vAIXNlWmURdmlafsCOBe70BkQWmk=;
        b=dD67ndMMankmi/Ex6ChvkP3MCZGI5qgL01MGM0EARgdYtji5jU0C0fau+/+g3H0aUF
         bLs/7y1j08e6b0souUwc5hp8oMgAQOPAEi+sxJ9abUbPMKqgZwePaNENkSUBStR2b3ks
         rNuuuJ7D1ei5nTcq9nSjjzRnApd2voAwb3Z2BYyWYFyXIKtP0QCY3a8PjGE7GI/67gxr
         EEE/w8TceKJWykw7PlyHkMS3b6eyVsURTylZncqvFypkYvA5uzVbFwWkqe11gfQECgg0
         iIFfaas0FKfuCAfsXqeRnt3KI/cQombj1bArVsUWAqhuEwQuP1PVHpQzkYGDvNxUyOW1
         wdww==
X-Forwarded-Encrypted: i=1; AJvYcCXfcJSdhSI8qImhkIuPhPy/1D1TsDNtSHuXrLj2GuKU4+1u/5Tnqjqhk9VcuXwHYqIUmKOKMSkKoV1Y9aqRxyJQ0h/VowxWnBnmLDjvNTbipCmn
X-Gm-Message-State: AOJu0YwHLc4QFzrt9T4fDcC0v2UCxqo/GE92jjQ1sAPuNO9qde0jYK/y
	Jk7P4zE+w7noRHQU4v7zeez0UpZNPtABBWyhc2TTMn8m4oXrVHvU
X-Google-Smtp-Source: AGHT+IGPg0TcyM5FM5P2N8MzncJHqBNaf4XUzVq0k/1hKGGahsM8lm6b1acACn8c1v7G9KBmrprMLQ==
X-Received: by 2002:a05:6830:14cd:b0:6f0:e2aa:ea49 with SMTP id 46e09a7af769-6f0e92ce674mr19960426a34.3.1715814936703;
        Wed, 15 May 2024 16:15:36 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ec2e566dsm2032159a34.15.2024.05.15.16.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:15:36 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 3/5] Bluetooth: btusb: mediatek: refactor the function btusb_mtk_reset
Date: Wed, 15 May 2024 16:15:19 -0700
Message-Id: <fc7dccf0990d1eda52f7b9ebbe5348e06979107d.1715813148.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
References: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_161538_907706_DB036D31 
X-CRM114-Status: GOOD (  12.70  )
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
v4: rebase onto the latest code
v5: no change
---
 drivers/bluetooth/btusb.c | 45 +++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 611135d1ce01..602456e94fdb 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3033,28 +3033,13 @@ static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
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
@@ -3098,8 +3083,32 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
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


