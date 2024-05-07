Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B49CC10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EbHKc868SB9HcUl+k2ACtYV5D4mU/L/TbmBCs0TDn/g=; b=ebliMNmI77ctoj1N+mpAdak3ab
	HoppxMnTVejyx0XBr2gTUJxY28QeSCMbdQOMA72pOjLDvFa6du1yXoQwEh2n05G7q2Lo/x5uRLINy
	9TlHpWh3+jOb+nOUBCde7dp6RL8HKYSJ+9v/c5QJzpBhn6IyXwrxfM0u9k3OxAaeFlUkDzp3pTipV
	2QT1cs25oW9wyICxkobt4qjNt5YRF6m6qzx+EmL6+OJeGhjVqQDNRCtasjwQrHquK5whevsJZ3iEN
	XGNokHLZ6X3y4d8zajzMDBHMBksnkaikQ4asRB6onTCH1D0f/wOaltMTIemtLGUiC+uae4XTifFOw
	30MQbKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOF-0000000CXYC-03Z0;
	Tue, 07 May 2024 19:22:15 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOA-0000000CXUj-3l4h
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 19:22:12 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c96ef6bda1so114976b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 12:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715109724; x=1715714524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbHKc868SB9HcUl+k2ACtYV5D4mU/L/TbmBCs0TDn/g=;
        b=Wg7kecmQMxzw1q5tN5AvcZAD1WZ8TZs01PdzNa+27B9XUmcSCxZ/QrTnY4V0kVZlu8
         vQkRl0EfAHNWDZ0glQuGZTGPt/EEWesydI4CGZK4Qy1fTk8CULNkUfyOSS8mahAUJ+Lr
         vbkxccaEBLQILkniogqMbC9s+NUMqZ951/hVJaN5r88e+Oo5LxJYJRZtCF2Qe/leBQAg
         UwIxH9K4XwbjJ2TH4pMZnQPBqyZYO/dHW7lnXdSNfdCWdQTBpRlU9vRviLnLFMRM60qw
         l80aq626kXC0uCfeRikoa6C2bWhm6Q1QU+IVfYQwsyqVO6sJc6o9AxmFAe1NJzezUez3
         vMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUux7Hn5KS0vLnNewYG0/nIZoy39hINTd8q2t4PhdImZa3sPewo8gYNIPkFaniZyQvLHVQChnhAS0kThSYjCpmuY3et+DvtfPDduRCwNFpmJ22k
X-Gm-Message-State: AOJu0Yzp4QlXvlkBMA3c5AjO+BUnhUdfBXv/Px/l7ZzbH5ePW4Nuffbc
	9PeKb11KVRDs/uc9RCY83vY6AMIy3rLcMDxrOeyp7Zn6l2dHRjQh
X-Google-Smtp-Source: AGHT+IF6/Amm/9IUVwqPVK/3VfK6o6rocm8ala/XYv84JC/t3MO2ZMmHzbvtXvjZdxTbIyJfUGHM+w==
X-Received: by 2002:a05:6808:1796:b0:3c8:64c2:73fa with SMTP id 5614622812f47-3c9851e5985mr601086b6e.0.1715109724427;
        Tue, 07 May 2024 12:22:04 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id ec18-20020a056808639200b003c8643f0e5csm1937839oib.16.2024.05.07.12.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 12:22:03 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get the fw name
Date: Tue,  7 May 2024 12:21:57 -0700
Message-Id: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122210_982579_19208E10 
X-CRM114-Status: GOOD (  12.38  )
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
v4: rebase onto the latest code and add an additional parameter
    fw_flavor into the function btmtk_fw_get_filename.
---
 drivers/bluetooth/btmtk.c | 18 ++++++++++++++++++
 drivers/bluetooth/btmtk.h |  8 ++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 812fd2a8f853..a0a858a0706d 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -103,6 +103,24 @@ static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
 	}
 }
 
+void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
+			   u32 fw_flavor)
+{
+	if (dev_id == 0x7925)
+		snprintf(buf, size,
+			 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
+			 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
+	else if (dev_id == 0x7961 && fw_flavor)
+		snprintf(buf, sizeof(size),
+			 "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
+			 dev_id & 0xffff, (fw_ver & 0xff) + 1);
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
index cbcdb99a22e6..e76b8a358be8 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -160,6 +160,9 @@ int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
 			    u32 fw_version);
 
 int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
+
+void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
+			   u32 fw_flavor);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -194,4 +197,9 @@ static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	return -EOPNOTSUPP;
 }
+
+static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
+				  u32 fw_ver, u32 fw_flavor)
+{
+}
 #endif
-- 
2.25.1


