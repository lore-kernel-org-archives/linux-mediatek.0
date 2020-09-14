Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72458C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1537C208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rUevnFnI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZOzbFPPo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1537C208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iMiEw4wNeQ0EO//9UyJQQ0yzt/RWYWmjn9gZq1cyBb0=; b=rUevnFnIQqNikX/lAmHAcE+Qu
	1XYdLLStjt6oLarZdGV22MdvxG/uq92/YIFaH5/4Ph0L2qIhtFiFCm99iJY5b+1+JXbJUrwunjwo/
	ZVuuQyZf7aReRlcVsUdwCV8wqQdpwm70dqyriZpNys7l+tM6KxP6y877UrjVvCBW6cIrtJsgsxIfD
	GSsEWnY13hIcPR1Zi2yqq7yNKg8ysld9vO0ZpW1y6T344P+9QXnDfFmHk+pRsGUynO4bxjN7JgfWj
	Lf12Je91o+UJEgnLnymEM2etQMa1DMzFey2EVhqHfpbCnM+JBTb99OxJYjx62O2LmZE+IaAC1AE4q
	cdcSgEsjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHev4-0003Jh-Fh; Mon, 14 Sep 2020 03:12:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHeuS-00033n-4h; Mon, 14 Sep 2020 03:12:06 +0000
X-UUID: c8f7833ecbcf461bae94683ced183b24-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3iNwgFEYsqQE0ecY/uJhBDR4AFw1KMuDJ1lQlv3adck=; 
 b=ZOzbFPPoqL6S4Cqitk1iSNCE9eclkAHUzEcY1KFU6NcDnkbw3uhsZ2oYEFzcihWxFtECalBg+W+ZH0dfgbk0vqEsBUsO5B4bE3YyqzmPKZTPu8h5HWObrdIYDRn9EM6X+A7Rujy2H/vGrfEry4iBh0hkMgUveZX5qBETuR7khL8=;
X-UUID: c8f7833ecbcf461bae94683ced183b24-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555245945; Sun, 13 Sep 2020 19:11:53 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 20:04:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 11:04:48 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 11:04:47 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V5 01/17] dt-bindings: soc: Add dvfsrc driver bindings
Date: Mon, 14 Sep 2020 11:04:28 +0800
Message-ID: <1600052684-21198-2-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2BBBC37BC1269D0C0C35EF6A095D4F2182244D1975B471AD2F58AE758DEEED542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_231204_422559_A49C7ED3 
X-CRM114-Status: GOOD (  17.55  )
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
 Henry Chen <henryc.chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the binding for enabling dvfsrc on MediaTek SoC.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/mediatek/dvfsrc.txt    | 25 ++++++++++++++++++++++
 include/dt-bindings/soc/mtk,dvfsrc.h               | 14 ++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
 create mode 100644 include/dt-bindings/soc/mtk,dvfsrc.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
new file mode 100644
index 0000000..d5a47d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
@@ -0,0 +1,25 @@
+MediaTek DVFSRC
+
+The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
+HW module which is used to collect all the requests from both software and
+hardware and turn into the decision of minimum operating voltage and minimum
+DRAM frequency to fulfill those requests.
+
+Required Properties:
+- compatible: Should be one of the following
+	- "mediatek,mt6873-dvfsrc": For MT6873 SoC
+	- "mediatek,mt8183-dvfsrc": For MT8183 SoC
+	- "mediatek,mt8192-dvfsrc": For MT8192 SoC
+- reg: Address range of the DVFSRC unit
+- clock-names: Must include the following entries:
+	"dvfsrc": DVFSRC module clock
+- clocks: Must contain an entry for each entry in clock-names.
+
+Example:
+
+	dvfsrc@10012000 {
+		compatible = "mediatek,mt8183-dvfsrc";
+		reg = <0 0x10012000 0 0x1000>;
+		clocks = <&infracfg CLK_INFRA_DVFSRC>;
+		clock-names = "dvfsrc";
+	};
diff --git a/include/dt-bindings/soc/mtk,dvfsrc.h b/include/dt-bindings/soc/mtk,dvfsrc.h
new file mode 100644
index 0000000..a522488
--- /dev/null
+++ b/include/dt-bindings/soc/mtk,dvfsrc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MTK_DVFSRC_H
+#define _DT_BINDINGS_POWER_MTK_DVFSRC_H
+
+#define MT8183_DVFSRC_LEVEL_1	1
+#define MT8183_DVFSRC_LEVEL_2	2
+#define MT8183_DVFSRC_LEVEL_3	3
+#define MT8183_DVFSRC_LEVEL_4	4
+
+#endif /* _DT_BINDINGS_POWER_MTK_DVFSRC_H */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
