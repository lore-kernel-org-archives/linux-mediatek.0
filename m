Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89C3C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vln0CNwaST+CG5hDwRmd3vFdEm2z8jnscnTb6gZD+o=; b=vO5iHH5+tTx/Pj+w480ITtEn7s
	tuvDgAMTHonXNrJU6I6Fki62QfSuUS8FdujXIYgieL2IOIZQZ+J7/7YhGTYXRBhr8XlO9X5yCATcH
	d4h/0mszV1kO5Tu4FPt5t/Z2ABOJHo34tWlUUid1qRmeitPPPE5Bfi+ODbIat0ZQ1ciPlKzGRodp/
	h5OS1624tikiN9cCvhmfC/xa5dwtk3qQkHHo0tNG1IVih3ZmayJN9V6/QqmM59K+Pkn+lmjnc8HPE
	yHacR4S7+xWGc8Y7dSmKYVOF5POCFpM5IU/XOeu+bG4YC9VTAO/grGA6TkMr7UJV1IicCB34TAyRP
	/4LjwN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhqw-00FEaG-Iq; Wed, 08 Feb 2023 10:39:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpS-00FDdl-Vb; Wed, 08 Feb 2023 10:37:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16FD3660209C;
	Wed,  8 Feb 2023 10:37:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675852649;
	bh=NHwI9wz8c2rm9f8C+YQk4IHldiJVGMy9bByas6AgTLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPOzPn5DJLfXV7xK7LvRnHr+UPZ1vZHuttiqK7hW4ilQgrER8UKEPM5tuE+ceqxH8
	 lWuTDfdPzaALUnr0PwA6ikpN9mIAkoCYBMqkR8TxtG686lsu6sjBG1OB8jcxJJ01rx
	 IjpU1IhF/rx1pnvcb1J+kJ8pqzmyRwP17EPybH1CN3nct2hRsPE/25driR3IXo0PNN
	 NIVL7vMOnfrafgfguiH1mVeFNRFVjm6JHsmflVuC5Lj8BkfuFz8ph/TWmgAAy8i+X1
	 t7ppyaLizEvTOeVubFipnVGZZ6GlrhI9QUp/l+fBfxfU0okzwtAN+Idc3Go1WXDle9
	 6dZIfQktps8Ow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
Date: Wed,  8 Feb 2023 11:37:05 +0100
Message-Id: <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_023731_178419_60FC3F10 
X-CRM114-Status: UNSURE (   7.77  )
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

Get GPU support on MT8186 by adding its compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 8c57b89ee866..85111559dfe0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -15,6 +15,11 @@ properties:
 
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8186-mali
+          - const: mediatek,mt8183b-mali
+          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
               - amlogic,meson-g12a-mali
-- 
2.39.1


