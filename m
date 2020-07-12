Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDE1C433E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 00:33:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E29206F4
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 00:33:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyPxLa+w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VXspkkWV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E29206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KQgqcSVyB/+EjsWyP5LcLXXxnoz6FG51wnyyP4fOj3w=; b=qyPxLa+wP32WFQ/HKVc+/3WKSI
	3YgrEJkbU0CWaO0vrFIxnVvEqjgCPOIYCnhJ+6w0fssfqU3nnnL9MGF3y/g/ObExq5bqqGMqP3ryS
	TE91NtJpmQEdHklo39SxoP3z4Vf3qzWr+ZBdUq1A6xTyWXncjTKmxOwOsfe1OxalUF+3Q9JcM4p8O
	X/vEL4RpY19tNhtHA5OqSMZA3yKSgvAYK3O1815ixkrm8VFASRc58mh85IgfbNABVNZORLA0Mg5K5
	YCORYa9ltDYkQ3g9zEithZ/RrQH5YGnowI+nwfgrgI38kvqvXzCGdb7qKSHtZ4jFwLxQUiXfMZDhl
	VmoANOaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juPvL-0002Ib-VS; Sun, 12 Jul 2020 00:32:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juPvI-0002I1-Sf; Sun, 12 Jul 2020 00:32:55 +0000
X-UUID: 91c359dbbc534ecdbbb24332d9ebcdb3-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Z1SuMVtx7OA9n2jgiMCXVQ8y0m5FxirhJO+d41akUHw=; 
 b=VXspkkWVh+oPvp4y2s+TqUobjolG2QZ23C9mGeuk2KwW9/wJbl0RrDl2ZqFMD+YbrXcmEqhYKlUsfRTp4aTRvPoJtPRZSMbeKaaKUg3MA0NwymTsxr+zGyHOTKCthuZBeTY/F1TbqpbbFmY+BqkRPVjT0/u6lOwWaehbCbvfivA=;
X-UUID: 91c359dbbc534ecdbbb24332d9ebcdb3-20200711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1926010742; Sat, 11 Jul 2020 16:32:43 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 17:32:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 08:32:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 12 Jul 2020 08:32:27 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <ebiggers@kernel.org>, <satyat@google.com>
Subject: [PATCH v3] scsi: ufs-mediatek: Add inline encryption support
Date: Sun, 12 Jul 2020 08:32:26 +0800
Message-ID: <20200712003226.7593-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CC95F33B94D9D190BA186BDF462498E3A2DC36E666D567D6896CF24781C8EFC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_203253_119870_4A43F80E 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add inline encryption support to ufs-mediatek.

The standards-compliant parts, such as querying the crypto capabilities
and enabling crypto for individual UFS requests, are already handled by
ufshcd-crypto.c, which itself is wired into the blk-crypto framework.

However MediaTek UFS host requires a vendor-specific hce_enable operation
to allow crypto-related registers being accessed normally in kernel.
After this step, MediaTek UFS host can work as standard-compliant host
for inline-encryption related functions.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 22 ++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index ad929235c193..31af8b3d2b53 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -16,6 +16,7 @@
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 
 #include "ufshcd.h"
+#include "ufshcd-crypto.h"
 #include "ufshcd-pltfrm.h"
 #include "ufs_quirks.h"
 #include "unipro.h"
@@ -25,6 +26,9 @@
 	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
 		      cmd, val, 0, 0, 0, 0, 0, &(res))
 
+#define ufs_mtk_crypto_ctrl(res, enable) \
+	ufs_mtk_smc(UFS_MTK_SIP_CRYPTO_CTRL, enable, res)
+
 #define ufs_mtk_ref_clk_notify(on, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_REF_CLK_NOTIFICATION, on, res)
 
@@ -73,6 +77,18 @@ static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 	}
 }
 
+static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
+{
+	struct arm_smccc_res res;
+
+	ufs_mtk_crypto_ctrl(res, 1);
+	if (res.a0) {
+		dev_info(hba->dev, "%s: crypto enable failed, err: %lu\n",
+			 __func__, res.a0);
+		hba->caps &= ~UFSHCD_CAP_CRYPTO;
+	}
+}
+
 static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 				     enum ufs_notify_change_status status)
 {
@@ -83,6 +99,9 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 			hba->vps->hba_enable_delay_us = 0;
 		else
 			hba->vps->hba_enable_delay_us = 600;
+
+		if (hba->caps & UFSHCD_CAP_CRYPTO)
+			ufs_mtk_crypto_enable(hba);
 	}
 
 	return 0;
@@ -317,6 +336,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	/* Enable clock-gating */
 	hba->caps |= UFSHCD_CAP_CLK_GATING;
 
+	/* Enable inline encryption */
+	hba->caps |= UFSHCD_CAP_CRYPTO;
+
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 6052ec105aba..8ed24d5fcff9 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -70,6 +70,7 @@ enum {
  */
 #define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
 #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
+#define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
 #define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
 
 /*
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
