Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715DEC87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEwUmic4Z5prQL9//Xlzjumx0S4juaPb23aML7EElLM=; b=iArdEj7bVFA95dCgGg1vIexEtc
	3N6XvmdEUJtfaF4ci0ddei9vQfoM9i93AI6DdCu2Y55oaY9109iKiRYyiT43yRAuvOcSqimaRPIPO
	uS+Cr2bgdW8a+d/ZCt0QnZY/Er523hMqymCPY+LQ/GU5IDbbJUwAVSiACNNhMrIi4CPX5IxskFE9N
	tE+BrObi1D1luZM1+KZsnOJtlkuxu8Mbs9/Kzpjx/WLp/GJQsLh1j0JadxAnsTCp+x6kf3Y20FVJq
	eOQUkXGj0bOLfYabYddEKyBNUMFIsRri13f0Ix/BYY4Z0KeSQYnia1BKpB5ljAG5yeVPd5ncxw9Xy
	DzexeKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnrE-00000005Y9k-3uey;
	Fri, 01 Aug 2025 11:23:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnm5-00000005XGs-2MPo;
	Fri, 01 Aug 2025 11:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047087;
	bh=vU24Rbtm0qkvmBCpmr+GYFE8OyNzvp1wYgPZVrYsMQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kyAnGIB98LHZRdNTavPx6q1F35dD8JxU7OTKE/GovJYD2QCneLHNNMusM/Nuauwkm
	 lea4bGbFwhrne0by4YUTPvTOC6U3KnKcBD6+LoqV7vz5f/lHf5e8CPjiWHQCz+Fwvk
	 5nyMhpgQluT/QGcXGSc9FLSgqSy1SoefIYDKkIk6OGm1eN/QgdW5Ad27Dj2APN2Emt
	 xtorYFTGeVaPeIjlSzzM3SdMT8D3rSPj7bDGO0v6hCUYCojAEpzwPswIRCmmQOY5gH
	 yPHe4H79ib6M+OO5CKPNb2lqd5Mbs8EaLItATf+pznXn1uoS2YOGX1t+QNyYxnf5eM
	 oQfH1/W4HJg5A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04F6417E0256;
	Fri,  1 Aug 2025 13:18:05 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:03 +0200
Subject: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_041809_749140_F397F7C8 
X-CRM114-Status: GOOD (  10.13  )
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

The mt8183-mfgcfg node uses a power domain in its device tree node.
To prevent schema validation warnings, add the optional `power-domains`
property to the binding schema for mediatek syscon clocks.

Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,syscon.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index a86a64893c675ac134af609b3a49242565db6ad8..1011bc46cfcb97b90b86019e95a7e4bc8a819342 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
@@ -76,6 +76,9 @@ properties:
           - const: mediatek,mt2701-vdecsys
           - const: syscon
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 

-- 
2.50.1


