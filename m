Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A1FECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 19:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuXR+AMIaexq1rNS0igofnWkpIe+w6Cyd+LJdGYf1aE=; b=nCIJGqgDr9Karao9TgiZqMbvGm
	NJvTE2e5gvsZWVAkegTtzpoZkVvL85TG8HrHEgPkXCanM1nq1iNlquFYOAFtqBdxKdwz4y1YKDv+k
	OMqxxnwLJZC1xzWtQZfD4NtdHv+iRGdYcNJ0mk9kog04sEku218bGh6tedlB2llhZYN7lXegoq8Gi
	nYKT41Kq7rMp/vGy8F8fkeRX18rpBHl0q1LhpHis9iZMKRH/EtDbrOnoSt/4d/DU2URahAMnCd6op
	Rj9b+VgNEzump9GraPpazUrEUMu8aBVpCKFn/9rrSVr2ko6usaFnMuhJ5x5+A1vaDAyhTkZJUFQ/G
	7B/uir3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooUeq-001nsn-Hp; Fri, 28 Oct 2022 19:04:44 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooUen-001nr2-2I; Fri, 28 Oct 2022 19:04:42 +0000
Received: by mail-oi1-f179.google.com with SMTP id s206so7113454oie.3;
        Fri, 28 Oct 2022 12:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuXR+AMIaexq1rNS0igofnWkpIe+w6Cyd+LJdGYf1aE=;
        b=LnjyLCQwKC8ShSFK1B274V2JBkFkU3klw4SU1JDarnFzKi2gOFQVwHjo3ZRv81Dmn0
         Ka8MuBwdt6OLn/ZQ8Uohr6yoV15uEAj+QetWoNR0H79yD0m+P2HL3deBH7oMi+w2QmGa
         9T9wZeGismn2529S1yJd82OoUsb7HNVABb3XsdmNavGp9f9UFljydeU9AdHagRf926B4
         QcowuFY0gL1ebZxU1GBRFOpDa2xztm8Z8/Yt7+7r6j3C4jj11oSGyvzCBI5txXSTvQ73
         i9jRwX+sdzSJ5zgfcG2ZgeLTMugybLXcjQEAgIT6jojBqNg3FEFBbQlp1aGG/LrChUsM
         ryGQ==
X-Gm-Message-State: ACrzQf2MqMVln7/FOflHlZdy5VsklOD14a/DhSc7BICvbH82ZXwNEkif
	Yskp6Y8rABO20Hja1fN5OQ==
X-Google-Smtp-Source: AMsMyM7A9oX8dlbTLmm8qWnrYjEsJijL0O5QjYpX6UoNvlc4jXnM+R7TBFa3nuLjwYYAuT3jvsADMw==
X-Received: by 2002:a05:6808:1486:b0:355:3cb7:b51 with SMTP id e6-20020a056808148600b003553cb70b51mr490281oiw.19.1666983878062;
        Fri, 28 Oct 2022 12:04:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w17-20020a056830111100b00661abb66319sm1973125otq.37.2022.10.28.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:04:37 -0700 (PDT)
Received: (nullmailer pid 2098124 invoked by uid 1000);
	Fri, 28 Oct 2022 19:04:38 -0000
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mediatek@lists.infradead.org, Andy Teng <andy.teng@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Yassine Oudjana <y.oudjana@protonmail.com>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20221028153505.23741-8-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-8-y.oudjana@protonmail.com>
Message-Id: <166698381170.2093641.13406532790494149895.robh@kernel.org>
Subject: Re: [PATCH v4 07/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Fri, 28 Oct 2022 14:04:38 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_120441_141761_F87E20A4 
X-CRM114-Status: GOOD (  14.55  )
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

On Fri, 28 Oct 2022 18:34:59 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml in preparation to combine the MT6795
> document into it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 30 +++++++++++++++----
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dtb: pinctrl@10005000: 'mmc0-0' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


