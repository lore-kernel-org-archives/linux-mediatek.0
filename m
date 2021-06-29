Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BDCC11F65
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 01:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C96661CF0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 01:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C96661CF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5jGis+IF6cHMGQiheBd8uMdSGFSaE6l+0rP0QKs7mo=; b=iZsnnbjKs3CWwM
	0x3taN0NQXe0M8YToup5GPPxt0q3WRp6lOqXnMTIQi7JkVReYNaZxkKGgBv3GZre0wqxeG27/gWLf
	8caXCwKm57okrzuKTD2/S7VPHLTIEIGC5oYN42VqwJPN6SUb2baEp47nv2aV1VMaMDrOsUPLGrEpy
	KsHdvLHuxe77dTcSt4uPGYnhPmPdBBp74Z3yotppvuDtZbfvSwIG7SieXWZY7LDLvlHgbMuWYpPFk
	Yof0zSujzjkiX8h7YJXzzR/ed4QhI7XzQA3x6YjZr2s58GTpBsNzZdQeDtc/FzbtOuGYdUEES59bu
	GnwHSJOvKLDx31l5FUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly2rf-009XDd-Q4; Tue, 29 Jun 2021 01:48:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly2rQ-009X7K-SG; Tue, 29 Jun 2021 01:48:26 +0000
X-UUID: 4a9cfa25faf34321a1cd796a62b7bbd3-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6P1EUXMmAeFUQdd+cWsXQ0s+Vs7NFx0wriCTncpSSrA=; 
 b=TF2N2UnwbDy7Cu1xFmAwpi5wMS4UpOyvJ2I9H4b03oAuwIjyiFfYts2NZDsK6y6DJaWonykCgJQaEFj5aXNRDa5pW6K9+VNXgOZ9AdoJwWp09UpFFkGIGTTTuQDONHfzspN5UEYCVD15I0opvEG1pL1ZAiKddigTUvy1e7J9Ek8=;
X-UUID: 4a9cfa25faf34321a1cd796a62b7bbd3-20210628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1059903116; Mon, 28 Jun 2021 18:47:56 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 18:47:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 09:47:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 09:47:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>
Subject: [PATCH v2 8/8] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-rt1019-rt5682 document
Date: Tue, 29 Jun 2021 09:47:36 +0800
Message-ID: <20210629014736.31153-9-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210629014736.31153-1-trevor.wu@mediatek.com>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_184825_013137_826BC0EA 
X-CRM114-Status: GOOD (  12.42  )
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

This patch adds document for mt8195 board with mt6359, rt1019 and rt5682

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
new file mode 100644
index 000000000000..246c0875e64e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8195-mt6359-rt1019-rt5682.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound card driver
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+description:
+  This binding describes the MT8195 sound card.
+
+properties:
+  compatible:
+    const: mediatek,mt8195_mt6359_rt1019_rt5682
+
+  mediatek,platform:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8195 ASoC platform.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+
+examples:
+  - |
+
+    sound: mt8195-sound {
+        compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
