Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2ECC531E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZV3jSXI5ldR4jveK2PsLzkMeIX1O0Q5JVn7RfzOo4go=; b=pobn+vb2HDU5PLh/7AXpOo60/4
	0qlmOIZbaRg4U9sfzteF17OxkoAljlSiUbVzmSRmrc+VDDvBmm/Q2N5l52adEOpJzCPRNjO8jAsgr
	bHzDNDVgX5blVnygzslTQnhr60YVA5I9PJNovHeGI4n4lL+bh2A+kittYTVqtxQ8TY8SdqHw8dgb5
	YqyjiFi2XSb8y7RyIA6GiDAKeUBO4fOKRWPp5bVrNRt1mlOIGYCsKi7rA3KVIhYNTlYG3EeUhMz93
	fbvA9TMa2Zppq+SWco2OStj8quFvJhcfYrAIB5Q2TVKHANyITb/wfiMS8eUJarviAHQaImiXWvdBI
	kLOHQ6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDGB-0000000CRyh-1zFX;
	Thu, 19 Feb 2026 23:16:39 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDG8-0000000CRvL-08gH
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 23:16:37 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-66f747175d8so930856eaf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 15:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542994; x=1772147794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZV3jSXI5ldR4jveK2PsLzkMeIX1O0Q5JVn7RfzOo4go=;
        b=RNeowLEO/mn75Akyt4JyMQlsukOC2LKXNXKS1S5P29SQksoA72YUISXa8M5dyBbn2J
         mGdM96OFPrM1nWHu+/ckzXi4qo74uTLcZrGuygd1of0JZ5pKqCs+8Uor8X00+6JllW5C
         xy+ajl0vUguwRbbTvk2bLa9TVDbYvGhylK3Ds+z3rERk9cUbw5gahVZNPLvFwTpmVNMq
         BvMbJxplzGeRP0HWmPoAhZ8NMZeda40VKDo4QSmo2MN/2zmuo3SSQBC1CoMSopd+QV8+
         uRow+Pcq5qnEToqICTx+WtAECHquJZuAdfkFOd43Qo3iteYWmRT7OSTA+ePfTsHLnaTt
         MeOA==
X-Forwarded-Encrypted: i=1; AJvYcCUK2P37smfwXsiaZNAAGU3KplXQdirGZthYiUtufgmlbmimKlt5kU74++C1FtRWTb/XL+8JyaMOoUEP+4VdEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVu828N5aRc69e/tmBhoWLjgRXbIrAl6d52/x2seTWqnVik0mP
	xSinNyGP3Rl9+5kC7OkHlMMZVBu7kvtNogDpaePHyj5TXs+edLsNQ3Mo
X-Gm-Gg: AZuq6aLaE5swU1qSHzn6pR2wQ4MFtvOL5RsE1G0oX1Bj77e8RjpH3Tw+Ajr3PBw+W21
	ohFEP1Z212CLQ6/+76qnw0esL2WMJztcqn5SFlqUmUHjeXnIj3mebXT4SRBnHK7m1Qc+Z2MLaUe
	wnQnltmgKjFyrdaYGX3dcIlkJkqSotS9b0VXwz6jm/DdAs0QtcDwCPGwFlO/RLo6acFBAPGAoWB
	9F6kdaJ5CK8iPoiDFIKNZuCBhyGIvfaqFnHg+8bn6tuvK+Sz23bYwdCHaadwMZ5X1xqpiR6Z3OM
	uv7s/+nd6Sc8B8taiHFO88gN0bsnK2KPsI5UZNifHn7xe2u1qXI9ehp5n6a8pO5EbDddHjDaFUh
	bRdN3+hRLPopNtqjGaYi3sAjOrHg+5asP6pWQfxUC37nhocUA3ANDx4XeESPvkci8szFsHUzeeO
	a9C9cIvPhvx1zhaWyHwlH5g7hxZkqGI8NAQBH5QMv1Ngv3nHg=
X-Received: by 2002:a05:6820:a07:b0:674:5dbd:7859 with SMTP id 006d021491bc7-679a74430b4mr3886891eaf.55.1771542994551;
        Thu, 19 Feb 2026 15:16:34 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm26719644fac.1.2026.02.19.15.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 15:16:34 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/4] Bluetooth: btmtk: add MT7902 MCU support
Date: Thu, 19 Feb 2026 17:16:22 -0600
Message-ID: <20260219231624.8226-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219231624.8226-1-sean.wang@kernel.org>
References: <20260219231624.8226-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_151636_075238_2A6199C8 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Add MT7902 device ID and firmware filename to enable MCU firmware
loading.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 14e2f4100806..2507d587f28a 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1338,6 +1338,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7922:
 	case 0x7925:
 	case 0x7961:
+	case 0x7902:
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version, fw_flavor);
 
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index b9df2b8f0627..adaf385626ee 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -5,6 +5,7 @@
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 #define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
+#define FIRMWARE_MT7902		"mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 
-- 
2.43.0


