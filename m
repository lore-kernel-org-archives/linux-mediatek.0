Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0165C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 01:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/jVO4+uYVBMuYAP3G2ZzmPD0Uq1AAiugkwWSHuKaK8=; b=LpJ/IonEjPHXLy
	F/fFyD574JmZcLaoN5+ynca6yAN0dHvemsnh5U0F8qb8GoOhkcI/ZFeRKfBGOjziGjw78VBkmDoZ1
	R+DwSxNFr0ZXQA0o7rf1F/NmNixLnPASY57otaLOoBZJuzmdb6s1dD6foVx0Akgqxp/dAsv9g8z7B
	mUZKPz5zPaLKDUH+w6KQCzZcW2DuX+dGG25HOeqgOkDvCeoBzV22LjmC2z/aQE11imX62dHz8qPTd
	lhC5qYUUUIPLU/ec5BO8m90YOPXfVlJkmCOgynpeiDmljzzr+xC0XjFLv9ICaznkV70wGxmMTMOUG
	Ga5+e30jWwfNw57YkdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2mI-00DFeM-Cc; Thu, 26 May 2022 01:59:06 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2m3-00DFVn-Ll; Thu, 26 May 2022 01:58:52 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-f2a4c51c45so663327fac.9;
        Wed, 25 May 2022 18:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=u1k8n/bnMYLdf6Ge4xddMp84AvG888eR8uyJpk19AXI=;
        b=VYvmpdf33YNzz9YLpPcc1LkeD7hpU60v97IoUgWDuKDyW9Yh1Q1ivjBMk1FOyDGBbd
         u+V1gfYelRGRxSUPtdUU3gqG0uUQpMzHD5+37y41NMJpc5L9lPNOLgjG+3YLTwuXC4fV
         nP8qud6SaKMS7OgKE7BXWa8dqoRFBj2+IEdJSyUORekJPo3SgiqLyysSO7OJ3U6JulVa
         DRabqpeusKhCfUk/fWjZmSBcQEmUQneZwpGQNAA6rO1+uKgZmRkY7DbpDsMYHpAbq6Ji
         lnd5Mnc3GuKuVYoyF6F5kG0eInLqmYfpGjFPjVR0vtg+xvo4Jm7dkriaES0hiKU7o1QY
         pnhA==
X-Gm-Message-State: AOAM531RWe72d9sSdumgakThNa0rwNZEoiQjuAPaYJwSbQdPzW4VfXMY
	wP79v+xlcOkxXIPJu2g5EQ==
X-Google-Smtp-Source: ABdhPJwm0i+e0VsW1YFMx88HUodQOXevLnzV1/8atr9allVCR9Q5IuKOcmK9q2gmX2vgMB5I2FGcjw==
X-Received: by 2002:a05:6870:ea8d:b0:e6:135c:1a2e with SMTP id s13-20020a056870ea8d00b000e6135c1a2emr25954oap.9.1653530329601;
        Wed, 25 May 2022 18:58:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 25-20020a544199000000b0032aea9c2c23sm193918oiy.40.2022.05.25.18.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:58:49 -0700 (PDT)
Received: (nullmailer pid 2898004 invoked by uid 1000);
	Thu, 26 May 2022 01:58:48 -0000
Date: Wed, 25 May 2022 20:58:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] dt-bindings: pinctrl: mt8192: Use generic bias
 instead of pull-*-adv
Message-ID: <20220526015848.GA2897970-robh@kernel.org>
References: <20220525155714.1837360-1-nfraprado@collabora.com>
 <20220525155714.1837360-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220525155714.1837360-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_185851_764048_62A129D2 
X-CRM114-Status: GOOD (  14.12  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 25 May 2022 11:57:14 -0400, N=EDcolas F. R. A. Prado wrote:
> Commit cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous
> Mediatek's bias-pull usage") allowed the bias-pull-up and bias-pull-down
> properties to be used for setting PUPD/R1/R0 type bias on mtk-paris
> based SoC's, which was previously only supported by the custom
> mediatek,pull-up-adv and mediatek,pull-down-adv properties.
> =

> Since the bias-pull-{up,down} properties already have defines associated
> thus being more descriptive and is more universal on MediaTek platforms,
> and given that there are no mediatek,pull-{up,down}-adv users on mt8192
> yet, remove the custom adv properties in favor of the generic ones.
> =

> Note that only mediatek,pull-up-adv was merged in the binding, but not
> its down counterpart.
> =

> Fixes: edbacb36ea50 ("dt-bindings: pinctrl: mt8192: Add mediatek,pull-up-=
adv property")
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
