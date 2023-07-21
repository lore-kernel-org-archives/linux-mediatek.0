Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEDFC00528
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 20:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99RMAZN9YJ5f/9bjOIwGLYwaX6ieL2Tz0mX3g9OfMmM=; b=w2rULBRrVoafxe
	o1D2qNdlVw82nEEv/ldX+3h/baT2zp/GgYuWrVCBbfxdy+PUQ2cst3ELmS2C77qMYUIyrHHon73CM
	hV6q0qQJa+K6oX2kVrYKpOTSkmLVyYsjBRWQioSXYflLJAm6mTFbVpSZmTaOm8RGiBSN9ShAiTPwi
	EOkqytXOPlBt8u3+ciMhKJ9h7NT+V3BII65O1IRH9MZz5GWpojtUgXgikAbFzSmHZe1qF1B77euuT
	eGKWup1IyFKCii8F6Tc5RD4gFFSaXRF68O1uQqYA5fD3dK725+1CVxkulC3TWIh9gTeG30tdWZwD7
	Zt/dfiUeztK6aXPqwvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwZ0-00F1rp-05;
	Fri, 21 Jul 2023 20:17:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwYw-00F1pd-1B;
	Fri, 21 Jul 2023 20:17:19 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A478666070EF;
	Fri, 21 Jul 2023 21:17:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689970635;
	bh=WL+uFpD62iqe6y+iIExP4+zt+Ry9pEUG8xx3SgYjepc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mthopCXn07bLkBcDRydeRNpwgZ7pid1+N0F0l7YEl+Qz53sS5b1fWzvOPJktxPs5j
	 iw7ThZEacXOd3+g2tX4OMFviy7zpnCpQIVvVbZxySGiBFvZL9Uugl7WqeDPTJ34mLs
	 FUwDm4Z4btRb+4L/LEFnfWS6gVBpMZu1avWAp9a5SDw5jQmzb0yBUTzbWBjgAE5JTK
	 zngEZQJAwTO9p/TRrKssYP6D+/KOgnW5b+Z9RasqEwjWvLMCf3Rb2+afGdJVgKA7Ts
	 Fi9buzdVMm06WR52N/y1vKxLXhl1Xk9Vl+BaYzkv0iR/fgWE6ujGjnY6e8Gjb9mmdG
	 t9Cg9EMNql2Ww==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/5] dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
Date: Fri, 21 Jul 2023 16:16:54 -0400
Message-ID: <20230721201705.387426-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721201705.387426-1-nfraprado@collabora.com>
References: <20230721201705.387426-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_131718_552607_2681B5BE 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding for newer version of Google Hayato: rev5-sku2.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v1)

 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ae12b1cab9fb..11458cd16109 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -133,6 +133,12 @@ properties:
           - enum:
               - mediatek,mt8183-evb
           - const: mediatek,mt8183
+      - description: Google Hayato rev5
+        items:
+          - const: google,hayato-rev5-sku2
+          - const: google,hayato-sku2
+          - const: google,hayato
+          - const: mediatek,mt8192
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.41.0


