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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25715C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B2022265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WqGW8ySj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pOaQaKbI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B2022265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VO/TW+HdI/BNwEVAUyIt55SBZpX9rW1XgAqNeBfgP1E=; b=WqGW8ySjUH53P95TUKgKldN3a
	Ytlluz38x7DU/NWAuMKt6Dtk5k4YgLQw7iRQiS6V79X1YtvAAsvwKErZ+dnOJuhHXJpej3G0OsIWN
	0S9l4/GOAiEScVCpRl54XS1DmOWBRMd8HfxbZ1u9BzZY71jZ/ygB1vKLUMfDcFB42Axkv7ynuNiZ5
	IxK13g2rv7WVJh+y66JnBLWcQsN8THyv8evDcf9RpShCGoBdEbl3Ou9hHSweYnOdL4DhTUI+TDThI
	uwMW/aJw+kDBJIYMwk2c11S3tGOoHdnaf3QGIQ5W15K/OhnMIBfX+R6nx3BQyef3vk/Q2XtN54VD7
	rnsR9y4ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYWf-0006Nl-9D; Mon, 16 Nov 2020 07:02:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVm-0005yh-Bm; Mon, 16 Nov 2020 07:01:17 +0000
X-UUID: c29315a204e14cd9a9d344301256f3d2-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dq9m13ll9mzFaHKQ8FBsTKBwnkO4UxLR3BQzD9QCJcM=; 
 b=pOaQaKbIX0P51DqI+6Y55SEJThWXckfvVn+LmZjxAKIv67CMsFo3ChNUAFozMlGqZkDKD9MN1jZ9KRfU/M+L2mfCn4/Km+hVZPbuv+cSCoNUuSGXgSBCeOcGmkCwdUSsyLaSMCM9Y/d6FhrD7787rGQwbBlbFuYBXmP5hSvXq9E=;
X-UUID: c29315a204e14cd9a9d344301256f3d2-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1110875955; Sun, 15 Nov 2020 23:01:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 4/9] scsi: ufs-qcom: Use device parameter initialization
 function
Date: Mon, 16 Nov 2020 14:50:49 +0800
Message-ID: <20201116065054.7658-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020114_652469_68208A90 
X-CRM114-Status: GOOD (  10.62  )
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
 drivers/scsi/ufs/ufs-qcom.c | 13 +------------
 drivers/scsi/ufs/ufs-qcom.h | 11 -----------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 357c3b49321d..04adfbd10753 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -691,19 +691,8 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ufs_qcom_cap.tx_lanes = UFS_QCOM_LIMIT_NUM_LANES_TX;
-		ufs_qcom_cap.rx_lanes = UFS_QCOM_LIMIT_NUM_LANES_RX;
-		ufs_qcom_cap.hs_rx_gear = UFS_QCOM_LIMIT_HSGEAR_RX;
-		ufs_qcom_cap.hs_tx_gear = UFS_QCOM_LIMIT_HSGEAR_TX;
-		ufs_qcom_cap.pwm_rx_gear = UFS_QCOM_LIMIT_PWMGEAR_RX;
-		ufs_qcom_cap.pwm_tx_gear = UFS_QCOM_LIMIT_PWMGEAR_TX;
-		ufs_qcom_cap.rx_pwr_pwm = UFS_QCOM_LIMIT_RX_PWR_PWM;
-		ufs_qcom_cap.tx_pwr_pwm = UFS_QCOM_LIMIT_TX_PWR_PWM;
-		ufs_qcom_cap.rx_pwr_hs = UFS_QCOM_LIMIT_RX_PWR_HS;
-		ufs_qcom_cap.tx_pwr_hs = UFS_QCOM_LIMIT_TX_PWR_HS;
+		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
 		ufs_qcom_cap.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
-		ufs_qcom_cap.desired_working_mode =
-					UFS_QCOM_LIMIT_DESIRED_MODE;
 
 		if (host->hw_ver.major == 0x1) {
 			/*
diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
index 3f4922743b3e..8208e3a3ef59 100644
--- a/drivers/scsi/ufs/ufs-qcom.h
+++ b/drivers/scsi/ufs/ufs-qcom.h
@@ -27,18 +27,7 @@
 #define SLOW 1
 #define FAST 2
 
-#define UFS_QCOM_LIMIT_NUM_LANES_RX	2
-#define UFS_QCOM_LIMIT_NUM_LANES_TX	2
-#define UFS_QCOM_LIMIT_HSGEAR_RX	UFS_HS_G3
-#define UFS_QCOM_LIMIT_HSGEAR_TX	UFS_HS_G3
-#define UFS_QCOM_LIMIT_PWMGEAR_RX	UFS_PWM_G4
-#define UFS_QCOM_LIMIT_PWMGEAR_TX	UFS_PWM_G4
-#define UFS_QCOM_LIMIT_RX_PWR_PWM	SLOW_MODE
-#define UFS_QCOM_LIMIT_TX_PWR_PWM	SLOW_MODE
-#define UFS_QCOM_LIMIT_RX_PWR_HS	FAST_MODE
-#define UFS_QCOM_LIMIT_TX_PWR_HS	FAST_MODE
 #define UFS_QCOM_LIMIT_HS_RATE		PA_HS_MODE_B
-#define UFS_QCOM_LIMIT_DESIRED_MODE	FAST
 
 /* QCOM UFS host controller vendor specific registers */
 enum {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
