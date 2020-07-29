Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD340C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:08:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B362074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u1b8hnu4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IkQRjfE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B362074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FI7kNWifBpWjrFYeVFeTWASM6UGJPh+yyvzY1TrWac8=; b=u1b8hnu4DvKOS70KV04gfbWyV
	y3f6vCFjk/A5agUhN8qMkoMVx06FWj7fkX5vZB5kG97D2WVxtkfSmRxDM/PzKzYkuo7TQgQ0+A9Pd
	jI4QdLKqZFXeYgDpp5kaWGY/NFr8Xl9+Gi94uubJ7yP0EKhe+DMEwFUzMHOoGZzv44vC9hg7RAM0Y
	x5fvT0/fV/HoSfibyu23mFZgAZQ1OnsT6BIJHylktMfbe3SwPBQ+f+4q37u5qM+U36pIEoL5II93z
	qY3KN8/HNdCZ0AACFtx32hGG+KrizZ2aOOwTZrb9COTLV35b2uPdlXZntkwqeus+MTxhpsBYXeNJp
	LdHvciG0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0j08-0006Hi-Vm; Wed, 29 Jul 2020 10:07:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0izt-0006Bu-TW; Wed, 29 Jul 2020 10:07:42 +0000
X-UUID: 8e9c11d39965412ba45db096cf405f6e-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Rx7lqPlUO6eBPjJnE7Gk7n6FgLIwydc+DSCMweEF+uU=; 
 b=IkQRjfE4wG81gNGpInR317/ecy/fIJoYDw4amI2n36KGY18PvAw2ZHlPxDBbhItL1w1G6Mo3987Y3KrXbwviK0iAIwpz5dhDybppj4uOyuKkHHU9i9q8SdHD6udpk69RdvzgYHj9kSqO0FkzSMp2XUG5d0O8Ffwct2/sYVGHsZ0=;
X-UUID: 8e9c11d39965412ba45db096cf405f6e-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 505612035; Wed, 29 Jul 2020 02:07:30 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 03:02:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:28 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,2/3] dt-binding: mt8192: add toprgu reset-controller head file
Date: Wed, 29 Jul 2020 18:02:01 +0800
Message-ID: <1596016922-13184-3-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_060742_101324_0F8D00D1 
X-CRM114-Status: GOOD (  13.32  )
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
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add toprgu reset-controller head file for MT8192 platform

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h

diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset-controller/mt8192-resets.h
new file mode 100644
index 0000000..be9a7ca
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
+#define MT8192_TOPRGU_MM_SW_RST					1
+#define MT8192_TOPRGU_MFG_SW_RST				2
+#define MT8192_TOPRGU_VENC_SW_RST				3
+#define MT8192_TOPRGU_VDEC_SW_RST				4
+#define MT8192_TOPRGU_IMG_SW_RST				5
+#define MT8192_TOPRGU_MD_SW_RST					7
+#define MT8192_TOPRGU_CONN_SW_RST				9
+#define MT8192_TOPRGU_CONN_MCU_SW_RST			12
+#define MT8192_TOPRGU_IPU0_SW_RST				14
+#define MT8192_TOPRGU_IPU1_SW_RST				15
+#define MT8192_TOPRGU_AUDIO_SW_RST				17
+#define MT8192_TOPRGU_CAMSYS_SW_RST				18
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
