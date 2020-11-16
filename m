Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190ACC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95297205ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZA1/hVsQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JyKBryhD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95297205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D+9RNS3tFyaVJsPokzjjvil9V+vsEDWTQXCt74dmODc=; b=ZA1/hVsQ6txKQLGoCtj+ufK1U
	AZcDPaqA9wlGwvPBDN0qn1xn7nzUaFgICjowmRY3EbgcPEWFvcMUG4RDU1l1E68KOCORcH8GvOK0Y
	JkSZzktDk3ut1EdEa8uGh5qKpv/sjWylU/CGtcj46YsXJ8ru5yXTThdsgCS03+WmpCEj6sIBcrUG4
	QegOoROTMR610VbgppPG4Ej19iKqUoVm63aQFb1F3fyxev7VinjsmbuzJrcAMT7dyhNWfsyMs95QT
	hQKxRgn8ofemiuF0xbJTCAQXmcAAWVACWPJ4TllfS5MKn74jNtJFHN9Y36bME2kOzbiN0LcK/T3AX
	/BCQA00Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYVq-00061t-8g; Mon, 16 Nov 2020 07:01:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVe-0005ww-TN; Mon, 16 Nov 2020 07:01:08 +0000
X-UUID: b0f3e096f4f14298a613155ac0942950-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JweaizfpMlDekUkK/RS9zsszEPShdUNgAS8OdzrXhrk=; 
 b=JyKBryhDTfkHrcqOzeUMw/p44ObALEpRW9C0sAIejLyp0lZyb21d7270QEaNbMqklt2Nld15xWbNqPLoRLDRJlYEUvAcDnA4DxggNbdLP8+zvOAngQvMqI5KH55lffJ+/sJFjsECjsWl4vwXRnERusEwLKaN/9Tg0P3zgaiYgkQ=;
X-UUID: b0f3e096f4f14298a613155ac0942950-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 264129735; Sun, 15 Nov 2020 23:01:00 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:50:58 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:56 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 5/9] scsi: ufs-exynos: Use device parameter initialization
 function
Date: Mon, 16 Nov 2020 14:50:50 +0800
Message-ID: <20201116065054.7658-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7C328403594EF3E73E48010B0EA8562DABC4C1AE26A152F8097040FB84C7D3E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020107_214433_613923BB 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use common device parameter initialization function instead of
initialziing those parameters by vendor driver itself.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-exynos.c | 15 +--------------
 drivers/scsi/ufs/ufs-exynos.h | 13 -------------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
index 5e6b95dbb578..a8770ff14588 100644
--- a/drivers/scsi/ufs/ufs-exynos.c
+++ b/drivers/scsi/ufs/ufs-exynos.c
@@ -617,20 +617,7 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 		goto out;
 	}
 
-
-	ufs_exynos_cap.tx_lanes = UFS_EXYNOS_LIMIT_NUM_LANES_TX;
-	ufs_exynos_cap.rx_lanes = UFS_EXYNOS_LIMIT_NUM_LANES_RX;
-	ufs_exynos_cap.hs_rx_gear = UFS_EXYNOS_LIMIT_HSGEAR_RX;
-	ufs_exynos_cap.hs_tx_gear = UFS_EXYNOS_LIMIT_HSGEAR_TX;
-	ufs_exynos_cap.pwm_rx_gear = UFS_EXYNOS_LIMIT_PWMGEAR_RX;
-	ufs_exynos_cap.pwm_tx_gear = UFS_EXYNOS_LIMIT_PWMGEAR_TX;
-	ufs_exynos_cap.rx_pwr_pwm = UFS_EXYNOS_LIMIT_RX_PWR_PWM;
-	ufs_exynos_cap.tx_pwr_pwm = UFS_EXYNOS_LIMIT_TX_PWR_PWM;
-	ufs_exynos_cap.rx_pwr_hs = UFS_EXYNOS_LIMIT_RX_PWR_HS;
-	ufs_exynos_cap.tx_pwr_hs = UFS_EXYNOS_LIMIT_TX_PWR_HS;
-	ufs_exynos_cap.hs_rate = UFS_EXYNOS_LIMIT_HS_RATE;
-	ufs_exynos_cap.desired_working_mode =
-				UFS_EXYNOS_LIMIT_DESIRED_MODE;
+	ufshcd_init_pwr_dev_param(&ufs_exynos_cap);
 
 	ret = ufshcd_get_pwr_dev_param(&ufs_exynos_cap,
 				       dev_max_params, dev_req_params);
diff --git a/drivers/scsi/ufs/ufs-exynos.h b/drivers/scsi/ufs/ufs-exynos.h
index 76d6e39efb2f..06ee565f7eb0 100644
--- a/drivers/scsi/ufs/ufs-exynos.h
+++ b/drivers/scsi/ufs/ufs-exynos.h
@@ -90,19 +90,6 @@ struct exynos_ufs;
 #define SLOW 1
 #define FAST 2
 
-#define UFS_EXYNOS_LIMIT_NUM_LANES_RX	2
-#define UFS_EXYNOS_LIMIT_NUM_LANES_TX	2
-#define UFS_EXYNOS_LIMIT_HSGEAR_RX	UFS_HS_G3
-#define UFS_EXYNOS_LIMIT_HSGEAR_TX	UFS_HS_G3
-#define UFS_EXYNOS_LIMIT_PWMGEAR_RX	UFS_PWM_G4
-#define UFS_EXYNOS_LIMIT_PWMGEAR_TX	UFS_PWM_G4
-#define UFS_EXYNOS_LIMIT_RX_PWR_PWM	SLOW_MODE
-#define UFS_EXYNOS_LIMIT_TX_PWR_PWM	SLOW_MODE
-#define UFS_EXYNOS_LIMIT_RX_PWR_HS	FAST_MODE
-#define UFS_EXYNOS_LIMIT_TX_PWR_HS	FAST_MODE
-#define UFS_EXYNOS_LIMIT_HS_RATE		PA_HS_MODE_B
-#define UFS_EXYNOS_LIMIT_DESIRED_MODE	FAST
-
 #define RX_ADV_FINE_GRAN_SUP_EN	0x1
 #define RX_ADV_FINE_GRAN_STEP_VAL	0x3
 #define RX_ADV_MIN_ACTV_TIME_CAP	0x9
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
