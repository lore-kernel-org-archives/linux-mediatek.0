Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7DCC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyGlXVbcuOBmT6INVyvYbqSZy7NpTaBdxh15HEARP+o=; b=MwiTeIKW116CZy1jn5h/TusU21
	YERmmGguMIblXYK3rHF3LcPZFI3xn+do0xYZ16+IhMUQjE7W5jesoW9OjAMmKQVZ0M+HeLK0LJexp
	xn6ujfQA3qsUP3qOb7uYyVyFPs4YKYM7WFtJEeV66If20cJU8hqkP8sRnAwgI4tl1tY5mybZBqMkn
	yvAuDxFwtxmxsfFn+7nT+LN/uQnQakkH6w6Nf6B70QoGqNl3M7RcKffzUPxq37dpm5wvoz30WB4sK
	bsoGEvolmfdtpMX56zJk8RcPko6SeUa3l60sh9QQSHLX8PsEd15hllNUjvtMa+ITzrybyiUNjTwZS
	vkkZEa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOF-0000000CXZ0-3J0q;
	Tue, 07 May 2024 19:22:15 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOC-0000000CXVi-14ja
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 19:22:14 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f035fb2b03so97625a34.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 12:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715109728; x=1715714528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyGlXVbcuOBmT6INVyvYbqSZy7NpTaBdxh15HEARP+o=;
        b=lh4fHCPAv8A/h2MKxQeUYPJn9T+EQ7aomSkN+gkMigh9fwDq0ACWb2IP+bCwxoxHjV
         R3DmMMs3BnHQMd5AfnB4gCsHzGjlFPFRhHu5iyylYRnKK5fj5jFx75BWPIitwH8jOC8J
         mNJWhpRjK/yawfh3AlOFa9PhDdKjmIvZjTcygL5Xn6y4MNwz0NJuomnldgiM8rsfPc2q
         lZlbm4iFcVliOAWhfPpaSd2YGXdnO+P+tlVQwapOtsx/XKRZkpfY9OnNrxjdxM3p4SHv
         04UrZyaIvZSozuLn+yYG1CtNvneTgwVioMtWex6aGfEot8mU1HMoyL3GpRQTHrGSgQla
         PgaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt+2DUHOQBDrEFfj24HgfcCg3HZMVP8HzyFcOOTqJ+nsz/Lzs2ABKMwqnqqJcckeuDpe5aEL+XSBOaJzUUIYz/Na3+2FaUcjkRUPQn3fRCXPkU
X-Gm-Message-State: AOJu0YxbOfSmi2B6IoJyBIY4SIwHEmey+jvPQ8fO/oiQdMaIbabpXiu6
	E8rGkAGDLfEy75QhBhg5+cHKK4N57TqKT5gOeQxYbnCzZe2PH0qA3WjbzyPs
X-Google-Smtp-Source: AGHT+IEpqc15K+aZH7Df8bQldnVSTf8pYsmcQxJbCA3BrQZr5kPInLxof+4kwH5BEOk7Gu+fJGF55A==
X-Received: by 2002:a05:6808:2008:b0:3c8:4964:cc9d with SMTP id 5614622812f47-3c9851ea36amr575921b6e.0.1715109728245;
        Tue, 07 May 2024 12:22:08 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id ec18-20020a056808639200b003c8643f0e5csm1937839oib.16.2024.05.07.12.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 12:22:07 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v4 3/5] Bluetooth: btusb: mediatek: refactor the function btusb_mtk_reset
Date: Tue,  7 May 2024 12:21:59 -0700
Message-Id: <457c7be3bbbeda1241e097e99056d9c5e2a734bb.1715109394.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122212_339901_313CD767 
X-CRM114-Status: GOOD (  12.87  )
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
---
 drivers/bluetooth/btusb.c | 45 +++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 1603e97f0d7c..76c52f2fe917 100644
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


