Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD2AC433E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:19:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF33F22AAA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF33F22AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i21vJ4o0F5ARmKO3CkjaoGPjGPqa/x5dgGvbsaugy9M=; b=1L7Z9g50TiSUPLF/26v/yjU//
	xLsTPcsNu3D47SXRPmuA4+toBo3ter7ErPPMqNrTvP7dZrd/ALI+HC3APuJayunK+ob1+qg72eMTN
	xYxMxnEfhZAUtP9Pa9Is7zKdUAG1GfOtPkrs7Ie4vgSRxYNR7ntF6Srf4bFIFVkw8Zrnltxax517T
	lVemgLYcbE54roJI7PRZC64BPChHiwBchDvffBGpNQkUtbIcMfUYrSTBaP8UW7vCEnh4Z2iMsWD4+
	JNKQuYNdu3L3JejjvrRyriRNPxsmldJcFKHX0Cicn0U6MGmaeHI19lXQkGcvkk5z7kyLE5/vk/21l
	r9tNH3JMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksJy0-0007nS-85; Thu, 24 Dec 2020 06:19:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksJxo-0007hx-7b; Thu, 24 Dec 2020 06:19:05 +0000
X-UUID: 55ad68682bd44d649653a180c171fb2b-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L2XTkuXgMPHui2e+nAhmdP0VDMX8BFemr2I5TNkJozE=; 
 b=IaNZJlobWzNu2Z0A/OQ/mW3cxDUFpF5BXG2PzCGscEY4CfRRE6gv8+IC4DnlGo18bWf2Sxlku7ndNc+9p+h2rdWg5mgZ4qlKYW0BIOLR3hXPnqe2AS66Z0MURLWFWa9hI4IjBtAzvdAxpBUzYjmRZaQeTsKOT+zw4+X9lT/yRtg=;
X-UUID: 55ad68682bd44d649653a180c171fb2b-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 344669672; Wed, 23 Dec 2020 22:19:01 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 22:08:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 14:08:57 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Dec 2020 14:08:58 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V6 10/13] arm64: dts: mt8192: add dvfsrc related nodes
Date: Thu, 24 Dec 2020 14:08:51 +0800
Message-ID: <1608790134-27425-11-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6FFDD4BFC80FB18CF54DF20D345E004F93C24AAE235E790A5E68AA87B980C2322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_011904_407564_1EA95862 
X-CRM114-Status: GOOD (  12.69  )
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

Add DDR EMI provider dictating dram interconnect bus performance found on
MT8192-based platforms

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 1e5d506..14c521d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+#include <dt-bindings/interconnect/mtk,mt6873-emi.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -266,6 +267,7 @@
 		ddr_emi: dvfsrc@10012000 {
 			compatible = "mediatek,mt8192-dvfsrc";
 			reg = <0 0x10012000 0 0x1000>;
+			#interconnect-cells = <1>;
 		};
 
 		systimer: timer@10017000 {
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
