Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4771AC10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lStmgiqTJIXMZ0FpbHnHRZG5n3g0ZAPBxl1jPCO//LA=; b=2yASQfZpfFQwvHqgL9LnNfPTC8
	l4qB0y3msQgBHLuWusDrBzG1RPcj0RjkX1ae92x8NxYW/thNCR3dXrXa6td05mU8wcoHqLdf16dPK
	j6SUoaSERBeop9e92oyZ6xeAoHLlBwYP4zqc3+GCgVPtuNTCQyTzyJogP1h1lM25IdkshjTtlC/rf
	ZH94yFEx512t5T5N9lFnDfL1+3ESdkOTqZG+iA6lyQZ9szzsv8A8ud8ivefwhQiksRQ/VTSQJFi0y
	Rz32sYIXSHKNjZszI9t0AuUXZTBmz15bb0eDR6vO+U75KQcAY8qBJCQn614VPRgRmaAhS6hjVIg1X
	ylSluleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FR-0000000APIA-3Zbm;
	Thu, 25 Apr 2024 22:07:21 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FM-0000000APD5-3ML5
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 22:07:18 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c73b33383aso139534b6e.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Apr 2024 15:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714082832; x=1714687632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lStmgiqTJIXMZ0FpbHnHRZG5n3g0ZAPBxl1jPCO//LA=;
        b=fewz9Ucl2aXHw7LrVMPTT3wR35kHW6zReO7ygjzyqMQ9D5O1wRZtDQbMXDR+CiYIrR
         bID27H8lrYOlOP9MtrooLVA/lq1Xo65mzsxfwDm7RVkKuuVpHjvJVRuL4EE+B0pNA6F4
         ZFLE9kO1KBW0b1NkFQMihpXujhYL9EmfqnPtAjAuNOldzOnzcjJFT3+Ti+dcFnciHgQ8
         3M5TRhYlFNLSrObTlYEXsH0D/sQhfNIJ5lVjRJkjejNVCOyyHz9m+n4xkwXpmlbZ8Aow
         lpWVz+biLjrStzjJVG+MnTrgBnWBrnKAGNj6A3tIWnp7uSZ7nSXq+5Lm7897KiPATUCt
         vGRg==
X-Forwarded-Encrypted: i=1; AJvYcCXZPk8LjmRKwLZEkQ5hoztDrUlUKKX2mdZfvltnRGBXxbQpOpKzAPXrktjm8wtiFdoFijTfo3QY0EamMm8fbeb8LxBmfKObo00cq6nKxjq/bEgG
X-Gm-Message-State: AOJu0YyuBnQqNGiHUsFMMQfbTBKvxf7I84cm1sBpBHZKEQ+m+7ah1U8d
	sCeROnIEJk4YNcyy0CnmCA1aFezZnIydWpTl1s75dks9L4b0gGTsaqIuCFMQ
X-Google-Smtp-Source: AGHT+IGnZRhr6DaC2jeDPcFMkAZdwigwlzS7ta02Yx9OWUvO003Lg3x4ruU18ekQ5ot8jHcYzT7pcQ==
X-Received: by 2002:a05:6808:bc8:b0:3c8:4de7:6736 with SMTP id o8-20020a0568080bc800b003c84de76736mr970276oik.4.1714082832086;
        Thu, 25 Apr 2024 15:07:12 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id a9-20020aca1a09000000b003c76f98321esm1514421oia.41.2024.04.25.15.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 15:07:11 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v3 1/5] Bluetooth: btmtk: add the function to get the fw name
Date: Thu, 25 Apr 2024 15:06:27 -0700
Message-Id: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_150716_885988_6255C1BC 
X-CRM114-Status: GOOD (  10.26  )
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

Include a shared function to get the firmware name, to prevent repeating
code for similar chipsets.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v3: first added to the series
---
 drivers/bluetooth/btmtk.c | 13 +++++++++++++
 drivers/bluetooth/btmtk.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index e882613036a0..7ead7f967019 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -103,6 +103,19 @@ static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
 	}
 }
 
+void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver)
+{
+	if (dev_id == 0x7925)
+		snprintf(buf, size,
+			 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
+			 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
+	else
+		snprintf(buf, size,
+			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
+			 dev_id & 0xffff, (fw_ver & 0xff) + 1);
+}
+EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
+
 int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			      wmt_cmd_sync_func_t wmt_cmd_sync)
 {
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 56f5502baadf..ef225980f110 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -159,6 +159,8 @@ int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
 			    u32 fw_version);
 
 int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
+
+void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -193,4 +195,8 @@ static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	return -EOPNOTSUPP;
 }
+
+static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver)
+{
+}
 #endif
-- 
2.25.1


