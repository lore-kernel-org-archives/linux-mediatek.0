Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DADDC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=357WJpKqK4n072gUDP2xO7EDnU9lyZF13OaAt7W+XvU=; b=zQF8iNjsQH1YIi9gOVnCNFORgq
	rjP/TdnMRVTpdVZsu1EeBIo8+N6R81zf29cFhg3zRoPMmyfgQ0qgUgIgt5DCxwVySKfDaPwvNvCM0
	G6yb87luYSG3/9fZBYrPPrHQuQkTeoh/vKz6LQZ6pTGhZwYPP9H1w+CtH2pUh+bYVGjOHtvEo9cKW
	ip3T9gVrNec81ruqu2wdSlF/hnzXvpJ94hO0ylHJtl6AcLovgjZV9yng8f23RSYFRhSq4eRY+KrR4
	kBaIwMS4vvozQ0yJGxQJMrYnMLsgHO0FOfk5WL4z8Wz+Yt+ZbL35hJsKqh4mCdgCUJqBIEH1e+Lgh
	vlsesATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUmE-00BB3g-6M; Fri, 15 Jul 2022 23:31:18 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUc1-00B5Rl-FD; Fri, 15 Jul 2022 23:20:47 +0000
Received: by mail-io1-f51.google.com with SMTP id p128so5028016iof.1;
        Fri, 15 Jul 2022 16:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=357WJpKqK4n072gUDP2xO7EDnU9lyZF13OaAt7W+XvU=;
        b=5kQAWK5GGATVry3BkJrFSCtkzhRdJ86N5TSnXAWpRoyF+sfAAPHpmzJnaN401JWgXN
         0p2OpislWtF5s8q8mEtZnPKwvkAtZPQD0kgPxfythN5Y2z51LQyRcxeJGg3mVvejJKmL
         0Ylp4WVf+df0B1Ve/ndPNfwCSiBPKIYE1rP45pF+KGNMuRfbgiFhY/Y9ZChCck8cXdJm
         Wn9fWV/S3BJ2VwzxcfS4R5RnFcBqbj5FZoJjpHoQUdVJjAOqH0hgqVjNQseZDRHCPxQH
         IjQF+hwR8ECzAIQSwda/9UQnjGU/VAaGFUYCXT4EQuk7arUn48N6g5RXeIwND1f+0wWY
         te1w==
X-Gm-Message-State: AJIora/GFdWa7AnYjPzAryaJH18x3XfS/exAEzV2apkFonkFXM/l3lpJ
	50Qjj2NkWJNRcJx8c3UQwA==
X-Google-Smtp-Source: AGRyM1tQ46xHJYDafNFQLDzbX9yaXJPf1IJ35ZWUtezEz3nl7DXHI+lRSk0NX8wn7O6/zhUIHiuMjg==
X-Received: by 2002:a6b:ed14:0:b0:675:9593:483e with SMTP id n20-20020a6bed14000000b006759593483emr7665689iog.65.1657927241909;
        Fri, 15 Jul 2022 16:20:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k7-20020a02c767000000b003415545d938sm600126jao.166.2022.07.15.16.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 16:20:41 -0700 (PDT)
Received: (nullmailer pid 1651421 invoked by uid 1000);
	Fri, 15 Jul 2022 23:20:39 -0000
Date: Fri, 15 Jul 2022 17:20:39 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, sean.wang@mediatek.com, matthias.bgg@gmail.com, nfraprado@collabora.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use
 drive-strength-microamp in examples
Message-ID: <20220715232039.GA1648171-robh@kernel.org>
References: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
 <1657892575.852530.520283.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657892575.852530.520283.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_162045_597242_EF122B9E 
X-CRM114-Status: GOOD (  14.59  )
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

On Fri, Jul 15, 2022 at 07:42:55AM -0600, Rob Herring wrote:
> On Fri, 15 Jul 2022 12:30:29 +0200, AngeloGioacchino Del Regno wrote:
> > The property mediatek,drive-strength-adv was deprecated: change the
> > example for i2c0-pins to use drive-strength-microamp.
> > 
> > Fixes: b6d9af2c6b69 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dtb: pinctrl@10005000: i2c0-pins:pins: 'drive-strength-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

Seems to be a false positive since commit b6d9af2c6b69 was not present 
in the test.

Acked-by: Rob Herring <robh@kernel.org>

