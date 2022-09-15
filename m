Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1BFECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewl9ccoqSS/pK38WPwPo/QqMTNkX57cZ/0yi66bbkzk=; b=ggprSBNohc4RuhOsspuOtJD2oS
	C6W7bc7rkB/N4B1MLOWWwRUyiTll6cbvXa8RVLTmBrCkA3N6RsAe+cWvrXhS5u/rWx6ISxhJARNtE
	SnxIqvM+Q7G8fHZJVitHMadkoaLxfxVyI+6gpijHlMhGmLERz0kG++ezc+zq6MSAMaGsd36tN+LJz
	67xmSkmdMaA+adeh286ge45QmraS2blAMs5MEZk8CzcIN1xfYQ8CLaPTXCifIAoePHjSuDnjdyCMA
	fdIXEVeo0/JodIBdKQJOzDzlY3OYfkW2TeF4V7eo3fEK0oDkFzJKii9I0GRVLPTjpGGlOn0bWFCcX
	8rHBSazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYp9u-009cu0-5K; Thu, 15 Sep 2022 13:44:02 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYp9r-009ck8-CF; Thu, 15 Sep 2022 13:44:00 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-127d10b4f19so47455851fac.9;
        Thu, 15 Sep 2022 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ewl9ccoqSS/pK38WPwPo/QqMTNkX57cZ/0yi66bbkzk=;
        b=A4L39irZMnocC4SL+yd7/heF9O9JyU1VLk+uQRVPILQ5tuxViXbF91hmE6nlsRuUH6
         P9bbACmAH+K+Lih1ay/+qoMQphA0YeAf0MjN6a0ozvYgFlZJUVzxZ/Cjxvg3mrvxgF3P
         Vif/5z2VWQrkZeDoSG7zlXCN4R9bCBKRrxoHazYy3RuPY2oodQUzKgbF9BI/oV1FqW2M
         gfy2RpFdYE/LhnD2pLwG2Qzvr8BQfvTidkEGSHRF5LZWW8MYi6XGiYC5yxhXRrwZm5hD
         E4CUjUbN//Ad7p1gQ/vDOn+hP9sJ1TXl3aI2nZ3N8z5QbTO/ePRn5OvLlKluhwTm7+gh
         RPwg==
X-Gm-Message-State: ACgBeo3SnGIJpOWbAMlMsDEUj5t9M18Wrno5MkSy68w8p3wvIEBcRuwU
	BLA+A6W8kWACpsstCoisxg==
X-Google-Smtp-Source: AA6agR7KpuyZQGv01An5Z6T7hcfabP9X2k1fxaer8B7wdoNGNu8YinFps4J/+3gx+pBofhHdaMN4bw==
X-Received: by 2002:a05:6870:b494:b0:126:b7fa:f235 with SMTP id y20-20020a056870b49400b00126b7faf235mr5308587oap.266.1663249435226;
        Thu, 15 Sep 2022 06:43:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b14-20020a056870160e00b00127fbb7afffsm1402056oae.5.2022.09.15.06.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 06:43:54 -0700 (PDT)
Received: (nullmailer pid 1168692 invoked by uid 1000);
	Thu, 15 Sep 2022 13:43:53 -0000
Date: Thu, 15 Sep 2022 08:43:53 -0500
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org, cy_huang@richtek.com, linux-mediatek@lists.infradead.org, alice_chen@richtek.com, robh+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, chiaen_wu@richtek.com
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the indentation in the
 example
Message-ID: <20220915134353.GA1168381-robh@kernel.org>
References: <1663157936-5010-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663157936-5010-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_064359_494243_2E38F514 
X-CRM114-Status: GOOD (  15.07  )
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

On Wed, 14 Sep 2022 20:18:56 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Fix the indentation in the binding example. There're two redudant space
> charactors need to be removed.
> 
> Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Since v2:
> - Add Fixes tag in commit message
> 
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


