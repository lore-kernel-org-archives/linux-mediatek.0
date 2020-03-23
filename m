Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6825C4332E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:16:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A3A216FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nDR3qv7Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iBSVdMlk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A3A216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srIhxshtBGOr0xHtxBuunkqtdDamc/Fu0GuKQYO3kKY=; b=nDR3qv7Y6hx3jq
	Q5Z/SpwLn/PTrfMF2gBwJFi/J+yLlGUWaJnMWCyyxLElc8fouyYbeaCrK/ap541nbZ4i2FXIOxTac
	BIdN3sNoFeIwcyvP0zFFXRivdVhA0VdHD6kZ4/14mfqN8E5vZ5HQfSYhVG7AWUHj+wbwQi2ccQzSd
	DsDAFXP2FuggdJrWnL4b/HERBJ6y1CJaTW7E/XViGqVcp2UYmFGL/ZqenbTtg4MEQd3oUQCGEJhNn
	/dxvnP6eINZpIu4qqxplXOf/rY/gVQJwfDMc59vYrUXTpMZxnZd28PWq8xdwJBHtpLDs9vCQ8FTOt
	pxv+Qt3wWO6H9Osf+JOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGM0K-0007Po-6h; Mon, 23 Mar 2020 12:16:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGLzh-0006oU-6C; Mon, 23 Mar 2020 12:15:50 +0000
X-UUID: 32e858f50b8148efbbc32786bb006e89-20200323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kFXOGIrbZvG1pMcA5nWeAzPVOClsgKfC1+JFMevkUH0=; 
 b=iBSVdMlk8WSou9EekUafwNmqIWJ6Ccnk4GAn23OJCnVcLGaw/TnEMktIiQFfCINSWUmNHCorRR63/PwxnW8M4cqTLGLOUagHeB2SMBt0np0yic0K5wdit5/tZzjyreW7G7rKenHcyU9ovY+m4fA0UI58ZPVdviBIr8YhWUY+bJ8=;
X-UUID: 32e858f50b8148efbbc32786bb006e89-20200323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2046566071; Mon, 23 Mar 2020 04:15:42 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 05:15:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 20:14:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 23 Mar 2020 20:15:37 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui
 <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <michael.kao@mediatek.com>
Subject: [v4,1/7] arm64: dts: mt8183: add thermal zone node
Date: Mon, 23 Mar 2020 20:15:31 +0800
Message-ID: <20200323121537.22697-2-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200323121537.22697-1-michael.kao@mediatek.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_051549_246471_F1D0B258 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "michael.kao" <michael.kao@mediatek.com>

Add thermal zone node to Mediatek MT8183 dts file.

Evaluate the thermal zone every 500ms while not cooling
and every 100ms when passive cooling is performed.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Michael Kao <michael.kao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 433c62efab2d..59f97217aaa8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -638,6 +638,86 @@
 			status = "disabled";
 		};
 
+		thermal: thermal@1100b000 {
+			#thermal-sensor-cells = <1>;
+			compatible = "mediatek,mt8183-thermal";
+			reg = <0 0x1100b000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_THERM>,
+				 <&infracfg CLK_INFRA_AUXADC>;
+			clock-names = "therm", "auxadc";
+			resets = <&infracfg  MT8183_INFRACFG_AO_THERM_SW_RST>;
+			mediatek,auxadc = <&auxadc>;
+			mediatek,apmixedsys = <&apmixedsys>;
+			nvmem-cells = <&thermal_calibration>;
+			nvmem-cell-names = "calibration-data";
+		};
+
+		thermal-zones {
+			cpu_thermal: cpu_thermal {
+				polling-delay-passive = <100>;
+				polling-delay = <500>;
+				thermal-sensors = <&thermal 0>;
+				sustainable-power = <5000>;
+			};
+
+			/* The tzts1 ~ tzts6 don't need to polling */
+			/* The tzts1 ~ tzts6 don't need to thermal throttle */
+
+			tzts1: tzts1 {
+				polling-delay-passive = <0>;
+				polling-delay = <0>;
+				thermal-sensors = <&thermal 1>;
+				sustainable-power = <5000>;
+				trips {};
+				cooling-maps {};
+			};
+
+			tzts2: tzts2 {
+				polling-delay-passive = <0>;
+				polling-delay = <0>;
+				thermal-sensors = <&thermal 2>;
+				sustainable-power = <5000>;
+				trips {};
+				cooling-maps {};
+			};
+
+			tzts3: tzts3 {
+				polling-delay-passive = <0>;
+				polling-delay = <0>;
+				thermal-sensors = <&thermal 3>;
+				sustainable-power = <5000>;
+				trips {};
+				cooling-maps {};
+			};
+
+			tzts4: tzts4 {
+				polling-delay-passive = <0>;
+				polling-delay = <0>;
+				thermal-sensors = <&thermal 4>;
+				sustainable-power = <5000>;
+				trips {};
+				cooling-maps {};
+			};
+
+			tzts5: tzts5 {
+				polling-delay-passive = <0>;
+				polling-delay = <0>;
+				thermal-sensors = <&thermal 5>;
+				sustainable-power = <5000>;
+				trips {};
+				cooling-maps {};
+			};
+
+			tztsABB: tztsABB {
+				polling-delay-passive = <0>;
+				polling-delay = <0>;
+				thermal-sensors = <&thermal 6>;
+				sustainable-power = <5000>;
+				trips {};
+				cooling-maps {};
+			};
+		};
+
 		audiosys: syscon@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
@@ -648,6 +728,10 @@
 			compatible = "mediatek,mt8183-efuse",
 				     "mediatek,efuse";
 			reg = <0 0x11f10000 0 0x1000>;
+
+			thermal_calibration: calib@180 {
+				reg = <0x180 0xc>;
+			};
 		};
 
 		mfgcfg: syscon@13000000 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
