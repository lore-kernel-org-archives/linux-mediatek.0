Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629EEC43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 08:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E2D2073D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 08:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLlneUc0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Zy5ddd2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E2D2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gaNiNO5mH+kMhptijMhPGZ5WOHuRsG3/CnedEcqXqM=; b=RLlneUc0RbyYUv
	OtCzoYgmBJ8+H8BK2jcNbPbv5U5IgU3SVieHpRS7vtiSTd6dxA3d4YoMMQEvzDnSNnTAhZz9OBkPW
	cNdnGy1ZVk3wMqFGturcK8zRYadLYanUBrSTjV/Kg3XZfTTTaM5pZY1bIp7KtQBt7iIvR3yJ8mN6g
	VySIuctJDHHo+oo5fx8m474e0QxULeS1qCplAqojSG39czROgdJZgszSV0x3MKp5GkZI+wGZ1v7h2
	v/uIjYdPH/5NHZnsuGjqofk0xQPvNqfVtoZooEf6AKMoMZn3BvSkx9u/3LvrC5TYrmFpU9m4ZPnq3
	i1qVFIQd2MqoZgRMM0cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieEY7-0007gu-Mo; Mon, 09 Dec 2019 08:37:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieEXw-0007UW-2M; Mon, 09 Dec 2019 08:37:37 +0000
X-UUID: 161b348ed52d4accb5f527a27d023e5c-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PobjKoCgXRNn990HIlJZTubi4uiFA7wzU79j4/Le0Bk=; 
 b=Zy5ddd2VHcyHhNuqA1B03JfCjdZM9g8ATySnJem1CmJrLkHY1EnJw5MrubGchT5J8tMWc+kLPU3Vvae+uluoRuE7YFrTv/eLabUrvhjAMmOiDFebOSXhgWPZauwETo5BXxrWegVPclXfvYki5yIxd77hfV64B5CBDWoVkqgwLiw=;
X-UUID: 161b348ed52d4accb5f527a27d023e5c-20191209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 229379691; Mon, 09 Dec 2019 00:37:32 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 00:30:18 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 16:28:52 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 9 Dec 2019 16:29:00 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <f.fainelli@gmail.com>
Subject: [PATCH v2 1/2] soc: mediatek: add header for SiP service interface
Date: Mon, 9 Dec 2019 16:29:13 +0800
Message-ID: <1575880154-6099-2-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1575880154-6099-1-git-send-email-stanley.chu@mediatek.com>
References: <1575880154-6099-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C9D4BFB12BEAF2AA31D11178215C377E0379A3988D3D52318AB1548C0C1868E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_003736_110418_C5704AC6 
X-CRM114-Status: UNSURE (   9.02  )
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
 include/linux/soc/mediatek/mtk_sip_svc.h | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
new file mode 100644
index 000000000000..3d725fcdd5ba
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ */
+
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
