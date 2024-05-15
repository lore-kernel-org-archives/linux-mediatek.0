Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8071C25B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhvsCgYPvB92Q5BFBKTie57uhIEMm1z1mEV6N05fCRE=; b=Hp3gkY3Ye+PBIABJmu/9B/oiSR
	MoTA8aLcU6s/KdYIIvq43Ew5wZis3xl8lWE3v5PFAEaayMxPs/Y9n0bqkySkH9r2DxGNp6PXT3IOW
	4OIHVVt7rG3CDyOWVOtIJLHYlrdkL+GdUImMAdB7UXolxahQSwEeiFJxt1XGQ27b6HUi4RX2N8srY
	R1tGa5adNS3dpaHOAyIoi8tK2xyWrNftT2Yzv1HgXcJ3jFEqmgR5FzkEw54aQsywNjomNZix82Lxx
	ZIjqENz4RdNCL1OkS+GXk3A59vCZwvNg3eLbugMixfyB3Fj+NOBiuj7WPJ3gYiZGgVwvfXPlmyFkN
	gmCbnDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Nqa-0000000386p-0EVM;
	Wed, 15 May 2024 23:15:44 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NqS-0000000383D-3tmh
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 23:15:40 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f0e35b60f1so539652a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 16:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814935; x=1716419735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhvsCgYPvB92Q5BFBKTie57uhIEMm1z1mEV6N05fCRE=;
        b=WFEfWW9UUiUOpyE24qfub5yOcrdOYXsnE1bGrxxEfrFmCpCQD/GyxnbAjx7pzbu6ON
         Kd0etX/Olepdb3G0ND5JyUE5QI0XnjNBODQbERQALazIL9qLuYVDWDzwIGv4wGPoXdZP
         t2pEjvrRfwz9/PIXrNRxGpV5wLOg/MjZyWrAnVcqmvkYWVcVbOcYpxNu/1m4IzXO6Xgc
         EJXdCkHx054/iY2uwyNUhL7ifvmJ3vyQJqyxLj7VjNleZN74GvZ2mzM8h2WXhirE6v5f
         rgQc5U1Jn2RZ0OyWYpYesCdBFvOnU7uZg8uI7BfKHGha7RwuI7JYt5HJDNRQAroNmSuX
         s9kw==
X-Forwarded-Encrypted: i=1; AJvYcCWsvpRylTr5M33R0cYePkydH8jAQwlYkphhPKzgOoDxG5JewSdGrXy+m4ELRnK+WFzKuixERiQwoeAZWBeuskcSHSt7vi0CS/z6ovFvRsvVclqX
X-Gm-Message-State: AOJu0Ywi+DE1FzD38RkCcbupJ3UN84EbSH29ct9LdTOH2zSmw3oG9jsl
	5WzVIWUtkBxXivdJCH+ixTbBUROvSr/AEGEjqVFY4r09ID7cqGOc
X-Google-Smtp-Source: AGHT+IEE6LNZ3dq4LwLZKPsCEi4p+ERRiPUUnv07W4qArNWrUWhhCwZjNS6tXxt72v25gQ1W/iMpaA==
X-Received: by 2002:a9d:6d95:0:b0:6f0:85dd:131e with SMTP id 46e09a7af769-6f0e92a69bfmr21075455a34.2.1715814934801;
        Wed, 15 May 2024 16:15:34 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ec2e566dsm2032159a34.15.2024.05.15.16.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:15:34 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 2/5] Bluetooth: btmtk: apply the common btmtk_fw_get_filename
Date: Wed, 15 May 2024 16:15:18 -0700
Message-Id: <1e9c955a0b311ede0bafedd4c49436cb5a04c9b1.1715813148.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
References: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_161537_148660_B9030381 
X-CRM114-Status: GOOD (  11.28  )
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
v5: update the caller usage with btmtk_fw_get_filename
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
index e384ef6ff050..611135d1ce01 100644
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


