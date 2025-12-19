Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48493D7496B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=; b=AHfzwXgbD/QHvosYbNxXS676F8
	Utq0e+xwKdaF6tuqZqHGuPRnaLikVH0xaI6sM8TGqG7C5Kb2nBn0nSTzq37X6ak/wpRmqeTbTJz8M
	FiAVguadvWH0FP/LPWW4Mn3/iOZ75k5+yPUd2o+BwhEdC50J2ka42S8u1oNio703CKNDJ7mkZL8W4
	Xavr0xgQs7lEfCz18aHG0Gj/nJDoWIfoIdqSLu0hl46yZMw2OxV2SNHm7NrE4VX4MAShDwxP/NnIk
	LtKnH7j13hydb4wfbW4xI5lCj95FBqiLqYRgE60jR+NtDhGsHJxknL8QN7yhWjQPuuuoVGxT26KpZ
	ZoVTgBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkb-00000009wKc-3rsz;
	Fri, 19 Dec 2025 09:26:23 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkW-00000009wFh-0Z8E
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 09:26:13 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so1532055e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 01:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766136370; x=1766741170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=;
        b=OrP41L4awWlY4DM6xKn2cGglGe+yWzmCdoWEWu6sUUE+ciK/vZm8yxZvSenwUBeYd7
         PJVCqn0xJ1ZhrLHa7DSAWzNtNWFVTBcXU9M/ae1vyzf5YWKKNaXprU/El22qmM6F+HT3
         l37JikFRKr6lnrM2Zbd+ucJ8TujAE1mudcFmDCITS+FrdkT+dw95lAewFjgi+OqBhCF9
         yLIE+zkkd39VVVB5lrFCYxXZ/cR4iByi8oX0ZhYnJsKFIYmq5bNijAS7eZ641sicl6bX
         3OtTC3SIXV/Qe828aOH7sU7Az6a2aI+gIPv+uaQ81dw7sCz1a48I+49DwbF2YXALXskT
         5rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136370; x=1766741170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=;
        b=YRpu11KKC+Ui6hduYj38AFbTeZ7crMc/qRMVkGFqLjRE9l69w6FAPHt3H6j8cy9qzu
         nMtdsYoi4xvPK3E7dAZ7WxLEdpDbRkNATfB/8L9l1UsOyKdESTgkn1HnSZtbr2Gr+yEN
         Q4SBjsmftiwVANbCiwNczNXB6z89cULLAXbdzuJ/IvdIOweg0lC8R69+Zse+lgxhY7OK
         EgtOBAYocMSn4OsowcgvtXz9zZkVu5Uefgcb3XjIRxIf4oPdM1GeUAoBZOaoFCDCEKSN
         LgtUS6N/a/3EVTwhKTkgWGX3HKZxyTjITB/Qvt1zPfPb5ngv1s+/MmIvzo1aTl+VOA4m
         17qA==
X-Forwarded-Encrypted: i=1; AJvYcCUjSBo6+TE6cg5tgmQuBmWKCAfaeNB4+PjrK0lGzfnbyjdHoxCIE+HSFG73Fvww2xqOjkkfGC2aT9S3JcNZZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEB+eq4cBmvgeiaIitG2Oh9462VNeacRLvfoNz7+wWkY5j74JH
	7HRQe8TndZHMv0ulNISkoxT4UR9bHABes1CGoehjJ3CNSB30WTn1wjcXjHNkHp14Qo8=
X-Gm-Gg: AY/fxX5MtXM2dormyzWnhIF1NB8TsW1OZyBbVUpEp3Ojl82v8u5K7YunH+KbrJiSm/W
	jeHS4BFgYOSoyDtIgR5LJbIOJZryxPm4eOPGbdyHQ7xWJT6jmAS0kZFf76+kY0Ok9CEC6HsGrYw
	HO0UuJKDRIQWoqBW6aKcWsztjEr7pmx96qHasEamF6uFCdan8pH4UQQQjCCDbAJ3etWPuNz2U97
	n94wL8QJANdPdRuL6qwEsm7oHwJgInmZPZNHUCv5FJJgq+3PpobS23bNDtI7J6y/Q064xz9Vr0+
	udRSPhvnhcCFz8JqTbrXFz2V0PLy6WaYe+U9t7tuS+Yi/ebCpcgE6R6b7TrW4WJaIWO99H2v/CG
	2SROhBsccTXR+aFRCJMzkRc+4hQnyqT9aJxBtqj1st50YvZnkXxft+JfT5t4D74qmcztp3Lr4iQ
	5JAICEwj1Nv6CqzGTvx89c7gk0u1hUusdtTXb3VnztdAioqqaa0ugucIzj47dwc3z/wM71BxIFs
	3Q=
X-Google-Smtp-Source: AGHT+IFEGjvrlWAs0NpG2elZsaHgNsCZyVGl9rExLbOyNOaoYdDfMM8vBeF0ffSfqRLAATFuQzu3Vg==
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr18629415e9.11.1766136369925;
        Fri, 19 Dec 2025 01:26:09 -0800 (PST)
Received: from localhost (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de. [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47be3a2b419sm32705035e9.1.2025.12.19.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:26:09 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
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
Subject: [PATCH v2 8/8] scsi: ufs: Convert to scsi bus methods
Date: Fri, 19 Dec 2025 10:25:37 +0100
Message-ID: <69f17c7d4f8f587e2a56e3ea268d441d98a6a895.1766133330.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=JFJvLGnyaHaCV/eJzejgi5pSvHr6D8xakNdWbDoTCoQ=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGlFGiGjjk6qc0RvRyJZG5ixc8Wz+NTnF0Cizh6nRvjrn03iE 4kBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpRRohAAoJEI+A+1h9Ev5Ov6MH/jlY GNzBxxjQ/8nlY7aC9rclIr1Lin6LyW5AQ18LOuo0fVz3sG8R3ZFEKxjSgJeIMXKXO8nP9NCVvQr TUPIpYMAUlkYaMsrnD61k+Xqver+dgeMYDw4FC64WIuD2/DQjl/gg5d8OB/KKKCN1Qr1sNhNb/R nKRnwHJkzdfscRfMOPZviEplerBOt/hwrbVwnpSDdokMqZfZDI2OR1gP1+HsVT3JDJrj71gFBLl /LnuX6EB0ADIkKNSzywAiVQqiHSjGZVjCYl7zi+RNSdS/QZ4IHFnMT8nvWK+2GcTo5KX9i8eIxj TopuKY6AKRdIz1k5qDtUXiNO97+TxTahd1eMKyk=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012612_207547_166D064F 
X-CRM114-Status: GOOD (  14.53  )
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

The scsi subsystem has implemented dedicated callbacks for probe, remove
and shutdown. Make use of them. This fixes a runtime warning about the
driver needing to be converted to the bus probe method.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/ufs/core/ufshcd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index da1e89e95d07..78669c205568 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10525,9 +10525,8 @@ int ufshcd_runtime_resume(struct device *dev)
 EXPORT_SYMBOL(ufshcd_runtime_resume);
 #endif /* CONFIG_PM */
 
-static void ufshcd_wl_shutdown(struct device *dev)
+static void ufshcd_wl_shutdown(struct scsi_device *sdev)
 {
-	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba = shost_priv(sdev->host);
 
 	down(&hba->host_sem);
@@ -11133,9 +11132,9 @@ static int ufshcd_wl_poweroff(struct device *dev)
 }
 #endif
 
-static int ufshcd_wl_probe(struct device *dev)
+static int ufshcd_wl_probe(struct scsi_device *sdev)
 {
-	struct scsi_device *sdev = to_scsi_device(dev);
+	struct device *dev = &sdev->sdev_gendev;
 
 	if (!is_device_wlun(sdev))
 		return -ENODEV;
@@ -11147,10 +11146,11 @@ static int ufshcd_wl_probe(struct device *dev)
 	return  0;
 }
 
-static int ufshcd_wl_remove(struct device *dev)
+static void ufshcd_wl_remove(struct scsi_device *sdev)
 {
+	struct device *dev = &sdev->sdev_gendev;
+
 	pm_runtime_forbid(dev);
-	return 0;
 }
 
 static const struct dev_pm_ops ufshcd_wl_pm_ops = {
@@ -11223,12 +11223,12 @@ static void ufshcd_check_header_layout(void)
  * Hence register a scsi driver for ufs wluns only.
  */
 static struct scsi_driver ufs_dev_wlun_template = {
+	.probe = ufshcd_wl_probe,
+	.remove = ufshcd_wl_remove,
+	.shutdown = ufshcd_wl_shutdown,
 	.gendrv = {
 		.name = "ufs_device_wlun",
-		.probe = ufshcd_wl_probe,
-		.remove = ufshcd_wl_remove,
 		.pm = &ufshcd_wl_pm_ops,
-		.shutdown = ufshcd_wl_shutdown,
 	},
 };
 
-- 
2.47.3


