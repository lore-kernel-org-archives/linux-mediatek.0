Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805B7C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QFA3/mQhLy7fgYMGLPprlm0hS1YDC7NiRtX/q+sS5cU=; b=RfPHPcb0wDy3LvsxGgDNEMYUSU
	MXbwf6IhZupPoBNf+e1D9a/2UFrroOU4TnXtdqF1dpCfWTaZ6dExwty3V9TlmPMnN4nsHyIEGUzvZ
	DJvnV4lmhxrHB+Wd3rLbsq9aYwKvxblN8OpVKeRFiJ1mt3m9qQ4qkH5gzOplU1H9pD4el80mCxG2e
	L86NZolmfDSXi+9Lqicz8IFw7sqIHh4ILOaFDBtfmoLRRS7hTdJPJXBy8ItkbYyytRwtW+6MrUvcR
	mZPqSsxdJzaEHtFIORdLx7X59W5aL+ZLLpo0LDHvXG9WaRF3q9tPAO6SzDrCNLwqiUOMPSxpO7DT0
	0S04AW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOHeG-002vlI-17;
	Fri, 12 Jan 2024 13:32:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOHeD-002vkU-0r;
	Fri, 12 Jan 2024 13:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705066350;
	bh=a3smX73X/DO4mpCygf5S67DyKKn/F9+tabtj3srXY1o=;
	h=From:To:Cc:Subject:Date:From;
	b=d8e8vYat6IVxhJU0Nb1ligWNmsdgMgpmSW4Ig5CFnXPLLC/dxKs/kRFHjU3rF5WrJ
	 AQSIUPLG4cWI6M1Boj1UttPt+XvcuUe69jfWbxVj48PXRLqrJSBNo8ehDnCsDt4jNG
	 Cxd6SKa/5zOkhWqIaQoht8O/XzisZwFHrPhFXcSM9x14SgGiVPgqgD3yVjC/abrKHr
	 lGfxygNCxRZOnvgtVJWz/ebCmLUhsciRF9IMFhuRDu81oDJkT5JxfQVJgjmVIwIqoO
	 oWXGQQfDNkx2X0hGUK+pnx2YYt7A1qfud8lobobtNsEeVJjSvxw3EgHtVzFgpJ1nji
	 HMivCm+jberMA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 939E53781FE5;
	Fri, 12 Jan 2024 13:32:29 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: usb: mtu3: Add MT8195 MTU3 ip-sleep support
Date: Fri, 12 Jan 2024 14:32:21 +0100
Message-ID: <20240112133222.240038-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_053233_492957_4A4D70C9 
X-CRM114-Status: UNSURE (   9.39  )
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

Of the four USB controllers present on the MediaTek MT8195 SoC, three
of them (0, 2 and 3) are behind MTU3: add wakeup controls for them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index a59d91243ac8..d4e187c78a0b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -185,7 +185,10 @@ properties:
             2 - used by mt2712 etc, revision 2 with following IPM rule;
             101 - used by mt8183, specific 1.01;
             102 - used by mt8192, specific 1.02;
-          enum: [1, 2, 101, 102]
+            103 - used by mt8195, IP0, specific 1.03;
+            105 - used by mt8195, IP2, specific 1.05;
+            106 - used by mt8195, IP3, specific 1.06;
+          enum: [1, 2, 101, 102, 103, 105, 106]
 
   mediatek,u3p-dis-msk:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0


