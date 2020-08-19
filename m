Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B1BC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8DB920639
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o8FinDZ7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sq2coitV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8DB920639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ll32AZqcraIZCysoF606f8VQuJFVpEL2bml3lQ7le7A=; b=o8FinDZ73UA1ph8oen8wVDwdW1
	igAHFffpVU11WNhnHTgWPIFkDqAdr15CeMdlUU3zhowdUGysvQrf0+HJv73eELj76sRshAxN46/+v
	vWkOa6n57qfb5Jw/iIAQtkkTdKMmIjh2RmvOQrawsMB28axkY9wrUtUPHB5XxN2UpYhyl+scjGa6b
	NLlpPRXzeCZt1E1X9T+rdwwEWtKHVCOyqLCfK5uKGk2Iw1Gwgd+0HwVNojQTL4V7zwH4g6PZfjAcc
	hfXYUvH/dxkVcznqzZC2Ny4IKp4/aSWdFEzBw2XA9hZ9YaEnP/xFQox4Ha2btwynxfMpw/S0k6iMe
	tG5g4+bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Jhy-0004ze-3d; Wed, 19 Aug 2020 08:44:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Jhv-0004yj-R0; Wed, 19 Aug 2020 08:44:33 +0000
X-UUID: b86d222b85c9471094140ca1254dabb4-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AECUkhYUHBHHNyZQuHsduJ7+PYMR4h3yA3w0YXFQIAA=; 
 b=sq2coitVuMZkfuGBl2AkCsuFUClEws7szVGl4t20fw/WQnAPvH5I0ahgpRzzbAwB+1vo60ayt/D3J02vMd5saLV7IyebFm6LB7y4Ea3YOp18Ks7zQQGvvJuiTSnBMM34tmf07fcpWnBwOO/Ih4Eoi5YUODcZV8p6LeY9XLDKVwg=;
X-UUID: b86d222b85c9471094140ca1254dabb4-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1742372063; Wed, 19 Aug 2020 00:44:22 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 01:43:52 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 16:43:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Aug 2020 16:43:39 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH] scsi: ufs-mediatek: Modify the minimum RX/TX lane count to 2
Date: Wed, 19 Aug 2020 16:43:40 +0800
Message-ID: <20200819084340.7021-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_044432_114569_8CAAAE7E 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Andy Teng <andy.teng@mediatek.com>

MediaTek UFS host starts to support 2 lanes, thus modify the
minimum lane count to 2.

This modification shall not impact old 1-lane host because
PA_CONNECTEDRXDATALANES and PA_CONNECTEDTXDATALANES will limit the
target lanes properly during power mode change. So we could relax
the limitation in ufs_dev_params.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Singed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 8ed24d5fcff9..87657376d27a 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -33,8 +33,8 @@
 /*
  * Vendor specific pre-defined parameters
  */
-#define UFS_MTK_LIMIT_NUM_LANES_RX  1
-#define UFS_MTK_LIMIT_NUM_LANES_TX  1
+#define UFS_MTK_LIMIT_NUM_LANES_RX  2
+#define UFS_MTK_LIMIT_NUM_LANES_TX  2
 #define UFS_MTK_LIMIT_HSGEAR_RX     UFS_HS_G3
 #define UFS_MTK_LIMIT_HSGEAR_TX     UFS_HS_G3
 #define UFS_MTK_LIMIT_PWMGEAR_RX    UFS_PWM_G4
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
