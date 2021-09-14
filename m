Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F33C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830B461151
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 830B461151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSF+RvyLcPxQbJ+ih+Lor1j9VUUInLlx6OxLZUlGUTA=; b=Wdx31gVMrVfN60
	DMRoP6B6UoTN5ysArYR8/SEw13/M0TVe7uLXh3B1DmGoetZKd81cRb0G3jr6koMjW+ZkR1I51FDf2
	ofmPCI7kl+7DNhXM40tGbbn06pqJLSS6Y5GQ9K4XMNGEjfvI2Ki9vySfR59tYBdl+nPJsZAvFhTcG
	HMptnix+0dT+USL9etkBsnGPz/yUK+0tunpdNjb/w8tUwbSPwrIkXb/I80bRcPENolIiYYTJSbgvG
	S03eQXoJpAy9KmqvtpQXMpqKooUpUW//BnYVqhqP6Y0baQOJrsz9GkQtPudWzFqw6i+OksUXI3/HK
	vbOFOkvsT+kweiDTDQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQD74-006kOB-Q1; Tue, 14 Sep 2021 18:24:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCj4-006fDC-Mo; Tue, 14 Sep 2021 18:00:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id s24so183970wmh.4;
 Tue, 14 Sep 2021 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wvbyZiOz7Ec9hyqSMpm7mmMn4oxPF4j+O4Rp3JHG2m4=;
 b=mfyFG+lR7RBM2GfQ3G4NpQZOUn6NZBITG9iuVFfYmmBUHeB1Gcr/Wto32TRMdfaY4/
 dc5LoMnFT4wsUNATmuqVy0looXm6tzhJHkysFpatHA3985nLfmeaLb7EUaU+gpbdQ6EP
 vbR9qc+vBNEGDjUUc1b1qG67UMpiwBRH4odmNsNQ9yJ0Oj/jtfSvp3hDP/5z9PROi4Du
 SJOYEhHS6D3tblpwl+UBx1H65Mc+hb529Xp4ZB+ilxabGLJ72wdsLjFmDy7CxDMhQO9x
 /IuB7K2pDLMzKj7401b5P1UyuSqCsLAe6XkeEHPYHB+SxqLJbMF5pzl/VgAjStzztQ09
 Pikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wvbyZiOz7Ec9hyqSMpm7mmMn4oxPF4j+O4Rp3JHG2m4=;
 b=N5tQNlN+JZvPjKHKZwWVWRKZsSktKYuyiIltTxNJTsiCNODNVfMGSYFJ1TjPPUISi2
 R6bpYtlTKbMHXiqo2o2EVicJhwO6DNq36b3QebmgyuZbRoUlhaoReGSea2wDoGM6j2E1
 nXG6v3EE17GijdOL0zIbGj4hhBTMOeIL20wQZWPIUZ1D+xFdf8WtRBNSM5zNcBBdxqAa
 anNkAvDH1NHgLkZ8L1vngBa8jOB6vaLLXTg9Ei98m58xMgh6Bg/2AjWjw3npEB7tuwMo
 2SJfS/dTj60TNtwICD2Yf6nj1MlZl7QAYsyF9622xnOl+B9ZsIUjq4tTxNLVukAMgZwv
 dEhA==
X-Gm-Message-State: AOAM533n9OrxmDvA+eUgdm2mW1ltv1RL8z5mSisL1VGlQSg/4YAmsExp
 xoZ/onC2twRrjXnRaVLSyE0=
X-Google-Smtp-Source: ABdhPJw/wltv4HvH8nTvBUz2AhO7PAV/1Z+vLbyMv0bsdlONsSJXjcVDS6v23vp5wflmT7xBZuOXtg==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr315087wmb.119.1631642408706;
 Tue, 14 Sep 2021 11:00:08 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
 by smtp.gmail.com with ESMTPSA id k17sm10887920wrq.7.2021.09.14.11.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 11:00:08 -0700 (PDT)
Message-ID: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
Date: Tue, 14 Sep 2021 20:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [RESEND,v2,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986
 series
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
 <20210914085137.31761-8-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210914085137.31761-8-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_110010_966578_D99DB36D 
X-CRM114-Status: GOOD (  17.47  )
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



On 14/09/2021 10:51, Sam Shih wrote:
> MT7986 is Mediatek's new 4-core SoC, which is mainly for wifi-router
> application. The difference between mt7986a and mt7986b is that some
> pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Sam, I'd like to take this patch through my tree but you seemed to have send the 
patches in a strange way that confuses my b4.sh

Would you mind send the next version using git send-email or similar?

Regards,
Matthias

> 
> ---
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
