Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6CC25B4F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sYQ7hw69f2uaeyraCUDwvaBx7HkdTU5mSjbOPq3iac=; b=vJxUKbGyf1pJuAwAKTWsXvTM6f
	EHPagVePt4foeLkyQKIJzaS5M0LUQkMy773Du8dtex4muNQydFW1WvwNDvghnKsKSrHhZzROmLUEk
	HSPIUHRDYujCspYg5kPb4gtjbEfx+NxiYy+AefP/CAeboCoUT9wzLhl2YOgMlqPdINJq4Nf3xyEYe
	sneuKBdTjo32mDWhTw5Qh33uq6QQ8Vz5wsaT3TzGKRR3ZbcA+VJWpawdqWnV0f6Ap2ctc2o9q7Rq9
	owqQYoAqS806aX0Ewez9We9mnhZlHW2t6AVYJLB8vVIRSfi1sVW1dJHlA6KNfkwr0axy/xUXcFFIa
	1XeJ4GfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOE-0000000CXXi-2GSL;
	Tue, 07 May 2024 19:22:14 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOA-0000000CXVP-43Rk
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 19:22:12 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c96ef6bda1so114987b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 12:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715109726; x=1715714526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sYQ7hw69f2uaeyraCUDwvaBx7HkdTU5mSjbOPq3iac=;
        b=FqMQxKiTWUIrKajKy2804V23NMwtG5McD5ZzaDbh+6c8ol6R+M4G/BUFUAzonvTxQ2
         3DMGkCjOe0CV35oOKKxELzvA6owYMWlDD7hn2qYSUfVTYUR+grPWJE0nFjJHG9XvmbBa
         zZ6Bxo5x+ltcNU34zid7TGS0kizkca/nv0v5Zu94gLALTHxDkJF4aW+hcFA+Bv3uLfZ7
         OAEv22WXUtS0me4DU/Yj/Qy//zH0A6RwRiQnO5LRqIopwALtyvXpsMpl7IRmy6cGSWYj
         h9W0NAUu4lqom1KmCJJie2UWV+d4krljBvVFhK5rmn6P1BAspYDK2Xhw86/JP8TSvQmn
         AaMg==
X-Forwarded-Encrypted: i=1; AJvYcCW/KrydOMVLH6u6H0hmO36qqz7M/9RjWCMIz2IYSl9UsqtVoUl+YC1F2/4A4BrVoNcwIEZJwHTI5IepqcaV8Khtk7hiNPQZWL1CYuJKdEdladBw
X-Gm-Message-State: AOJu0YxtLLbAIIWp1HqaMdsi64BYLaoo/dJEuuEITrA/ZQA8EYNDqdDq
	eDcd9iiJj16JlPeLb5B8TuSy6UmyNBkr2i79EyxlBCtJ/P5ZBxnB
X-Google-Smtp-Source: AGHT+IFGJT+GhblVrXRIxWa/VWNiQry1JanDcqFMqp4jnjRxoRWMN+EgM7MNzwp7ukiMEffX9fLAGQ==
X-Received: by 2002:a05:6808:181f:b0:3c8:4b12:107b with SMTP id 5614622812f47-3c9852ba08cmr595514b6e.2.1715109726543;
        Tue, 07 May 2024 12:22:06 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id ec18-20020a056808639200b003c8643f0e5csm1937839oib.16.2024.05.07.12.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 12:22:04 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v4 2/5] Bluetooth: btmtk: apply the common btmtk_fw_get_filename
Date: Tue,  7 May 2024 12:21:58 -0700
Message-Id: <6aef1a64b54a32134f5e995d1dadacbcd9c9ce33.1715109394.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122211_027838_45C8822A 
X-CRM114-Status: GOOD (  11.35  )
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
v4: rebase onto the latest code
---
 drivers/bluetooth/btmtksdio.c |  3 +++
 drivers/bluetooth/btusb.c     | 14 ++------------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..04be06f73e05 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1117,6 +1117,9 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 			return err;
 		}
 
+		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
+				      fw_version, 0);
+
 		snprintf(fwname, sizeof(fwname),
 			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 90d1f1697357..1603e97f0d7c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3166,18 +3166,8 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	case 0x7922:
 	case 0x7961:
 	case 0x7925:
-		if (dev_id == 0x7925)
-			snprintf(fw_bin_name, sizeof(fw_bin_name),
-				 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-				 dev_id & 0xffff, dev_id & 0xffff, (fw_version & 0xff) + 1);
-		else if (dev_id == 0x7961 && fw_flavor)
-			snprintf(fw_bin_name, sizeof(fw_bin_name),
-				 "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
-				 dev_id & 0xffff, (fw_version & 0xff) + 1);
-		else
-			snprintf(fw_bin_name, sizeof(fw_bin_name),
-				 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-				 dev_id & 0xffff, (fw_version & 0xff) + 1);
+		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
+				      fw_version, fw_flavor);
 
 		err = btmtk_setup_firmware_79xx(hdev, fw_bin_name,
 						btusb_mtk_hci_wmt_sync);
-- 
2.25.1


