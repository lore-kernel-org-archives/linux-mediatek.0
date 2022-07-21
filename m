Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDF4C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QFedzwg4Z3Bt4Cl0NrBaPQTB9ve87kp9+ryMOTjPwQ=; b=pdLzeDnH3zbVdlvWl7RCv134aF
	Ohix5aa4AeMEl0joSE8PR1HmXIe6+kTK5FdkcyTn3QR5B4cKBBn0As5dqr4lXMDZNpFAa+aJ5GH5k
	DS6omGYt8y3eKupq8AfND77l0PMvndyQpmP6fkZh3+/otsLiQGNdUEYmlboXZmuTZWtcsdS7tEFlz
	uHPqJy6bMlkTwoRgMStWasZubDGFERhXY0khSzUhZLGyOEHdSSkBHDGwamS5aMGqU9FwvqDcZFRNR
	2MCZCFtQ0zMP+M/7HYBzbKMSmVHRBwaJm11qFfl5VzglT6sk2hkSa2Txibh7sSn+Bs+THvMLt/UqX
	rnmV7gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES1V-002t8n-1r; Thu, 21 Jul 2022 08:59:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES12-002sjh-Py; Thu, 21 Jul 2022 08:58:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a5so1258184wrx.12;
        Thu, 21 Jul 2022 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8QFedzwg4Z3Bt4Cl0NrBaPQTB9ve87kp9+ryMOTjPwQ=;
        b=hqYc50/ygMFmNqDMaBxEUXZIqcngF9VA2CxW4pjNqMyxin1dlJwJBqen+MAu6VaR2r
         uY09io+notR681tLTLwivZ8mYtCy4ogEm3fo/oxcwhcJYnzix/8/q5OVcHD+KSYOjODM
         Bpn7RnnbptJ1AVKdIWmUXx7yN3VreevV5GWnMHHw0XtHbxXbVFTRwYmmgPHsQ/JX2FGb
         NJzJWxvxtbrpe4Sx7PosKz2SlFKazByZ2Gpx/nFORw5wKJ2Qz53bHD8AH4VaA70O1e53
         yYMug24BGa6UuKwhjSEOMQs4Ibeqk2X3KVEUbJn543rsSeBsRGQsTh6GWMxtpEFRVPTe
         OZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8QFedzwg4Z3Bt4Cl0NrBaPQTB9ve87kp9+ryMOTjPwQ=;
        b=3oEhaTYsTFvR5bZNtl9VnB4XUM+oIrRhbCK+b256FYGKmUN2bv6ZzqWoRk9gmnQPk4
         6s6voJKkPAnZ9bpvZDwQDSQ0vt4Bhb6Q5vtQlPeL++6st4IoW8VevOj8ej89AYD1mcS7
         UqpudVh4WcFsFYXYChO+CCXkW349i/KZbmtCAb5BenzjOzVWIJhIKl+UXne9j8nipN56
         xJeLdYxOx5FdHOYdd8cUVgB9a511JAZZlxNfhC2zZ/tNhH5rXak3bUiJntNah2v7ih69
         ++xtiLmMhABjKfnHxUcC7i27myoEMD31GqGeIGRLcb4y8jlEhTvL69UjF+ZsxiYBgWzR
         U/dg==
X-Gm-Message-State: AJIora/Oa59fYei12EneZrzlG7xFXnOy5WIJIpU5JBT821j2vlLjZ6de
	7UTgEDkFLpw3GWOhLulbtFo=
X-Google-Smtp-Source: AGRyM1s/+WRL6EVdc4FhHYS+vntbkQFrNJ6oMEWZO1WIgvLT4FOsRXWPvITE1MwEgF+Pn5dN8AH/Mg==
X-Received: by 2002:adf:a51a:0:b0:21d:86b9:f41e with SMTP id i26-20020adfa51a000000b0021d86b9f41emr33877852wrb.217.1658393917102;
        Thu, 21 Jul 2022 01:58:37 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003a32251c3f9sm5887572wms.5.2022.07.21.01.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 01:58:34 -0700 (PDT)
Message-ID: <59dd19f6-8e20-56d6-506a-93656bf15138@gmail.com>
Date: Thu, 21 Jul 2022 10:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: mediatek: add binding
 documentation for MT8365 SoC
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-2-aouledameur@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220720181854.547881-2-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_015840_877572_7F271B53 
X-CRM114-Status: GOOD (  13.95  )
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



On 20/07/2022 20:18, Amjad Ouled-Ameur wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the binding documentation for the thermal support on MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

I suppose you wanted to add Signed-off-by here, at least get_maintainers.pl 
doesn't list you.

Apart from that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> index 5c7e7bdd029a..ba4ebffeade4 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> @@ -14,6 +14,7 @@ Required properties:
>     - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
>     - "mediatek,mt7622-thermal" : For MT7622 SoC
>     - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
> +  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
>     - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
>   - reg: Address range of the thermal controller
>   - interrupts: IRQ for the thermal controller

