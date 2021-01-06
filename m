Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1C8C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 12:23:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1221D22AED
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 12:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1221D22AED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s2I14biMwu0Z/htiN7Mh0jaQAIhQJ1TNYs2IGcgKwY0=; b=zUDu0rpM6mgH3iZzelm5sFoLH
	A0a1LhX/D0UgUPGaiPYMjEeGkByZOpHsJPUfXHLhXL58SU0jRV2och22Etc8/tNy4F2Vzw6Ac+EH4
	xCTGKC6csWvGMd9Cn5bbLo670BqrlhQBom3lUZsjH1AE8raIPEr+RjL+L6X6s89B5LtUs58s6hsxw
	UDBIylEqn6QyQcgY1TI84c+OYRkr0IL+JtxwzKa/Q3YSvDEgTyWZPt+ivczYnrnXzmZBAwiPx6/+a
	pnuJRLCSGyLLQBp/eIt82kS7lg7LCxgn+/qXVQCXKpq7r/aV7XcF6FMfMt9+kGIPQfM6FGezoLwHg
	LXX9L04Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx7qi-0006Wd-UC; Wed, 06 Jan 2021 12:23:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx7qb-0006U0-PD; Wed, 06 Jan 2021 12:23:30 +0000
X-UUID: 9c05011be551433bbdda3e4517cff8d0-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4zHB3DMKOM8k9VP80pk+46Tx9EGx3Fm2PGQfQINowSA=; 
 b=tRSrsZMikm11f15sp/vGX60NvberBdNUlSCkNeG+axLn2mIOCsAdvYl4OXhUHp8R4z2l9ewxOwFTZJHNadPzI32kFDHYSCp+u/RxFq8bdi2567NGdwnE4YzTZPDhA9mVvXItKEeK3899XOBd5WKd95j8QBmqc7ZO2wjASJqIiYw=;
X-UUID: 9c05011be551433bbdda3e4517cff8d0-20210106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 338795164; Wed, 06 Jan 2021 04:21:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 04:19:10 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 20:19:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Jan 2021 20:19:09 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359 accdet
 document
Date: Wed, 6 Jan 2021 20:19:05 +0800
Message-ID: <1609935546-11722-2-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_072329_958536_E25D208B 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Argus
 Lin <argus.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "Shane.Chien" <shane.chien@mediatek.com>, linux-mediatek@lists.infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Chipeng Chang <chipeng.chang@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds MediaTek MT6359 accdet document.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 .../devicetree/bindings/sound/mt6359-accdet.yaml   | 142 +++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
new file mode 100644
index 0000000..fde0d29
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Technologies Inc. MT6359 ASoC accdet driver bindings
+
+maintainers:
+  - Chipeng Chang <chipeng.chang@mediatek.com>
+
+description: |
+  This binding describes the Mediatek Technologies MT6359 ASoC
+  accdet driver.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6359-accdet
+      - mediatek,pmic-accdet
+
+  accdet-name:
+    maxItems: 1
+    description: named as "mt6359-accdet" for snd_soc_card_jack.
+
+  accdet-mic-vol:
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
+  accdet-plugout-debounce:
+    maxItems: 1
+    description: For using ap gpio eint only, it is sw debounce time.
+
+  accdet-mic-mode:
+    maxItems: 1
+    description: |
+      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
+
+      enum:
+        - 0x01 # ACC - ACC mode.
+        - 0x02 # DCC - low cost without in bias.
+        - 0x06 # DCC - low cost with in bias.
+
+  eint_use_ext_res:
+    maxItems: 1
+    description: select HP_EINT pull up resistance, default 0 use internal resistance.
+
+  headset-mode-setting:
+    maxItems: 15
+    description: |
+       headset-mode-setting : Indicates customized pwm, debounce setting
+       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
+       debounce0, debounce1, debounce3, debounce4
+       eint pwm_width, eint pwm_thresh
+       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.
+
+  headset-use-ap-eint:
+    maxItems: 1
+    description: indicates to use ap gpio.
+
+  headset-eint-num:
+    maxItems: 1
+    description: |
+      incicates pmic eint usage.
+
+      enum:
+        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
+        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
+        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
+
+  headset-eint-trig-mode:
+    maxItems: 1
+    description: |
+      incicates pmic eint trigger mode.
+
+      enum:
+        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status by setting polarity to high or low.
+        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.
+
+  headset-key-mode:
+    maxItems: 1
+    description: |
+      incicates key mode type.
+
+      enum:
+        - 0x0 # THREE_KEY - support 3-key key mode.
+        - 0x1 # FOUR_KEY - support 4-key key mode.
+        - 0x1 # TRI_KEY_CDD - support 3-key google CDD key mode.
+
+  headset-three-key-threshold:
+    maxItems: 4
+    description: |
+      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
+
+  headset-three-key-threshold-CDD:
+    maxItems: 4
+    description: |
+       3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
+
+  headset-four-key-threshold:
+    maxItems: 4
+    description: |
+      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
+
+additionalProperties: false
+
+examples:
+  - |
+    accdet: accdet {
+        compatible = "mediatek,mt6359-accdet";
+        accdet-name = "mt6359-accdet";
+        accdet-mic-vol = <8>;
+        accdet-plugout-debounce = <1>;
+        accdet-mic-mode = <2>;
+        eint_use_ext_res = <0>;
+        headset-mode-setting = <0x500 0x500 1 0x1f0
+                                0x800 0x800 0x20 0x44
+                                0x4 0x1
+                                0x5 0x3 0x3 0x5 0xe>;
+        headset-use-ap-eint = <0>;
+        headset-eint-num = <0>;
+        headset-eint-trig-mode = <1>;
+        headset-key-mode = <0>;
+        headset-three-key-threshold = <0 80 220 400>;
+        headset-three-key-threshold-CDD = <0 121 192 600>;
+        headset-four-key-threshold = <0 58 121 192 400>;
+        status = "okay";
+    };
+...
--
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
