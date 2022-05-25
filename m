Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23751C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 01:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiCh+1XRSMUUOJ0SmSBN9WjI6T3LRncSozNsjo+7KmY=; b=Kz3tkXSS+/AwG9
	+mcHpmvppinlsax7sRU16z6xZk3R4Zfj5R9xk6gzd3MToPeA5853cz4GSvhXzGf11Jb/w6yoI0rf3
	1mtFMSEq7QYyCrhU6W+eb6y0UeAWAMRNJwvDGuBOhTGipvpxTZoidnLdn22Q8IH/LlfstnHhMtmH0
	bubXYYlxBiRCfviUqwmprjuSV8xA+V1kt3kXN3V50blsac9CvHgZDlqVf9sGbuXV9mAx8sRGnuTW9
	E0bVm06/BKOqVOFvV76J1QLbwvjpbspgozTI5KQs2n5Wg05WrMJdpcr50iqvpvwbdg7lExyp+1uW1
	iXg8ggRdzH1Je9BPbrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntgBo-009fpT-7J; Wed, 25 May 2022 01:51:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntgBl-009fo6-BJ; Wed, 25 May 2022 01:51:54 +0000
X-UUID: 012d9b39ce004e50a4abacef90eadd87-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:10a8075f-a448-4c6c-b49c-0a3a8aff7078, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:58745747-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 012d9b39ce004e50a4abacef90eadd87-20220524
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1147099545; Tue, 24 May 2022 18:51:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 18:51:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 09:51:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 25 May 2022 09:51:43 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Axe Yang
 <axe.yang@mediatek.com>, Lucas Stach <dev@lynxeye.de>, Eric Biggers
 <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd
 <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND v12 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Date: Wed, 25 May 2022 09:51:38 +0800
Message-ID: <20220525015140.384-2-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525015140.384-1-axe.yang@mediatek.com>
References: <20220525015140.384-1-axe.yang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_185153_421883_03D9D18C 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
This feature allow SDIO devices alarm asynchronous interrupt to host
even when host stop providing clock to SDIO card. An extra wakeup
interrupt and pinctrl states for SDIO DAT1 pin state switching are
required in this scenario.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 2a2e9fa8c188..e83bf10281d6 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -72,12 +72,27 @@ properties:
       - const: ahb_cg
 
   interrupts:
-    maxItems: 1
+    description:
+      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
+      interrupt is required and be configured as wakeup source irq.
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: msdc
+      - const: sdio_wakeup
 
   pinctrl-names:
+    description:
+      Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
+      will be switched between GPIO mode and SDIO DAT1 mode, state_eint and state_dat1 are
+      mandatory in this scenarios.
+    minItems: 2
     items:
       - const: default
       - const: state_uhs
+      - const: state_eint
 
   pinctrl-0:
     description:
@@ -89,6 +104,11 @@ properties:
       should contain uhs mode pin ctrl.
     maxItems: 1
 
+  pinctrl-2:
+    description:
+      should switch dat1 pin to GPIO mode.
+    maxItems: 1
+
   assigned-clocks:
     description:
       PLL of the source clock.
@@ -208,4 +228,32 @@ examples:
         mediatek,hs400-cmd-resp-sel-rising;
     };
 
+    mmc3: mmc@11260000 {
+        compatible = "mediatek,mt8173-mmc";
+        reg = <0x11260000 0x1000>;
+        clock-names = "source", "hclk";
+        clocks = <&pericfg CLK_PERI_MSDC30_3>,
+                 <&topckgen CLK_TOP_MSDC50_2_H_SEL>;
+        interrupt-names = "msdc", "sdio_wakeup";
+        interrupts-extended = <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_LOW 0>,
+                     <&pio 23 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-names = "default", "state_uhs", "state_eint";
+        pinctrl-0 = <&mmc2_pins_default>;
+        pinctrl-1 = <&mmc2_pins_uhs>;
+        pinctrl-2 = <&mmc2_pins_eint>;
+        bus-width = <4>;
+        max-frequency = <200000000>;
+        cap-sd-highspeed;
+        sd-uhs-sdr104;
+        keep-power-in-suspend;
+        wakeup-source;
+        cap-sdio-irq;
+        no-mmc;
+        no-sd;
+        non-removable;
+        vmmc-supply = <&sdio_fixed_3v3>;
+        vqmmc-supply = <&mt6397_vgp3_reg>;
+        mmc-pwrseq = <&wifi_pwrseq>;
+    };
+
 ...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
