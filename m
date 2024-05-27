Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36646C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjWlqz9Iw22uQSZFMqz/92uy77KqvpXPzgwpKU6ElhE=; b=3tc996j0tu9K6+LrRKnDWnukAG
	8Zr9VA/h09BhXSjF+b07dYWsMfm6JmSZOuiHFyFx65jUWOZT5XxtaMOu98wCTOVgLZeLhY2uk6qyM
	R9+OW5dWP9vz7jZcjKQlTYNdyLZv2evHxysNRdNJnCHze+rUWMfFiq8XtHY9koAHP9ldpnSZJq4B1
	OyKgiPetyK4x1BHd27q4gYIgrTNDPzJMOUr31i47gJpku7XnRbN9h/1Y/cWUoHQYpy5pY2T0Pi9LV
	n1l4yoqwFLlwA77WitdPy7FmVGWgwBPWxney50lg0Md3Z8a3oyXVG77CQ1KbNUlzsRk7ILOFQ3nEf
	Fxhu2PBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWbf-0000000EOSa-2Pyr;
	Mon, 27 May 2024 09:25:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWbZ-0000000EOOs-3sws;
	Mon, 27 May 2024 09:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716801918;
	bh=XVR8YE9RRnYslpsTdox8CwVpumNgWPDF20WRxi9WmE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZlgJ/9niwuZBXq9izGjUJTRI02i7jPQr1VbcQ6162TC+c3yqrx33tF7o1BOcBRH0
	 WjhrB3O39bRjZvjQjNA4bamPKF17UqZOs/n6TMARxigfdZsBUwlOmuNGaV76HeDUSU
	 P5E/VFSlat0O45CjUvfSV3dxLBQXtoWNKTsRuZgpPp+lkxOYlDIllbjvaQ21IPezMq
	 ojfTXeyNXiaTN27t5uQRh2s7zndRQFYClHfyAGkgw21i4zgeW2P2BXR0dcMgYPXHpK
	 xe/85nhHetEUIK0WgapR6zhd/tFi825YGnuybMgJYOheVhbZ3911cNiPUT8fdJQ/Do
	 TDq4ARw/0I0zA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 089153782113;
	Mon, 27 May 2024 09:25:16 +0000 (UTC)
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
Subject: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
Date: Mon, 27 May 2024 11:25:12 +0200
Message-ID: <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_022522_162089_85EC0C47 
X-CRM114-Status: UNSURE (   7.96  )
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
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index e796a1ff8c82..4cf676190ae8 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
+              - mediatek,mt8188-mali
               - mediatek,mt8192-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.45.1


