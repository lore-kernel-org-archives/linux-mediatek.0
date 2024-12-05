Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C977E7716C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4ssub2oHj1XQWaekdv+c0iO6yU2XYhJflP7PVgCVxw=; b=ENJVq3hQ6J4RhYxpyetCAIJtFb
	lo+YlTPIb2BPVCW9V6Oku1KTCfJZw1jlNHpkjUnNI2eiqzGE8jANc0Ftig0vfe3wRXiq+/IXPrZ2c
	sMt4KegQrBP7G9+UNjP0MLU89+aKOF3lQizNgmMlH8ZsObSLXfzl7M4BfDlpd8g1MXig9Zlwx/hky
	U/BISmyrTAhQxOZIMLbwgjn7oy2H8d6eMFwOzEXz6hUwy4FkBc56Dtq/Rthuasf3jdAA7uqGeb+6o
	evDuvq+OF2j4CbdOFIzRLGkvpo9Og5gxKZab93qebd7jPPfVjvrvcoJWdaw9b9ELdAfWUnJ6mipQR
	py0Zq96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBER-0000000G0c3-2isS;
	Thu, 05 Dec 2024 12:45:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBAb-0000000FzZv-3dEs;
	Thu, 05 Dec 2024 12:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402484;
	bh=HO0wXGzhDvgrKBdJi7+/8nVYZ/pZQYioghULZD0qjqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aOzgpfaY0TmEBk4soLcN6wXjvOIK/KhkM2yCNrY0T55tinTVZmWGVnzCruNUqUrRK
	 VloxJi6n5F4lESgTIFAqIEVKP/pyK1wORtxVWe60RzpzCah+cA/h/avbuMD3ggk4gs
	 QA7cKy5fG+YEe2NHFvFqfJh2ltiIe2FnvcjYOvoA/Yqo4RPtios+9XokGEdnu9A9V3
	 FbiCTkQKgB0xj6Ijxd6e5vEiQxZe0nnMQdI9E+IuaW4CHnTWKNqf48NgsBP2yJwVPK
	 H72H0ITEThfLkRK5emjJ1JX2R7kstw5LqBE7EFw2ElTfRkoz2O7zuWFOANE4ZImGLi
	 Lb3Ky7+KGFHpw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F6B017E369C;
	Thu,  5 Dec 2024 13:41:23 +0100 (CET)
Message-ID: <ef8db876-bd06-4d5d-96ff-c570beefaa9a@collabora.com>
Date: Thu, 5 Dec 2024 13:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DSP
 properties
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-3-0e955c78c29e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241205-genio700-audio-output-v1-3-0e955c78c29e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044126_046330_AC37BBDA 
X-CRM114-Status: GOOD (  15.96  )
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

Il 05/12/24 13:13, Nícolas F. R. A. Prado ha scritto:
> Add the mediatek,adsp and mediatek,dai-link properties to allow
> describing the DSP configuration in the sound card node, as is already
> the case for other MediaTek SoCs.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml      | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> index ffe9347b543f5c687433862a21ad534b8aace27e..1e282c34dbd99851d3959b641096968c0b2e71be 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -33,6 +33,16 @@ properties:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description: The phandle of MT8188 ASoC platform.
>   
> +  mediatek,adsp:

This is already upstream

https://lore.kernel.org/r/20241105091246.3944946-1-fshao@chromium.org

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8195 ADSP platform.
> +
> +  mediatek,dai-link:

That shouldn't be needed.

...so this patch can be dropped :-)

Cheers,
Angelo

> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      A list of the desired dai-links in the sound card. Each entry is a
> +      name defined in the machine driver.
> +
>   patternProperties:
>     "^dai-link-[0-9]+$":
>       type: object
> 


