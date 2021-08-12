Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D673C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC93360FC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC93360FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMLS4LbT7zlbtJh9WDoL4RhwfOuLo4mDlDo6PXTj3zU=; b=n02ce7rlltAWz2
	qzdHCfK22Fjjwfu4hI/CcmYdchlnzmnIRqNYtvZX7FS7dzlaGSWmKWgtGZxfhYOTp9oiZArCtxQAI
	opywQ7wzBaj4y4l8v0K+IRm/0M91Hjd4F6oFN0pHqTDipIbM2jkIJQst73Ctm/oQNYugJOXpHcLm1
	DSIc3QKr5ToJPRNtj6mElGMjUdKAXc0DWBpRpy2EvUXmD+GXztt4+WRWykgEILMbJkLh5TAYqZwxL
	RDhi1CxLih9lNeujsvIZ/obKpx2uW+zcnP3j7rD2fYAiy6S0YE/AJOQmqWuF0xVHDVk/lyK77W+hK
	cbPRekfffzFwvzUKvP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE6pK-009Mte-CJ; Thu, 12 Aug 2021 09:16:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE6jM-009KLT-3T; Thu, 12 Aug 2021 09:10:32 +0000
X-UUID: b332d8fd386d4899837583e2b93e75dd-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=O3er2CQR6Id8+1EMLQvRKgMyOzMLqloI0I4CFNz0h8A=; 
 b=RWyMWW7W1Y9tqqKpYOXhtVIUQBzk6fHNLQmIwDigEi1mX0/uRIC2jm+1g/7zDlgfA3D7Oc3qvyXQ3aMZb8RXDLi4BQwUXKMWcQ6zXwRtig/p+JXPyCNwYop/jZ/SK4LMJckEgOYmKhq6NxRIXbgp4XkLZdwXnE1qUNgPjjFzvCs=;
X-UUID: b332d8fd386d4899837583e2b93e75dd-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1851719344; Thu, 12 Aug 2021 02:10:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 02:00:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 17:00:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 Aug 2021 17:00:23 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Dawei Chien
 <dawei.chien@mediatek.com>
Subject: [V11, PATCH 11/19] dt-bindings: interconnect: add MT8195 interconnect
 dt-bindings
Date: Thu, 12 Aug 2021 16:58:38 +0800
Message-ID: <20210812085846.2628-12-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210812085846.2628-1-dawei.chien@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_021028_211946_C6765150 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add interconnect provider dt-bindings for MT8195

Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
---
 include/dt-bindings/interconnect/mtk,mt8195-emi.h | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/mtk,mt8195-emi.h

diff --git a/include/dt-bindings/interconnect/mtk,mt8195-emi.h b/include/dt-bindings/interconnect/mtk,mt8195-emi.h
new file mode 100644
index 000000000000..c7e8b805f8bd
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt8195-emi.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT8195_EMI_H
+#define __DT_BINDINGS_INTERCONNECT_MTK_MT8195_EMI_H
+
+#define MT8195_SLAVE_DDR_EMI		0
+#define MT8195_MASTER_MCUSYS		1
+#define MT8195_MASTER_GPUSYS		2
+#define MT8195_MASTER_MMSYS		3
+#define MT8195_MASTER_MM_VPU		4
+#define MT8195_MASTER_MM_DISP		5
+#define MT8195_MASTER_MM_VDEC		6
+#define MT8195_MASTER_MM_VENC		7
+#define MT8195_MASTER_MM_CAM		8
+#define MT8195_MASTER_MM_IMG		9
+#define MT8195_MASTER_MM_MDP		10
+#define MT8195_MASTER_VPUSYS		11
+#define MT8195_MASTER_VPU_0		12
+#define MT8195_MASTER_VPU_1		13
+#define MT8195_MASTER_MDLASYS		14
+#define MT8195_MASTER_MDLA_0		15
+#define MT8195_MASTER_UFS		16
+#define MT8195_MASTER_PCIE_0		17
+#define MT8195_MASTER_PCIE_1		18
+#define MT8195_MASTER_USB		19
+#define MT8195_MASTER_DBGIF		20
+#define MT8195_SLAVE_HRT_DDR_EMI	21
+#define MT8195_MASTER_HRT_MMSYS		22
+#define MT8195_MASTER_HRT_MM_DISP	23
+#define MT8195_MASTER_HRT_MM_VDEC	24
+#define MT8195_MASTER_HRT_MM_VENC	25
+#define MT8195_MASTER_HRT_MM_CAM	26
+#define MT8195_MASTER_HRT_MM_IMG	27
+#define MT8195_MASTER_HRT_MM_MDP	28
+#define MT8195_MASTER_HRT_DBGIF		29
+#define MT8195_MASTER_WIFI		30
+#define MT8195_MASTER_BT		31
+#define MT8195_MASTER_NETSYS		32
+#endif
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
