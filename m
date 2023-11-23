Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50981C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M1+5t6EN+uTXuWzSJk0TjasZTcd1MKf8/mCib9ah+A=; b=KoTMidwMVFUVgecXuQAOf4U0oy
	SK74ow+ig6ysphVI7j9lXh1RXuedDlaTZsAANURsTiAHVXBwcC39HM120VPAIUHFm4Fa+dVzGn3lL
	UvAdvHz9IUBiO/Ds825oeIXOUDzYe+Udn0LCI8BQEIdlmS8RfYylDOelZL1XJ7uMjZvQ6kiEdm49v
	jQKCW/gHu16wDtQao7WUnS+D3jAzSwZYQs0iD1myD9T5MFXPx0HZ1dQ1OcrJhMxc6V7tGwgmJPPlC
	7KBu0Qp7OZWDzUcnGtYFvsArUaAoyj4h/CdSTJpDKG7QHi5oKLQ+MEGr9gIbv1E58wU7CoCT7Z9k6
	iSCq2/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69uI-004uHf-0w;
	Thu, 23 Nov 2023 13:38:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r69uB-004uE2-1u;
	Thu, 23 Nov 2023 13:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9B3D6213B;
	Thu, 23 Nov 2023 13:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6FEC433C7;
	Thu, 23 Nov 2023 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700746685;
	bh=MT6oWZWBbySd/bCRRRjnP/MchEhM4olMaAyFtTUdpCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uTOK77TuCBkGedL2lsDha1qAEjPwTsuWBvtYcX+YZtvynUSxRyVL1nE9soPgqo9jG
	 4BBD3BS7STDI2SKGDeLvUKNQCnVVoiXQVXazOoobwIMleUPV9Buplj6TCgGO4YAVAQ
	 M89CYNGdX5gPZbDgYuaTR45BZlfTPrOtLJx1JojXZ9k/wTcZnLWlD5+HRyhV5+BwSF
	 qCuW6kFlo6qLwbkM0lM+ciie+/YYwBZQQeroIRqv2m1S1gzA3lRTf1WC4h4X9gNt4q
	 SvamQg6ODrOFiKDgfhwz209pL/8h6SOHvfMD+hEf1XCRUHyRofFYhyun0TOLH6muYp
	 qxFW/Fpesct4g==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/4] dt-bindings: display: mediatek: dsi: add compatible for MediaTek MT8195
Date: Thu, 23 Nov 2023 14:37:46 +0100
Message-Id: <20231123133749.2030661-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123133749.2030661-1-mwalle@kernel.org>
References: <20231123133749.2030661-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_053807_673472_40DA5795 
X-CRM114-Status: UNSURE (   8.76  )
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

Add the compatible string for MediaTek MT8195 SoC, using the same DSI
block as the MT8183.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 537e5304b730..4a7a9ff21996 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - mediatek,mt6795-dsi
           - const: mediatek,mt8173-dsi
+      - items:
+          - enum:
+              - mediatek,mt8195-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1
-- 
2.39.2


