Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF557C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 23:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98Tc85EuDyxwX9CpzA9xhFHIPw1tuYPhqYBrpF4fse0=; b=ZMhchl4+TSrLnTAuq32UApnPjT
	+KPQhWloIpGbKhZYesCWlRqonu6VdaSCYT5Z/L5J7EPpXALoasY7ITiLc0SfcLlno0ji8lhCE4igM
	sieEEtJM+iMjYjBf5TqOiVg8rbOWMnGEQ5CesdWWF3zY5Wu5lc+3q8x3vB9HYS+SG++l40hureBy7
	bY3R2VsfbegcmDxVEvXBeBuAPwgE0I6RPf/hRMIiE7iCw6TglTR/oR5mqCVtTZ/HRbCnOCH3THCke
	xOREx9NC55ihE3In1TRwE10X6GA/5BpYJWJYR3wMiHfTlIPWh1rldha3ZhGTT+RYNsVpdA4qbmyMu
	VksZRtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on6XV-003LpN-3C; Mon, 24 Oct 2022 23:07:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on6XJ-003LoX-0p; Mon, 24 Oct 2022 23:07:14 +0000
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7D27D6602319;
	Tue, 25 Oct 2022 00:07:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666652824;
	bh=syu6x+tQMYyXRnROEzYyOqlWI3pV6D/rMZw1lLuGM5g=;
	h=From:To:Cc:Subject:Date:From;
	b=bMUwQ7iyuh1NncKE+xbrlV4imgXvN327I0B1FFYOlO9RvlB4/vL5xDB5HkHfSrltg
	 jqoPN/y0eDEWf0R0TqfMACGkLH/iC88vUEJEyjIy2hzRo2TL51zDjk84uo8rEZ2O2u
	 fJ3Q9lCEFsbQAMMS+eT8uN+bdrbkWyQXLKaw+AN7nnZBTdJ1GopP7mGKT72fbCCtJA
	 QkLmUSxiIDx2kftHEj3WQeYtpXNQpLRoBXZK4KrZRyce8QGIaCa5Kw/+2RRTT/6RPo
	 wSsVI2XKgM9bJnwXyzcxPRU/XPrCf+rLUiVsmj0VlLDEDvu5t7q4vIC9N4KP15I8HQ
	 S+iDU7uVQPNDA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shane Chien <shane.chien@mediatek.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not type, for sound-dai
Date: Mon, 24 Oct 2022 19:06:57 -0400
Message-Id: <20221024230658.1772907-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_160713_313551_295E5ABE 
X-CRM114-Status: GOOD (  11.18  )
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

sound-dai is a standard property whose type is already set to
phandle-array by sound-dai.yaml, so there's no need to set it (and
wrongly so for headset-codec) in this binding. What should be set
however is the maximum number of items, which for headset-codec should
be 1.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 478be7e3fa29..c6e614c1c30b 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -34,7 +34,7 @@ properties:
 
     properties:
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle
+        maxItems: 1
     required:
       - sound-dai
 
@@ -48,7 +48,6 @@ properties:
         maxItems: 2
         items:
           maxItems: 1
-        $ref: /schemas/types.yaml#/definitions/phandle-array
     required:
       - sound-dai
 
-- 
2.38.1


