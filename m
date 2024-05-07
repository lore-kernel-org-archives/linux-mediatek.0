Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3CCC25B5F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlonihVk5HXWq/ZpBp4yUpJHwD260ZA8CaexGXiG9rQ=; b=lo7jWkDK1yphWtcqWNj4wfV/I8
	2NflU730Qj5I1iU4oumHjhJiETot8ny/Xu8UE5HnE+jw9lu6ZftnDWgf6ZDr+os5jCTQPyJVpgTSK
	9oCV7fwutNKHHhCArUwzm8GzPEWGC/Ikn3hZh5LWKUVB/JneaFTkwTVTHgYAx5s7akn3bEaXeRmaw
	fSqfL9bCtX14F5picTqdIgE6bd7RWFugDuVP/XtZ1xPORY+Y7NqpihuPRlHgUv8Oy57tnp5hIMtpI
	Ezz09mJpjPvsWozZS8IeVgY4xLTD5E7DY34YktGuaztSO71zY28VB2cnY2zBOU+sxDqndmT/PV6lt
	RNmGsVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOF-0000000CXYX-1v4a;
	Tue, 07 May 2024 19:22:15 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QOB-0000000CXVr-3S7w
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 19:22:13 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5b209a2c390so419185eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 12:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715109730; x=1715714530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlonihVk5HXWq/ZpBp4yUpJHwD260ZA8CaexGXiG9rQ=;
        b=Pr3IjYunaCDsQ5WL1F4ZJPWNHEnXwIZGsTgIAG1tWI6UCY+x0PpgxTu8VL63zWPkkf
         96bGudnFFATZOZeABARTujX/NbtzMyqmPaZGUAsgaUsTA8t+/Ew5x0RJRv5FtJ7taW5M
         eYHIPuSJHVRgbeAjy04dnzQOooi9mpPnMg+1YKP48TkK5/Uiajnf950tlktl0B/Fdrdm
         N6yzsfoMA1Se8Q+CmxrXSnpqVNhYG2fMSoHKwtkPPeFofQFc31soN1EiICUvAdB+bavK
         DQCa1XZjuBcU8DTlAA7ymNs5roKbrkag9kdeBWyoopftxQLcJdiCdSl3rMad4Rtnux1A
         gqMw==
X-Forwarded-Encrypted: i=1; AJvYcCXk/fQLpdDLBcBqg6L2M9M5mKQKuZGLaY0g/BhWizq7/D8FqCOk7qR5Md8hJ4w2JAzOmMhV5XYmaYmy016Iv49WdWkannJ7tN+/cHMG9jkLWosd
X-Gm-Message-State: AOJu0YzCrtKNR2OY2BwoKcu6vo5qLgA9ZdPTmUb1JjrEJCmH2wYzQ7Kg
	QEyb8p5oFW0Y9GHL/r2cYd3yxNncukKi+D5D/FC4PRiPs0VzjyqP
X-Google-Smtp-Source: AGHT+IF9UmOg15I3ALrBE4OUAVGBFCQP5hgkpg6/WXPLKaGBvsjk9953JlxPcrsBGu/BmVmoH76jVw==
X-Received: by 2002:a05:6808:181a:b0:3c8:4de7:6736 with SMTP id 5614622812f47-3c98543850bmr542210b6e.4.1715109729785;
        Tue, 07 May 2024 12:22:09 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id ec18-20020a056808639200b003c8643f0e5csm1937839oib.16.2024.05.07.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 12:22:08 -0700 (PDT)
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
Subject: [PATCH v4 4/5] Bluetooth: btusb: mediatek: reset the controller before downloading the fw
Date: Tue,  7 May 2024 12:22:00 -0700
Message-Id: <3c3dfe8efc70af04794035537c7c40a52f2266d5.1715109394.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122211_887466_9DF3C2AB 
X-CRM114-Status: GOOD (  13.54  )
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
v4: rebase onto the latest code
---
 drivers/bluetooth/btusb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 76c52f2fe917..054e8c06bcf3 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3175,6 +3175,13 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
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
 				      fw_version, fw_flavor);
 
@@ -3182,9 +3189,12 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
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


