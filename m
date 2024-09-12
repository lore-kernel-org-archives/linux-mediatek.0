Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A113DEEB565
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kog4Agco51WUnzGvZsP74ArZfwFqloI09oRuKhTkY7w=; b=3PrNPeQTRo98/zwfLzEh3vDhPw
	fPDO9gPe8fEvBWsvppjghP8Y3p27tF95AU6B4xFcI5On1XAIiR6o7BEOT2bolyypw6guv18GMgxpn
	fbfOozQo4OIBND0/O52SfMc5vxVfXoGo480/y6Ha77IO/OxYQqcimY7EyeN5yRvKxAO6YzYnm1gMH
	oZsNIvSgPYgPBSJuRp3+p9rbttmmqMn0WEsk+nK16SihwbAYyDNxLGrOoD2asKSaYAHP/YvK1up62
	+VnRJgNojno1fNC3Rij/VY8smH8NLqC8rroGNlxfRudpvsZ3m8MVxFF9aHVCJ5us1RFhdA7QhPgtx
	/DNAtKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofZF-0000000CRKA-09Ur;
	Thu, 12 Sep 2024 08:52:45 +0000
Received: from a7-32.smtp-out.eu-west-1.amazonses.com ([54.240.7.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofZC-0000000CRIB-2E4d;
	Thu, 12 Sep 2024 08:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726131159;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xJ9eCl1S0Iib7OyTFXyfu7E4QHZm/EK9MdR3L+m6jec=;
	b=WFHJSOch1FvME8xcQx8Vv+DhTaiZg8MNLVbiPbL5Lz2hytT1xDhsRd7PPn4D+cl9
	DP1KBtLfO1dDOhfLVIRyTi7VsQi6JkSUyQoKib+Y9McTG0EI4AUaOD81ZQsAQl96+OX
	t4aGLD8D58xVjF8qe+0S15lU+wzcrVdKNqqW6UV9dQUQiKx9CNAVzqm5eLm24MsIo+S
	EeuvjJj2hLn/Ja5E5YGyeufA8386U6O2Jj+f0yQZO9q119XS4nTpFPMMMTTnIohxXyD
	l8kqvgAiU7XVN1pb8tC3Q13r8Q8WXLTbLNnkM5JAaMBEYtftQEatV/ZIJ5pJl+5jHGv
	75wKXDK99Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726131159;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=xJ9eCl1S0Iib7OyTFXyfu7E4QHZm/EK9MdR3L+m6jec=;
	b=MztR/XCHSiCKUwbLYZTA3+Hhe+xQhiGVyicjuvUX1zjHqP6/8P0tiOMhNN0fA9fQ
	o8JO9d9DUrihPvbi8u8nICihzwrIyl7iyKDGrIpzKUoisFUTPxWIq6Yv/AVbO/MKCCq
	2+FYZKMRNJn5xpWQmIXOOXzZRM6//pNiBsOmKpe0=
Message-ID: <01020191e56f3f66-1afb592c-a676-4871-b75a-bc38d896ae03-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 08:52:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: mediatek,mt6357: Describe
 Auxiliary ADC subdev
To: lee@kernel.org, robh@kernel.org
Cc: lars@metafoo.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, andy@kernel.org, nuno.sa@analog.com, 
	bigunclemax@gmail.com, dlechner@baylibre.com, 
	marius.cristea@microchip.com, marcelo.schmitt@analog.com, 
	fr0st61te@gmail.com, mitrutzceclan@gmail.com, 
	mike.looijmans@topic.nl, marcus.folkesson@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, andy.shevchenko@gmail.com, 
	kernel@collabora.com, jic23@kernel.org
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
 <20240604123008.327424-3-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240604123008.327424-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_015242_776060_FE6EE4E0 
X-CRM114-Status: GOOD (  12.29  )
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

Il 04/06/24 14:30, AngeloGioacchino Del Regno ha scritto:
> Describe the PMIC-integrated Auxiliary Analog to Digital Converter
> subdevice node.
> Full description is available in the mediatek,mt6359-auxadc.yaml
> binding relative to that hardware.
> 

Hello,

I just realized (indeed too late) that while all of the other commits of this
series are upstream, this patch was not picked, causing dts validation warnings.

Should I resend or can you just simply pick it?

Cheers,
Angelo

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/mfd/mediatek,mt6357.yaml       | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> index 37423c2e0fdf..e3513cad25f6 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> @@ -37,6 +37,11 @@ properties:
>     "#interrupt-cells":
>       const: 2
>   
> +  adc:
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml
> +    unevaluatedProperties: false
> +
>     regulators:
>       type: object
>       $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
> @@ -83,6 +88,11 @@ examples:
>               interrupt-controller;
>               #interrupt-cells = <2>;
>   
> +            pmic_adc: adc {
> +                    compatible = "mediatek,mt6357-auxadc";
> +                    #io-channel-cells = <1>;
> +            };
> +
>               regulators {
>                   mt6357_vproc_reg: buck-vproc {
>                       regulator-name = "vproc";


