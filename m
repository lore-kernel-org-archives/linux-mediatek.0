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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA27C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFF322265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkAheH5x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bhVHeIEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFFF322265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9IK0Bfmk8lVZG4Ot/wxfS+qqHuENT6xA1ZsZDBrjN/E=; b=SkAheH5xSGT8OlGbg/pVMPvW+
	+AA9jWKQpMzo88TuNa7mSuG1g/1YYem6zQzqkm/LRYpBmc0aqYrIbdmpo8otatHEOpoFyPLm3ManL
	oSgXvuSEYf+utGdFbN0oeQSn2IanDUvY1T4wCw8fFJ0V43nDcH/XJslWfRdOmwumoDAlmasg5R9Nu
	Qup0A7aG4++gRHimDzyFGMOZvfF9MmvpT9bkN5SHcvXGrAzTZaQAcbsbTEbXPJ3IV/ZVo6meug4hh
	9jG3gwtSHdRFdS4QoENFcrVf1ymqLcMdsVeooRTPVNoUSymQM/Y8hzBVVhfB1GqWEHgdu0LtUMaSa
	4/LZIU3Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYWr-0006Xb-RI; Mon, 16 Nov 2020 07:02:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVr-0005xz-6r; Mon, 16 Nov 2020 07:01:21 +0000
X-UUID: 5342b99597e042cca7d81e555f44f8b8-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7yXh6JvwR359tTzhm9kMN3keXYY9JMk+adXxRmKmUL0=; 
 b=bhVHeIEYH8Jf+byVjFLXhJdGBs07CO4xHQPuWEpBuVdu09dzQLvCbjHCEVaXHqWUyPqouG5cLS4S441vxFE1EBOB6dZ4pK/tFKFTO+w4qThqNXUqEcR2QLIs2syCrXbzNzGWp1/PRMnpjpRzYw2zRY3mIe5Gx0JL84oA9JWc/S8=;
X-UUID: 5342b99597e042cca7d81e555f44f8b8-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 958704281; Sun, 15 Nov 2020 23:01:10 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:09 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 3/9] scsi: ufs-mediatek: Use device parameter
 initialization function
Date: Mon, 16 Nov 2020 14:50:48 +0800
Message-ID: <20201116065054.7658-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8A036E5F5A4507C6D2CA8D84E1B0A0CC0EB40EE0ADAB9ECF05EFF866AB29A3CD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020120_175845_EFFDEE52 
X-CRM114-Status: UNSURE (   9.29  )
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
 drivers/scsi/ufs/ufs-mediatek.c | 16 +++-------------
 drivers/scsi/ufs/ufs-mediatek.h | 16 ----------------
 2 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index b9b423752ee1..87b4bf125e23 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -680,19 +680,9 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 	u32 adapt_val;
 	int ret;
 
-	host_cap.tx_lanes = UFS_MTK_LIMIT_NUM_LANES_TX;
-	host_cap.rx_lanes = UFS_MTK_LIMIT_NUM_LANES_RX;
-	host_cap.hs_rx_gear = UFS_MTK_LIMIT_HSGEAR_RX;
-	host_cap.hs_tx_gear = UFS_MTK_LIMIT_HSGEAR_TX;
-	host_cap.pwm_rx_gear = UFS_MTK_LIMIT_PWMGEAR_RX;
-	host_cap.pwm_tx_gear = UFS_MTK_LIMIT_PWMGEAR_TX;
-	host_cap.rx_pwr_pwm = UFS_MTK_LIMIT_RX_PWR_PWM;
-	host_cap.tx_pwr_pwm = UFS_MTK_LIMIT_TX_PWR_PWM;
-	host_cap.rx_pwr_hs = UFS_MTK_LIMIT_RX_PWR_HS;
-	host_cap.tx_pwr_hs = UFS_MTK_LIMIT_TX_PWR_HS;
-	host_cap.hs_rate = UFS_MTK_LIMIT_HS_RATE;
-	host_cap.desired_working_mode =
-				UFS_MTK_LIMIT_DESIRED_MODE;
+	ufshcd_init_pwr_dev_param(&host_cap);
+	host_cap.hs_rx_gear = UFS_HS_G4;
+	host_cap.hs_tx_gear = UFS_HS_G4;
 
 	ret = ufshcd_get_pwr_dev_param(&host_cap,
 				       dev_max_params,
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index ac37b11803fb..93d35097dfb0 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -30,22 +30,6 @@
 
 #define REFCLK_REQ_TIMEOUT_US       3000
 
-/*
- * Vendor specific pre-defined parameters
- */
-#define UFS_MTK_LIMIT_NUM_LANES_RX  2
-#define UFS_MTK_LIMIT_NUM_LANES_TX  2
-#define UFS_MTK_LIMIT_HSGEAR_RX     UFS_HS_G4
-#define UFS_MTK_LIMIT_HSGEAR_TX     UFS_HS_G4
-#define UFS_MTK_LIMIT_PWMGEAR_RX    UFS_PWM_G4
-#define UFS_MTK_LIMIT_PWMGEAR_TX    UFS_PWM_G4
-#define UFS_MTK_LIMIT_RX_PWR_PWM    SLOW_MODE
-#define UFS_MTK_LIMIT_TX_PWR_PWM    SLOW_MODE
-#define UFS_MTK_LIMIT_RX_PWR_HS     FAST_MODE
-#define UFS_MTK_LIMIT_TX_PWR_HS     FAST_MODE
-#define UFS_MTK_LIMIT_HS_RATE       PA_HS_MODE_B
-#define UFS_MTK_LIMIT_DESIRED_MODE  UFS_HS_MODE
-
 /*
  * Other attributes
  */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
