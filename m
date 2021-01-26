Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBF5C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:05:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0C5206FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0C5206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=msuCZ7xsqdIySU/DftD9+AZ9UOrbbVNSUHWpcB7h0aA=; b=Y+sXZjUnpJ/+767pR51B+ybhN
	xc4VSmG+LI+VbF6cbvQ3OzH7uJ/XJwQojGz4LMuYhD6B6kowaMAAodeVbWCcBFQpKxW5CevJFLg/d
	Ta4zQw+TtRVJGD1ZXePdb/jDm0O/vN7DzjL2FQff59nVl7sgoO2PMhRUDYcR1NLBvew92tz5I0VvA
	FNT22Vo1GGaL+yiIOAZC0my91TTWHmRi9P5eqoqS8XOqxD5ou3uSFK4HrEDyDiOECn/WdjygZIej4
	/0PST6q3wpQmQNIJpu+EmgrRCo1//0cO9kG3XmmYmfM3gpr47aqazf3j6wJi1NcwLZSfz45NBkDN/
	xkxRG0GSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4JLo-0006pN-GF; Tue, 26 Jan 2021 08:05:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4JKb-0006LH-Bh; Tue, 26 Jan 2021 08:04:13 +0000
X-UUID: 5b3fc8800eef447a9d7ea115c499ac87-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4vpxDTPXX6q2UEwuO1yZgBFVRkQlLXlm1hbek2jxC60=; 
 b=BcYxLRbLVN+H1tAUscG6winYwllsXR43hCzIf3iaJOT+42Ye9jNWb7/qqCogevG1qcyP06WWWmsuPDFqekmu8O/UGTyf/ifHmnOnJV99nLepIP15C9DtG6Sz8y6vIz1f3qNtdG4ApWeR5ni8bWyidb2M97zCkL+482fKWpK+BGk=;
X-UUID: 5b3fc8800eef447a9d7ea115c499ac87-20210126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1510894373; Tue, 26 Jan 2021 00:04:00 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 00:03:59 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 16:03:56 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Jan 2021 16:03:57 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Subject: [PATCH V8 07/12] dt-bindings: interconnect: add MT6873 interconnect
 dt-bindings
Date: Tue, 26 Jan 2021 16:03:49 +0800
Message-ID: <1611648234-15043-8-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
References: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 73DF2E5D54282CC118BDD67D4E9631131DF1BF91191992B3490D80BC0D5D61372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_030409_710896_104C42E7 
X-CRM114-Status: GOOD (  12.18  )
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
