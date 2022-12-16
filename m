Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CADCC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUbUQYdA9uIL1gANrRpWzNy+A6oN/aPQMxaVdqIc/Ec=; b=O+sUoB5lhfe47WIbGUOas3gkKK
	o8Ic7Av/NqrEPtMTkC8Vg4EGyrcXjiNRWo4W4aPhU5Aq1x3mGiBzqxW6stdD0QF6WxZpYTIjudSyA
	QtnIV7oK5CwwZhzRck7hgEjsGK5d8Z6JBFLKaNe2Uid9nh9i56RCRB/q59yQQ/+WdpypsarCMT4hy
	tdScdCYrBwjhhokYBTohGuHFidgxwkuy2LAMrPAeOFy8wLLRx11GUgyb/2lb4rDU1csFqc+Kvs+/A
	3sNItgMG2W6PkNuFajUh8xZT9XQY5I0sYdIEPnk5R98KEysHSpJSzNbXRbfYS/+Cd564aRy0gmVKs
	x2qS62Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68k2-00EPfn-Gh; Fri, 16 Dec 2022 11:19:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68jz-00EPcO-76; Fri, 16 Dec 2022 11:19:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h12so2131132wrv.10;
        Fri, 16 Dec 2022 03:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUbUQYdA9uIL1gANrRpWzNy+A6oN/aPQMxaVdqIc/Ec=;
        b=mZEodglBC9sPGG0EG0nvzNC65qvpe4Uk2UG2Jrp5/L6DgghUYDo5VOddfYhHemaO62
         T0PygbRqTcQr+iS1lwL9RXwyoAb+1T4ziqmXXMOKQPVcSPiZ2hbrEnkrITmhSKHKqDsI
         JResed6REfZi9iXIwgd31FkqZ7JArZ1cSAlstKPFiq8RB8n5fCrc29T2o9ev2Pn0Wm+b
         SXsc/ApwEBkm4N3J4Fg9mdxrVch4Rw9Ax5OYmYXQrw1Rr0FW2YjAg8PwrFWLfWyWyvRL
         k2e17WqfYDqjTuPG1dqPYjyo6NPbzIEOYrMX8mBgTxYTk84yUexGSWXZISu2wo2cAZhE
         CmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUbUQYdA9uIL1gANrRpWzNy+A6oN/aPQMxaVdqIc/Ec=;
        b=S2Kv6Bvt/Lt52G++SdBd/UBcTztwEd8m5X8nCkI5QNbGh4B+iUqOWmQOupqJXGlzAv
         mlHYSkR/FNAiDgU9bTWyr85suyLUVEizjgq+5dSUo6Jg3czvJZew8ziP3ZQIJ12F7Ugr
         3W511xhdJw5JbMD0jhcNcLUm+GPxVl+GKO4IaCje+L0ga/fbm/M2MMYJubtdu0pMNyoZ
         /wxRI0o9FGO2uhhYcGai1hiqyv1n/73pjocsq3M9s3KaHq/zU2kj0dxZ5ON8ZEDjOfE5
         xJUy8aEviYN7KyzM2GPKH4dMb+oNisDYn+gGGUplO3CWZir+r46xNRYbyoOjiIeEs+uk
         n1sQ==
X-Gm-Message-State: ANoB5plJMv5P/ytMQw2IR5odEfwAHwxieOeZnqTSjMrRVHoKjskvInDn
	dSXhOz09ptSbndxGWH0NlHU=
X-Google-Smtp-Source: AA0mqf4il1eAeR7CBxxr2GgBBR+dVprN/eW6AJZaB3Fn0BlHgV+EVyRhEstZQzUij6LVFR3n5nYLEg==
X-Received: by 2002:adf:f5cd:0:b0:242:3eff:6855 with SMTP id k13-20020adff5cd000000b002423eff6855mr17365159wrp.54.1671189534544;
        Fri, 16 Dec 2022 03:18:54 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d59c5000000b00241fea203b6sm1965853wry.87.2022.12.16.03.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:18:53 -0800 (PST)
Message-ID: <3270e0fe-2f45-62d4-e1bd-0f55546cda6c@gmail.com>
Date: Fri, 16 Dec 2022 12:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk
 board
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-2-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221213234346.2868828-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031859_294125_98DD4021 
X-CRM114-Status: GOOD (  12.02  )
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



On 14/12/2022 00:43, Bernhard Rosenkränzer wrote:
> Add bindings for the Mediatek mt8365-evk board.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 2275e5d93721b..ae12b1cab9fbd 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -244,6 +244,10 @@ properties:
>             - enum:
>                 - mediatek,mt8183-pumpkin
>             - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-evk
> +          - const: mediatek,mt8365
>         - items:
>             - enum:
>                 - mediatek,mt8516-pumpkin

