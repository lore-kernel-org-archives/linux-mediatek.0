Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D61DD7496D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=; b=synVIPRIkk8Ya9YAz4OLhg1VM3
	b7smo2y1B2neb8dKi62sLtQ6kbOpUfAj2pH8vSNzPlZsK5hBVOQInSmp1cYAiigS9x6CgLrpWFMH9
	ghxeyIFOYHsH2agnZD3tdNrry8lioygdzBaJS9Nh03iyiI+CsFHtkGZd0AH0iJ1uuiraWDclh9/3K
	c7UbLKY9PBn2dzjL1d9PfNkBZksKjtPc4shqIJQpThkx4iqBLFVNNP8A1IIgcM8thX73VZHl5uabP
	49CbbVT+lIvuOcAK57rouvQ9IMSFowiqQOFKjszKqgUjeukk/dVTmUpgnnLOcPAqNzIB7PJb483V3
	rGjZWbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkU-00000009wFa-2kPZ;
	Fri, 19 Dec 2025 09:26:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkT-00000009wDw-1qeH
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Dec 2025 09:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=; b=UUqk1HafX1AMM3z6K6G1bvuL2T
	G/ysaQMDXfKr6hoR5y7jUVi2TbNzUq076E6XKFSEAQx2JTt+d85pWcJ2CtvSsg4S7C1qp014WdztX
	uzpu2KW31aJlAyIWRBFHJjXUc5UgBQwWqXEvInkI0uemspv+tNgu4vNJEkrrd160zbnKzO5fuHzvS
	8ShPYtqjxL1sGvEyCCKNY9hkBP+mvUQoLGKGT6fMI/HDbTZWvisIfa/MkgaeJDjkPoVEKTaeBRZON
	jpgQPMHUPfdmL0R3GZELaqXFoZ+ghF3MgcRN2Aa4OeC1ZloIwGr7gnWkM1DA/yodYGgMUP4btUkPl
	0fhaNSEA==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVsv-0000000ATVO-3aK2
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 08:30:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso919712f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 01:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766136362; x=1766741162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=;
        b=hiHiO8mvw1Nid60NMsLInnLBaeMb15V1r5akiLfWFO3W+UDJRGZGPyH1y0+9L7hOzT
         lysAJkMz2i1SKmifQ5+zl9KaTCRph633wiCqRIMl6DalowbuVOzt/DCU27C4s1VElC7l
         yRUq2AVCFv39ghQaOV5BcMx+KbwtMbQ/Smc3IuWubsPtnXJewaFstaGefX53Y8reV0il
         bhBjqQNQ0aw6gEZt8+Yq/Djt9vvHWGwGma0nXSMGQg2DcSYEFrVij6JhUfpZI/eZhf2y
         TKOBqeCc67f8gDoo6goDflPlpDYF1NzeQGVblkQACrfjpnSx9bgcpL7z1nzITpDdH6S0
         8fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136362; x=1766741162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=;
        b=YSAabsysz7U4Up6CUp0iGjLATrlxzfDwkPV7k4GPA3yc1BwBvJ0oKfLsw7IiHFI9Bb
         MVBsox74gxchp9HEm7LMlTwBkfnZBCqAFl79KW9d92ID+WANkJJjqzCyjSOufQbjklM6
         FnurAdLggEhfvEYHi7nSwBoi1ABl3x9HIKUNvA1TzBpTm+Qa/HaZ8IN/ql4HhRAy3UOe
         ynLwCRh3T+xCAbjkGacDoqzIPie909UMZiMulLAz0lie0b1Igq1BZSOPsPkPMxIHxK8C
         v0GoOOcmnLKNeDFJJsB7XMFK0tNCsZziITSB7UyA7LOJ01qaK+xgl/TngiiujrLVLGD2
         QpxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTpUjRSacALVNrH7y7Ul08ZMte7+qKvDQThjDQLSd7j5Fcv4X3zJMtdDH+gSU/W6fryG+9SvBGkL1ZJb/bvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhuont8giRntI3Aqadbpz0ASjnfGVUhzVfhpRzTg8DudB8OTOH
	lXyPmhi3sFjAByj7lhQI8zrqcJvlc0DkdILppPSiQqzcF5DAWCnN1nnbeSzyspn6pew=
X-Gm-Gg: AY/fxX6PZ1eDPR5J5zw1N2zb2VH7ltltheEnyaVWIowDyKm4VWNvA6g6qYxV4uQqCVF
	u8NQpxdu3XMd5wIFqlvt1Ukyz8RP5gjgsAP+cboWFXmEupwvfEgtH0LPvtTS1IcRHDZe0qKsEjw
	x+eEVjy11Wjf9N/AwIXVFUDhBpUESNOO6Jy0sjqef89Oxbv7Os65PNB/B4afJUK+k5YhCKRtkIb
	/UYaYZsiCedrbNR/SL5yA5suB0joIx1lI1aIjvay77fIIXA3vTXGKry0Tp6yTOfQaZVkDalZ4mo
	kyErx+yiwtq4SoBfykMRpA4Qco/c769Vex/FpriuAFOEguSRXcpUXtCpa2DrBT37WMdR9XwOPHN
	H7Upw3kbCOaoWYsDBmn9t+MIJsxvk9ejGOB/PHU0uG5E5fAAGB+i3WGFefKF1yWjbGcmsxO6ctG
	qVhk/cSjWF6rWeiadaYWcy0M1Wg8d/ziQQQLvszbFej/bUERKXcQFVG9+TgAI/Jyo8Kythg3RfZ
	IY=
X-Google-Smtp-Source: AGHT+IFQAhNkTc5ytTmFQoCzq2kpBrhbdcL15ws/0mD1lOKgcviKWNLj2gB606Fsbvncghm2MouC2Q==
X-Received: by 2002:a05:6000:2303:b0:431:342:ad42 with SMTP id ffacd0b85a97d-4324e50d6d7mr2259085f8f.44.1766136361832;
        Fri, 19 Dec 2025 01:26:01 -0800 (PST)
Received: from localhost (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de. [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4324ea1b36fsm3863039f8f.5.2025.12.19.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:26:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	=?utf-8?q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/8] scsi: Pass a struct scsi_driver to scsi_{,un}register_driver()
Date: Fri, 19 Dec 2025 10:25:30 +0100
Message-ID: <ac17fdea58e384cb514c639306d48ce0005820b0.1766133330.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5857; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xXNyc3XdzurEAz26qjxcttkpA50IJuXe67qdD2JoMBo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRRoQ+rKmIl8VKZbGhEIWm8TteCPYl12ira9TX AoE/6RTArmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUUaEAAKCRCPgPtYfRL+ ThtBB/9ayMulPqjTlc0DszWoahuw67pfRGpc5vOLZsOtqHOXKA+kV0Lp72EO8zO686wO6j0wWde m2bV6qMC3NOc7Jp+9CB1NP5/rHr4SVg7D7B2Noa2+iS9nfJbaGHElNzsGFYq19/MkhsPY/wYWP9 9ngozQjFmjsQ/KKoCwxUGLWfAab7akqvGq2MftWRJ7DNMtAtsXRPWqz3GM8WM7WnaTtBg9gpFxV jXRGPpKCiyIWZcon5w+6sz7ouPRfeoOi10rqvjdsMOK9Uyr6IgTaaffaJEey2STBM+L32/iOSe4 SF76ectDaaQAIkTcpXVIwhEWJCjJCllTtHLvLIO2l2xcUHC8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083050_339786_70E23542 
X-CRM114-Status: GOOD (  15.18  )
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

This aligns with what other subsystems do, reduces boilerplate a bit for
device drivers and is less error prone.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/scsi/ch.c          | 4 ++--
 drivers/scsi/scsi_sysfs.c  | 4 +++-
 drivers/scsi/sd.c          | 4 ++--
 drivers/scsi/ses.c         | 4 ++--
 drivers/scsi/sr.c          | 4 ++--
 drivers/scsi/st.c          | 4 ++--
 drivers/ufs/core/ufshcd.c  | 4 ++--
 include/scsi/scsi_driver.h | 4 ++--
 8 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index fa07a6f54003..f2b63e4b9b99 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -1014,7 +1014,7 @@ static int __init init_ch_module(void)
 		       SCSI_CHANGER_MAJOR);
 		goto fail1;
 	}
-	rc = scsi_register_driver(&ch_template.gendrv);
+	rc = scsi_register_driver(&ch_template);
 	if (rc < 0)
 		goto fail2;
 	return 0;
@@ -1028,7 +1028,7 @@ static int __init init_ch_module(void)
 
 static void __exit exit_ch_module(void)
 {
-	scsi_unregister_driver(&ch_template.gendrv);
+	scsi_unregister_driver(&ch_template);
 	unregister_chrdev(SCSI_CHANGER_MAJOR, "ch");
 	class_unregister(&ch_sysfs_class);
 	idr_destroy(&ch_index_idr);
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index 99eb0a30df61..db0ba68f2e6e 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1554,8 +1554,10 @@ void scsi_remove_target(struct device *dev)
 }
 EXPORT_SYMBOL(scsi_remove_target);
 
-int __scsi_register_driver(struct device_driver *drv, struct module *owner)
+int __scsi_register_driver(struct scsi_driver *sdrv, struct module *owner)
 {
+	struct device_driver *drv = &sdrv->gendrv;
+
 	drv->bus = &scsi_bus_type;
 	drv->owner = owner;
 
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index f50b92e63201..6ea6ee2830a4 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -4417,7 +4417,7 @@ static int __init init_sd(void)
 		goto err_out_class;
 	}
 
-	err = scsi_register_driver(&sd_template.gendrv);
+	err = scsi_register_driver(&sd_template);
 	if (err)
 		goto err_out_driver;
 
@@ -4444,7 +4444,7 @@ static void __exit exit_sd(void)
 
 	SCSI_LOG_HLQUEUE(3, printk("exit_sd: exiting sd driver\n"));
 
-	scsi_unregister_driver(&sd_template.gendrv);
+	scsi_unregister_driver(&sd_template);
 	mempool_destroy(sd_page_pool);
 
 	class_unregister(&sd_disk_class);
diff --git a/drivers/scsi/ses.c b/drivers/scsi/ses.c
index 2c61624cb4b0..f8f5164f3de2 100644
--- a/drivers/scsi/ses.c
+++ b/drivers/scsi/ses.c
@@ -921,7 +921,7 @@ static int __init ses_init(void)
 	if (err)
 		return err;
 
-	err = scsi_register_driver(&ses_template.gendrv);
+	err = scsi_register_driver(&ses_template);
 	if (err)
 		goto out_unreg;
 
@@ -934,7 +934,7 @@ static int __init ses_init(void)
 
 static void __exit ses_exit(void)
 {
-	scsi_unregister_driver(&ses_template.gendrv);
+	scsi_unregister_driver(&ses_template);
 	scsi_unregister_interface(&ses_interface);
 }
 
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index add13e306898..2f6bb6355186 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -1001,7 +1001,7 @@ static int __init init_sr(void)
 	rc = register_blkdev(SCSI_CDROM_MAJOR, "sr");
 	if (rc)
 		return rc;
-	rc = scsi_register_driver(&sr_template.gendrv);
+	rc = scsi_register_driver(&sr_template);
 	if (rc)
 		unregister_blkdev(SCSI_CDROM_MAJOR, "sr");
 
@@ -1010,7 +1010,7 @@ static int __init init_sr(void)
 
 static void __exit exit_sr(void)
 {
-	scsi_unregister_driver(&sr_template.gendrv);
+	scsi_unregister_driver(&sr_template);
 	unregister_blkdev(SCSI_CDROM_MAJOR, "sr");
 }
 
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index 168f25e4aaa3..45622cfce926 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -4576,7 +4576,7 @@ static int __init init_st(void)
 		goto err_class;
 	}
 
-	err = scsi_register_driver(&st_template.gendrv);
+	err = scsi_register_driver(&st_template);
 	if (err)
 		goto err_chrdev;
 
@@ -4592,7 +4592,7 @@ static int __init init_st(void)
 
 static void __exit exit_st(void)
 {
-	scsi_unregister_driver(&st_template.gendrv);
+	scsi_unregister_driver(&st_template);
 	unregister_chrdev_region(MKDEV(SCSI_TAPE_MAJOR, 0),
 				 ST_MAX_TAPE_ENTRIES);
 	class_unregister(&st_sysfs_class);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 80c0b49f30b0..da1e89e95d07 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11240,7 +11240,7 @@ static int __init ufshcd_core_init(void)
 
 	ufs_debugfs_init();
 
-	ret = scsi_register_driver(&ufs_dev_wlun_template.gendrv);
+	ret = scsi_register_driver(&ufs_dev_wlun_template);
 	if (ret)
 		ufs_debugfs_exit();
 	return ret;
@@ -11249,7 +11249,7 @@ static int __init ufshcd_core_init(void)
 static void __exit ufshcd_core_exit(void)
 {
 	ufs_debugfs_exit();
-	scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
+	scsi_unregister_driver(&ufs_dev_wlun_template);
 }
 
 module_init(ufshcd_core_init);
diff --git a/include/scsi/scsi_driver.h b/include/scsi/scsi_driver.h
index c0e89996bdb3..40aba9a9349a 100644
--- a/include/scsi/scsi_driver.h
+++ b/include/scsi/scsi_driver.h
@@ -25,9 +25,9 @@ struct scsi_driver {
 
 #define scsi_register_driver(drv) \
 	__scsi_register_driver(drv, THIS_MODULE)
-int __scsi_register_driver(struct device_driver *, struct module *);
+int __scsi_register_driver(struct scsi_driver *, struct module *);
 #define scsi_unregister_driver(drv) \
-	driver_unregister(drv);
+	driver_unregister(&(drv)->gendrv);
 
 extern int scsi_register_interface(struct class_interface *);
 #define scsi_unregister_interface(intf) \
-- 
2.47.3


