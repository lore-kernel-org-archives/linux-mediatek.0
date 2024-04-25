Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558A4C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ghe6Ntj3w82U0VJxVyYvLCInhwuNPbaLekvh/4FENKg=; b=lyG74N3TfzmzJ1uWPs9+cX1J5R
	6FEU6EyT9IGGnziiHxLmT2aYfD3BWgMhSJTAAfB34Nr/E+XxQhq8c2GJcy6y2TXkCQCGb/8M8Z3Rc
	LcWP8PtqwaZPV/m+KEYL5ZRt3oqFmA1eGwyXUgKSWhtSl6GRIEk2R5J9fyuDKYEjMZdi6Z2jf2vm/
	efin8UbePw3VEI03Py/tnLiMiMHC+5CGEqmjc0OaNRse1kh1UERf274QiXxAB2LDq8HQc9KPEjEov
	kSpng3gL8UFU1A/m6adL4gp3GUwa+Mi/TJ3fk+00afebGexO442kL4OY0bcbdwGLiCx7oi02t7SyG
	rmFl4AlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FW-0000000APKI-0DGM;
	Thu, 25 Apr 2024 22:07:26 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FP-0000000APFj-22Eg
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 22:07:22 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ea0a6856d7so237617a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Apr 2024 15:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714082838; x=1714687638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ghe6Ntj3w82U0VJxVyYvLCInhwuNPbaLekvh/4FENKg=;
        b=oXG1mAMnwXi48+0SpuWOO/K+aW56MRANRxY/R/djuwSuHbXuHINcCjhIK/W1RiUtBM
         58Kozw6DOL8tpe772M28k13YRX3YKBAqZ+0b0u7HEQoU/HtHClqHZBz0Ce93sB+qCin/
         veM5hJ0tpLoEJElUAv0+7zZbPknm6DQ7Nn0qNEoYwPkAQd+P5fMKzsIAP6yEaUzHRWd0
         /ZIXfc+GmhC+rnLntBUPmx9Wkmjt2LeZBaZ26/HQzHXYgQm+jpE2nRThO9zzL/n5Dilx
         PzzhYoK2UEaxLTlqaI810mnzx/i3fERAlS/4HiZbgy1JIg3gVFOLt5Tg6qsCd6cG7a3g
         c+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+aIo03z2nOpKGnLk4yTSKMJbFpYbMij865nsGmRS2XQpIRNvXVyPBqIKhTa7de1flqhpZMC/ZjSWk3KJQJpOFqazXJVW30mf82Lq5YkyMQxpA
X-Gm-Message-State: AOJu0Yyy/Nf8xLLCCkEY2d4w/AD4m6yNqkqkvL0pEkPDFhqAiC8karSR
	+9Pg7HxPSVYYS0ucwyGfMQJCh1oYoAXln6zBpOetFequVw4FTWzWHTWtPP4L
X-Google-Smtp-Source: AGHT+IEM+H4ncyT8CeCSalp8L8SuB7uAot40z6mDnViuZECMPrVG9EHcQbkeCYdfrDJwoDtUA3GvwA==
X-Received: by 2002:a05:6808:189e:b0:3c8:4d54:94d with SMTP id bi30-20020a056808189e00b003c84d54094dmr1149898oib.4.1714082838135;
        Thu, 25 Apr 2024 15:07:18 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id a9-20020aca1a09000000b003c76f98321esm1514421oia.41.2024.04.25.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 15:07:16 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 4/5] Bluetooth: btusb: mediatek: reset the controller before downloading the fw
Date: Thu, 25 Apr 2024 15:06:30 -0700
Message-Id: <13854f7ce7d4607d37dc24f39c69b3fe6d6e44f3.1714082459.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
References: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_150719_573673_22CC2EBE 
X-CRM114-Status: GOOD (  13.35  )
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

Reset the controller before downloading the firmware to improve its
reliability. This includes situations like cold or warm reboots, ensuring
the controller is in its initial state before starting the firmware
download.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
v3: split from the v2 to make the patch do one thing in a patch and ensure
    the reset the controller only when we actually need it to avoid the
    regression on the time spent in opening the controller.
---
 drivers/bluetooth/btusb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a25543ff6472..6cfeec2118e9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3132,6 +3132,13 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	case 0x7922:
 	case 0x7961:
 	case 0x7925:
+		/* Reset the device to ensure it's in the initial state before
+		 * downloading the firmware to ensure.
+		 */
+
+		if (!test_bit(BTUSB_FIRMWARE_LOADED, &data->flags))
+			btusb_mtk_subsys_reset(hdev, dev_id);
+
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version);
 
@@ -3139,9 +3146,12 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 						btusb_mtk_hci_wmt_sync);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
+			clear_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
 			return err;
 		}
 
+		set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
+
 		/* It's Device EndPoint Reset Option Register */
 		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
 
-- 
2.25.1


