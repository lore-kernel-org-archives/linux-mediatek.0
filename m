Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAFCC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 18:01:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58336115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 18:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C58336115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQOlDLFoVl937tlrSf7Cyn4Rg6TNzFfWB9g7e6Mbea8=; b=fyY/YywgKGB6nHspguVc9k5oqh
	HDrqL69GRrnq+B5XCCahqC44kDxi1yNdi5w+wBBHzu7jCKKF1ZmuCSHauFBwCJAQfWzOBTPOzbupv
	YLyU8GMSdV7LrczOABpqaVBYd5AlaAKmzUZx5dq/BAXqAgXpxgNd7gfdQl1Z5SMVvqSnkZpFfTE2T
	edXpMp7Pd9WybwlUHn7Sm1CHIrA+ftWA962ytn40n6GWJ/BM4DEm/xSVFh2P8+8rZ6Px6rSIRHDf6
	FeKFoyD5NgY8vAo4RqvWAe/0se7RZtS1t0kh0reIxBoRaXC7sunndadCdVftoPKeOqr5fN+28XM8F
	oe+5bltg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXSmi-0031Nh-C6; Fri, 16 Apr 2021 18:01:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXSmV-0031M6-MM; Fri, 16 Apr 2021 18:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Vmf4XBXfx/GPa3Yjcsccgq05PYXS1ISqoSBtkIzuniw=; b=elOcRuXczK4G+0eiNpGQnUZ+Gu
 1ytS2Df5fHPhk4EvNNr7uTlpiBvYeAwi6/YdMtvsKawEhFJ7BlL9DFCMMvkgwir4W8Ngg6QQ5o6wd
 fGcZtF0priC/y561SmamIe1P5DvB6ChjNAihqBXK1Z70ZiPoJ+2VcOw6kRA50WY2o8GVUd4Pw/eJS
 lZox9BBGvGQt1cVqDcLSvoqmJFmrvDd9FWjQNkn5k6MC3stLLZHmPJun+0uaPHLFlpsOhdqpzoOhI
 w8uBiFL5qJdSAf+NK+u3N5SG8QI4Uqi1UQuMyFUVcg5wwFTbbPmG/fS/ugw06BmP5Lp53fSekx43l
 hMHZ7WPA==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXSmS-009c00-Mu; Fri, 16 Apr 2021 18:01:26 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 5-20020a9d09050000b029029432d8d8c5so566069otp.11; 
 Fri, 16 Apr 2021 11:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vmf4XBXfx/GPa3Yjcsccgq05PYXS1ISqoSBtkIzuniw=;
 b=CWXsU55P0+YDkOp8kPvnAUH1Xa8fB7L1I8bdRe1YbesPjwZ9IiYj3XGfp9/4niLtDv
 8BEs+YTrr3IFMzPy/7PmwgeuzvsSAea0P9TqxPYJN0yjXsF4bDsyLYFMh/4uR9939Wui
 BXOsxOMfMoR9lrifVpTizimN/BW/LT7k2NCVsDhqa8xGWip4QcEidPd7xdlvpCc9Hrnf
 SBr09sHcO6BFDt3Nuc+OZegKkIRMtWmIwzcktqe64EckYpXR+LjEAUl8rvjb7NR/ju9L
 vehc1Ork2rFZvopWUGtzZvPTjIGk5lGxeK8Cg51meNYRMT6oF1Cv80Bn7JXNFqbPEDMS
 6n2g==
X-Gm-Message-State: AOAM531/Rp/OrlA/XhIt/sMe8xziaJbsgWp214orEd0WCtiidVShHVyg
 O/1Cg84Gf/yCPF2I/yc9yQ==
X-Google-Smtp-Source: ABdhPJw5PVcUE+vhVYVOcvFfMPwx98X7v9QTzuauOkbkFxiPCfHe/t1LBStf9Tht3Dd9zlgkuTcIIQ==
X-Received: by 2002:a05:6830:1e61:: with SMTP id
 m1mr4523038otr.36.1618596081220; 
 Fri, 16 Apr 2021 11:01:21 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m129sm1554217oif.34.2021.04.16.11.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:01:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, Argus Lin <argus.lin@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "ASoC: mt6359: add ASoC mt6359 ASoC accdet jack
 document"
Date: Fri, 16 Apr 2021 13:01:18 -0500
Message-Id: <20210416180118.3662904-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_110124_776036_707BCD82 
X-CRM114-Status: UNSURE (   9.94  )
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

This reverts commit e61c589587c772c5f672b22683c3e0b38be20702.

The binding document has lots of schema errors and there's been no
effort to fix them, so let's remove it.

Cc: Argus Lin <argus.lin@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/mt6359-accdet.yaml         | 164 ------------------
 1 file changed, 164 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
deleted file mode 100644
index 7fb3e8dfb4c5..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
+++ /dev/null
@@ -1,164 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek Technologies Inc. MT6359 ASoC accdet jack driver bindings
-
-maintainers:
-  - Chipeng Chang <chipeng.chang@mediatek.com>
-
-description: |
-  This binding describes the Mediatek Technologies MT6359 ASoC
-  accdet jack driver.
-
-properties:
-  mediatek,accdet-name:
-    maxItems: 1
-    description: named as "mt6359-accdet" jack.
-
-  mediatek,mic-vol:
-    maxItems: 1
-    description: |
-      accdet micbias1 voltage.
-
-      enum:
-        - 0x00 # 1.7v - micbias1 volage is 1.7v.
-        - 0x01 # 1.8v - micbias1 volage is 1.8v.
-        - 0x02 # 1.9v - micbias1 volage is 1.9v.
-        - 0x03 # 2.0v - micbias1 volage is 2.0v.
-        - 0x04 # 2.1v - micbias1 volage is 2.1v.
-        - 0x05 # 2.5v - micbias1 volage is 2.5v.
-        - 0x06 # 2.6v - micbias1 volage is 2.6v.
-        - 0x07 # 2.7v - micbias1 volage is 2.7v.
-        - 0x08 # 2.8v - micbias1 volage is 2.8v.
-        - 0x09 # 2.85v - micbias1 volage is 2.85v.
-
-  mediatek,mic-mode:
-    maxItems: 1
-    description: |
-      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
-
-      enum:
-        - 0x01 # ACC - ACC mode.
-        - 0x02 # DCC - low cost without in bias.
-        - 0x06 # DCC - low cost with in bias.
-
-  mediatek,pwm-deb-setting:
-    maxItems: 15
-    description: |
-       headset-mode-setting : Indicates customized pwm, debounce setting
-       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
-       debounce0, debounce1, debounce3, debounce4
-       eint pwm_width, eint pwm_thresh
-       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.
-
-  mediatek,eint-use-ap:
-    maxItems: 1
-    description: |
-      indicates to use ap gpio.
-
-      enum:
-        - 0x00 # MT6359 eint detection mode.
-        - 0x01 # SoC GPIO detection mode.
-
-  mediatek,eint-detect-mode:
-    maxItems: 1
-    description: |
-      indicates to use ap gpio.
-
-      enum:
-        - 0x00 # detection mode with higher detection power.
-        - 0x01 # detection mode with lower detection power.
-        - 0x02 # detection mode with sw moisture detection mode.
-        - 0x03 # detection mode with hw moisture detection mode1.
-        - 0x04 # detection mode with hw moisture detection mode2.
-
-  mediatek,eint-num:
-    maxItems: 1
-    description: |
-      incicates pmic eint usage.
-
-      enum:
-        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
-        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
-        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
-
-  mediatek,eint-trig-mode:
-    maxItems: 1
-    description: |
-      incicates pmic eint trigger mode.
-
-      enum:
-        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status.
-        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.
-
-  mediatek,eint-use-ext-res:
-    maxItems: 1
-    description: |
-      select HP_EINT pull up resistance, default 0 use internal resistance.
-
-      enum:
-        - 0x0 # use internal resistor.
-        - 0x1 # use external resistor.
-
-  mediatek,eint-comp-vth:
-    maxItems: 1
-    description: |
-      indicates comparator detection voltage.
-
-      enum:
-        - 0x00 # 2.8v.
-        - 0x01 # 2.4v.
-        - 0x02 # 2.0v.
-        - 0x03 # 0.7v.
-
-  mediatek,key-mode:
-    maxItems: 1
-    description: |
-      incicates key mode type.
-
-      enum:
-        - 0x0 # THREE_KEY - support 3-key key mode.
-        - 0x1 # FOUR_KEY - support 4-key key mode.
-        - 0x2 # TRI_KEY_CDD - support 3-key google CDD key mode.
-
-  mediatek,three-key-thr:
-    maxItems: 4
-    description: |
-      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
-
-  mediatek,tri-key-cdd-thr:
-    maxItems: 4
-    description: |
-      3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
-
-  mediatek,four-key-thr:
-    maxItems: 4
-    description: |
-      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
-
-additionalProperties: false
-
-examples:
-  - |
-    accdet: accdet {
-        mediatek,accdet-name = "mt6359-accdet";
-        mediatek,mic-vol = <8>;
-        mediatek,mic-mode = <2>;
-        mediatek,pwm-deb-setting = <0x500 0x500 1 0x1f0
-                                    0x800 0x800 0x20 0x44
-                                    0x4 0x1
-                                    0x5 0x3 0x3 0x5 0xe>;
-        mediatek,eint-use-ap = <0>;
-        mediatek,eint-detect-mode = <4>;
-        mediatek,eint-num = <0>;
-        mediatek,eint-trig-mode = <1>;
-        mediatek,eint-use-ext-res = <0>;
-        mediatek,eint-comp-vth = <2>;
-        mediatek,key-mode = <0>;
-        mediatek,three-key-thr = <0 80 220 400>;
-        status = "okay";
-    };
-...
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
