Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FA0C3DA40
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtEuZevnBjcR6D96+agLJCBKT1rBIyCcNiMHlKb0NTw=; b=LQJRCTsoRvVO0cLtTSj/tLPV3H
	4x/llR9TdBp2xzSzlW/rqga4+MKA2VQxStJ73ITGwsvuB24ioe31R1H9+lpvwHYM807r3Sah5pDXe
	ZZ922EFSMQkEBfvWEvUV24I4pUDxC4bejVbxGTXeq1WZI229+Z0oAM04fn0xl9kWDclo9bqY58r1g
	amkMsrW0lvg3smdKP+ZmHw8VsFHLnhnlwRejYAGmt3PM9IRTxk10PJFumzxwm+vIDYF8yRDOis+D7
	7Ws7IdAEnJQHbQFUMx/KXxVJOE0cs3/aJeCB31K9geRLgNn7Rkpt6X/r7Fn8+EXYxAzxLOhJMhr5I
	+JBo/zQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETRu-00000002Jbe-2U7A;
	Tue, 04 Jun 2024 12:39:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETRp-00000002JZk-255U;
	Tue, 04 Jun 2024 12:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504767;
	bh=CpQdxsV8bHr08qgSs4fiUyuci8075LtVplEkoA/kEzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sDL1xvTeZR1ICVuDrYO4MuN3eVtUzy8Eq5zWP4h1GQQYEjvPxtV8NZflQIk3Rx60E
	 uZaKFEtuD6jMadkj+xgcqTdOekT4qvC/RbXNsk75XFOAbZbYzS9mxaHuXAQ4QjSyW5
	 7EIQI5zJ2HuzqaXW9iJqQCJ/VIdRpkwl198E7NfN6FrBo5QM76237nsPsR/lf0jIVb
	 p5R/c50axFNY6jXt4TPaQAHt4Yrfo1mbMOdoxIbi3Rkjd9tII+9Tmeb9zrTOJzsKIi
	 B1dRBNCVclTbyO73mJCD5qVCIHDbvtPc6OpSjvvFB42QKp5aegWFCGLuwKFzcp2na4
	 uTuIQgEFuUq1A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3054837821F2;
	Tue,  4 Jun 2024 12:39:26 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	steven.price@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
Date: Tue,  4 Jun 2024 14:39:21 +0200
Message-ID: <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_053929_690099_7F0A891D 
X-CRM114-Status: UNSURE (   9.92  )
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

Add a compatible for the MediaTek MT8188 SoC, with an integrated
ARM Mali G57 MC3 (Valhall-JM) GPU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index e796a1ff8c82..8acb46adabe2 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
+              - mediatek,mt8188-mali
               - mediatek,mt8192-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
@@ -195,7 +196,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8183b-mali
+            enum:
+              - mediatek,mt8183b-mali
+              - mediatek,mt8188-mali
     then:
       properties:
         power-domains:
-- 
2.45.1


