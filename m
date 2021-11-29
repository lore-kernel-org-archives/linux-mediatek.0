Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFD4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//HbGU9eaiDtQa9tS6bVe8+46Zbb4y6inkwIiX9LmlA=; b=M5wCr7b+fdJ+tO
	7I1cLouA1CtAU+CapOjHOvqas83Fptwm/P+vSTyTfAnz2jNdfAXlKppX6lAQeMQwGQwA1ET+KkexQ
	qUSxR9AVb56lkP3cs7rGTj/P35I2RVLp+h4pX9XHsHyee0wQpQRZTlpZcnIHJD/Daxgk5fyknbFZR
	Lboc83XVCtesHCkC2oGAy2/O4t/f2jTlfds1l9ncelYfHjd/2D7EGJo31vjFQTrtK7l0NYK3r/qyw
	pYu+rJm71bpkSiqdfiICgGw8y8oyHWxh8SiTB3zoIAkTuc0I7ZjVgGjHLJPqys5t2Zm5f6EPE23LK
	4D0z3XBBqpUDYVZprk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrhWt-000zs2-Ie; Mon, 29 Nov 2021 14:21:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrhWq-000zqp-2R; Mon, 29 Nov 2021 14:21:13 +0000
X-UUID: 853efdbe557240b49863c2989c44995d-20211129
X-UUID: 853efdbe557240b49863c2989c44995d-20211129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 309645096; Mon, 29 Nov 2021 07:21:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 06:11:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 29 Nov 2021 22:11:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 22:11:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>,
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 2/4] dt-bindings: mediatek: mt8195: add model property
Date: Mon, 29 Nov 2021 22:10:55 +0800
Message-ID: <20211129141057.12422-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129141057.12422-1-trevor.wu@mediatek.com>
References: <20211129141057.12422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_062112_129118_DF2F2FCE 
X-CRM114-Status: UNSURE (   8.89  )
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

This patch adds the description of model property used to specify card
name from dts.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml           | 4 ++++
 .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml           | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
index d354c30d3377..cf6ad7933e23 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
@@ -16,6 +16,10 @@ properties:
   compatible:
     const: mediatek,mt8195_mt6359_rt1011_rt5682
 
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
   mediatek,platform:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8195 ASoC platform.
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
index 20bc0ffd0e34..e6786dece9a3 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
@@ -16,6 +16,10 @@ properties:
   compatible:
     const: mediatek,mt8195_mt6359_rt1019_rt5682
 
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
   mediatek,platform:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8195 ASoC platform.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
