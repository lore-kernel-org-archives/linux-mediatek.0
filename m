Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B379DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEJR5MhPldIkuFZHlhxZmw0T+CU8OnYEbF6qCyQ8sg8=; b=VxCQtODdWDLuq/
	bLnHKh3YD1p2wEM94VkSAc35+IiVR0U0Y5zvU1iWAIVGr5666pkU9E6u52ikpzNZQPiNXJdKTxAyE
	YQG3Ad/fovI9Ib87FZIh6yhk3RAo9mZ07FhTjeSoa8l27f4wc4lBpFuinVYTzii33ggIeCC53p66o
	UbVKol0395YMXpmISD16IuYC3W+YmlHYqR64ZVxl3kmdLlrb9EInRiro05aIB7/xl0e7y5OlkhMOP
	2p790Ie19Bum0Gureyltstgt0BdxREeM0o7QdZJu4SxDst/S5EYcciPnZi26q/+1yi8ZBXtfFj8CD
	Eon76WzGJeuA7+R6GDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTOB-003k60-FQ; Wed, 02 Mar 2022 18:07:51 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPTDa-003gcK-Au; Wed, 02 Mar 2022 17:56:55 +0000
Received: by mail-oi1-f169.google.com with SMTP id k2so2439614oia.2;
 Wed, 02 Mar 2022 09:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cdY4Cd9XsSSd3wJ+B7rrT4fkTVqTOk4fX8CSvyN80Ec=;
 b=3qkWCd858mK+LUweWoZUu8gMHlMPIN3HdjP9VmVDbIVzrnlB4MYd0wzmQXQBgp47x8
 szyEwVLdzKff17ExZRTP6s7kGrevOv2jruj0M3sPc7eWt/6Oqesfds9n5rndtgGJRhjH
 f2qJu1jLwoQMy7qaGlYqT+ovKX8scPXipk3HzcPhC0f2nMqwAYtZueHXqMm8a1tNMPF3
 1R9K2aawszEw2vsTKaRWu+XobRtz5rZ76L1s8zZ/PqVw88dogo5OWJL9Zp1kPZWYq6eH
 vKwfx4me6qsWFzpzPz8oyQP39w5pWCC9XOhrjlsBN8+8nVarbmp86/g5qf3a+CQ3xaXj
 0vlA==
X-Gm-Message-State: AOAM533apWT3NdgUTVyoRZMPLMPco6ZevYKLL5t7PdeakbtYgAyK6CNK
 s9zhEKo8tot/r6AbURS0+Q==
X-Google-Smtp-Source: ABdhPJw61vl7JL/KvfMW0GeVw15bGRkHEZiAkLusBAmUPvayWC5wFnJhXujY6TtZynik2FRR/Gz32g==
X-Received: by 2002:a05:6808:d49:b0:2d7:2725:90f with SMTP id
 w9-20020a0568080d4900b002d72725090fmr921573oik.162.1646243813104; 
 Wed, 02 Mar 2022 09:56:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e7-20020a9d2a87000000b005af548abe73sm8250840otb.4.2022.03.02.09.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:56:51 -0800 (PST)
Received: (nullmailer pid 3963012 invoked by uid 1000);
 Wed, 02 Mar 2022 17:56:50 -0000
Date: Wed, 2 Mar 2022 11:56:50 -0600
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v3, 2/6] dt-bindings: pwm: Remove compatible for MediaTek
 MT8167
Message-ID: <Yh+v4vjevi4/cwHY@robh.at.kernel.org>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646199106-26879-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_095654_425545_89C9B674 
X-CRM114-Status: GOOD (  14.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 02, 2022 at 01:31:42PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Remove dt-binding documentation of pwm for MediaTek MT8167 SoC.

Why?

> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index f844695d605a..f18e8bbd13d2 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -20,9 +20,6 @@ properties:
>            - mediatek,mt2701-disp-pwm
>            - mediatek,mt6595-disp-pwm
>            - mediatek,mt8173-disp-pwm
> -      - items:
> -          - const: mediatek,mt8167-disp-pwm
> -          - const: mediatek,mt8173-disp-pwm
>  
>    reg:
>      maxItems: 1
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
