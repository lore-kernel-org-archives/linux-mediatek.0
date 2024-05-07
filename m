Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FADC25B77
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToNbBgB0lLDuXRtTbvd57CqqqGRtlld+OojUmDuwhxc=; b=zHT6AJbKR5HvZvnLvn13pP3BJs
	z0ep6t2pZejyxaNKhbodTx1RvdTci6e2zmUWmR1iwjMuuxxlcS828kUYfShBktEtJoiN5wHKzw33K
	GLgJVdbtDxQjnbB2XElP8U8Zxt2HyYH+ay0LCaAB85AMceb1MR8JnXu9fnEewyhvOJDZyz9blnuRT
	8/rljT3J1qS4xqA3cbIdTsFa/G7MRqgo55Z7V3pLTViN5I0DXyHE7eSdzf2ZnZP5/TWLFtOWvldyu
	bU+rzWx3xDIUKNwdwnAhDQaI2dbJnE7ANviqc6+lny1/kLu4NExEE3h3OXne/XIZGJRzyeARsyPzJ
	FKNWsEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOG-0000000CXZL-0Rvk;
	Tue, 07 May 2024 19:22:16 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOC-0000000CXWV-0iaH
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 19:22:13 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f02ba0713dso387412a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 12:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715109731; x=1715714531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToNbBgB0lLDuXRtTbvd57CqqqGRtlld+OojUmDuwhxc=;
        b=bP7vsJkJdX/LKqYYWJnnSZTqxWkWRhe+ZIf3BL3d4/nxMobT2wawVSuC3A6ZxAqDoe
         V6KYf9moxyXylePv84i4wB/U9p6qmYbXFxTcj4+5WfcrhpEQPZIeVIbYxNGUI78Ptcgt
         rkeBwlvbPOMz/7rmJ58RhaHGfDUhJsbypjrPL85O8RutMxVGXQkg7PHpRYRpWtUBm6P2
         BMyQb580dm3TIRTOwums4zEkp+D0deUD5RgayjYkCOUy9O/t8B6OOAlgu60mfrwDcL5u
         qlkeumYbk6+N3x16K/yFXyIvh8XCuau3ePHZat6xQIf4wm+hcm4MKdtUR3hCbJ4bE6zP
         SzOw==
X-Forwarded-Encrypted: i=1; AJvYcCVQhxeOvrmM74lszQ2l1HL0Cccfa3uGYcG5o29tBxygDjkRHkJb7eLmfReTgNCWPNU+4pQ7inQG4//wlJGofMA7sLSJOcACAHs8CImc9Bs8op12
X-Gm-Message-State: AOJu0YwA4cse8uYj/fR8EDxvs6jLp9aH7kMJeOqhJyewVu26jNMCQmFV
	jD/pQcloo1xm9wRPTWUYt77j0VgKaQq7vSYHPelcS3AKzfEE8uG/
X-Google-Smtp-Source: AGHT+IF01EcqeEosejqPrZMGtaa/ozo1Yp4hkp6Himg1Sj+DlBjL0oa9WOSi3FgmAGqaf3rlpay/lg==
X-Received: by 2002:a05:6808:1a21:b0:3c8:49d6:2df0 with SMTP id 5614622812f47-3c9851ea375mr670264b6e.0.1715109731470;
        Tue, 07 May 2024 12:22:11 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id ec18-20020a056808639200b003c8643f0e5csm1937839oib.16.2024.05.07.12.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 12:22:10 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v4 5/5] Bluetooth: btusb: mediatek: add MT7922 subsystem reset
Date: Tue,  7 May 2024 12:22:01 -0700
Message-Id: <346166eebadac93848e733277e164d5ce4c1d8c2.1715109394.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122212_252715_FE221E64 
X-CRM114-Status: GOOD (  11.72  )
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

Add the support of MT7922 bluetooth subsystem reset that was called the
auto revert to self-recover from the fatal error in the controller like
the host encounters HCI cmd timeout or the controller crashes.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
v3: split from the v2 to make the patch do one thing in a patch.
v4: rebase onto the latest code
---
 drivers/bluetooth/btusb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 054e8c06bcf3..a70a5e12912b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3039,7 +3039,16 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	u32 val;
 	int err;
 
-	if (dev_id == 0x7925) {
+	if (dev_id == 0x7922) {
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= 0x00002020;
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= BIT(0);
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		msleep(100);
+	} else if (dev_id == 0x7925) {
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
 		val |= (1 << 5);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
@@ -3079,6 +3088,9 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	if (err < 0)
 		bt_dev_err(hdev, "Reset timeout");
 
+	if (dev_id == 0x7922)
+		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+
 	btusb_mtk_id_get(data, 0x70010200, &val);
 	if (!val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
-- 
2.25.1


