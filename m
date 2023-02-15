Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA38DC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiWMajGyv4pUEc6LQ35x6+6K731whfqz2L60SMBRWkI=; b=NaRtzxa5EZEfRXqGHfgKhQAdZ7
	A3emIQ5OlOfYCUOU+6yHgfaVF3uWbkXkCTqMrGUlIkDivtkD4HNSR2/dIMk6AXPodZvGYTwiT+g5B
	ZF26bDT4X5NKdyVmiT3lPdzY7plbBvFJ3IIHSDLlIo7RFEUA8JLiqg7bD0CbfftHNjdq5Lh5MGOOd
	07/eBSwEz8FeiFD5nqxYYDeymGTzwM15znMtQBIvZZ4c4puZUn/QKA5D099LyQiet4Jc40sLlWN7i
	bgNY/OFzKLYQIN2tXJad0HPdcT7mNyeaCHruPzDIiW+Y7VSlfWfd6mCbatyMmxyDR/G/Xa56mchK7
	oMooe/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHxN-0062EV-HW; Wed, 15 Feb 2023 13:36:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHxK-0062Cc-Gd; Wed, 15 Feb 2023 13:36:20 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pSHxI-0005vW-0N;
	Wed, 15 Feb 2023 14:36:16 +0100
Date: Wed, 15 Feb 2023 13:34:39 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: [PATCH RESEND] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Message-ID: <Y+zfb2uQyKHng0kS@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_053618_594591_E2F082EB 
X-CRM114-Status: UNSURE (   9.72  )
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

Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
been added. Also add the compatible string to dt-bindings now that
they have been converted to YAML.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Resending this patch as I missed sending it to linux-pwm when first
submitted. See also
https://patchwork.ozlabs.org/comment/3049442/

 Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
index dbc974bff9e9..8e176ba7a525 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
@@ -22,6 +22,7 @@ properties:
           - mediatek,mt7623-pwm
           - mediatek,mt7628-pwm
           - mediatek,mt7629-pwm
+          - mediatek,mt7986-pwm
           - mediatek,mt8183-pwm
           - mediatek,mt8365-pwm
           - mediatek,mt8516-pwm

base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
-- 
2.39.1


