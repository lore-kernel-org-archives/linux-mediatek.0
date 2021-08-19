Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996C5C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 08:44:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A2AE60E78
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 08:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A2AE60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRWJh4mFjfM0vtAi0yL0hLXM8Hpy0AY3UE1EHIlkLdM=; b=WJKTQCYdpA8dQ5
	o6yQZCDhLWuop62CXng8Wzyv/Ugl5/g0I6rV8AkI1E6ZlteTt0WbmeLJb5P1JZQbSGgalSPrbPJem
	ID+4OhWIB04IYzd2MDRV0f93fTj7wV070FAXKeDqU4Ijbyd67RZV31F2XuqG9ju5Itdchryr77I6G
	YXoo12nvryVdaI0JkskBOF7i8qDbKy+SYwN6aytp1KVBiFPktKXF7T/x3FreZkE5WbVxNIjmRQ0Pi
	XsXrA5XeFGh0sPrNtZLK8Dn0I6TZlmxKf+r+1e8gtzjbB3mf5Bm52mOfkjckFahwHW5GLAvOThjel
	S6vjEelH2LTzKtJ91JzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGdeO-007icp-P0; Thu, 19 Aug 2021 08:43:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGddt-007iUi-Qp; Thu, 19 Aug 2021 08:43:21 +0000
X-UUID: 4764241250f04c08ab3dbe351efa1c85-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1Iy/LwAkCJ/Q6HXJlJdfxA8zdLgDs0wOAvqLvimjbCE=; 
 b=RSbmNiSSfKddXUDazB4h+BiFQ40UPOIz1SLMefMTmDBWaUCA3tttLow6TEBwk3JjyQ64Ep1BBsK1hZOGiWZ+2UOntiPBkVZ9lgKS6TJ2qGYDy8Ycu9MJkCDlvHgqEX5j1GwiEMypfq1dRgu6rTp75orAaMVacK4ELoBb4Ecr9pg=;
X-UUID: 4764241250f04c08ab3dbe351efa1c85-20210819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 959913457; Thu, 19 Aug 2021 01:43:13 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 01:43:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 16:43:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 16:43:10 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>, <wenst@chromium.org>
Subject: [PATCH v5 11/11] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-rt1019-rt5682 document
Date: Thu, 19 Aug 2021 16:41:44 +0800
Message-ID: <20210819084144.18483-12-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819084144.18483-1-trevor.wu@mediatek.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_014317_909248_42409B7A 
X-CRM114-Status: GOOD (  11.69  )
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
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
new file mode 100644
index 000000000000..20bc0ffd0e34
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
@@ -0,0 +1,47 @@
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
+  mediatek,dptx-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8195 Display Port Tx codec node.
+
+  mediatek,hdmi-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8195 HDMI codec node.
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
