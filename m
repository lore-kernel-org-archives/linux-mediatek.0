Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD9D13587
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Oct 2024 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ2WYyGF0GFT3vSYcra1zUpfg+zSYnB8QcKAnlwig/Y=; b=USW4S6yxis1L+1M4cX7jCqXwxr
	t6G4KoGhoMvwv2y7uSjMqSUpEcd3IDyDmWKXDIZDQq+1FxWHrCwQoBiZjOBNuDsMRhJMQHfAn5foi
	0RgbWU3OlOMqpP3kdjwhwFp3zXBJcTnsah/k7EDMBx3psOyCBAYby56oTi5Wa95z2TqQ1o7W5ZKGC
	4L1ard8eojk3lNdVPKmYyti4DWhiezEzljvboVpwbDH2xXia2Zkx9ZufswGy0ANWGYsFOjx1YbbXZ
	sYs7CI/KzxFE1bzEF74mcx5mk2qx752VzyeYXLqYrWmcUGjKLb3TsSQ7L8liWlzRk8thABP/VmVSc
	DXwcU2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AJ5-00000008tOc-2Q13;
	Sun, 27 Oct 2024 20:56:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AHT-00000008tBB-3Ki9;
	Sun, 27 Oct 2024 20:54:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFD3CA400AD;
	Sun, 27 Oct 2024 20:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A44C4CEC3;
	Sun, 27 Oct 2024 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730062474;
	bh=2/SY7cEbrOd1n+Q4oIA/+7D/s8Dxlqav5A6rulFeiwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpUBkjQKLIg/MxSaS7yQD2D3MK30x8PBJ+ulbTB2LMQYacegiKfSxp1WzW/QhvNfV
	 xLLC57Qy1aD8cd8EleiJvcrMPRoh4nUwCXdenM0NrP0vTw9f/aRwkW0N6cdm55DVVt
	 +RXTg3kc6t44DlBcR3roEi1j4P8RKlpHnL6T7lggwOMT5v8tzN9KJ6pdnCrICEeCDA
	 43rzYfvKfh/4zPQyofcirmId0kERVFshiiG+z/TAt5wRCcfo97LbizilGQ6sjwcQ7g
	 IWwYs8DcP+uVJ8STQnZrh7x8j25pGLnwYW/uQUlIG5p6rBKyjzEiPPx4Xg+BU+bLmq
	 JkWtuoB7gd+6A==
Date: Sun, 27 Oct 2024 21:54:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp
 and dai-link properties
Message-ID: <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
References: <20241025104548.1220076-1-fshao@chromium.org>
 <20241025104548.1220076-2-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025104548.1220076-2-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_135435_925234_FE1D733B 
X-CRM114-Status: GOOD (  18.82  )
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

On Fri, Oct 25, 2024 at 06:44:41PM +0800, Fei Shao wrote:
> Add "mediatek,adsp" property for the ADSP handle if ADSP is enabled on
> the platform.

We see this from the diff.

> Add "mediatek,dai-link" property for the required DAI links to configure
> sound card.

We see this from the diff.

> 
> Both properties are commonly used in the MediaTek sound card driver.

If they are used, why suddenly they are needed? What changed?

> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  .../bindings/sound/mediatek,mt8188-mt6359.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> index f94ad0715e32..701cedfa38d2 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -29,6 +29,16 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of MT8188 ASoC platform.
>  
> +  mediatek,adsp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 ADSP platform.

And what is the difference between ASoC and ADSP platforms? What are
they used for?

> +
> +  mediatek,dai-link:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      A list of the desired dai-links in the sound card. Each entry is a
> +      name defined in the machine driver.

The list is provided below. I don't understand why do you need it. Your
msg is pretty useless - you describe what you do, instead of why.

Best regards,
Krzysztof


