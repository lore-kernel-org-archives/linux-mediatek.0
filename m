Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44343C4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 09:04:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E50B22250
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 09:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrDtbYYL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="quSHh30X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E50B22250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/TimBn2Qi9gJBuHwCg9me0ObT3RHeXn9ZTciP6dshgI=; b=DrDtbYYLRgDilMusZReGQTs6o
	39WRl+34lRLClA3L5lMobyJv3myenD+5cZikf/9Aru0SEd2i+pWD+Y8qwd6/VyEOplSrw+x0Qm5XC
	9hVgcdzBvULT2CDOatG6T+gGwIVvD/mRCTPFO9YUkw92v6w/D+XYfxZn4r2Gnc6G52jCFGILnRap3
	AdYQ1KxfQHDiapZcPtFu2arhcJwXjgfS0aSQRzwRHXiN5JO41DDyiD9JuqlPeBfdbkFrQUvQAO8Y0
	uBY+7KNCnZzojxcSIvvNAwC3n3/1W7H46v0NsvMx0Vnx4HaznAAKE4X28MgoKJCoPeoqlY5gGWPWv
	wquUN7WPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVA2X-00049r-6M; Wed, 21 Oct 2020 09:04:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVA2R-00047n-Vz; Wed, 21 Oct 2020 09:04:09 +0000
X-UUID: 7bf0bfabb7694c06bd971beac572d6b0-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2eA5mKkZSX/w+1QgOhh4/7GoKxQze5d+ZVQZMBmbcxQ=; 
 b=quSHh30Xph9924O/gI9tAL0JKzJ+Ve+wVavHYPhoo1TRcXecFe1jENpBK0hNFR/Nrmpcju4B3y5/6Q7KivT43Kq2KoEA929mQgWayZ3wSC9Ebm60ypL2VW+xN3hqh52PzpzeaHzRsonkCntHkgsHlYRzYTFWcqJzED5HbONy49g=;
X-UUID: 7bf0bfabb7694c06bd971beac572d6b0-20201021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 95094319; Wed, 21 Oct 2020 01:04:04 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 01:54:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 16:54:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Oct 2020 16:54:00 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Date: Wed, 21 Oct 2020 16:53:53 +0800
Message-ID: <1603270435-3548-4-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_050408_221321_0B1FC55A 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds mt8192 audio afe document.

This patch depends on following series that has not been accepted:
https://patchwork.kernel.org/cover/11752231
(dt-bindings/clock/mt8192-clk.h is included in it.)
https://patchwork.kernel.org/patch/11755895
(dt-bindings/power/mt8192-power.h is included in it.)
https://lore.kernel.org/patchwork/patch/1321118
(dt-bindings/reset-controller/mt8192-resets.h is included in it.)

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../bindings/sound/mt8192-afe-pcm.yaml        | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
new file mode 100644
index 0000000000000..7c2f07b8b66dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8192
+
+maintainers:
+   - Jiaxin Yu <jiaxin.yu@mediatek.com>
+   - Shane Chien <shane.chien@mediatek.com>
+
+properties:
+  compatible:
+      const: mediatek,mt8192-audio
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  mediatek,apmixedsys:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    maxItems: 1
+    description: The phandle of the mediatek apmixedsys controller
+
+  mediatek,infracfg:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    maxItems: 1
+    description: The phandle of the mediatek infracfg controller
+
+  mediatek,topckgen:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    maxItems: 1
+    description: The phandle of the mediatek topckgen controller
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AFE clock
+      - description: ADDA DAC clock
+      - description: ADDA DAC pre-distortion clock
+      - description: audio infra sys clock
+      - description: audio infra 26M clock
+
+  clock-names:
+    items:
+      - const: aud_afe_clk
+      - const: aud_dac_clk
+      - const: aud_dac_predis_clk
+      - const: aud_infra_clk
+      - const: aud_infra_26m_clk
+
+required:
+  - compatible
+  - interrupts
+  - resets
+  - reset-names
+  - mediatek,apmixedsys
+  - mediatek,infracfg
+  - mediatek,topckgen
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8192-power.h>
+    #include <dt-bindings/reset-controller/mt8192-resets.h>
+
+    afe: mt8192-afe-pcm {
+        compatible = "mediatek,mt8192-audio";
+        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
+        reset-names = "audiosys";
+        mediatek,apmixedsys = <&apmixedsys>;
+        mediatek,infracfg = <&infracfg>;
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
+        clocks = <&audsys CLK_AUD_AFE>,
+                 <&audsys CLK_AUD_DAC>,
+                 <&audsys CLK_AUD_DAC_PREDIS>,
+                 <&infracfg CLK_INFRA_AUDIO>,
+                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
+        clock-names = "aud_afe_clk",
+                      "aud_dac_clk",
+                      "aud_dac_predis_clk",
+                      "aud_infra_clk",
+                      "aud_infra_26m_clk";
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
