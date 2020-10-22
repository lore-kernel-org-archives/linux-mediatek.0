Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93221C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:51:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03E2223FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PrLEQBLk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XkLPqel5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03E2223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Df0H7PG/ypc4yxovr/piUwQ/W8K7ETDyIWCZb8WTmg=; b=PrLEQBLkBhKuE8zkYRjtriMEi
	UcmJm+w5l/IykHoCSpIS8cxDICzvxJ9Pzz/SZAB5sfxabMuSuQ8uAln6Aq2lRz1o0Lc5yBkLpMdDc
	ycbYJXZ6YNl6iRYWc14vYPgHZeV6TAoC9C+kyxp2QOROpMBsBPqKu6R48cGaJxbN2AdnuHstaM9XC
	CEgDga5fnPHjyhTPFQEkKSgOGgIvxjWc78Yrd8Cg0FgUI0zyTdkVNLvRv6SYDPhrvKMFbYImYmcCc
	ywdBmg7/mvEepX77Squ9PuMl/L1xKWd9K/8jeF7W1zAVsFTiKifGq3+2Dcb6oxt7kWc2L15LmLArF
	TubWZMsXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa3Q-0008Li-6O; Thu, 22 Oct 2020 12:50:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0h-0007BO-KY; Thu, 22 Oct 2020 12:48:07 +0000
X-UUID: d4b78a5c01984f95b56ac61f5c0a12ae-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tnNBLT8QS4sxWquOIKDNtO9WwSSmSHSH00fYNlT7kkA=; 
 b=XkLPqel506M67stAiB0gRYbZ8ULPAy9HlDal0ZfjN8H2sslwkbeMCZBuAte0kq2c15xYxF0ZpjVPfFIhK+DFg5qVkEgZXkBD+CskddLN+jvUaZTQzSI58Uc8s2My417vVGwHI2tSFPbBZpVA2OeUZSg0qiCi1T6Mg9zNgGvA8EU=;
X-UUID: d4b78a5c01984f95b56ac61f5c0a12ae-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2024121380; Thu, 22 Oct 2020 04:47:57 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:47:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:47:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:47:39 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: power: Add MT8192 power domains
Date: Thu, 22 Oct 2020 20:47:34 +0800
Message-ID: <1603370857-30646-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084803_852655_2462A27E 
X-CRM114-Status: GOOD (  14.95  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domains dt-bindings for MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../bindings/power/mediatek,power-controller.yaml  |  1 +
 include/dt-bindings/power/mt8192-power.h           | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8192-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 67a15f2..1ebed79 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -25,6 +25,7 @@ properties:
     enum:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
+      - mediatek,mt8192-power-controller
 
   '#power-domain-cells':
     const: 1
diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
new file mode 100644
index 0000000..4eaa53d
--- /dev/null
+++ b/include/dt-bindings/power/mt8192-power.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Weiyi Lu <weiyi.lu@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8192_POWER_H
+#define _DT_BINDINGS_POWER_MT8192_POWER_H
+
+#define MT8192_POWER_DOMAIN_AUDIO	0
+#define MT8192_POWER_DOMAIN_CONN	1
+#define MT8192_POWER_DOMAIN_MFG0	2
+#define MT8192_POWER_DOMAIN_MFG1	3
+#define MT8192_POWER_DOMAIN_MFG2	4
+#define MT8192_POWER_DOMAIN_MFG3	5
+#define MT8192_POWER_DOMAIN_MFG4	6
+#define MT8192_POWER_DOMAIN_MFG5	7
+#define MT8192_POWER_DOMAIN_MFG6	8
+#define MT8192_POWER_DOMAIN_DISP	9
+#define MT8192_POWER_DOMAIN_IPE		10
+#define MT8192_POWER_DOMAIN_ISP		11
+#define MT8192_POWER_DOMAIN_ISP2	12
+#define MT8192_POWER_DOMAIN_MDP		13
+#define MT8192_POWER_DOMAIN_VENC	14
+#define MT8192_POWER_DOMAIN_VDEC	15
+#define MT8192_POWER_DOMAIN_VDEC2	16
+#define MT8192_POWER_DOMAIN_CAM		17
+#define MT8192_POWER_DOMAIN_CAM_RAWA	18
+#define MT8192_POWER_DOMAIN_CAM_RAWB	19
+#define MT8192_POWER_DOMAIN_CAM_RAWC	20
+
+#endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
