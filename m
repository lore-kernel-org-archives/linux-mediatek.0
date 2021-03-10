Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D02DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 13:33:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F93364FD7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 13:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F93364FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zqDchw7Yq4xfhy6RYtzwPZKOn9q8RoghkVKZaFVdFaQ=; b=eAU/WxaGuW2pLg4p/J/xyLBdf
	g/h1JYonf0GX96PWK3DF9vmnQkHf2oORLLXZXxueC3uvctzWq7zFYD1BXgzAS4ysyYtvFKvv3KZJQ
	bj4dsZL8p+Wtgp7Gi/w6W6YLX+M2zvNkN2fil2SP9CPCW7m8B6Lg/Lej4o7rrA95Ej2Le9TaH7rbH
	aM60hun05TcFNtagu45GjMs9mFpLu+K/gJufYUNeixstjJndaQb6zmUp5ohT1Vt7uat8rket0RBmI
	7Xpq2RCepzZCrajOhSmaFBFiKT9NaeEKvwclcQJIzWfzpwmviUrXgN/KplLo1BVYvf1KgzvlbaK0G
	GaeT0Xvvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJyyC-006wx1-Um; Wed, 10 Mar 2021 13:33:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJyxp-006wrs-F1; Wed, 10 Mar 2021 13:33:28 +0000
X-UUID: a486bac91b1a4aef81821d88c3b0e982-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=g0GhGNp/qWxNHLdKhrovw3CJG5GubOKlI0RAtogpT0s=; 
 b=haVjYnTUZ6Gyfj+cow8+7q+DW6w7rJtn9aWRMRUminj3G2/lIEiVpHz28vr8Lj7DA3cZzztiNEIjdVm7xSG/lPhQOV+Fklfg2Xqc4QeO71sKo9j9ZE1FA7Za6oevX4uHUVcCK4xxBsWg8jIrWK2rwZHovWL/2XZ7YVOSw95Gbag=;
X-UUID: a486bac91b1a4aef81821d88c3b0e982-20210310
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1890421743; Wed, 10 Mar 2021 05:33:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 05:33:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 21:33:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 21:33:11 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Jack Yu
 <jack.yu@realtek.com>, Shuming Fan <shumingf@realtek.com>, Dan Murphy
 <dmurphy@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, "Argus
 Lin" <argus.lin@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Shane.Chien <shane.chien@mediatek.com>, Chipeng Chang
 <chipeng.chang@mediatek.com>, <alsa-devel@alsa-project.org>,
 <wsd_upstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH V2 1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359 ASoC
 accdet jack document
Date: Wed, 10 Mar 2021 21:33:05 +0800
Message-ID: <1615383186-18500-2-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_133325_894690_CAEF402D 
X-CRM114-Status: GOOD (  14.11  )
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

This patch adds MediaTek MT6359 ASoC accdet jack document.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 .../bindings/sound/mt6359-accdet.yaml         | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
new file mode 100644
index 000000000000..7fb3e8dfb4c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Technologies Inc. MT6359 ASoC accdet jack driver bindings
+
+maintainers:
+  - Chipeng Chang <chipeng.chang@mediatek.com>
+
+description: |
+  This binding describes the Mediatek Technologies MT6359 ASoC
+  accdet jack driver.
+
+properties:
+  mediatek,accdet-name:
+    maxItems: 1
+    description: named as "mt6359-accdet" jack.
+
+  mediatek,mic-vol:
+    maxItems: 1
+    description: |
+      accdet micbias1 voltage.
+
+      enum:
+        - 0x00 # 1.7v - micbias1 volage is 1.7v.
+        - 0x01 # 1.8v - micbias1 volage is 1.8v.
+        - 0x02 # 1.9v - micbias1 volage is 1.9v.
+        - 0x03 # 2.0v - micbias1 volage is 2.0v.
+        - 0x04 # 2.1v - micbias1 volage is 2.1v.
+        - 0x05 # 2.5v - micbias1 volage is 2.5v.
+        - 0x06 # 2.6v - micbias1 volage is 2.6v.
+        - 0x07 # 2.7v - micbias1 volage is 2.7v.
+        - 0x08 # 2.8v - micbias1 volage is 2.8v.
+        - 0x09 # 2.85v - micbias1 volage is 2.85v.
+
+  mediatek,mic-mode:
+    maxItems: 1
+    description: |
+      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
+
+      enum:
+        - 0x01 # ACC - ACC mode.
+        - 0x02 # DCC - low cost without in bias.
+        - 0x06 # DCC - low cost with in bias.
+
+  mediatek,pwm-deb-setting:
+    maxItems: 15
+    description: |
+       headset-mode-setting : Indicates customized pwm, debounce setting
+       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
+       debounce0, debounce1, debounce3, debounce4
+       eint pwm_width, eint pwm_thresh
+       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.
+
+  mediatek,eint-use-ap:
+    maxItems: 1
+    description: |
+      indicates to use ap gpio.
+
+      enum:
+        - 0x00 # MT6359 eint detection mode.
+        - 0x01 # SoC GPIO detection mode.
+
+  mediatek,eint-detect-mode:
+    maxItems: 1
+    description: |
+      indicates to use ap gpio.
+
+      enum:
+        - 0x00 # detection mode with higher detection power.
+        - 0x01 # detection mode with lower detection power.
+        - 0x02 # detection mode with sw moisture detection mode.
+        - 0x03 # detection mode with hw moisture detection mode1.
+        - 0x04 # detection mode with hw moisture detection mode2.
+
+  mediatek,eint-num:
+    maxItems: 1
+    description: |
+      incicates pmic eint usage.
+
+      enum:
+        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
+        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
+        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
+
+  mediatek,eint-trig-mode:
+    maxItems: 1
+    description: |
+      incicates pmic eint trigger mode.
+
+      enum:
+        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status.
+        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.
+
+  mediatek,eint-use-ext-res:
+    maxItems: 1
+    description: |
+      select HP_EINT pull up resistance, default 0 use internal resistance.
+
+      enum:
+        - 0x0 # use internal resistor.
+        - 0x1 # use external resistor.
+
+  mediatek,eint-comp-vth:
+    maxItems: 1
+    description: |
+      indicates comparator detection voltage.
+
+      enum:
+        - 0x00 # 2.8v.
+        - 0x01 # 2.4v.
+        - 0x02 # 2.0v.
+        - 0x03 # 0.7v.
+
+  mediatek,key-mode:
+    maxItems: 1
+    description: |
+      incicates key mode type.
+
+      enum:
+        - 0x0 # THREE_KEY - support 3-key key mode.
+        - 0x1 # FOUR_KEY - support 4-key key mode.
+        - 0x2 # TRI_KEY_CDD - support 3-key google CDD key mode.
+
+  mediatek,three-key-thr:
+    maxItems: 4
+    description: |
+      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
+
+  mediatek,tri-key-cdd-thr:
+    maxItems: 4
+    description: |
+      3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
+
+  mediatek,four-key-thr:
+    maxItems: 4
+    description: |
+      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
+
+additionalProperties: false
+
+examples:
+  - |
+    accdet: accdet {
+        mediatek,accdet-name = "mt6359-accdet";
+        mediatek,mic-vol = <8>;
+        mediatek,mic-mode = <2>;
+        mediatek,pwm-deb-setting = <0x500 0x500 1 0x1f0
+                                    0x800 0x800 0x20 0x44
+                                    0x4 0x1
+                                    0x5 0x3 0x3 0x5 0xe>;
+        mediatek,eint-use-ap = <0>;
+        mediatek,eint-detect-mode = <4>;
+        mediatek,eint-num = <0>;
+        mediatek,eint-trig-mode = <1>;
+        mediatek,eint-use-ext-res = <0>;
+        mediatek,eint-comp-vth = <2>;
+        mediatek,key-mode = <0>;
+        mediatek,three-key-thr = <0 80 220 400>;
+        status = "okay";
+    };
+...
--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
