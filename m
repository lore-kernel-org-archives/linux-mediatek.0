Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5ECC4742C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 08:05:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735F6206E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 08:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SNOHZxIA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QgxERYAQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 735F6206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cf/RV5Q+/6WoRWqqoYu2Xv8j7OOnuGO5q8v5XjpjoXw=; b=SNOHZxIAaZk0IJxVZGPxXQbSmH
	gW4d1n1E4xpcmv10w2VoQvWFNruQDam5CAQ8lbQmJ5EiVUEGIcLCo8JNBJrDy1raqszk3mxGCH/nt
	FAlPvV3mvkP148aa7QbaJ2rgjPdXon2cSavP7GMkeKA8JZW9CpIwH7CX7FDBJKn2vzzX44bwLw+zI
	fA6Gc1b9QSiwa6ZPmdL7iiUy6f4sPuywPuEFuw/EP+bXBrEtFeqvATG5w0IPZJxbLW/3ex5o/G37x
	BSzvlyZN9gYHHkbhIt0sZ7OSX4V//3FwoltvSLUWBKvlr7PIENy4kuLWrJj6EY2RwWbKx8sD25TGI
	NkzC1Ybw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcl8P-0001MZ-3A; Wed, 11 Nov 2020 08:05:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcl8L-0001L6-UJ; Wed, 11 Nov 2020 08:05:39 +0000
X-UUID: 044af9a7689f447eacfbe0bad52eee7e-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DGLUxWncSDIOWD56Ah4rLrLkP+NUxz4vtVZsn7i/Y6c=; 
 b=QgxERYAQz3ZEWQE9v6/gW54otlNpP+zsACmD5H756egMYcGKVW6K0CAcCqgBE8am8kex/sQ9W9VaFDG9+49JLG6D6jkM7SHzNh7VNTAM4eCqZVcLHr2NkqZnvbh6bWznC3HOxF3kgS+qNxI8u2X1gbhMRBucT2dnbs4+ygz/lm4=;
X-UUID: 044af9a7689f447eacfbe0bad52eee7e-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1914572021; Wed, 11 Nov 2020 00:05:28 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 00:05:26 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 16:05:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 16:05:21 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: mediatek: mt8192: revert "add audio afe document"
Date: Wed, 11 Nov 2020 16:05:20 +0800
Message-ID: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6B60659D593C4E89EEF10AE1AB27A634A2912B517692252360D8B9598ABDC582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_030538_325205_E502155A 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
 These dependency are continuing to upstream, I will revert this patch first.
 After the dependencies are merged, I will send 'mt8192-afe-pcm.yaml' again.

 .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ------------------
 1 file changed, 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
deleted file mode 100644
index 0170c93802d29..0000000000000
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ /dev/null
@@ -1,100 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek AFE PCM controller for mt8192
-
-maintainers:
-   - Jiaxin Yu <jiaxin.yu@mediatek.com>
-   - Shane Chien <shane.chien@mediatek.com>
-
-properties:
-  compatible:
-      const: mediatek,mt8192-audio
-
-  interrupts:
-    maxItems: 1
-
-  resets:
-    maxItems: 1
-
-  reset-names:
-    const: audiosys
-
-  mediatek,apmixedsys:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of the mediatek apmixedsys controller
-
-  mediatek,infracfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of the mediatek infracfg controller
-
-  mediatek,topckgen:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of the mediatek topckgen controller
-
-  power-domains:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: AFE clock
-      - description: ADDA DAC clock
-      - description: ADDA DAC pre-distortion clock
-      - description: audio infra sys clock
-      - description: audio infra 26M clock
-
-  clock-names:
-    items:
-      - const: aud_afe_clk
-      - const: aud_dac_clk
-      - const: aud_dac_predis_clk
-      - const: aud_infra_clk
-      - const: aud_infra_26m_clk
-
-required:
-  - compatible
-  - interrupts
-  - resets
-  - reset-names
-  - mediatek,apmixedsys
-  - mediatek,infracfg
-  - mediatek,topckgen
-  - power-domains
-  - clocks
-  - clock-names
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/mt8192-clk.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/power/mt8192-power.h>
-    #include <dt-bindings/reset-controller/mt8192-resets.h>
-
-    afe: mt8192-afe-pcm {
-        compatible = "mediatek,mt8192-audio";
-        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
-        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
-        reset-names = "audiosys";
-        mediatek,apmixedsys = <&apmixedsys>;
-        mediatek,infracfg = <&infracfg>;
-        mediatek,topckgen = <&topckgen>;
-        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
-        clocks = <&audsys CLK_AUD_AFE>,
-                 <&audsys CLK_AUD_DAC>,
-                 <&audsys CLK_AUD_DAC_PREDIS>,
-                 <&infracfg CLK_INFRA_AUDIO>,
-                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
-        clock-names = "aud_afe_clk",
-                      "aud_dac_clk",
-                      "aud_dac_predis_clk",
-                      "aud_infra_clk",
-                      "aud_infra_26m_clk";
-    };
-
-...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
