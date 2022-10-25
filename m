Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAD5C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UInQ6IVufyVY6isbWN3msNku8ovcQyxJatd+GjKGSQA=; b=eJqLo8s14b6hQ480o+Jz7GYj3w
	4QYpFRvcdlPlQt7o0RxWiKsOkBb87gZmPG5KWfvXzzNbJB96YANzuiJ4/IMD/U/Y0BLIOiUxSat2A
	i3YMBmyhXE1XpevO9jzs6k2Lzmths6j90mhPxPl3bS93mpi2Xs/ylOSQ9U95IhnK3JWIxyA0ohag2
	9l0ClSVOoIS8Ok2ffx+FsMCyAlk42Vdv8eBoLseINm83Rn2KYacY7eUS1Gdjy/7U+kn0QK3SQlCsk
	TWPm6x+Xw/mzX07+LHvFno8So8M0LqUy7RT3AIrYIilJBx/+GCAKCH0+8Kx8HupnTXmeeAk4Sn/ol
	S6F/snrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGeA-004fLM-Rm; Tue, 25 Oct 2022 09:54:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGdz-004fIN-E5; Tue, 25 Oct 2022 09:54:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80C206600011;
	Tue, 25 Oct 2022 10:54:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666691686;
	bh=1q4rZfObRZxO8+JHR7vaDLdjMed/BUEslgXYYLFJykc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hm8OPB+RilErmyhlGdxknvLlSohESk35wtrkkQOALlxFYD20WUCcfVZZ9C++ZvaN9
	 6tmUBRnDhdDqy1mZW9napuSWZ4ZbOBSFcG3TzFIb/FsY8tlJsgJRjy6wZxY4VLN86+
	 Mn2oxMBaryRVJK/Ioyf2I859SLpYqNwCrt51d6wg4KxevvcIDNVZJoiOs5P5MerB5P
	 ozZCc202zdiGCF5MzCHO+j8tnWx31gbqZe/epuk58LIVH4pExX6++UF1fb71BpOODx
	 1/GukLWmSm+6S77XUYAzTPlXv+GZ3jnqyMHZrsukDhrqtj6JEyP8kPJ4Cxd4tV8moC
	 TgnA0QmTjHnzg==
Message-ID: <2a771db2-5570-73a4-e16e-3bfa29deb8f8@collabora.com>
Date: Tue, 25 Oct 2022 11:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC
 bindings
Content-Language: en-US
To: Fadwa CHIBY <fchiby@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221024131544.31219-1-fchiby@baylibre.com>
 <20221024131544.31219-2-fchiby@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024131544.31219-2-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_025447_629209_CDA424A6 
X-CRM114-Status: GOOD (  15.73  )
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

Il 24/10/22 15:15, Fadwa CHIBY ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add pwrap binding documentation for
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Fadwa CHIBY <fchiby@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index d24e2bc444be..8424b93c432e 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -30,6 +30,7 @@ Required properties in pwrap device node.
>   	"mediatek,mt8186-pwrap" for MT8186 SoCs
>   	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
>   	"mediatek,mt8195-pwrap" for MT8195 SoCs
> +	"mediatek,mt8365-pwrap" for MT8365 SoCs
>   	"mediatek,mt8516-pwrap" for MT8516 SoCs
>   - interrupts: IRQ for pwrap in SOC
>   - reg-names: "pwrap" is required; "pwrap-bridge" is optional.
> @@ -39,6 +40,8 @@ Required properties in pwrap device node.
>   - clock-names: Must include the following entries:
>     "spi": SPI bus clock
>     "wrap": Main module clock
> +  "sys": System module clock (for MT8365 SoC)

"sys": Optional system module clock
"tmr": Optional timer module clock

....as it's not granted that MT8365 is and will always be the only user.

Cheers,
Angelo

> +  "tmr": Timer module clock (for MT8365 SoC)
>   - clocks: Must contain an entry for each entry in clock-names.
>   
>   Optional properities:

