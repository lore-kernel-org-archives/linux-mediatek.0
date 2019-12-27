Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0899EC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 14:15:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD135208C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 14:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Phz2D/Rf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gDbh3tPm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD135208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cRWhvqiI2xpVN5R6ADgzzBwKdODGODpX2vuuTD65e4=; b=Phz2D/Rf1ZL80Q
	62j9VajMa38rnQU/kGw1x2Cn5x1f2QicbBZM3ZsyB+zJIUTDWGdRUFGU3z6EmLE9r1d99w0YpieLX
	AX4MpK0a0BdpEDd1ahyY3f9+mubjHcdEg9fHnllDrBe312cTuS39KbbiYdSbv9i2NS1yTGwg2kFNL
	R+kcwOXAd8c2u268xSmtQPuARm9IBWTDpLthAil8IaHb39GIXM4bzN/kIWyH3MkfLj9pFaJrPV6E3
	oLMsnuGUkOaFiUMLdxZBsTmAvATfXvbu/xxvpVVRnMn0sU1QnKygpNmBm7a6KyOdaakhu9z8zMWCV
	clKup1N9rNjD4Cpx3S3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikqP1-0005sf-0T; Fri, 27 Dec 2019 14:15:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikqOb-0005Pq-CM; Fri, 27 Dec 2019 14:15:22 +0000
X-UUID: 360037144ae2426eae6e50c7f0242fbe-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hYdZmAwLVCeFCpsriUEzZ1+MZbETmTkKJGq6zQc2fQk=; 
 b=gDbh3tPm36xfb7X++BSSaZSTHXTjctuxdOagaU310uA6V8yRgqqVQDvCEyRKsgpB8cdnXLcbaLQYw1m7P4MCx3I9FWxhqTVLpbz8IoXh0hvZYKeGTX3l0pB5zF2axxkSgRHTfVBpKAkPfEmv02f9zPELypvjyBx/AJu4WcGQIoA=;
X-UUID: 360037144ae2426eae6e50c7f0242fbe-20191227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 563276248; Fri, 27 Dec 2019 06:15:14 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 06:15:22 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 22:14:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Dec 2019 22:15:24 +0800
From: Yong Liang <yong.liang@mediatek.com>
To: <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>
Subject: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
Date: Fri, 27 Dec 2019 22:14:04 +0800
Message-ID: <20191227141405.3396-2-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191227141405.3396-1-yong.liang@mediatek.com>
References: <20191227141405.3396-1-yong.liang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 65573B1BF2CA74CE9D4CBFF7A61812BFA2E2A57D9D751D313324137F0D19EB7B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_061517_490414_6DE320A4 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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
Cc: "yong.liang" <yong.liang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

1. Include mt8183-reset.h and add reset-cells in infracfg
in dtsi file
2. Add watchdog device node

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 10b32471bc7b..c86f5684d502 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset-controller/mt8183-resets.h>
 #include "mt8183-pinfunc.h"
 
 / {
@@ -227,6 +228,7 @@
 			compatible = "mediatek,mt8183-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		pio: pinctrl@10005000 {
@@ -253,6 +255,12 @@
 			#interrupt-cells = <2>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8183-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+		};
+
 		apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8183-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
