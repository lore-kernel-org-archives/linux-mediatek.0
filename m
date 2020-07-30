Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAFAC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 10:32:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46DE02075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 10:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/QCpF8d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AnCLwfNR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46DE02075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2kfEzUP5duO6/YxCSowHcqXEzcdYzhuD/LVLI4201Y=; b=M/QCpF8d1JAXTmzXptnnsReYU
	nWNOeutedR5y9V+RD3+FzEuxP5bBJ45gKdWGHHcv7bX/vHUpWHeHparsRurF2IJe7Sk02Pubypy5p
	b+Ust/dBtz7tNnXuK1OyJ9cQOey2XFIV0bPtq2gSN95EiyYUtMOX5fQ8q/ubktwTj54XNJLTu01l4
	BVDtWgm/JA4/X8rhD5SYPXra9JBwkmXb0sCbVRWKYeD9ETC0/8bLB35tuIr39hMVw8g0GYvHvPQ2P
	EH6XCOCQyyDwGtWRrNPTQ7WfJZw8ioYSl7boaPPKByamPAxANTE3A1AKz579L9a3pZHvv7geoEYAn
	RpIqWITDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k15rg-0006be-Vi; Thu, 30 Jul 2020 10:32:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k15rV-0006VJ-J4; Thu, 30 Jul 2020 10:32:34 +0000
X-UUID: f702c5c4ec4f4e1b97af1815dd6073fc-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=650NVCPZG1KcydX0hTrnKCdiU0nIw3CgigzQoQXdQQk=; 
 b=AnCLwfNRoY0Za/crMZD+KmDbN9m1OhpBK3T4QnCwpTA+Fz6xaizLnA8+Bsri4uF3GYNldQEECciG96dspMNWxteHicn2/O+UikznD446kZTC1aOWaHhyo3cENUvchTpwDeFmYBPKVuUM/nCwDrGjO5z9AFNxZ07AcWHbZkKJLmY=;
X-UUID: f702c5c4ec4f4e1b97af1815dd6073fc-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1286841993; Thu, 30 Jul 2020 02:31:52 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 03:22:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:19 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v3,4/5] dt-binding: mt8192: add toprgu reset-controller head file
Date: Thu, 30 Jul 2020 18:21:49 +0800
Message-ID: <1596104510-11113-5-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_063233_808261_C8155EA9 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add toprgu reset-controller head file for MT8192 platform

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h

diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset-controller/mt8192-resets.h
new file mode 100644
index 0000000..84fee34
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mt8192-resets.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Yong Liang <yong.liang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8192
+
+#define MT8183_TOPRGU_MM_SW_RST					1
+#define MT8183_TOPRGU_MFG_SW_RST				2
+#define MT8183_TOPRGU_VENC_SW_RST				3
+#define MT8183_TOPRGU_VDEC_SW_RST				4
+#define MT8183_TOPRGU_IMG_SW_RST				5
+#define MT8183_TOPRGU_MD_SW_RST					7
+#define MT8183_TOPRGU_CONN_SW_RST				9
+#define MT8183_TOPRGU_CONN_MCU_SW_RST			12
+#define MT8183_TOPRGU_IPU0_SW_RST				14
+#define MT8183_TOPRGU_IPU1_SW_RST				15
+#define MT8183_TOPRGU_AUDIO_SW_RST				17
+#define MT8183_TOPRGU_CAMSYS_SW_RST				18
+#define MT8192_TOPRGU_MJC_SW_RST				19
+#define MT8192_TOPRGU_C2K_S2_SW_RST				20
+#define MT8192_TOPRGU_C2K_SW_RST				21
+#define MT8192_TOPRGU_PERI_SW_RST				22
+#define MT8192_TOPRGU_PERI_AO_SW_RST			23
+
+#define MT8192_TOPRGU_SW_RST_NUM				23
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
