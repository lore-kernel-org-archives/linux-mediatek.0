Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE76CC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54804208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uaQh6quE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p0T8VV3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54804208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k10HuW7WTCQ/ig3IdsZDtQMLD9D/UVVEXLkzzQFylLQ=; b=uaQh6quEarfKOt69B99C8M7VL
	49CqEDKQXMI7axCAYuCNyebVreunMOZMsvfF79mJJKHN+RSx4YlY9VApze3CkZydZceFvvqaY+FPi
	KuxkYtFd5NjoH66Q7VeWxbW9PK4tiVwqqeSswI0zwOMlNl3Wt/P/RyTu0QQkdDdkuWGnpXfIoS0iU
	8Kqgo1DVCtd0a4LcBPh/lEaslAoeR24hGTxq20lNzV2yRE6CFfMkMofMwzzvBHMqf/ObvNKtLkk+s
	nl6Q3OMXxD5Mc10Lsahb+83JFv+byW+O71hJrX82Z1TK8rrZAisc9nAxLAE0XpOdv1zN5zpx/m+2R
	+GDqsAXCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHevB-0003Nm-QA; Mon, 14 Sep 2020 03:12:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHeuV-00033n-9P; Mon, 14 Sep 2020 03:12:09 +0000
X-UUID: a87e896c218342f6b9d1b879e32492b2-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kaQ/SpH1F4HrcCCuPU4wh+Rei5ZPnfkbghkqnxqa45g=; 
 b=p0T8VV3+BCWEAgg9hxsg+vbpdxKmwn1AnI90OoALErEFkW4wgyGYsKVY95JX1ugjEKN0sEoSAW3dorLWdnLbdkyT0XGufl0R/tsu4Bjz2fLam2J1Osz8+I97dJo7iq1qpb5FlAX802Xp+cIUN6xikT53GSKFjVpMDUdG5nfk8Dc=;
X-UUID: a87e896c218342f6b9d1b879e32492b2-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 607756583; Sun, 13 Sep 2020 19:11:53 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 20:04:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 11:04:50 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 11:04:49 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V5 10/17] dt-bindings: interconnect: add MT6873 interconnect
 dt-bindings
Date: Mon, 14 Sep 2020 11:04:37 +0800
Message-ID: <1600052684-21198-11-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F60D75705FACF5A5A949F675B18DAD3224C96443ABB84D1AB01ACB8AB0630B8D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_231207_510454_4B1E10EE 
X-CRM114-Status: GOOD (  13.47  )
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
 Mike
 Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 "henryc.chen" <henryc.chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "henryc.chen" <henryc.chen@mediatek.com>

Add interconnect provider dt-bindings for MT6873.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 include/dt-bindings/interconnect/mtk,mt6873-emi.h | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h

diff --git a/include/dt-bindings/interconnect/mtk,mt6873-emi.h b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
new file mode 100644
index 0000000..25ffba8
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
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
