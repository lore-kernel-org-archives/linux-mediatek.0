Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E26C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 08:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8AD61008
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 08:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB8AD61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ezvJgyPQFWM2k8AqjB6lR7sMI0xSPWEOCOLlcXJIsQ4=; b=YAtMhZv2j82GOH
	H5cksALRW/wqrtbC75C9TFRrooLDG+iUnP0SCAWQJdonilLPbrfu7oSYPMVH6CrTtyim6ro1S6z/t
	2YU4p1mUtdWwBaUxRXzDKCIdaG57X7+7A4UWqtiKPOaR30/Q0O54qg5mJLhdO3zR7ymqFzkqg3Z5g
	Zk0W0nOrxj6cxvKNslIZho3wB6c53fGhcd/+sdSvfAeQKR7QNA6wdG9fP1lpQyysiCfuTRDK+QsuT
	StRh1lVOPJPZNQpV3U2jhBGpvy+Sp7eTGjJuDhbra2vaHfBtZ8SiYUydi80mvLtEC4HLhINAPoDix
	zAaarAsnhZWdYdCVz+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzTJ-001pcX-O1; Tue, 31 Aug 2021 08:50:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzT4-001pbU-CC; Tue, 31 Aug 2021 08:50:10 +0000
X-UUID: 17f2fc9a42114768861675d94281a47a-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qfl72ugr/w6lhm0qKP3SqGBQUUW/YAvFHshDrw+gnjA=; 
 b=hXo1cxn6TQNzei8xrSYIpol+qxmvkkOILBI6bRgGN6+MjOq5zAUyWYRMIzTUvYrJgTjRNvf99iEB7qU3Muc0obgHrpwyTMTBxZpTCr2Y0oIRxSg5hOlOtWQ5Bcmez62/DTpUkP8TFBDxeEmy5CRJP0XBIJtbhsJ/bjpHBdYYgXw=;
X-UUID: 17f2fc9a42114768861675d94281a47a-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 309678917; Tue, 31 Aug 2021 01:50:01 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 01:39:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 16:39:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 31 Aug 2021 16:39:57 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH] ASoC: dt-bindings: mt8195: remove dependent headers in the
 example
Date: Tue, 31 Aug 2021 16:39:56 +0800
Message-ID: <20210831083956.9804-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_015006_481483_DF6C310C 
X-CRM114-Status: UNSURE (   9.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Drop the use of the defines including clock and power id, so that
we can remove the headers which are not applied in the example.

Fixes: b5bac34fcfb4 ("dt-bindings: mediatek: mt8195: add audio afe document")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8195-afe-pcm.yaml        | 40 +++++++++----------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
index 53e9434a6d9d..dcf790b053d2 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -130,36 +130,34 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/mt8195-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/power/mt8195-power.h>
 
     afe: mt8195-afe-pcm@10890000 {
         compatible = "mediatek,mt8195-audio";
         reg = <0x10890000 0x10000>;
         interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
         mediatek,topckgen = <&topckgen>;
-        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+        power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
         clocks = <&clk26m>,
-                 <&topckgen CLK_TOP_APLL1>,
-                 <&topckgen CLK_TOP_APLL2>,
-                 <&topckgen CLK_TOP_APLL12_DIV0>,
-                 <&topckgen CLK_TOP_APLL12_DIV1>,
-                 <&topckgen CLK_TOP_APLL12_DIV2>,
-                 <&topckgen CLK_TOP_APLL12_DIV3>,
-                 <&topckgen CLK_TOP_APLL12_DIV9>,
-                 <&topckgen CLK_TOP_A1SYS_HP_SEL>,
-                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-                 <&topckgen CLK_TOP_AUDIO_H_SEL>,
-                 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
-                 <&topckgen CLK_TOP_DPTX_M_SEL>,
-                 <&topckgen CLK_TOP_I2SO1_M_SEL>,
-                 <&topckgen CLK_TOP_I2SO2_M_SEL>,
-                 <&topckgen CLK_TOP_I2SI1_M_SEL>,
-                 <&topckgen CLK_TOP_I2SI2_M_SEL>,
-                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
-                 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>;
+                 <&topckgen 163>, //CLK_TOP_APLL1
+                 <&topckgen 166>, //CLK_TOP_APLL2
+                 <&topckgen 233>, //CLK_TOP_APLL12_DIV0
+                 <&topckgen 234>, //CLK_TOP_APLL12_DIV1
+                 <&topckgen 235>, //CLK_TOP_APLL12_DIV2
+                 <&topckgen 236>, //CLK_TOP_APLL12_DIV3
+                 <&topckgen 238>, //CLK_TOP_APLL12_DIV9
+                 <&topckgen 100>, //CLK_TOP_A1SYS_HP_SEL
+                 <&topckgen 33>, //CLK_TOP_AUD_INTBUS_SEL
+                 <&topckgen 34>, //CLK_TOP_AUDIO_H_SEL
+                 <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS_SEL
+                 <&topckgen 98>, //CLK_TOP_DPTX_M_SEL
+                 <&topckgen 94>, //CLK_TOP_I2SO1_M_SEL
+                 <&topckgen 95>, //CLK_TOP_I2SO2_M_SEL
+                 <&topckgen 96>, //CLK_TOP_I2SI1_M_SEL
+                 <&topckgen 97>, //CLK_TOP_I2SI2_M_SEL
+                 <&infracfg_ao 50>, //CLK_INFRA_AO_AUDIO_26M_B
+                 <&scp_adsp 0>; //CLK_SCP_ADSP_AUDIODSP
         clock-names = "clk26m",
                       "apll1_ck",
                       "apll2_ck",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
