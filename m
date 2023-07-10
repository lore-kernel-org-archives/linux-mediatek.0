Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141DDEB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8qLO55Vr7jsbm09jztyw8xMmMihk27bt8iUnejOXKA=; b=H2aLo2c4CUTIh96g8UwuI4YQrL
	Ikq/ouzWm+wFIfdeiAyV9vWbf3v2wIDQIh1e5iGOS9Wz6hvFQQIyBOXqCJFC64ex6wuH/q20gNjYm
	Ue84WzAf82SnB95zsWo3mxqARd5uR9i5+HslcdvacDRAch+scr0bZYHllAzmegGBLUwgo0toinyKw
	TRsWVO8IP+WWC/SttwX64gb2II46/li+rOXNAqKADy1swYg/kXevHt39Dj0onz8h5IoFihuSYqWA1
	rlBu9PMmEKCNY0mydbIESWNaH41arVENegWQxmp9ylWfonc/hsUM4cfriRErTgXEQ+Vv/BIFy9gGJ
	9d1KNIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImLQ-00ArNR-23;
	Mon, 10 Jul 2023 08:34:08 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImLN-00ArMG-0c
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 08:34:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6f9edac8dso61873791fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688978042; x=1691570042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8qLO55Vr7jsbm09jztyw8xMmMihk27bt8iUnejOXKA=;
        b=Hvf3tsUJDgBDosylitVXgKWoTMFFxBZhO6B7AsY/+bfGJe/ri96PlWXoTZiRpo1oEe
         ilw+UiKiXAcQ1MSUpCs+GrFtJ1U/x0tTjB3/t7Bw173Uo874h1U96Lcs0sG8F/qe52og
         YhjJzXEZsu/NU2Od3zGihTccc/bAcukTtB4LXsUqhRdxc7RLAyExN88BswUT+vSgvrd1
         I5BuKydv5tA2lbQSsrPFMNGTSvfBAo574L6zLm4/zPW2NgdNX0nUmIHenpkohI9SXacy
         g7mWSvVQh8+mX9nV5Y4mADOXk++zSjaWs+xG2slVSVjhMc4KPEwO2+6On5vysbrinrA8
         qQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688978042; x=1691570042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8qLO55Vr7jsbm09jztyw8xMmMihk27bt8iUnejOXKA=;
        b=Z4a/0kO+U4FHsYFY8s9wJ5cwDi+kaKFsF5TiE04Yb9BrFec5oZIA+G2HTKlpVG3q0J
         285nT2l88NkyOqoEo2e9nyXYKSNsrLixGiZYNDI8p8+OcH/M15n2SPb+ewYwkLrLjd01
         /MoyNjKZ3iKefM5vSEkJKrcUFuohBoitEIViygP7mXs1L6YwfeiEaUoIGqKR2+lXQbhD
         YHYInye7MT1+inuPJrqLLp6UFUk5yCy3iydL4Qg1hw6K5fxsSS0/wYGqDVqMtGovq3k/
         arH1GSllUXTJCwtpBZj1V+JEkyZsfw7siAiCyarTJ2T3hGrf5d2YGVYfGhI/JHnTZQZw
         caqw==
X-Gm-Message-State: ABy/qLagzcqSXQjbap6Ei/rrjMpPyFjOUaJYRhneZ7f0/xHXPOsQ98hq
	BRpfF0zXuClb9ieWMI9RHrvhHw==
X-Google-Smtp-Source: APBJJlEwDXXbGl7RIZcFGrb5mR1IXJNqOS4jXW4DPrQNSeFwwlXhncUnFC4Cqg6Tp4eo0TCEFbFQnw==
X-Received: by 2002:a2e:7d15:0:b0:2b6:d7a0:c27d with SMTP id y21-20020a2e7d15000000b002b6d7a0c27dmr8530764ljc.37.1688978041895;
        Mon, 10 Jul 2023 01:34:01 -0700 (PDT)
Received: from blmsp ([2001:4091:a247:82fa:b762:4f68:e1ed:5041])
        by smtp.gmail.com with ESMTPSA id e14-20020a05600c218e00b003fa96fe2bd9sm9649160wme.22.2023.07.10.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 01:34:01 -0700 (PDT)
Date: Mon, 10 Jul 2023 10:34:00 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v6 8/8] soc: mediatek: pm-domains: Add support for MT8365
Message-ID: <20230710083400.c24jnxxykxjsl47q@blmsp>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-9-msp@baylibre.com>
 <85ce05db-5392-79e0-1183-b40db641f3ae@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85ce05db-5392-79e0-1183-b40db641f3ae@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_013405_228633_E624F62E 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Angelo,

On Tue, Jul 04, 2023 at 12:31:23PM +0200, AngeloGioacchino Del Regno wrote:
> Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add the needed board data to support MT8365 SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> 
> 
> ..snip..
> 
> 
> > diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> > index 07f67b3d8e97..f853397697b5 100644
> > --- a/include/linux/soc/mediatek/infracfg.h
> > +++ b/include/linux/soc/mediatek/infracfg.h
> > @@ -2,6 +2,47 @@
> >   #ifndef __SOC_MEDIATEK_INFRACFG_H
> >   #define __SOC_MEDIATEK_INFRACFG_H
> > +#define MT8365_INFRA_TOPAXI_PROTECTEN_STA1				0x228
> > +#define MT8365_INFRA_TOPAXI_PROTECTEN_SET				0x2a0
> > +#define MT8365_INFRA_TOPAXI_PROTECTEN_CLR				0x2a4
> > +# define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0				BIT(1)
> 
> Personally, I like this kind of indentation, but more like
> 
> #define REGADDRESS
>  #define REGMASK
> 
> instead of
> 
> #define REGADDRESS
> # define REGMASK
> 
> ...but this doesn't count, because this header doesn't follow *either* formats,
> not my preferred, nor yours: this means that, for consistency, you have to follow
> what's in there already, so you have to change that to
> 
> #define REGADDRESS
> #define REGMASK
> 
> ...so please change that to retain consistency across the infracfg.h header,
> after which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thank you for your review. I fixed both issues you pointed out for the
next version.

Best,
Markus

