Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E75BCD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=; b=K3WyPwJZp5kMDAdk/8/hysNoRR
	TZwUEDo07qv0oGp7WF/74LX7NX5yq0GssE23PImdoRhfmxKkB2txioN+xWcLvGFOdlIh0zqJXaigl
	nbNfHolo3vuvvy62yJukj3WQBqNNe0i8ldI3dyczugvjqrMFvIIUOct1BCGj7MilG5BfXuDRoBpaa
	Gb7Fn+kt3BhzW1lE6UbBryP6qmzmbA70Zk+qhZci8Wn68E9pqlf8VNo8xENWoBBOYG/F6pXze/m8O
	ArHVa2o+2ulUxECjgeGwRIrp5NC9ElCadIHk3zu24DKiH1uZaiGr0T9HQKv0nLhLcQWXIbSj7jIES
	Sc9QCs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqr-000000068Cq-1wW0;
	Thu, 28 May 2026 17:49:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqk-0000000687R-11RO
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 17:48:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso112428385e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2026 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990532; x=1780595332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=;
        b=MPfGdbNLUoJWkxXWI1PxZSooV7WUfljriMzmK0G/bIt4x2RTWB6FGAP7cJAwc1K2hH
         8PchDOzPGz2sE6kQteRObQ6m8NBOTNZlMUaLvYpq1YKnfQGMW3DVSwFacugpexBn6fME
         coJFPapryh8XEVOjfupgr6NgZx4/JickPGUplrilypJIKWwwFsnhuNpEsN5GmP0NNaK/
         K2KwjBXG8qX8nyqmg0vA2ODZgoESJUkyr+4uqKwZcyUgZNWA0OPdUVAWisi0UM8nnXPV
         GKiBWSgPZ1fxm/11Hm/HjYcIF9UIJelWq07wQlLfY4nWhzAeF0kHzqDfpbAfcvLNO+kL
         k0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990532; x=1780595332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=;
        b=rzAZQ3aFShaBPfTZSl/dKF2ehJZpvApRW9JXC8hj649VCSdNiS4x5G3l5/s3bi/T6t
         7kK9nPUdR5XUUceEQs+3CTgZJGyXUoiVkKtkqygj/BPtYs24wenngt7+52XHfRcgojzf
         /0JBTiX3s3Y9Xcq0rgPVbw3BbYGfgLfmvS4Qa5ybiRAgmI2tZdk6y4z5Wk10fLtH9/Dn
         UvgOIDuJJWMPPaj+avHpsmK5Bbi2Wq4plO9kpIcpHILOG8UtmhNMS9oHaeWQZ7VT1xsn
         PTxyawR9HmZLKaGX+aetY12APGvrPAZRJ44+qoLbQx4gFAcElCwhv3C/4k/e6Dpo/iUe
         wshg==
X-Forwarded-Encrypted: i=1; AFNElJ+Q0Kf5ITe0x6HGv508LTDGOuqXBmUimHO+eGJc3DA/1fm40MkEFlBh1VG5NiAPCiDMyqCh5W9ZXDDiWGaNYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6eUQqgD6donGSU9O0/Wd2MEz4obRMhKjxmWfJwl/YY8UU1oY
	ffaTImW8ajixUbpqfas7v0fkJdZIeQadGHhifp1q0lfIlPOPeohTMksv
X-Gm-Gg: Acq92OGysObrQsrwW9VTrWXR7sjzX708oIb5XMEIOxKUWYJJCTIvS5f5yfOZ/um5hPD
	f9JTGq4spmd2ZqrXQW1AwU8AYettuY9mtqWtdhry18lXDb9uqOAk+Pde2Uy5GaSxmVZzsjmUkNg
	Q5/or1iWg5Z3Lj5plnrFO+x5uLZZLjiSKwo+tbaLOQgRlJcg4aZqAmcBnaqqudwCMlstA6HQLlM
	YGevL/gGR7TZfW8Crg5k739mwSMyg5n00ZofTqBlCllVOMmy93BcUJcHvGW1mu9SFOdejHVAq/s
	Rx1LFLKR5l137PJapm9SA312uVq5+b7aNzPiUbmd+cMZ1oBCM6fyPVS2TJEOb+ZGmtG+v0M9Vr6
	+mbbfGFHpIU+Fc/7Rafag83gOtq2umUyTQOK++4mAmbeNvZtWWUMlQCHHUMORMIcR0+WKgqGPL6
	8XemGDjCZ1UWOo2UQUXr6bEJ9GVFlXEMAwfzt5CAedwS1gWn3Rvw/eADgrBeaQTDFS7PFGuncL6
	rvIZJM=
X-Received: by 2002:a05:600c:4fc1:b0:490:7227:100 with SMTP id 5b1f17b1804b1-49072aa14b3mr221993685e9.18.1779990532172;
        Thu, 28 May 2026 10:48:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
Date: Thu, 28 May 2026 19:48:29 +0200
Message-ID: <20260528174840.28644-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104854_297702_7A3BFFD3 
X-CRM114-Status: GOOD (  12.50  )
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0


