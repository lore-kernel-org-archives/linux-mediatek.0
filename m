Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVts4r3ZWwL5e4rf2G1UDHUleZWTwDpoV8po8yAqzIc=; b=scVVWzcwAAf6/I
	5fnYcai34LqL8iV9evmAIxWcttm9ydFvGr3HdRdxvWSRXFJ5X/awIyn6WJKRbFbFBPZx211yJYOm6
	qcq575X7GSc4mewenT5r8CYOBbEXb31etLQH2RABf9xejFhmE4aLFMQDEFV16TuItkL8QCloQDJo+
	p0w8ERFscjH3AHVM+Yx0dsnP64HnIhHnc43Cuw66+9KQw4/u5Jl7c+wa2VNxE7QPGhPwowZYDHuVX
	phIHMrYXY0PfH5WM95KOC71o/2Bcz0jD/64G3CSMeWWm6WMcByfKxTNo9jPAyrwjXk0jeOBl9z6Qc
	QITP7sBqY0HDgtYblxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwiq-00FGHp-6x; Tue, 01 Mar 2022 07:15:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwia-00FGCB-4w; Tue, 01 Mar 2022 07:14:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 a13-20020a05600c348d00b0038188b8bbf6so589286wmq.0; 
 Mon, 28 Feb 2022 23:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dMkVK0banCGS1SiaiD3Pe8NqYzc2z8K/wyEPw+N+YvU=;
 b=ib347cIt3ntK1P/QPyVbu2vUwQsRjZbNdUDSmPJeHxjB7RNf56VOiV6hjCN1rkVyrK
 p7ixJLG8+O4nB1pc5s322BKZjlpyAL4EBxERgZdxRLIqOhhPjRdbsGhn0dEx0HP85PJJ
 /1NFNhkVR3alsfWEMIZCE/wce81GRXXUpUuNb/pE442lUCTMQbLWPYW5vrXkfhhYHgy9
 1opLYjWvXCNiAuHObmpW0m7XBx/tHm5fmgPLzPYz1q8v9N6k+OxKTt3K4w2ErvakWro0
 uOHjAXwpLOeTWTxvrLcffHd3g1cXDrsH2Ztnixohp1uBM1dl8TMY07dQPMAO7MEV7/54
 Li6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dMkVK0banCGS1SiaiD3Pe8NqYzc2z8K/wyEPw+N+YvU=;
 b=GD94LkuUMhWhuPBxYn6+YU/tpgqCV5rexjLbG2ZV2Hq2w2Hu7Bzhlpk+v1JelFdqir
 OT2jHePvqXBFjPAYQHOMjvc1gwNEm/UnHVKpTduBA+3zvXXENUUjHSfTrEft79xXzI9T
 FUf3tAGcmY4XSblrR2lZ2niCf48Iq+IMHvM9iVWGAEI53rAD5Xdw8ClEH0eST2HPPhn5
 1Ig7GpbP3fo3iMAvp+xPeIziW1eVN35bwlErNAhUilGfxdRZ8GvtAjr7BuONun1fIzZL
 1RQRSqY48vGxv7D8dlbkRp0WIEkvavYrUeBN3dGdzEMdMqbD2Sjuz5zCoOlg0lJYxRp8
 DALg==
X-Gm-Message-State: AOAM530NbfWWB4KtMJWezzPK6Ow0tNoZf9NV5GOlVPFLVtvEqJ7MVOy3
 ln0kFqc27O/NjQvcW+ugDPQ=
X-Google-Smtp-Source: ABdhPJw86wvyFdv4N7Lgo+V4+RrPrPEo8SsZKzNeoYzKkuCc4Zz/khabOPClOAl/SG1YZ3AWJZW9+Q==
X-Received: by 2002:a1c:4b17:0:b0:380:e44f:426e with SMTP id
 y23-20020a1c4b17000000b00380e44f426emr15843929wma.150.1646118881620; 
 Mon, 28 Feb 2022 23:14:41 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 i12-20020adfe48c000000b001ef6eab4c81sm12113858wrm.96.2022.02.28.23.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:14:41 -0800 (PST)
Message-ID: <c5d61fe7-5238-58ae-c782-5e28531d9b2b@gmail.com>
Date: Tue, 1 Mar 2022 08:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: Add compatibles for undocumented trivial
 syscons
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220228221537.1700071-1-robh@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220228221537.1700071-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_231444_236460_25B95CB6 
X-CRM114-Status: GOOD (  15.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 28/02/2022 23:15, Rob Herring wrote:
> 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc',
> 'mediatek,mt8135-pctl-a-syscfg', and 'mediatek,mt8135-pctl-b-syscfg' are
> all used in DT binding examples and/or dts files, but are not
> documented. Add them to syscon.yaml as they are all trivial cases.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index eeac1cbc5a17..29d4a97f7108 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -44,6 +44,10 @@ properties:
>                 - hisilicon,hi6220-sramctrl
>                 - hisilicon,pcie-sas-subctrl
>                 - hisilicon,peri-subctrl
> +              - intel,lgm-syscon
> +              - marvell,armada-3700-usb2-host-misc
> +              - mediatek,mt8135-pctl-a-syscfg
> +              - mediatek,mt8135-pctl-b-syscfg

Thanks for filling the gap. Would you mind to add as well:
"mediatek,mt2701-pctl-a-syscfg"
"mediatek,mt2712-pctl-a-syscfg"
"mediatek,mt7623-pctl-a-syscfg"
"mediatek,mt8173-pctl-a-syscfg

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>                 - microchip,sparx5-cpu-syscon
>                 - mstar,msc313-pmsleep
>                 - rockchip,px30-qos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
