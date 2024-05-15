Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4FBC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 23:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s8lTrIOPp2rps4ETyvV9vi8AsmvDY3xHbsdrzyXbxxM=; b=RTA1zrdeyZDj8NBw14NmpRj7yU
	Bce3WDVE+fYsW6l+5kAGRoiFWAAKobB6hR/1PLVDGKwqVahSD7ZQviFFZ7MfvRIPsnyr4HdfR3+JC
	8Cw79ebxR7JPy84eocViE1IrkPMyCGA47wT94AZcpI5ZAUUyITJknYkAoG0m61jkdvMpc7cKg6Y+D
	64ZNM3pCs1QTraSvQIaOSYWTJyAj08vNp0L46y/KYuEzYMn9SRIiLaayqUDgoigW+XyVvviw3DEG7
	vGLoCLMSvxV+aKMWqEvMbQyPCRsBboN6Xn9fuTHt/k24SCGr5mLW5HoEGm5DYl2F3hyKm9XSlfxTH
	HWUJTb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NqY-00000003861-13le;
	Wed, 15 May 2024 23:15:42 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NqR-00000003828-2Gyf
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 23:15:40 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b2f2a584c6so212198eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 16:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814933; x=1716419733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8lTrIOPp2rps4ETyvV9vi8AsmvDY3xHbsdrzyXbxxM=;
        b=irLUSq1mYsQ9lvZlGz8Ard/uOlNW4x2lSezLBs+Ab6tjWTzgpG7+zdfPGcLV+P4X9t
         7OIwIjpcZnP+RQyCL6u7SzMoHevVW83O9jkG1oKoX6767d7BgRdsbNOX8c+TXhCk4bPj
         pNUCexAbTGQqwz+dit4UAC4NyZnJQ8D5l+x/4wM4XHpGGcMHVMz5+M48cLwKI1PLsJJA
         c3fCWtCBhxpKexxkePoS+xJHenTxk+388FJvj1lMT29hUFqQqbozbEYhVqbwI9d8b+fY
         OTiBMQiOpi1ZuA+mE1cSsHN2UTEbiP0HL5evJcnCbMQ643obRBEAr3bIKLveL8wqBNGe
         2YnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjj7fKsOlV+IKGln3ZeBBv2tYBecrDrP9kQxGmGN0YzyNnPRc5mZEB3EZFUgvhqXXvAJ/eVc+Lv7WH81RUS3zeEC47doYxywsg5xmGSoKNoBNm
X-Gm-Message-State: AOJu0YxBzLZpAc75gGwV8l867xUVIfRuN06VayGl0KuYTfHwqlsHC4LH
	Oc9gAj27GlA/MPwhTwfqD4oDB92sg5RO/jSErpnHKgK0jR8u/c90
X-Google-Smtp-Source: AGHT+IHJZzy1efEISuW3awypyoQF6Uoeq89kZn447ERsBVT1h1CIAYblZT6dnBXhB5s6AqsgZ4ehKw==
X-Received: by 2002:a05:6830:2051:b0:6f1:2171:4f9a with SMTP id 46e09a7af769-6f12171526cmr4177443a34.0.1715814932887;
        Wed, 15 May 2024 16:15:32 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ec2e566dsm2032159a34.15.2024.05.15.16.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:15:32 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 1/5] Bluetooth: btmtk: add the function to get the fw name
Date: Wed, 15 May 2024 16:15:17 -0700
Message-Id: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_161535_661977_81AAEBC8 
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

From: Sean Wang <sean.wang@mediatek.com>

Include a shared function to get the firmware name, to prevent repeating
code for similar chipsets.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v3: first added to the series
v4: rebase onto the latest code and add an additional parameter
    fw_flavor into the function btmtk_fw_get_filename.
v5: fix an issue about the directive output truncated writing caught by
    the linux test robot
---
 drivers/bluetooth/btmtk.c | 18 ++++++++++++++++++
 drivers/bluetooth/btmtk.h |  8 ++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 812fd2a8f853..a27c251bf56e 100644
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
+		snprintf(buf, size,
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


