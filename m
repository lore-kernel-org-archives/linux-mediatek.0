Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E876CC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE7F206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QILZ7lua";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YbhwXwZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE7F206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyVUzRmE0KEsj9W+LSzz1qdhV/vv0FGR3WIvV9/irUM=; b=QILZ7luak7WxRAK7UOYeHP6CI
	sZSUOPuhTRnaz3X/9qTN7OMzqR9Nk1lIvUC43wPNOGcjwdLDtAM6Ah5Yj2IZtIANBW3h0yafTIAi7
	jKDrpbR94WagzOny7Q4W2Zz8z0LwHlVxXGfYHU3kxJVzTAFfTavPJ3fdUPKkhx0UJja0aRITNqgAA
	DT13mIPr2yz5SQcqzwpJwTW2suqU/Vz2FB9UVAHsSYVzzXJK44HK3NgvX97Gatkm3bTCoyWeM+3of
	7wtD2HQQ8v+QWII1jOgcovecFla60reP8kqrnsF4fnxvcgfJbN0QmruMDWekwTcCxpl8ku+nwE767
	AscVTeEUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5TI-0002zE-0n; Fri, 04 Sep 2020 06:45:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5TA-0002w6-41; Fri, 04 Sep 2020 06:45:09 +0000
X-UUID: bfdaaf29710a40f1b4137c0ef85356c5-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VwEG62ZinjOJQ7i1HuY68zs84FT+XWmhinFNtU9FoFA=; 
 b=YbhwXwZIoYCv4OP/DO+TLU0jrqnJ6PKPDBFufzjicStRLyQFtjBOINnTdg56gOXxAm9x2iqUsYXtMIYcBvHFh+8AR/GSQjXMBietr2VwTcow2O0RVdt3MSMrkdLocWmvtXwchMar4O2VGaPrZTHykSMTHe1AEhCuP35C+mPLVwo=;
X-UUID: bfdaaf29710a40f1b4137c0ef85356c5-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 957980267; Thu, 03 Sep 2020 22:44:59 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 23:44:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 14:44:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 14:44:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH 1/3] dt-bindings: soc: Add MT8192 power dt-bindings
Date: Fri, 4 Sep 2020 14:44:53 +0800
Message-ID: <1599201895-11013-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_024508_307342_6C3AD229 
X-CRM114-Status: GOOD (  15.16  )
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

Add power dt-bindings of MT8192

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  5 ++++
 include/dt-bindings/power/mt8192-power.h           | 32 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8192-power.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index efe2025..7f322f9 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -16,6 +16,7 @@ power/power-domain.yaml. It provides the power domains defined in
 - include/dt-bindings/power/mt2712-power.h
 - include/dt-bindings/power/mt7622-power.h
 - include/dt-bindings/power/mt8183-power.h
+- include/dt-bindings/power/mt8192-power.h
 
 Required properties for power controller:
 - compatible: Should be one of:
@@ -29,6 +30,7 @@ Required properties for power controller:
 	- "mediatek,mt7629-scpsys", "mediatek,mt7622-scpsys": For MT7629 SoC
 	- "mediatek,mt8173-scpsys"
 	- "mediatek,mt8183-scpsys"
+	- "mediatek,mt8192-scpsys"
 - #power-domain-cells: Must be 1
 - #address-cells: Should be 1
 - #size-cells: Should be 0
@@ -50,6 +52,9 @@ Required properties for power controller:
 	Required clocks for MT8183: "audio", "audio1", "audio2", "mfg", "mm",
 				    "cam", "isp", "vpu", "vpu1", "vpu2",
 				    "vpu3";
+	Required clocks for MT8192: "audio", "audio1", "audio2", "conn", "mfg",
+				    "disp", "disp1", "ipe", "isp", "isp1",
+				    "mdp", "venc", "vdec", "cam"
 
 Optional properties for power controller:
 - vdec-supply: Power supply for the vdec power domain
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
