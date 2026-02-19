Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA84C531EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 23:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Os50U/6oPIcjA2CMN1raoU5d+8qh4ZaifQVvl0ajsGs=; b=3jx9TB99n7HGcE8et2t/OIrTHj
	uQn+VCIzJMuRpEkL2C18eoUw5g1oCxSXjvfkWmvK4WgiMoa1hgdp6MSBO89J3+n7kY4Mf5eIe++bZ
	RJTmZJ5hL8k+Cw0TMh59Fxy3zASdOqMH0Br1+xtVDAAgNuVL3mVjM09axkORwkXG97FAeRVeXkyTc
	uyfdhF32I96Lj96GD7JdUDsvVBRmS2826tu5XuBKZWpauG06fb71YHnnPj/sRvt1+fHQKZ0FRsXCn
	pLj+sdO/TPvb7aror35QmxQaROmCrv6UhIeeRme4kL9Y4rTPw3kgwEyEDoF71gHtz3nOs2EAd+XJm
	U3vGRAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDGD-0000000CS0j-0A3R;
	Thu, 19 Feb 2026 23:16:41 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDGA-0000000CRxd-2tOg
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 23:16:39 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40ee196dd78so985801fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 15:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542997; x=1772147797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Os50U/6oPIcjA2CMN1raoU5d+8qh4ZaifQVvl0ajsGs=;
        b=RB4KyusKsHdqh3ho7tug2SlJTEbuPeVjX1bObj3ym53bcoO0VRIkuchiDhROylOcRx
         6YgS5p0FU/21zYzpjOjfWLiGheT+PbW24XZakfBF56IJTPv9TwgZ2V2udE6wIngGQNQf
         vBV8M3IBIo+QvfILTwfZddUMb7vZyY1LefALO7iHHgsqBDFcJmQjKV3OQ8bJd/k5q2SK
         hWjixlpLg/p0IPBRNJOreJYAcp1vqzIMffCDZtrdh/bGqjmyMB+okPd0D0aRAS4zkoqP
         ndWKPYPHr/7aFipBlJzmFedSsUd0hFy0CWrAT24W4BG9OH8k4V0q6ypDWKgP1Uw3LV8e
         O+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU4rNMV+RtHDP4+N8A/5JyJEpWEXH/1L9chWUBlf0pEXeGBrZlQsogqXRSR+chaIAynur4GKtcRwMbcyxLt5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGSFe1jSJiYbouIw1rxz0NWWyVLM+9vxS8zjDaKxBOTxhRIv6R
	7K8Qfh7lHIYq1g4BR3Q6CB587jeBe9aMOanTVdVS5VaQAPOzP9t2yrcX
X-Gm-Gg: AZuq6aJLkgQdhClql71EXPzXGYvx8oUdrfapt9T76U4nDjB258X0cqbu3+Vi6kSLw6N
	iJbxlM/4y9Ewq52+fPHsjxbb8dZRAy5phF+2yt+MLOx7JiFrhc+LafWPTCTsDnlpBEC0EDaDyWA
	EHPRrbpDFhRQPPdpL6/RZSQMc+qz08lw/ML5xEvGnp9g2Rsg1MV1bAlqSZvHDwwcEwoMdMlZhrj
	4XA9TsnbHxGchqv/WXmoczwkvURfiZ228lzLySpZNY0FHSvnOKEQEYLSiGnX4nlsJNkjuf6ZZtI
	x6k+CKLSLVv49avQ9knKgl08CrgHHPKH/gjDCZ/uQZorYbQNFw3rydFc4vXWBg5E1mu7INsZOgD
	bzmViMVpoo8l1Ku79csidOoQ3seSmuYJv3a6PXdVBwKk9iZN075+d5pPh7WIvcFpLV06UdKYd95
	C1JbQPVhTicpd8LIu0hDXVwOLUXz7IrxaU47jwBnyR+PIsTz4=
X-Received: by 2002:a05:6870:21d0:b0:40e:deac:4248 with SMTP id 586e51a60fabf-4154539da2emr2009359fac.3.1771542997672;
        Thu, 19 Feb 2026 15:16:37 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm26719644fac.1.2026.02.19.15.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 15:16:37 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 4/4] Bluetooth: btmtk: add MT7902 SDIO support
Date: Thu, 19 Feb 2026 17:16:24 -0600
Message-ID: <20260219231624.8226-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219231624.8226-1-sean.wang@kernel.org>
References: <20260219231624.8226-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_151638_748022_20855C1A 
X-CRM114-Status: GOOD (  15.40  )
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

Add MT7902 Bluetooth SDIO support by introducing chip data and
registering the device ID.

Runtime PM is not yet supported by the driver, but normal operation
is unaffected.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 42 ++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index e986e5af51ae..042064464d34 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -42,24 +42,35 @@ struct btmtksdio_data {
 	const char *fwname;
 	u16 chipid;
 	bool lp_mbox_supported;
+	bool pm_runtime_supported;
 };
 
 static const struct btmtksdio_data mt7663_data = {
 	.fwname = FIRMWARE_MT7663,
 	.chipid = 0x7663,
 	.lp_mbox_supported = false,
+	.pm_runtime_supported = true,
 };
 
 static const struct btmtksdio_data mt7668_data = {
 	.fwname = FIRMWARE_MT7668,
 	.chipid = 0x7668,
 	.lp_mbox_supported = false,
+	.pm_runtime_supported = true,
 };
 
 static const struct btmtksdio_data mt7921_data = {
 	.fwname = FIRMWARE_MT7961,
 	.chipid = 0x7921,
 	.lp_mbox_supported = true,
+	.pm_runtime_supported = true,
+};
+
+static const struct btmtksdio_data mt7902_data = {
+	.fwname = FIRMWARE_MT7902,
+	.chipid = 0x7902,
+	.lp_mbox_supported = false,
+	.pm_runtime_supported = false,
 };
 
 static const struct sdio_device_id btmtksdio_table[] = {
@@ -69,6 +80,8 @@ static const struct sdio_device_id btmtksdio_table[] = {
 	 .driver_data = (kernel_ulong_t)&mt7668_data },
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7961),
 	 .driver_data = (kernel_ulong_t)&mt7921_data },
+	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7902),
+	.driver_data = (kernel_ulong_t)&mt7902_data },
 	{ }	/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
@@ -1090,6 +1103,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 	set_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
 
 	switch (bdev->data->chipid) {
+	case 0x7902:
 	case 0x7921:
 		if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state)) {
 			err = btmtksdio_mtk_reg_read(hdev, MT7921_DLSTATUS,
@@ -1167,22 +1181,24 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 	delta = ktime_sub(rettime, calltime);
 	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
 
-	pm_runtime_set_autosuspend_delay(bdev->dev,
-					 MTKBTSDIO_AUTOSUSPEND_DELAY);
-	pm_runtime_use_autosuspend(bdev->dev);
+	if (bdev->data->pm_runtime_supported) {
+		pm_runtime_set_autosuspend_delay(bdev->dev,
+						 MTKBTSDIO_AUTOSUSPEND_DELAY);
+		pm_runtime_use_autosuspend(bdev->dev);
 
-	err = pm_runtime_set_active(bdev->dev);
-	if (err < 0)
-		return err;
+		err = pm_runtime_set_active(bdev->dev);
+		if (err < 0)
+			return err;
 
-	/* Default forbid runtime auto suspend, that can be allowed by
-	 * enable_autosuspend flag or the PM runtime entry under sysfs.
-	 */
-	pm_runtime_forbid(bdev->dev);
-	pm_runtime_enable(bdev->dev);
+		/* Default forbid runtime auto suspend, that can be allowed by
+		 * enable_autosuspend flag or the PM runtime entry under sysfs.
+		 */
+		pm_runtime_forbid(bdev->dev);
+		pm_runtime_enable(bdev->dev);
 
-	if (enable_autosuspend)
-		pm_runtime_allow(bdev->dev);
+		if (enable_autosuspend)
+			pm_runtime_allow(bdev->dev);
+	}
 
 	bt_dev_info(hdev, "Device setup in %llu usecs", duration);
 
-- 
2.43.0


