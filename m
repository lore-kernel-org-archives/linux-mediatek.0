Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE42C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXnNDF6yDezLz3N7gpsxVKnGxCExhEG+nxYgUEp9sPc=; b=2tarxHhfPXz7XyB+95ArM9osMc
	la98PbL6zEIN6oDgPAKgpuAkRn47ZuwTjCB0fUKf7GvIxAN0AIoDgWEH4hJk5deSRQmg9x2PEM2jG
	73cgZVCZAPSMCvTyHcn+sCWrGKV06McFAVUCyeQ6jkbmZ5o25ZTe0L6ZtQwL9rjlEH2pYG25tTPcc
	Jdof+SyYbYHDWDu1lovjKoR8J3Gc9DvNJk30wI2XIw++8J6WoocJSDdCpSgx95GzaFfTlLCzCyRpz
	uKYDbVqDT1sCzMIbXjzIqZsGtKiiDas7f3QJ4HP0VCtXLS+rHQKzt7P1wzQA21r3Ff/qX8as+JU0K
	Sk08LuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKTe-0000000AGFB-1K58;
	Mon, 29 Jul 2024 07:07:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKT9-0000000AG3x-3ayL;
	Mon, 29 Jul 2024 07:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1722236815; x=1753772815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iGJ3QLxUBx3lWaj8smL6i5Dofs/yvFBxdgR2BHeTifY=;
  b=ZYQFE4HAeuGGH4Z5ivhZaVyjqPEMVnM0YIHcZTCSP1+0RSWnG+Ri0/E2
   v3acYOkt0TCiS+JOW4YSb97MoyLXgPu7EEKbfTBx3sePkBgsb0lOSwfbe
   zeJqFtRyElRWWP0FfDr8SjBJmCezNeXLVw+S3BHo8OfBGCgjOfM1j9OO5
   dzd4SV2rK8hmVqxULaLpfQ/0p32UgX73u1VD20WN3d/EugNjf0ZQMxbXE
   pu9u+DVEEcACFhNKKDpche2fByX1d1gUj2Q9Njg3nouydnp0hYGhIlWYX
   Zl0AtUv4+YorQl7O7fJpsAUWS4te+soeBQV05wME8US0wh9DpndVJjNhs
   w==;
X-CSE-ConnectionGUID: MnTnLLroRF2oCkj0nuokmg==
X-CSE-MsgGUID: 5TKxq8NwQEm1E1f6fiybtA==
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="32596747"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2024 00:06:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jul 2024 00:06:28 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jul 2024 00:06:23 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ychuang3@nuvoton.com>,
	<schung@nuvoton.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v6 02/27] dt-bindings: mfd: syscon: add microchip's sam9x7 sfr
Date: Mon, 29 Jul 2024 12:36:03 +0530
Message-ID: <20240729070603.1990265-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
References: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_000655_927152_71C9D478 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible for sam9x7 SoC's SFR.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
Changes in v6:

 - New patch in v6 as the syscon devices are moved to a new file
   upstream.
---
 .../devicetree/bindings/mfd/syscon.yaml       | 188 +++++++++---------
 1 file changed, 97 insertions(+), 91 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9dc594ea3654..50392d091e70 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -120,97 +120,103 @@ select:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - al,alpine-sysfabric-service
-          - allwinner,sun8i-a83t-system-controller
-          - allwinner,sun8i-h3-system-controller
-          - allwinner,sun8i-v3s-system-controller
-          - allwinner,sun50i-a64-system-controller
-          - altr,l3regs
-          - altr,sdr-ctl
-          - amd,pensando-elba-syscon
-          - amlogic,meson-mx-assist
-          - amlogic,meson-mx-bootrom
-          - amlogic,meson8-analog-top
-          - amlogic,meson8b-analog-top
-          - amlogic,meson8-pmu
-          - amlogic,meson8b-pmu
-          - apm,merlin-poweroff-mailbox
-          - apm,mustang-poweroff-mailbox
-          - apm,xgene-csw
-          - apm,xgene-efuse
-          - apm,xgene-mcb
-          - apm,xgene-rb
-          - apm,xgene-scu
-          - atmel,sama5d2-sfrbu
-          - atmel,sama5d3-nfc-io
-          - atmel,sama5d3-sfrbu
-          - atmel,sama5d4-sfrbu
-          - axis,artpec6-syscon
-          - brcm,cru-clkset
-          - brcm,sr-cdru
-          - brcm,sr-mhb
-          - cirrus,ep7209-syscon1
-          - cirrus,ep7209-syscon2
-          - cirrus,ep7209-syscon3
-          - cnxt,cx92755-uc
-          - freecom,fsg-cs2-system-controller
-          - fsl,imx93-aonmix-ns-syscfg
-          - fsl,imx93-wakeupmix-syscfg
-          - fsl,ls1088a-reset
-          - fsl,vf610-anatop
-          - fsl,vf610-mscm-cpucfg
-          - hisilicon,dsa-subctrl
-          - hisilicon,hi6220-sramctrl
-          - hisilicon,hip04-ppe
-          - hisilicon,pcie-sas-subctrl
-          - hisilicon,peri-subctrl
-          - hpe,gxp-sysreg
-          - loongson,ls1b-syscon
-          - loongson,ls1c-syscon
-          - lsi,axxia-syscon
-          - marvell,armada-3700-cpu-misc
-          - marvell,armada-3700-nb-pm
-          - marvell,armada-3700-avs
-          - marvell,armada-3700-usb2-host-misc
-          - marvell,dove-global-config
-          - mediatek,mt2701-pctl-a-syscfg
-          - mediatek,mt2712-pctl-a-syscfg
-          - mediatek,mt6397-pctl-pmic-syscfg
-          - mediatek,mt8135-pctl-a-syscfg
-          - mediatek,mt8135-pctl-b-syscfg
-          - mediatek,mt8173-pctl-a-syscfg
-          - mediatek,mt8365-syscfg
-          - microchip,lan966x-cpu-syscon
-          - microchip,sam9x60-sfr
-          - microchip,sama7g5-ddr3phy
-          - mscc,ocelot-cpu-syscon
-          - mstar,msc313-pmsleep
-          - nuvoton,ma35d1-sys
-          - nuvoton,wpcm450-shm
-          - rockchip,px30-qos
-          - rockchip,rk3036-qos
-          - rockchip,rk3066-qos
-          - rockchip,rk3128-qos
-          - rockchip,rk3228-qos
-          - rockchip,rk3288-qos
-          - rockchip,rk3368-qos
-          - rockchip,rk3399-qos
-          - rockchip,rk3568-qos
-          - rockchip,rk3588-qos
-          - rockchip,rv1126-qos
-          - st,spear1340-misc
-          - stericsson,nomadik-pmu
-          - starfive,jh7100-sysmain
-          - ti,am62-opp-efuse-table
-          - ti,am62-usb-phy-ctrl
-          - ti,am625-dss-oldi-io-ctrl
-          - ti,am62p-cpsw-mac-efuse
-          - ti,am654-dss-oldi-io-ctrl
-          - ti,j784s4-pcie-ctrl
-          - ti,keystone-pllctrl
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - al,alpine-sysfabric-service
+              - allwinner,sun8i-a83t-system-controller
+              - allwinner,sun8i-h3-system-controller
+              - allwinner,sun8i-v3s-system-controller
+              - allwinner,sun50i-a64-system-controller
+              - altr,l3regs
+              - altr,sdr-ctl
+              - amd,pensando-elba-syscon
+              - amlogic,meson-mx-assist
+              - amlogic,meson-mx-bootrom
+              - amlogic,meson8-analog-top
+              - amlogic,meson8b-analog-top
+              - amlogic,meson8-pmu
+              - amlogic,meson8b-pmu
+              - apm,merlin-poweroff-mailbox
+              - apm,mustang-poweroff-mailbox
+              - apm,xgene-csw
+              - apm,xgene-efuse
+              - apm,xgene-mcb
+              - apm,xgene-rb
+              - apm,xgene-scu
+              - atmel,sama5d2-sfrbu
+              - atmel,sama5d3-nfc-io
+              - atmel,sama5d3-sfrbu
+              - atmel,sama5d4-sfrbu
+              - axis,artpec6-syscon
+              - brcm,cru-clkset
+              - brcm,sr-cdru
+              - brcm,sr-mhb
+              - cirrus,ep7209-syscon1
+              - cirrus,ep7209-syscon2
+              - cirrus,ep7209-syscon3
+              - cnxt,cx92755-uc
+              - freecom,fsg-cs2-system-controller
+              - fsl,imx93-aonmix-ns-syscfg
+              - fsl,imx93-wakeupmix-syscfg
+              - fsl,ls1088a-reset
+              - fsl,vf610-anatop
+              - fsl,vf610-mscm-cpucfg
+              - hisilicon,dsa-subctrl
+              - hisilicon,hi6220-sramctrl
+              - hisilicon,hip04-ppe
+              - hisilicon,pcie-sas-subctrl
+              - hisilicon,peri-subctrl
+              - hpe,gxp-sysreg
+              - loongson,ls1b-syscon
+              - loongson,ls1c-syscon
+              - lsi,axxia-syscon
+              - marvell,armada-3700-cpu-misc
+              - marvell,armada-3700-nb-pm
+              - marvell,armada-3700-avs
+              - marvell,armada-3700-usb2-host-misc
+              - marvell,dove-global-config
+              - mediatek,mt2701-pctl-a-syscfg
+              - mediatek,mt2712-pctl-a-syscfg
+              - mediatek,mt6397-pctl-pmic-syscfg
+              - mediatek,mt8135-pctl-a-syscfg
+              - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8173-pctl-a-syscfg
+              - mediatek,mt8365-syscfg
+              - microchip,lan966x-cpu-syscon
+              - microchip,sam9x60-sfr
+              - microchip,sam9x7-sfr
+              - microchip,sama7g5-ddr3phy
+              - mscc,ocelot-cpu-syscon
+              - mstar,msc313-pmsleep
+              - nuvoton,ma35d1-sys
+              - nuvoton,wpcm450-shm
+              - rockchip,px30-qos
+              - rockchip,rk3036-qos
+              - rockchip,rk3066-qos
+              - rockchip,rk3128-qos
+              - rockchip,rk3228-qos
+              - rockchip,rk3288-qos
+              - rockchip,rk3368-qos
+              - rockchip,rk3399-qos
+              - rockchip,rk3568-qos
+              - rockchip,rk3588-qos
+              - rockchip,rv1126-qos
+              - st,spear1340-misc
+              - stericsson,nomadik-pmu
+              - starfive,jh7100-sysmain
+              - ti,am62-opp-efuse-table
+              - ti,am62-usb-phy-ctrl
+              - ti,am625-dss-oldi-io-ctrl
+              - ti,am62p-cpsw-mac-efuse
+              - ti,am654-dss-oldi-io-ctrl
+              - ti,j784s4-pcie-ctrl
+              - ti,keystone-pllctrl
+          - const: syscon
+      - items:
+          - const: microchip,sam9x7-sfr
+          - const: microchip,sam9x60-sfr
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.25.1


