Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 13:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9366101E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 13:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD9366101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2r6vSmlp3S/Msiqs7tNzqG7BRpW/ihQp7t8db3RYq+4=; b=FOl60y29AkPbV8
	vIlk6ZDX2thM+Ub3IlQj0+32KjQAJbbo2KcA8kOu8LPBiLj7hsSYcUnkiLUCVF0gBwu5Viec+nzja
	XRbYCGVbJGh+9GtEN1xriIKvdYEaP1sCRcAjnDHAHbnLK8h8ss+CDFP8b6RA1wta4XUW1u+LFU9Im
	GWrQ2AV/daiJuq2UencVyDdmFnavWjYnYgFsWaXt9WUBikgAcVuS/M4qM32VNMk1MgJE/Eau2K/pi
	2OayRa1jnjFZB4BOAV01e58oq9vsaOsFG6RzOB+LQGuhc7c+f6LeeWi0bTyV18C78jbD0WUbCP7lB
	BgOgCC/WD2k/4e7fifcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqJg-002xcU-HZ; Fri, 08 Oct 2021 13:53:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqJR-002xX0-It; Fri, 08 Oct 2021 13:53:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r7so30064050wrc.10;
 Fri, 08 Oct 2021 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yYWsu0Rg4yRualNrYxMIo7dnaqfU/YPo4u7hxec75RQ=;
 b=bbohXNY2pN0tG0VfoSJkDk8zsi8ByEGKv47t0+GqCwHguogMWEq0doeEkGAiHLue74
 tzC3QRTIA9xm3y4nVI7dd05PRfn/yIDLwRTgiUoOH6BzZkknS0tAZpy9gypIagpgixoK
 0jw3ZjfgZnlMoA7m3VVroeT/TyFmLDmwP7qB32TkscZoDHF5+tUc97n0B582epeuiHVA
 XEkdmZHdrlEVSr9tym+Wl60MDNgwCWOGQLuFAD7q9V07eDrrdtaETK75mBUjkBvfL78/
 n4No8br5zx7Wed0F30CPolSvsbqHq7Fc6UQ1F+Pp/FqnvTnAiiWCxJWEEb18deIuqviO
 vRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yYWsu0Rg4yRualNrYxMIo7dnaqfU/YPo4u7hxec75RQ=;
 b=E/RSr28DcUUSPpXiSWKB+xO2UkDX1qk8kk1p5Uq+hXutF18uvz0ihPDIlUGeU/EtgY
 oJkNz0mhn+nWac7d27NBQ4dZNZTvjLRogiMmcxH91/B1EdwepO9RnZU7qlCPw+uzcOew
 qmQwLnnMSoB76S1bD1K9OmM8B4xQdnVy/txiUfAFTKYmIM59KZ+j5ZIW+M9yICGIV9rH
 +iia4ZrpKEn7QwJ2fBzwFF1JtV3AzwSFvUXhpzB2TsI2AnpQRhtbAjbUptHSgJ7hQdZG
 JNy7rcqv3lQaK20dg1BohyEQty29xw2kM9Gtl6dpN3bSdANfvSs5os8HzlZhHrgvcMGt
 OyIw==
X-Gm-Message-State: AOAM532kZLSQ6BKKaveY5d59AhDH6UJ8Pe5uYVXSDpaGtmjuSKs/KrLG
 qDXxkNkMqQFG7pD6xslOs3c=
X-Google-Smtp-Source: ABdhPJwCCsh7mGFTBgvB/ol1kIoTWolzftm8yGGomZgw7NW71Awlwc9f6CNm1UOrwC/9jfT/DR6yCQ==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr3427289wmc.165.1633701203204; 
 Fri, 08 Oct 2021 06:53:23 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id c7sm3794235wmq.13.2021.10.08.06.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:53:19 -0700 (PDT)
Message-ID: <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
Date: Fri, 8 Oct 2021 15:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>
Cc: Ryder.Lee@mediatek.com, devicetree@vger.kernel.org,
 enric.balletbo@collabora.com, fparent@baylibre.com,
 gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
 hsinyi@chromium.org, john@phrozen.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux@roeck-us.net, mpm@selenic.com, mturquette@baylibre.com,
 robh+dt@kernel.org, sboyd@kernel.org, sean.wang@kernel.org,
 seiya.wang@mediatek.com, wim@linux-watchdog.org
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
 <20210924114046.26070-1-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210924114046.26070-1-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_065325_663687_B37B27D1 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Sam,

I'd advise to split this series in parts for:
- basic device support via dts.
- pinctrl driver + dts
- clk driver + dts

I would also advise to not send new versions of patches as new threads and don't 
respond in the same thread. At least for me that breaks my workflow as I use b4.

Regards,
Matthias


On 24/09/2021 13:40, Sam Shih wrote:
> MT7986 series is Mediatek's new 4-core SoC, which is mainly for
> wifi-router application. The difference between mt7986a and mt7986b
> is that some pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> ---
> v3: changed 'MT7986' to 'MT7986 series' in the commit message
> v2: added an Acked-by tag
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 80a05f6fee85..a9a778269684 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -76,6 +76,14 @@ properties:
>             - enum:
>                 - mediatek,mt7629-rfb
>             - const: mediatek,mt7629
> +      - items:
> +          - enum:
> +              - mediatek,mt7986a-rfb
> +          - const: mediatek,mt7986a
> +      - items:
> +          - enum:
> +              - mediatek,mt7986b-rfb
> +          - const: mediatek,mt7986b
>         - items:
>             - enum:
>                 - mediatek,mt8127-moose
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
