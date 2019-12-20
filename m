Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE63C2D0D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE872467F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyubOayY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tRAaeaKF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE872467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPKwmX6S0Kn7DhA6y8Gi5fmQoRBGKUQw2cTwg4vtbL8=; b=nyubOayYKsecpr
	wlyQJAaflc4+2R8bJqxyhaRCuBvsjGLgwBrAPyTJzFMiU2r7pFh9p2Cg1oqt8BejLwCWbANL1+6mk
	m8gY6v6VrhXAM1MnGIVU1+NtJ/iOIRw65uY6/bMzdGwprZra3JFrlnJ5RSaSfFyb6bUxCq9kkMnCc
	k3dUutnZ5xC/TzMQVGrJk68AGvdr+nQO5Ae2pe88FcGMStL3iz6l1yl/EAHdyve+Y0lMROXoYMvuD
	T0YJ+ptt7nWMKpM/NvJDzKLUCqpiWo1f6N+bCvej4qEtxDrYQkG/+xdLkSbG517MlYSb89JUwhZKl
	KYLBVRsIpzVgvevi8HZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiDmN-0008Ni-Ly; Fri, 20 Dec 2019 08:36:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDm7-00087p-AI; Fri, 20 Dec 2019 08:36:44 +0000
X-UUID: 99683d4334214b83a1aa3670ae893952-20191220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=12E3/w0zLzo1lHYmnmqiu5tF62G08uQTQTzZ3/Kf2H4=; 
 b=tRAaeaKFYWIg559X/Tg4dmJjeXBnzdD9rFLx8t+bS1unU2nCsIrJnV/Z9aRrNY41EhT7r3UZ23VwEsGwpk7/DEE2fDXSzZA74nRFU1aWzuhpK/jPYz9IXUr4UoCXmGB3UnhMxqJS328gaZtdI1TjtWxM4LPZO+lGAXDETxvKWEE=;
X-UUID: 99683d4334214b83a1aa3670ae893952-20191220
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1659457054; Fri, 20 Dec 2019 00:36:38 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 00:36:58 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 16:35:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Dec 2019 16:35:38 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <f.fainelli@gmail.com>
Subject: [PATCH v1 1/6] soc: mediatek: add header for SiP service interface
Date: Fri, 20 Dec 2019 16:36:23 +0800
Message-ID: <1576830988-22435-2-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1576830988-22435-1-git-send-email-stanley.chu@mediatek.com>
References: <1576830988-22435-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B5F7BFC16B0E8191AE28A1FFB78843557E482DF05CE81504A7CB1D2CDB00ED22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_003643_355900_CDD20B66 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a header for the SiP service interface in order to access
the UFSHCI controller for secure command handling in MediaTek Chipsets.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 include/linux/soc/mediatek/mtk_sip_svc.h | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
new file mode 100644
index 000000000000..97311959d7d7
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ */
+#ifndef __MTK_SIP_SVC_H
+#define __MTK_SIP_SVC_H
+
+/* Error Code */
+#define SIP_SVC_E_SUCCESS               0
+#define SIP_SVC_E_NOT_SUPPORTED         -1
+#define SIP_SVC_E_INVALID_PARAMS        -2
+#define SIP_SVC_E_INVALID_RANGE         -3
+#define SIP_SVC_E_PERMISSION_DENIED     -4
+
+#ifdef CONFIG_ARM64
+#define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_64
+#else
+#define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_32
+#endif
+
+#define MTK_SIP_SMC_CMD(fn_id) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
+			   ARM_SMCCC_OWNER_SIP, fn_id)
+
+/* UFS related SMC call */
+#define MTK_SIP_UFS_CONTROL \
+	MTK_SIP_SMC_CMD(0x276)
+
+#endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
