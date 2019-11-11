Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4E0C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 02:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E0A2067B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 02:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MRcmBlrW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GX52fptd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E0A2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLISxf10U3QuYx0qf/TYbCfxAdgcjHqTrxvsm2ytdXc=; b=MRcmBlrWUo0/ao
	ZhosDrYigdvhSmA6ho2UL9f+R1c/ghVizLkdxnwTxv7p5sfhF/HdBg4YmbQtLbZOb27NfYDp2l9qC
	KsyrzwoRszJiVCZn9wnW/rhfTxjMo74Whs3M8Vb1wXes2hECJIVhe30LGcUcVCZ2L1l9ZAAiR73Ke
	OcDkbQl12oNr5Vjz6cxbZVJGEgEpt5x5hTyn62hhRlLFyTSGL3MiEbYRAqrCul7nIQWuHNAA2CJTO
	jR4AdraFNvyWRxcM3QzntPGyWK7wMco7UMBH2p9HZAqhWEU/+XsQPAsI7+1smqR+gaCAt+t3d0AIG
	q7ihLj6ZYzoRIiwAwydA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTzTd-0001Yg-F0; Mon, 11 Nov 2019 02:30:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTzTa-0001Xf-Uh
 for linux-mediatek@lists.infradead.org; Mon, 11 Nov 2019 02:30:48 +0000
X-UUID: 3cf40d69e84248c9a7482b804a8f493b-20191110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=acEmGwvUjZOpmJa59Ln0aY1tOabs5B1U4izgcr2S2/4=; 
 b=GX52fptdC2by0mjmY64HLCuYWezz68+Ao7X2IYxAN41Fdu4EsrpdIMwC4U/ka53tsnGNEGJJ/jaBDrG+7nugDg3QanMDtHoWvu9ABOsuBOmkacTOrIx+OK+c2IRTGFARoxEoExHpGdmKEpYCz3dAhwPLa9DyxNz7v9vkbN64L6Y=;
X-UUID: 3cf40d69e84248c9a7482b804a8f493b-20191110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 926828510; Sun, 10 Nov 2019 18:30:48 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 10 Nov 2019 18:30:38 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 11 Nov 2019 10:30:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 11 Nov 2019 10:30:36 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/1] soc: mediatek: add SMC fid table for SIP interface
Date: Mon, 11 Nov 2019 10:30:02 +0800
Message-ID: <1573439402-16249-2-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1573439402-16249-1-git-send-email-eason.yen@mediatek.com>
References: <1573439402-16249-1-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_183046_992465_8F6453AB 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 Eason Yen <eason.yen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Add a header file to provide SIP interface to ATF
for clients, please define MTK_SIP_XXX  with specific ID

2. Add AUDIO SMC fid
mtk sip call example:
arm_smccc_smc(MTK_SIP_AUDIO_CONTROL,
              MTK_AUDIO_SMC_OP_DRAM_REQUEST,
              0, 0, 0, 0, 0, 0, &res)

Signed-off-by: Eason Yen <eason.yen@mediatek.com>
---
 include/linux/soc/mediatek/mtk_sip_svc.h |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
new file mode 100644
index 0000000..00ee0f4
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __MTK_SIP_SVC_H__
+#define __MTK_SIP_SVC_H__
+
+#include <linux/kernel.h>
+
+/* Error Code */
+#define SIP_SVC_E_SUCCESS               0
+#define SIP_SVC_E_NOT_SUPPORTED         -1
+#define SIP_SVC_E_INVALID_PARAMS        -2
+#define SIP_SVC_E_INVALID_Range         -3
+#define SIP_SVC_E_PERMISSION_DENY       -4
+
+#ifdef CONFIG_ARM64
+#define MTK_SIP_SMC_AARCH_BIT			0x40000000
+#else
+#define MTK_SIP_SMC_AARCH_BIT			0x00000000
+#endif
+
+/* AUDIO related SMC call */
+#define MTK_SIP_AUDIO_CONTROL \
+	(0x82000517 | MTK_SIP_SMC_AARCH_BIT)
+#endif
+/* __MTK_SIP_SVC_H__ */
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
