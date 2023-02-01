Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BC1C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmbJbzDNlN6WbohZyTgdwbbON8PQNzZ/sp/ZK7i4t+w=; b=F1fFam5BhcnVYCZx2uerCzENhl
	uOWFImfF7NiqYljk2WnncX3uYUv0evuDinZGoJTljGJcVO5QnXbc8gWL6I3Yzv2/9iO5stJP+nLgX
	jf1l/RRio+lG38FFLFYM8VtRPdtSQmdfSmfzOhbnxBHBG+j/58Eua3KIIlkWpntBgSuUV2HBph4Ng
	QuR2yVRGu0+MMPqJ6ufNMBhGXIJKGj9lfWPVwZZxtHOw2JE/nnUVeaqiAghgrA6hxTn4yROpahjHn
	G4xhZviIpXS/X/QF3ot5tgk5cMq0Tw22nIy8qu/76u5gVOyzGzznLiLiefbqJdoES3yKNZEtd1K/f
	HPhTCGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIln-00DMpg-Dj; Wed, 01 Feb 2023 19:27:47 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIlk-00DMor-JX; Wed, 01 Feb 2023 19:27:46 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pNIle-000267-2N;
	Wed, 01 Feb 2023 20:27:38 +0100
Date: Wed, 1 Feb 2023 19:25:57 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] dt-bindings: pwm: mediatek: add mediatek,mt7986 compatible
Message-ID: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_112744_678632_B00EAACE 
X-CRM114-Status: GOOD (  10.18  )
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

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
This patch has previously been submitted, but we decided to deferr it until
after the conversion to YAML which has now been done via commit
3e98855ca0cf ("dt-bindings: pwm: mediatek: Convert pwm-mediatek to DT schema")
See
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/Y39PjU1BqBB8tZ98@makrotopia.org/

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

base-commit: 66eee64b235411d512bed4d672c2d00683239daf
-- 
2.39.1


