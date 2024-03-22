Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE80BC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTGIV/yFV5azlUfidVeuSj2r5t76hOAwuD1XoYvXYOU=; b=BkQrjDfis+MScnsU2ICsD+RVAA
	+BQ1Gop4dwxWj5ybi2hE/NSerz78LEhgTAzDfJngnKZzij8yagLJJrftuGKdjcAKgsjLQhhNeCoYs
	fgxJlIE23v7QX8X2FA9IaY8QAXtUe7MhYXW9syBqoBUTXCr9sULDX4ARK/DhVzLIkYDLEH7Qa08kY
	cru5Gmjwyjmq+p7pm6W7iLt1tpZ9QagaHL7gc0ly+AhUkOF74B5jt9XhxiMCw3SK9s7fhfeE9d+2y
	1ooU+ZxuRSlhwK5ZyyUDxWgavgXZjikRMGXqHKL0zLp22F+GZ+PM39XCECyVzPQOwdZEqo+841MLI
	xLp17xZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbDM-00000006a6Z-1FU0;
	Fri, 22 Mar 2024 09:29:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbD3-00000006Zux-1jFB;
	Fri, 22 Mar 2024 09:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711099748;
	bh=AjiPCKYIJ6cIRh/6wA9+tKFj1BougxdVEi/ByygD0oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cRN5ZVmpqpseHFn4sGGAQbVwTyV9UPtQPKcbTGkxQnVPOv/qW/D06Wa+ii7Q0UzSV
	 GhKr7wFpuyyJlv7n5nz9m8J+Vin7mcNV+aLFXlbBvJxOgEaMaNMa6w3881dWuOi4Z4
	 /Zt1aMNEG3qwdV0SABWIQsnEmOVcbiN6RP8UoaXKSLpKPA5zIx8yWO2aP7tl58lf4c
	 p8HgeCRjFStuf4kYEwXxq1lQLnVC7og8sRfmQRqAfE7e60YJd41xSrhutkMQm6osd+
	 j+1qQmd5OHI2l7sx//zRjsA4SMzxZIewWvt90ixuhpeSHXDDqigVE0yWEgFh8QDUZa
	 bJwnHtyI3EAqg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 11104378211B;
	Fri, 22 Mar 2024 09:29:07 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/4] dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
Date: Fri, 22 Mar 2024 10:28:44 +0100
Message-ID: <20240322092845.381313-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_022909_603923_5266DFD9 
X-CRM114-Status: UNSURE (   8.67  )
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

Add a compatible for MediaTek MT8188 RDMA, which supports only a
subset of the MDP3 components of its similar MT8195 counterpart.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 59db8306485b..18603f6c5e06 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt8183-mdp3-rdma
+          - mediatek,mt8188-mdp3-rdma
           - mediatek,mt8195-mdp3-rdma
           - mediatek,mt8195-vdo1-rdma
       - items:
-- 
2.44.0


