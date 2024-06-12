Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD61C27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzcd7If3SCeuauwwlCdOOqvfS/Xb+tfBbSnKxqgSwgM=; b=GCkIG/MFnfxhLSDTSYL/b+5Pp1
	pw2mRVHBGPGIM8ABvY/u7pVQypVpCEgUV6s+Xuk39jnm4CEQKAiCjr53H81nsGveavqxuyw4W4jAE
	w6EeXI2jxy9dgth1Gq4nRFq64c19ZIdqzSCCqUwB0kbUv2EG0t9UGIQ7aWRdv3iSUiOdCG5AY5qWO
	dQ8ni5ZDoo/HmfSpR2sb6z8gdOqly1mmLwj5hEIn9Y88NuQtcaAg14lx4TMadPVuNFMXmy0wy+CcR
	LSlOwah1VzqVETMMo7EodRnquvTmO5cnNiwZ/tjFgpM1B9x1KsoRNyGlTa0G1of8wQVJrC3OcVHbe
	NLoMvidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIeQ-0000000BUbR-3J12;
	Wed, 12 Jun 2024 07:44:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdn-0000000BU3n-2Uao;
	Wed, 12 Jun 2024 07:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178210;
	bh=wZcU/FXZehoC+lJtazGBLsIeGgfB53r6HFIFrqTzF24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SShfAm4CoYKyVm0t5LhyWvvmUPhukqX1sldqdTI1lFe29jLgV/c7TpAOANcGlHWUg
	 qqMpau0QIPMm4MODw3DRvOMM5KWam0GZaj7l69gwcR9hpdJ6tQ5RojT+ErAiXo5Zgf
	 Ji/DEJl2XkRArxNhoCQibwydpfiZpLJ+2ulw1FpqI9IuZRYvkTmaFlzNzTNHWmZms7
	 JFo1W3tCLd+pV9EjIcopi0d9lVZl4YcBj/oAE2LZB7fMuc/Qr/zLPOzf80feYe2aki
	 I+D+If4y1qt9g4zkbY01Wsy5bZob9XtWapAkEF6jcojJxmvP5hRHStHhxGQHEWYAUo
	 nm7ow5+awGg2w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2420D378219F;
	Wed, 12 Jun 2024 07:43:29 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 6/8] dt-bindings: ufs: mediatek,ufs: Document MT8195 compatible
Date: Wed, 12 Jun 2024 09:43:07 +0200
Message-ID: <20240612074309.50278-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004331_795263_B9D1B7F5 
X-CRM114-Status: UNSURE (   7.34  )
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

Add the new mediatek,mt8195-ufshci string.
This SoC's UFSHCI controller is compatible with MT8183.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index f14887ea6fdc..5728e750761f 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-ufshci
+              - mediatek,mt8195-ufshci
           - const: mediatek,mt8183-ufshci
 
   clocks:
-- 
2.45.2


