Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688AFC77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OS7Cd231F040G33nTg/JdwMNbg9I56weKfa+JuzR9V0=; b=JYzKgFbpEbIRjY
	OJ+i2KwUlBySry6LU1UHtfApqgKDThhjcBHzztIHeIFlcfhwEOhaPIlLYmO3AiByRT3tbhWzKQKcn
	+jVrVhFTYAZnUFPyRgeQ0lf1X9z90TFcnpTKtlti5BQEn71TWIDz24/6tBjgEHnYt/zxQlj2ozZuj
	dihG/22eAmPFwoyib8i1azPvQvRI0Ghj5BiAwokqIUWGkkyZcmIJCf9w386kozyaj7GyXDnKks0bG
	nKwwVVHRmfxc/PIVIcCxxpW58OM3c5APrONdzg5nHrAN6e9tRxuXpwh1mtN4D56IJ9TOSxGfUoyf+
	lk9RfZb6t9VUHnDh267Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fZs-00B54L-1D;
	Mon, 29 May 2023 16:18:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fZp-00B532-2N;
	Mon, 29 May 2023 16:18:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so22764575e9.1;
        Mon, 29 May 2023 09:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685377112; x=1687969112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OS7Cd231F040G33nTg/JdwMNbg9I56weKfa+JuzR9V0=;
        b=odFSh468vCEXSATMzrGBnyFPDEPBnu3/GVtTQzp2WbXOltmvSGkGEzlC+K8uKcxOUK
         BYYZO3kOcY8anhzgBOM6eu2JYSW1pbA8imDeBahG2zyaSZEaB0IcQh5Ze1XwlYq4jIDY
         KelS15P78jje2Xt/QEEsGMzhwwlpa5oUQBJ1dAWnUgDFDo8WAy3DvrQgmAHMZ+JDff+L
         C+HUaai8+J2dlLY0DigOEZjxf2blWamfHgxRO/kjSklzV24Si3sLDtOa8183sh/g7NiP
         OMgXLYoeAhgFdMZIEnib1pOtsX2fU4TsK6pA2bkKNPWSkiM2WC4x7RsOvk4Zoblle2YU
         fETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685377112; x=1687969112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OS7Cd231F040G33nTg/JdwMNbg9I56weKfa+JuzR9V0=;
        b=dLSpw5lHZrsU1XKYv2zirEThyk9rp54nhE89kFhcrPPaAW3ociaI3rzHnizJtmz4an
         MGrTDfv+WAYi0Yfj/tslSMnlTFk6CM9dS5rZsuip4e+qGQanx0uVBIIgCleBHHMTBa5I
         UOEoisDHbCQbT8rUvcfEi1AcGKnhOwJLACIk2RwaYcCobmJ0PCawINalDuaugmRW4wZy
         sJb86P7xFi6NMWnin8NI8TCpQhQvj3gmsNYPrm9xBQcljMlvA4F5dVBa6DEmmGHzMFpK
         GmGVBa4ds10kccUyvgd7cTKNdZt4rAkMQ4aQUTZUbX4M2u0qUfmZwO1r7y0B6pUrUcvK
         M/ow==
X-Gm-Message-State: AC+VfDyLmbEve9WY2JpyMv6pf6pX1a9kxpMf5QeTW0boSbLxQ8Vtpc38
	cCvkmKVEoc7ydp/Ui2e40PA=
X-Google-Smtp-Source: ACHHUZ5yb7656A5Pt8QU+Hxu5DFAGjmIz71TZJhb5cmkFGg3fCgQ27dRj5NsY4DDPtehbz40yOKrMQ==
X-Received: by 2002:a7b:c84c:0:b0:3f6:cfc7:8bcf with SMTP id c12-20020a7bc84c000000b003f6cfc78bcfmr9832893wml.34.1685377111877;
        Mon, 29 May 2023 09:18:31 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x11-20020a1c7c0b000000b003f50876905dsm14723899wmc.6.2023.05.29.09.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:18:30 -0700 (PDT)
Message-ID: <eb9d9814-2dd4-ee87-b1ca-4660b59abec4@gmail.com>
Date: Mon, 29 May 2023 18:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: mt7986: use size of reserved partition for
 bl2
Content-Language: en-US, ca-ES, es-ES
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230528113343.7649-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230528113343.7649-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_091833_772908_BDB1B553 
X-CRM114-Status: GOOD (  21.59  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/05/2023 13:33, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> To store uncompressed bl2 more space is required than partition is
> actually defined.
> 
> There is currently no known usage of this reserved partition.
> Openwrt uses same partition layout.
> 
> We added same change to u-boot with commit d7bb1099 [1].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied, thanks!

> ---
> If the bl2 does not fit into the bl2-partition (cut off), board does
> not boot, thats why i want to increase it now. My current bl2 is 197K
> for nor and i ran into this problem.
> 
> Openwrt uses also the first reserved partition to give bl2 more
> space:
> 
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/mediatek/dts/mt7986a-bananapi-bpi-r3-nor.dts;h=f597b869abc80d1a73f44ebb85ad4da17376bb52;hb=HEAD#l22
> 
> so imho it should be same in mainline to not require complex bl2
> compression.
> 
> have now sent the board-specific dts to uboot too:
> https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e
> ---
>   .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso     | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
> index 84aa229e80f3..e48881be4ed6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
> @@ -27,15 +27,10 @@ partitions {
>   
>   					partition@0 {
>   						label = "bl2";
> -						reg = <0x0 0x20000>;
> +						reg = <0x0 0x40000>;
>   						read-only;
>   					};
>   
> -					partition@20000 {
> -						label = "reserved";
> -						reg = <0x20000 0x20000>;
> -					};
> -
>   					partition@40000 {
>   						label = "u-boot-env";
>   						reg = <0x40000 0x40000>;

