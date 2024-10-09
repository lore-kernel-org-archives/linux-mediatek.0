Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCBCCEE350
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKY1SkhecFBYAETzRUszNHfLte1KfQX47BcePuGbEbA=; b=v1HUm0GOY/axYlsK/eQ+lBon0P
	J9jF23e4rKJpYxtnE5b3MLJHlIGM8mzLjAnz3Pz9CY5fbGppulEcpI44VpaO6YeDYe2tqVYJr4odR
	iPWiX3e5gcwVRuLG0glFIwtIGR2txwpb/MnySSy1hLTSQdsZhPJYteEFoE7SU9ZFlhagoJNiYq2XB
	yOlero5XHs75Pm6T128mxImCKFiHp581bWf2DAKTXK9GPit0IEhYJKAAKfDl5pjOUucJ47WGA3jgP
	IJtj0fu6tQZ2diUc+Ic3fOgSHrOhVQd00Q2M2oYghh3JJR/EnkihizTwXp7orVTKpN7kTYOZ/zOZh
	ilZRXfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sye7K-0000000Am4g-2hwo;
	Wed, 09 Oct 2024 21:21:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sye5n-0000000Alpt-1ARb;
	Wed, 09 Oct 2024 21:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AEDD9A445B7;
	Wed,  9 Oct 2024 21:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0292C4CEC3;
	Wed,  9 Oct 2024 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728508773;
	bh=Vt+z5p5sQcbBWZ3AwQ1076IwrQIkaCh7SdfsfMYjZQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXxiwNUKrF6OkSTYIaZo8fbWz/4mzh2UjHXR4xRlBFI7ovx1oHXRJKGKo+E3cuWDk
	 f4nrsL0Yxo4m8r733D4J0WLsndLHmC/9O8koEVe0zvOQP9PM0+p4Z/3/Us3NOH+QV5
	 WRKhYepQ64L00jmlGw4IoLQRIRcwP6KxsqR0cGBMxEAVHi3LNKP8TWt9dKRvSnT6xA
	 NzOhnyG/qazQBBXy5VlJgdMZrkOHcUg5ayqgTTheCfhqaKzfv1QW22fQCQpbVigxEn
	 RGFbs8kSedE3rDQBxqNnK82Lbt09aehYbIptEeD3PO2N6eL/c3PQ13GXVZ/P4GBDpU
	 INvipZOXA65UQ==
Date: Wed, 9 Oct 2024 16:19:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v4 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <172850877244.733887.12458885415029802904.robh@kernel.org>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009165222.5670-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_141935_448604_1BAAF506 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, daniel@makrotopia.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, john@phrozen.org, eladwf@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 09 Oct 2024 18:52:13 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v4:
> - dt-binding: pinctrl: fix dt_binding_check fixed-string error
> 
> '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
> 	hint: Fixed strings belong in 'properties', not 'patternProperties'
> 
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 571 ++++++++++++++++++
>  1 file changed, 571 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


