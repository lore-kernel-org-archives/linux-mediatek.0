Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFE6C44507
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8bYcE+470t0v0F23cTqiuIwK1mFT+F1HgHru8nNPc4=; b=OmD1xBtP6rlNaf6QTIO7wkTuNp
	HNMvwNA9W2Z/xytYmpvEBjlsQ2fyaQeqOEMIAafNs2UMpWUEga8B9+v68pJT8KwMEM2j/ov0X9x92
	tF6G7KXN99uW+/0z2Y/Vrv45rqprY2nDsAt85aGLmNRtn2L9qnQildyS6Inm6egK64i+YD1B2lRCp
	20E0IarNouD9/jrOp4qRWlEKirIoWZthHQ64uUg2Wgyv44OCQ0x2OzCXr6/gKB6CfRMlCobJXO1Ug
	uja/6+01KMo2aAiVhUaAfEmy1yiLBhZJKqQqChy26tdjcMZY1MgZFnTLp23VxQ7VglqaEDbdCXqFC
	rsJZEbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDRJ-00000008o38-2Y9I;
	Mon, 13 Jul 2026 09:59:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDR9-00000008nk9-47A6;
	Mon, 13 Jul 2026 09:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783936733;
	bh=+1IMus2mrgKgBZBYS1iIfAgpNfuoFnLk9RiPJiZi4LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MczT9WRbTbCsqjMp5vSHiucbPL5Cs1Rubk5Eu031T5z0ccy6b8l1601kYbIYRrd9q
	 LPOTobYg1jozA3qmf8scQORu20asJtGOBB0PGE8AnyRYI/+/hjd0Eb4fg9pS8M1RuC
	 zhTacXNx+Pz+nKjgXrmWOGb3DBL1K+ywSl2GGgr8byf/Fz5UoE+djFMwnBWBHw8wPN
	 lb8ITAcEYv/wb5YHVZumXFdwQP+JpTHi41ggaWhJAe2V1sI5EiwWz/6Ca38y4wRhbg
	 z88lqaTnhIK/9bK5MtXQ3pn34dvOI3GemA7T6nsl+5G7U/Si3j9LlwXa3XtUKLDWdN
	 MPh7yaamcHgBA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5CAE17E0DD8;
	Mon, 13 Jul 2026 11:58:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 09/10] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Mon, 13 Jul 2026 11:58:36 +0200
Message-ID: <20260713095837.16590-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_025856_174066_8B4E96A9 
X-CRM114-Status: UNSURE (   7.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller: add the missing compatibles for Dimensity 1200 (MT6893)
and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 97d052b0fb61..c3ed867d058d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -22,11 +22,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-disp-wdma
           - mediatek,mt8173-disp-wdma
       - items:
           - enum:
               - mediatek,mt6795-disp-wdma
               - mediatek,mt8167-disp-wdma
+              - mediatek,mt8183-disp-wdma
+              - mediatek,mt8186-disp-wdma
+              - mediatek,mt8192-disp-wdma
+              - mediatek,mt8195-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.54.0


