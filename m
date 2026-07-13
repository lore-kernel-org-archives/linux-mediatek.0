Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E6C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIgAeSIeWMFrrZERdWh8nLvd/FHWfZLBVZiJ36Ls+jA=; b=TdZKmT8AcOO3A2sxg9l01ux7Hg
	6/fUWCkhDpY/gENzxzWtfXP/77G2M2KFe5p7XwunieUmQIZOQV3keSh1TG7rORq+bF+VXzhW/zUJg
	NTkjiBdMtv+/sxZrT6iwsvmdpfIIv8/co21rP0TX4xCdiMUWtgeqo7CPY4NZ2lN+V5Zbky4+j3ZIl
	Jt+efZtn9/m2RnJxN8J9KRBGtKJM9dS6ZnH2Z1g3kMILkW2k0Bs7teC7qz8arsXaJ8RjWUnNMHeaB
	gX1NbuHLIq0k4bi1OIXL70lsVEDmBlfR8hGzSw/t9YDIVXDvNR7Q49gS4kyhUW86Hp1j3BjYj/OFK
	hXNXemOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHde-00000009aZC-3wKT;
	Mon, 13 Jul 2026 14:28:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHdZ-00000009aU7-1GdU;
	Mon, 13 Jul 2026 14:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tIgAeSIeWMFrrZERdWh8nLvd/FHWfZLBVZiJ36Ls+jA=; b=UkvTa5S/XrGdhYMgDGZ+zGVSe2
	0Tx9sC24/ZHUjD0c0c8JPiKtQ5GbtxBcObGJZiayebqGpH1TUStha0kOd9epzJtCgpwuxfAnbqY2+
	c3srWNJY3nOuphJELSgx9a6XcXzrH5rUxOFhsa+MsYkVoDtZdH5TyBpg2I9ZcHj1vzSX7y05H0OWt
	a0EzV+sYcC7sL7eLVJOSXVG1XWRxHsAAbIeMN3mIawvXPjP8+yxjUyt7+BeDt8KrIPlFM5WOQegCE
	S6o2igGp0IamBUtIR3eC7XIfsJWQKwyqED5I39CrgJ7+SQ5tKY8V+aRu11THLfrJsbtxIyAQvMPBe
	wW32facA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHdW-0000000BiB8-1y2S;
	Mon, 13 Jul 2026 14:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783952873;
	bh=CRTgzEIiCGF3Q0P2KDt3LTOIuTWsDk2Q75L0QVm3KT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hW69CgJ0E2xqiwgTM0Mz+jn5CE9OICeKQEJopihKmeGK7OZQhFavADhQT6EidGfkB
	 YHVMehqU6qPu0cY8VQupg7NsOeBYQvM2NfZNjflb6ozc65JPgJodlITbIjRynJxGZM
	 8KJVfoHD+ZBjnTmSeIU6nY0hacfMpXXK09wv2Il7o3OlqW+gYuv5pVkrF9/mwoVwg4
	 YcCGaxh3ASiOw24holHD6cJR0j3TZ2E+o9wTcmKv2OChzfz7YmPxDSZ5+igi4r1EPA
	 6Fu+k3SqW0WLAYF+dCCl1hOOaVxHysrLT15Z4Vu+7s5Rtolaqut7LZEbvv48abWCa5
	 ZuNQ+vedBF7pg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D024117E07A2;
	Mon, 13 Jul 2026 16:27:52 +0200 (CEST)
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
	jason-jh.lin@mediatek.com
Subject: [PATCH v4 01/10] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Mon, 13 Jul 2026 16:27:37 +0200
Message-ID: <20260713142746.40259-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_152758_569131_520C8152 
X-CRM114-Status: UNSURE (   9.36  )
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

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.54.0


