Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15608C369BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RDFyLDZn5eH5Rl1FmJnGGMVB81pd02kGsrGSIKqqndc=; b=b0Ib/5ZsJPMaOk679DPXZugMO8
	qgWiUlBtorNo+30bXEdOfa/H8aftyNmNxw7F7tIulZ9bKVQOh5JZq5qgoou8gdQIBo17jG3ab90ml
	zLOEXEU9B9YFGM5mD+nqT6M79/7jeR9lmqqYsbat4H70+QsyC16BIUr1/T4ADkpitkYvOg0prXv+8
	NSUFvlPBazDSElEuQpxlWILq+CZ85JIRs99rLSCS0x426TgLcYCuRKrrYhmvUjMshxWiuHVUxEDkP
	NlMbJjZOFnxgvySkKmIrSvRvgsQz6h4N63v7PldZRNvkOdu1PzVSbefBZdLB2lMCrc6U8FT+UUnQY
	5kaxX1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Ys-00000009RtY-0Ii4;
	Wed, 16 Apr 2025 12:08:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51TJ-00000009QOI-2Hmy;
	Wed, 16 Apr 2025 12:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804948;
	bh=cM020cuSN9YCkIudH4gTD63dk7wurpSzieojCHTZoV8=;
	h=From:To:Cc:Subject:Date:From;
	b=qDzIIwuD2tTc8xfLuYi6dXeT1OBfQQ11jG0Rg4rAbhP20bz+NljpRlzkadmQvYL/w
	 ydqn/1nafMKr3IJQLCY8tOGZun/AKnaOWiVU11AnNNSb6ILNLnbbDXSnDDTfLSR/GU
	 tfJoU0YRe7xS6vhqf46L2/CCxUv9aN9BJQ4uPlSV80qEWHC6sSIcvtUmdycyhy3+yo
	 w/r6dxBB93KqrlSsr6+0tS4W6yLJDGNgu4DgZc2dxUy7oVynq9RoMSrv8rWU8kHnLn
	 3y0hCtGcVVaZQRSws35jziNMEsYtMRlEkzig4a6JIWq3zPB0GXSdGvPx5Yix2utNOW
	 SQ2QWe9FvW7KQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A8E017E362B;
	Wed, 16 Apr 2025 14:02:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT6893
Date: Wed, 16 Apr 2025 14:02:25 +0200
Message-ID: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050229_730002_4F7A99B0 
X-CRM114-Status: UNSURE (   8.16  )
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

Add a compatible string for the scpsys block found in the MediaTek
Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 768390b92682..0e1d43c96fb9 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mediatek,mt6893-scpsys
           - mediatek,mt8167-scpsys
           - mediatek,mt8173-scpsys
           - mediatek,mt8183-scpsys
-- 
2.49.0


