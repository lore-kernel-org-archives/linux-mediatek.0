Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279C3C87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuR3xYyhu9dZlNQ3EInNRyrbmBGHVm7vfjG/UwPWZzs=; b=AXh9GvhZ7QqmMzng8ZWLWia8E+
	VToSZ5ahKgeZI0TZ/y9L6PYsRMLEnHCfb2BQP19DAqwGNsrtYNXPw5bkFO5FZLf3qsnSTgm0tS0b/
	gIUG51KY4efoH//J0oPdiy7qwhS+gFVi1kU9KL4tb2KeoTU0X70ob+wSdjdRy67x89sMf9T2GjFdd
	A4+iLsqqnPnSXr5zHBbEnryZL9Qofuyvfqu8//nmDAwj3wZ5yCFr7K+5pMf3mIYjE6jOVOE8QSQJ5
	UbhMIJIfb4NXJA6pXANZ2vf8aMhrqskzes/uXCmCp7fop65mGc0zH4TODiRwTfv7BUViAu1vUVJku
	tFvz/bIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uho6Z-00000005Zpm-0Cni;
	Fri, 01 Aug 2025 11:39:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnmC-00000005XJP-1czQ;
	Fri, 01 Aug 2025 11:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047094;
	bh=qCAbH5/K+Dtx0sCXtdtamZe11GmeegYKDESNn8Qmre4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sylu1IPzGajMo8Iqz67dcl0WknNLdG7VD0UXc5ms75zW/51uN+iveZJT8yjIM4dwz
	 Abldbt5ctmcvRFBBypyM52pNNL+MS3VNhL6KURKKeRnZKnAX2wSt3yEN/mxrrIag5V
	 JsqVbxl+V8jFKW30x1iEJ4h5uJ7+uWbNqu3juIlx+7DoQss+xyme4jDprdGMhmhGPu
	 0ikn5q8fHuwa4zvS+lQykUW4d/6jRPvSVq0aDVTzekeMo4porvaSwEnMt1ikym+Sxx
	 zBtzpX5QmdXCJx9gupxAkKxbpQDrBZht3ozywccqt3cxs862kMHKSIBjXHGgrkgBeS
	 Ic/6m0xAHfMnw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9EA817E0256;
	Fri,  1 Aug 2025 13:18:13 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:09 +0200
Subject: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow
 gpio-line-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
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
X-CRM114-CacheID: sfid-20250801_041816_611591_DED97DDA 
X-CRM114-Status: GOOD (  10.46  )
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

Add support for the 'gpio-line-names' property in the MT8183 pinctrl
binding.
This allows naming the GPIOs, which is already done in several
device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
mt8183-kukui-krane.dtsi), but was previously generating DT schema
warnings.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 464879274cae4c5389f1210ba65c316ce6c433f7..3db2438fadc78bb45ae7f137abfbab14e462d138 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -48,6 +48,8 @@ properties:
     description:
       GPIO valid number range.
 
+  gpio-line-names: true
+
   interrupt-controller: true
 
   interrupts:

-- 
2.50.1


