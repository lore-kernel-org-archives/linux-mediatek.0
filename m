Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B43C25B10
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB6sdF7ZT2w7lYhw/XLWMRpdlEQQxivt35Hb9FtYEA4=; b=jsTDOf81ZVcKXzMU97KytVZNLV
	4K7RID8dk1J1gyFNCOnORS2N3x83Ur7gjHQLsYr+6OiC5l2ijfzCoOPXqB4mQ0J2ylozDrKK0YFWW
	AYqiFl39TfhnPPyKRwoBpY5oBM4lkpOO3xE/t8bXiI7aqyuwX8TuKEoZgdGWFHvUkN30mX/69Q9I/
	pgcvitONpfrJIQTGF4dL7r/5GyZxz30V4++ihnwdENtIOt0CT4ojAIKBwm8+ZyWAiCfNktr4rgJ75
	haX5OC1s/cjPcCUVv+1DhmZfOyR7LCydrNhbwkawOEpWR+9jJfUJvYV2IKHu5yib1CWyW1fKMoU5N
	iZosCo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FW-0000000APKe-1iXQ;
	Thu, 25 Apr 2024 22:07:26 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07FU-0000000APHN-0Ar5
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 22:07:25 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c73b33383aso139557b6e.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Apr 2024 15:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714082840; x=1714687640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nB6sdF7ZT2w7lYhw/XLWMRpdlEQQxivt35Hb9FtYEA4=;
        b=QC0ge0VG9BdTe90bkd0EPaYMSrRewtxfSTXn8xT22iAOuRyzEYrf0LhE3HGE23KO7L
         EBomEvFfF1EaW+jkCAssCLPDLuCWQIxv9rQmeG7Yhe2YoDOQbc4/0CrBFbROc5lDcCsE
         gibhMYbKbqdeDzrKXR0rM/K4ZZBsnZBSL55KLuEQM+Mvx9fF7/QI4S8lvMJzO4/ssZU5
         GqfU+DeTIQ1YU8AtyPCkT0+UaGjhxSgZbUcSHEbfPlsjQdkWmwTghftKwVzEek1mNJRU
         5cvJn/Bq9J1A9a7wnP1m8h2xMv05wiGiEzSGFKeG612qU87tNkOm742UOOSRSBTA8dM7
         nCAg==
X-Forwarded-Encrypted: i=1; AJvYcCVxSOwhR4WHaTDkXyQEyTpUh4g03SHVGcp2Micm7DdhnDzfprZhevAL2hbCWQX/JdjNo0Puu2I2qzBoX8QkGQAa3IjKSU2JOhgUpoVnHotK1UPT
X-Gm-Message-State: AOJu0YzsnlFtGvL8r9TOTUD6EVImdhHDtmjFU3aCM3c/4mPOdbEyoGGU
	o0G5MUGbSKFAghUxPkcqTKRXL417zCnEgnVG3vzGc5omlKbBWEI+
X-Google-Smtp-Source: AGHT+IFTLYQOtDKukzZ2CiKwcNjWdiffw6kNmAkr9+apA39RTZI7invH/+p4ORH+TKEGqVRy/8qcZg==
X-Received: by 2002:a05:6808:1985:b0:3c8:3076:f54f with SMTP id bj5-20020a056808198500b003c83076f54fmr1220361oib.1.1714082839739;
        Thu, 25 Apr 2024 15:07:19 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id a9-20020aca1a09000000b003c76f98321esm1514421oia.41.2024.04.25.15.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 15:07:18 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v3 5/5] Bluetooth: btusb: mediatek: add MT7922 subsystem reset
Date: Thu, 25 Apr 2024 15:06:31 -0700
Message-Id: <986bef1b3b92452ca0d212ccd9b2bbe1267f320a.1714082459.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
References: <dfd3a5830333e9b59ad1a1458aac8ac2fe28027a.1714082459.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_150724_110059_B7DDD05F 
X-CRM114-Status: GOOD (  11.34  )
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
---
 drivers/bluetooth/btusb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 6cfeec2118e9..3485fefc8bad 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3002,7 +3002,16 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
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
@@ -3042,6 +3051,9 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
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


