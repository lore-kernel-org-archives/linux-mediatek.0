Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50056C10F15
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOSUTMsrzGUh+EZaDgRrzzwhmdgrzIn+vCN9MSjqzbg=; b=KsDY5Bj8KUhRcWx36GedVHkTwt
	2BJtd5Ojbrr8Jlj8eWPJ/aykzBQk+XBSaYZ2IBkhkO9O4g18qRMC6QxhK/JOce9V56LsNQsZJHCzB
	37YWhOz+yMI8ee/ygaKLF1CSTXMbG4dfRE0jsxWx1M8ncN6Q+xEhvTkyrE3Y8xIuP6WOVI96jKGCU
	T1k4aVUl12TQ5rQCYvE7FTlegotjmjMdBkfa5lfjwGoqMiiw8fh0fzc8/cU0VXs+iMU6UkL9qr24n
	i3LFD2wOboSnxf8q0srkyMaooiDyuF7ik028iThrWuAyx0a8YNTAhHh3ePl1WO49SZhjjMmioMqBA
	pIgsNmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FP-0000000APG1-1DVZ;
	Thu, 25 Apr 2024 22:07:19 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FM-0000000APDX-1UPX
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 22:07:17 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6eba841d83cso341012a34.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Apr 2024 15:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714082834; x=1714687634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOSUTMsrzGUh+EZaDgRrzzwhmdgrzIn+vCN9MSjqzbg=;
        b=D24H884kgnG/9LpoxYXDcrDQ+mRK7CxKVEVjJNfhN5JT+BsY6EqELe83s7bsJYxJRb
         SnjRfqg8yRNBNYj4K8qtlN+yYEciKEazzDw7IQVqkD8I8mfZqeuwvkut6j31FcPNpDKj
         k1YBFAbXe1b8qZIauXlLS3sAEv19rnaduI1ZhZLi0bA1NuTqOF2IqgG4Re38MXqXv8iy
         hyrdXWvfpV+hw7OooZ+3gtkpOyWyIbTICn+tzDQ3jAEfN4iaG2uVIPiVrFk4Hv5MMXgl
         UIA3kjvP/DQDOxQ1OCy5Vjqsmyzvui23OgTJik0z1tHycR7ttO8xiJN4xv4D1AFM+DeG
         qq7A==
X-Forwarded-Encrypted: i=1; AJvYcCVv6gBXmbPXWJYEi7wYQtEyV6YrO5gMaF/6wTtVOIkk6j28OMRJBbj7lZbwyS6pmkPOYQ1hI65A52kJ3VLgJzBwZv3vTc+iwlFPYu3/vZ6+2679
X-Gm-Message-State: AOJu0YwJusAdUq1llzFJI1vYKH6Rdkz71YBhhDfPynSkKX/dRRx7vETy
	TFXVSeEj6QAg907v4ut7tdHeWfTwpzfm7FvQY3oVB2h9JtlGmVbK
X-Google-Smtp-Source: AGHT+IG6gSzPWbwWp5355tnnWnT7Vm9ciJl/9skpqxx0WDAK641I6qUFYo2xHAnEVdPXyLh3QBgctg==
X-Received: by 2002:a05:6808:189e:b0:3c8:4d54:94d with SMTP id bi30-20020a056808189e00b003c84d54094dmr1149679oib.4.1714082834143;
        Thu, 25 Apr 2024 15:07:14 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id a9-20020aca1a09000000b003c76f98321esm1514421oia.41.2024.04.25.15.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 15:07:12 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v3 2/5] Bluetooth: btmtk: apply the common btmtk_fw_get_filename
Date: Thu, 25 Apr 2024 15:06:28 -0700
Message-Id: <9c22c80334d5a895e9d47681d57d6c7965f3c086.1714082459.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
References: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_150716_539845_AE790109 
X-CRM114-Status: GOOD (  11.20  )
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

Apply the common btmtk_fw_get_filename to avoid the similar coding in each
driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v3: first added to the series
---
 drivers/bluetooth/btmtksdio.c |  6 +++---
 drivers/bluetooth/btusb.c     | 10 ++--------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..10bf273120d6 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1117,9 +1117,9 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 			return err;
 		}
 
-		snprintf(fwname, sizeof(fwname),
-			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-			 dev_id & 0xffff, (fw_version & 0xff) + 1);
+		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
+				      fw_version);
+
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 7835170b1d66..bad6a9888dca 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3123,14 +3123,8 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	case 0x7922:
 	case 0x7961:
 	case 0x7925:
-		if (dev_id == 0x7925)
-			snprintf(fw_bin_name, sizeof(fw_bin_name),
-				 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-				 dev_id & 0xffff, dev_id & 0xffff, (fw_version & 0xff) + 1);
-		else
-			snprintf(fw_bin_name, sizeof(fw_bin_name),
-				 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-				 dev_id & 0xffff, (fw_version & 0xff) + 1);
+		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
+				      fw_version);
 
 		err = btmtk_setup_firmware_79xx(hdev, fw_bin_name,
 						btusb_mtk_hci_wmt_sync);
-- 
2.25.1


