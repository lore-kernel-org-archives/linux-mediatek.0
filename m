Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1A7CFB441
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb7wAIefetmyULqsThbIXGhjEAFrVWLHkT3y0uI9AEM=; b=P/mp7qZ1eJd9eXDifXt8Aro8Ne
	zQR6p0400O4/2hMATx0VtIGKcwzE0LPYggx3rySyYkY2gEjYtMLUSNYKqbrNqCcWkF4VGIYUiKt84
	8QkXQDyOVT/9y4OBSuEKn23eqKHAGHYS8MaGaa5+KQ7YP24nu+fe50ml1AeqNnk57NwAO3+tfN5ti
	EM27BnUUogcyJbR2saGFi37F0TkSw3hs1308qJc8AghAeRcP5H+PCytK+gW6bM/MBfFKgUXOooUHD
	XqqxAto5PcfOjr0YKZLayn9oQNDhKUUhn9ARKqvgoDhgrz+BkruNULq6VS111Pr2LIvjNsO2oXC7w
	eNSbuwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoak-00000002ggo-1J6R;
	Mon, 07 Oct 2024 14:20:06 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoPu-00000002dTF-2SmC;
	Mon, 07 Oct 2024 14:08:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53959a88668so5453806e87.2;
        Mon, 07 Oct 2024 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728310132; x=1728914932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb7wAIefetmyULqsThbIXGhjEAFrVWLHkT3y0uI9AEM=;
        b=kdmvTlcGG3+VWDnHK7rTE09JgKa7e2GM+submEa4frSCR7jrluEmc3mFYtW5pyWZ7f
         pnH9vTr1YbeIFPXqOXHUB/L0XlS0Sct6p8x2pSYaSW+VE7WL9ZVxtOMAu9sbGsiTevIs
         4O7S9JQlRdDBCjHQDpex2pMg94vtt1oCxt9KfjHcyiROsWAKR/wpN6B11obSFDb5/9xC
         euu+CbYH0NTk0fWwbkLURSoAQ2rUwYb14QQIL2TCngw+caXOVkg+aiZhXNoVqDLsRSji
         I1R108UdB9SeiQw1twO6Bneullagi29/4Now0HQCsoUMrdnFmtzupdaGRg3NCNxgj2Wn
         PCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310132; x=1728914932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zb7wAIefetmyULqsThbIXGhjEAFrVWLHkT3y0uI9AEM=;
        b=OsNZrzUknPyH/y6wnClbea5scQOkApdAXSUy2BxCqN27OrjF9XoTsrl4t3gyTMDbFW
         6JlQtFD5XKh1Gqwjm7WabhMVum04QcArnSHSsrtX0OSpzi9ZLrOndNUDx87h6NQCBbQS
         amw4Vg55iuLV/HsEKBDI8MYfuN5PXw1Ga06K3f1dvjPgkEvGUiExebmVaHhXrE1wvmdy
         QyFYym+/DzAj3bib0H0R0ZrEWi8UesZE8MvUPKquootHmXaywFYuo6MRdSaCAWW3CzOI
         n3t9TOPoOyzxxi9IxFl7oni36W7e8UTqDwxXG3r4gcVl1K29H87SO1QPQnvrJwQE4Myl
         +uog==
X-Forwarded-Encrypted: i=1; AJvYcCVEAF65Vsqf+5q6MGysIrABuVjg7kHHlT8lSbBjjSD7jYRzJIu+uNOwX6hM9osLAVbVImIJle6bKGKyN/UV8yIn@lists.infradead.org, AJvYcCVzGCePiXsL6EitvWt7gx+F89J95gabNZPTVjzok0ElrS/qplMnwCvrZkBuHldCVoUnM5cfdxdDDe3PIiLd2MU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXrRcneq7kfgkKdsD5YGyPo4DfecFHgsFkbl7fbwH+5RKQWaKY
	7BHhp9GnPnr+HKNKT6gDs99l9yssG/2tx5PQUaaAUGjP/53/Q4IV
X-Google-Smtp-Source: AGHT+IHaCEe4z3YIDSbWblPPM6gMGIDCD//Oy46/0gPja7JeJVxRCUO3xT6psfC7QbYmDi2s6H5LYw==
X-Received: by 2002:ac2:4c49:0:b0:539:947e:18a9 with SMTP id 2adb3069b0e04-539ab9e175bmr5803485e87.43.1728310131924;
        Mon, 07 Oct 2024 07:08:51 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1696f921sm5825596f8f.91.2024.10.07.07.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 07:08:50 -0700 (PDT)
Message-ID: <27719ca0-7794-44db-b8dd-9a31c726ee6d@gmail.com>
Date: Mon, 7 Oct 2024 16:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-700-evk: enable pcie
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jieyy Yang <jieyy.yang@mediatek.com>, Jian Yang <jian.yang@mediatek.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241007100749.6657-1-macpaul.lin@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20241007100749.6657-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070854_677938_E48CDAD7 
X-CRM114-Status: GOOD (  14.64  )
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



On 07/10/2024 12:07, Macpaul Lin wrote:
> Enable PCIE, PCIEPHY and related Pinctrls for mt8390-genio-700-evk
> board.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../dts/mediatek/mt8390-genio-700-evk.dts     | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> Changes for v1:
>   - This patch depends on the pcie patch of mt8188.dtsi
>     [1] https://lore.kernel.org/all/20241004081218.55962-3-fshao@chromium.org/
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> index 3e77f59f2c74..bb68665f0b2d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> @@ -393,6 +393,16 @@ &mt6359codec {
>   	mediatek,mic-type-1 = <3>; /* DCC */
>   };
>   
> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_pins_default>;
> +	status = "okay";
> +};
> +
> +&pciephy {
> +	status = "okay";
> +};
> +
>   &pio {
>   	audio_default_pins: audio-default-pins {
>   		pins-cmd-dat {
> @@ -758,6 +768,15 @@ pins-rst {
>   		};
>   	};
>   
> +	pcie_pins_default: pcie-default {
> +		mux {
> +			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
> +				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
> +				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;
> +			bias-pull-up;
> +		};
> +	};
> +
>   	rt1715_int_pins: rt1715-int-pins {
>   		pins_cmd0_dat {
>   			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;

