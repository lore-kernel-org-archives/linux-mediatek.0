Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F64C25B7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 23:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gZhkoZh+996W2MlO/z0y0kus/aLno+FBdFhG28ujRw=; b=GsJcxl8Y1MZJs9wZ2yDZUyJ8jm
	rt12VqsDKJ0sjYwBG2kRY0ug/MiqOdn166tFw3ZKMt2RhHR+gzZ4EEYrXk2BPD46kuwNU2tsSlqAQ
	w9L8kguWoAINUhs9ESOWOJe6o+Z1Fh+iKmcxR59Kml7sjvyC1b1geyy3aE0+dcWSIzja3AZUUJ4rG
	/4LQi1G/o103HKT8pXTLvimv2TQO1EL8pMqGuiZ+6POC7A9wUXXYeQcO4wEJpYOOIAErNj1W//C6v
	bbnex0+mksGTVpkfcNmsoSz1T8t3hyTIzovMe2rbyF3WxCYN3iCm/sluUewFhCqs1F1+0zhfPWE/a
	adr1EMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Nqf-0000000388q-19kS;
	Wed, 15 May 2024 23:15:49 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NqW-0000000384i-3ZrH
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 23:15:42 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b2f4090ac9so337345eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 16:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814939; x=1716419739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gZhkoZh+996W2MlO/z0y0kus/aLno+FBdFhG28ujRw=;
        b=vJOXZxxV7hqVAn/TNFi1Yr1hlRKXqrpmRLKBv/xjNtH0Ml4oyEvTuq41aGoGF1xynN
         5neSoBb7R39aEyirD6zjFxefY+fSC+nOQg9GH2imZc5WPfxJijAQWIRkA6PrWbZiH1FH
         vDK6dAzxMT6YVSzfepP6ftzOGJ9vS85a3QY2VT5x+a17RrQxvf8cjoupsUpnSOZxY/ds
         SvEiSrKKY+apVliN7M2QxnlEGEapNSLy7pDWx3yMgMm/sItaYmeiqecBTISMmoMbOKsN
         SvvGP+Kd4co1PXcpHK1wIJxz6vaXcB9q/916nv6QCar6Aj+5CdQWGczu8YaxvWGSb0P0
         6O9A==
X-Forwarded-Encrypted: i=1; AJvYcCXdXmYTHCYXUEHYRVCr13tOIiMp6JWkYrGJA9062LCacFhoYIlQ718LqI5VeFhhBWtU7vCTfngxuaqt6bhNx8ana1BV0h2kfC737mA+BxOZNiAi
X-Gm-Message-State: AOJu0Yyz4BsyJrUFV2lqMv9dRyHnljO0p+xO28zzBSMJ3NLJ0nJKSyQW
	LNyLuphgmYC23euqTxwCZ4NG/AJEOSGyRrOtY29zD6dI33A84q72
X-Google-Smtp-Source: AGHT+IF0POBtkQziU+q0qOxtQZ52Him+GxehNpFjP35Htw+MWHS2pgEhKry+qlvjd5BNWQnU4udiGA==
X-Received: by 2002:a9d:400c:0:b0:6f0:52fb:c693 with SMTP id 46e09a7af769-6f0e90f24camr18546313a34.1.1715814938820;
        Wed, 15 May 2024 16:15:38 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ec2e566dsm2032159a34.15.2024.05.15.16.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:15:37 -0700 (PDT)
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
Subject: [PATCH v5 4/5] Bluetooth: btusb: mediatek: reset the controller before downloading the fw
Date: Wed, 15 May 2024 16:15:20 -0700
Message-Id: <38805679fd6abf8fec46224fa8edb81152adb6dc.1715813148.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
References: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_161541_087254_A50EC1E5 
X-CRM114-Status: GOOD (  13.29  )
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
v5: no change
---
 drivers/bluetooth/btusb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 602456e94fdb..ddd5ca7596e5 100644
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


