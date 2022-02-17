Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMZRgj/YA7aRKR9je3oDMpp44VRc2sscyok133zl43w=; b=iQMInAfJKprYQJ
	hcDZAfEyb37Fm5HKo5nS3CKv1d0MNTJrQih1HOBThZYm7uabKxYjZfUAVM0vifP8ctHIoIo4K0u9s
	8pvaiBqfoB3lMTspNjWt5uyqKKrtcdn31HmkLOKKHswRsXGGgpVY6PQaDNekEpDzr6b1DuFh7MzXr
	KUSDGqRESltVTJiD1D16v925ztHlvDkdTpJPrqnS9art1K0X5P5pCujc9Nk9EyNb4u7UGYBvdJn4e
	ietNBsiqG1YdNk3FCqj149yN07D7ES9LnoY4jsWShu59d5zATMSO49ngOYmjlf2WorPwWuR65uy4R
	jFv1wsQAr4NHJudasvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhBV-00AkYi-0L; Thu, 17 Feb 2022 13:51:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhBK-00AkV6-Jv; Thu, 17 Feb 2022 13:50:52 +0000
X-UUID: ac999768a6da4710aedb7566be315b70-20220217
X-UUID: ac999768a6da4710aedb7566be315b70-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 692875507; Thu, 17 Feb 2022 06:50:47 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:42:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Feb 2022 21:42:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:29 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [v2 17/17] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Date: Thu, 17 Feb 2022 21:42:05 +0800
Message-ID: <20220217134205.15400-18-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055050_679252_E1F13F1A 
X-CRM114-Status: GOOD (  10.88  )
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

This patch adds document for mt8186 board with mt6366, rt1019 and rt5682s.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
new file mode 100644
index 000000000000..9280a26038f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8186 with MT6366, RT1019 and RT5682S ASoC sound card driver
+
+maintainers:
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+description:
+  This binding describes the MT8186 sound card.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8186_mt6366_rt1019_rt5682s_sound
+
+  mediatek,platform:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8186 ASoC platform.
+
+  mediatek,hdmi-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of HDMI codec.
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
+    sound: mt8186-sound {
+        compatible = "mediatek,mt8186_mt6366_rt1019_rt5682s_sound";
+        mediatek,platform = <&afe>;
+        mediatek,hdmi-codec = <&it6505dptx>;
+        pinctrl-names = "aud_clk_mosi_off",
+                        "aud_clk_mosi_on";
+        pinctrl-0 = <&aud_clk_mosi_off>;
+        pinctrl-1 = <&aud_clk_mosi_on>;
+    };
+
+...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
