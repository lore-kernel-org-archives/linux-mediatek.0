Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9ECC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 07:59:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DFED233CF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 07:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DFED233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=msuCZ7xsqdIySU/DftD9+AZ9UOrbbVNSUHWpcB7h0aA=; b=P37eI7Suywx0mcIVX45OCcSjY
	Tm4eY0hjlMvQcsgyJlbA7Dh0HFPelo26TpS1YKtOZkEG6BdC3WvN8+KA1Dx5HTjZhOPYpiBlnk9G+
	nQF2C6htzTwOKOyaMeC7iZeRVJ6Rjo9XeW81LBDQB2g9/ThgsupvmOxoRTam7CfCUOZjiVMP+kVU5
	MQwjhBtj454pjNw3PY/pC3XbfOEBZiw4rvYbsANEyW2jBhVh0UlGWqS8DvTLjud6OgA7AVtE2k3AU
	KxXfhzZ8Gm78lcG9ri6ZgLeoitnZkENP+7nDF9wLZDmPMRjNXQSLCOG2hbQmNF1xVQaeUVk54rtiZ
	JlL5qm2YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmg8-00076C-HD; Fri, 08 Jan 2021 07:59:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmfS-0006j8-Bw; Fri, 08 Jan 2021 07:58:44 +0000
X-UUID: 3a4302db0b7d455e9b0f8d8fbd1b0296-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4vpxDTPXX6q2UEwuO1yZgBFVRkQlLXlm1hbek2jxC60=; 
 b=f9LwGOsarnDeKj71SOsgg/YSe0tSNR6ElVsnrrxEptMZv75o8KY5lySToe6zlYncT+fCXoquaS4AwJJUQqCwibvP759Zudi7GTZrnJu/EQLLmt61Zft+AUrriP+gagd+6nZhpc3AHf2eyASMz3kq0ecWD6X0Fbk1lkmucB78nw8=;
X-UUID: 3a4302db0b7d455e9b0f8d8fbd1b0296-20210107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850394553; Thu, 07 Jan 2021 23:58:36 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 23:48:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 15:48:20 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Jan 2021 15:48:20 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V7 08/13] dt-bindings: interconnect: add MT6873 interconnect
 dt-bindings
Date: Fri, 8 Jan 2021 15:48:10 +0800
Message-ID: <1610092095-5113-9-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
References: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B1DF9DBDD549F125D6B2394143AEE8EE4E2198D41E08187442E2BD806D80FC62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_025842_639872_FC0277AF 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add interconnect provider dt-bindings for MT6873.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 include/dt-bindings/interconnect/mtk,mt6873-emi.h | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h

diff --git a/include/dt-bindings/interconnect/mtk,mt6873-emi.h b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
new file mode 100644
index 0000000..0b20011
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
+#define __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
+
+#define MT6873_SLAVE_DDR_EMI		0
+#define MT6873_MASTER_MCUSYS		1
+#define MT6873_MASTER_GPUSYS		2
+#define MT6873_MASTER_MMSYS		3
+#define MT6873_MASTER_MM_VPU		4
+#define MT6873_MASTER_MM_DISP		5
+#define MT6873_MASTER_MM_VDEC		6
+#define MT6873_MASTER_MM_VENC		7
+#define MT6873_MASTER_MM_CAM		8
+#define MT6873_MASTER_MM_IMG		9
+#define MT6873_MASTER_MM_MDP		10
+#define MT6873_MASTER_VPUSYS		11
+#define MT6873_MASTER_VPU_0		12
+#define MT6873_MASTER_VPU_1		13
+#define MT6873_MASTER_MDLASYS		14
+#define MT6873_MASTER_MDLA_0		15
+#define MT6873_MASTER_UFS		16
+#define MT6873_MASTER_PCIE		17
+#define MT6873_MASTER_USB		18
+#define MT6873_MASTER_DBGIF		19
+#define MT6873_SLAVE_HRT_DDR_EMI	20
+#define MT6873_MASTER_HRT_MMSYS		21
+#define MT6873_MASTER_HRT_MM_DISP	22
+#define MT6873_MASTER_HRT_MM_VDEC	23
+#define MT6873_MASTER_HRT_MM_VENC	24
+#define MT6873_MASTER_HRT_MM_CAM	25
+#define MT6873_MASTER_HRT_MM_IMG	26
+#define MT6873_MASTER_HRT_MM_MDP	27
+#define MT6873_MASTER_HRT_DBGIF		28
+#define MT6873_MASTER_WIFI		29
+#define MT6873_MASTER_BT		30
+#define MT6873_MASTER_NETSYS		31
+#endif
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
