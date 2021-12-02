Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA261C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGJgqQBbN3HWy5zsDpU9XUoYFQD2vkYZCSvK0xWh/bA=; b=pHHQR8JPTQc6V4
	VKnSmjY2GU8uSTx8ELLteJkO0gaG/YmW6DF8bUd+rXzKBK/mMGxtRZoO9bHcNNR3p8uLZM85sbqf+
	spkCAYYwVsUGcHBa0xdbkPg6W5JwNhNdAoFXCmicY4JRerFGp1FVtv6hg8jMr6NAedt2TQrUM7HNM
	X7Q0aOJZ/2l/QBj94yMXHGIQXzVvLWH6myJv6qZZ/oYOyyoWJFZn5hCtm8TkANZQoUcZ3OdFpfGNn
	wudN/7aX1fsk5C/aoMKDOKFxIzUrovugC1qLWqkPq5jEMZMVmMeHfl1CClWUJnFcmxjZnD6wwNXDj
	CzPmr2c+DWLAIODqPCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnOv-00Cepu-84; Thu, 02 Dec 2021 14:49:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnO8-00CeUn-3G; Thu, 02 Dec 2021 14:48:47 +0000
X-UUID: 21bac15d1ce1444581531b9b33a51a32-20211202
X-UUID: 21bac15d1ce1444581531b9b33a51a32-20211202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 386065972; Thu, 02 Dec 2021 07:48:38 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 06:48:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Dec 2021 22:48:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 22:48:23 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <yc.hung@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <daniel.baluta@nxp.com>, <peter.ujfalusi@intel.com>,
 <trevor.wu@mediatek.com>, <allen-kh.cheng@mediatek.com>
Subject: [PATCH v6] dt-bindings: dsp: mediatek: Add mt8195 DSP binding support
Date: Thu, 2 Dec 2021 22:48:18 +0800
Message-ID: <20211202144818.31626-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_064844_185288_FC0D3011 
X-CRM114-Status: UNSURE (   7.83  )
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

From: "yc.hung" <yc.hung@mediatek.com>

This describes the mt8195 DSP device tree node.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
Changes since v5:
    Remove sub node "sound" and "mediatek,platform", "mediatek,dptx-codec",
    "mediatek,hdmi-codec" properties. Let dsp node as an individual node and
    sound card has phandle of this dsp node per discussion in 
    https://github.com/thesofproject/linux/pull/3239

Changes since v4:
  - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
    https://github.com/thesofproject/linux/pull/3237
  - refine DT file binding files with Rob's comments.
---  
 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
index f8bacd50b018..33db11ee2336 100644
--- a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
@@ -70,22 +70,6 @@ properties:
       - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
       - description: A phandle to a reserved memory region is used for DSP system memory.
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 ASoC platform.
-
-  mediatek,dptx-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 Display Port Tx codec node.
-
-  mediatek,hdmi-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 HDMI codec node.
-
 required:
   - compatible
   - reg
@@ -98,7 +82,6 @@ required:
   - power-domains
   - mbox-names
   - mboxes
-  - mediatek,platform
 
 additionalProperties: false
 
@@ -130,6 +113,4 @@ examples:
        power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
        mbox-names = "mbox0", "mbox1";
        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
-       mediatek,dptx-codec = <&dp_tx>;
-       mediatek,platform = <&afe>;
        };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
