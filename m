Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19A4C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=; b=4ihCa7dJBVNQe/RfvSVEIuTF+Y
	lKYDFku3i0O8545Jj5Z6P1KHwuIz6eLZ9Z+0TzFOyAQNSAaFrXH5hDg9MntEK3+Vt89t9Kd8k5P3G
	qjyZI+w0njA7jYjyJ2uZp068BG33upfuRCgBWT34tUSijJXboWkISEW99Zi3QVayiYi4jYImwNuec
	SBK+JFZksZv5b7DItcJEuG5jBvmveT6IxaHmCa4eCQGppFYqUzOLaevOVcV9L169grbypXoKEdggM
	N7eQUyxCXZAjCjF72MPCjxxZVE6/5AmKKJXa3DrkPWNib8ZwcPvXaeqR7aH7RhepnPb+B8YVwuLWy
	iU9RS8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJp5-00000005xbs-2o8x;
	Fri, 10 Jul 2026 22:35:55 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJp2-00000005xb7-37Pm
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 22:35:53 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1743678a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 15:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783722952; cv=none;
        d=google.com; s=arc-20260327;
        b=FP+RaD7GWPlp+yw7rqkniGWqGSOhKkMRJIhx4zlIY8nrvVdR5fK83KJtje3adBNsmr
         pV0ENnxw+lVFiWv4Sge7BWhnifD3Fj0t3fhFTtwsRnEzIl1hDKetVB5iw/fQKn4Q3vO6
         efq2c/hxIC2DfwhZJsJsDHkTyt3GeZmiZf1BlUln1ehjR4jah1HdXw7H5WADyIEWWc82
         svII/1jAyRPzUYESv/+IG94j0grxdsDSxSHeU+3MLZe+oxEjlbXhDEqCyvlwv6bofcxP
         Ul6DAQTgW0BJYko48VoDR0IfHXYjhbJqh6h15C6nex7utBpc7de/V2l5DXc1gUm2xsIG
         /apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        fh=U92zyVe2xpXclrzPM0JSNvPjm9TeBNJtyhCVMUlXsaQ=;
        b=OC0Fz8Q6uxT3Q5kWWuGZtLkgoDyY7K/Yqu+h3HJqIXaq1FPQL3GQBL9Wqukc273pmY
         fNECgD9TKyQgpgw7EyL0IH+9zTqsl2cbEAZkCcMVoKLun3p5pZxUvUCBV7cPT3T5LenK
         C3qPmIq6GoaoPpEu7hLmv4+tMc28dKxjSS+vGt6lZ3qK9V/DG49wsNwwmt9N96Unl7Pp
         LC9eGCLai7p0xKjPh95dtOV/DswKoZbYJXKzAwD6qlOwc5/CYsMkEN7B0rUhVfDdyGgq
         4lBcK+uXJU8aB2sgflT1SuzPpJuek0qxnbCMD30Y23PFGZsBxNXBYIOnjCbh/TflId5H
         64FA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783722952; x=1784327752; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=mDheFtsqdbJlran+1kFpnTj+Nig7INUuWnCrCYu+5UnkMwmq/I2LBHxH98S1ht87N1
         BEYttY/9FrA2t647MDx+UxoEJkYMtjNpcFuXPc9vU3T0y9J2hWALoPFOC0CCvdEiXzAK
         TlabdKc3RM7Pzg3hh8e+hlKhVtPWehNtR2EAnA5ohGr1ZIkQk0+VgQ3jYSeZCSWUoJva
         53DIpxK/joXUyTg1gD7KtKHnp9KZIiq4g5ngGVZTE+BWRiOy9CMAJqCkWuhzRw61Z3Mk
         SIY02WHEjWKjvZSobXn68JHFbllChcWzoBjb6RTpMW4NddzXDiOASYYOsmEdCPwn4jrb
         rwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722952; x=1784327752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=X3blLG/RJ5hHvHPSZC4O828fa3DTomPZrECHHNpjZAOrrXoqEVVTgcsMGfKfIBOSri
         7nRxlXUH7gihKdOG+Fp9NTMlcRYjCpEnk2hnMU3IyVSQrpN4me6OOiyhZ1Xr1wBFQ2wd
         D485nG/84tyKGpOCUTxbMICBGlhX6A645xLkOtcPw8DDbajF7pLvpx/+9JiaXRHdjCVf
         XkkFAonVGFBJ/tp+aVD0ySq7UgKwyO1sPGM+qR91tnVhpPXAZQcMjK5itDcjmTIFThax
         T4SigH2dd+1hqXTaGuY6ytQey6yAeLMzv4ObR+nQJC3qut/+cWFR+eI69ixn3RMhtrKl
         69JA==
X-Forwarded-Encrypted: i=1; AHgh+RqjAK/04hGvCX5J966jlF6y/FsAXhcMKF3Dw5SceU+ZnW0zJ9v64NN9EJSDWDcwxwo3VTT2VUrhuERJs0tNag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3rI534500MhsfY0E8O3R+FQUPfESKOqGYpqr34kqlGoZP04kx
	q2ovfzMiv3e67JCG4klylhS9k5B+6bNP2gSOGgnK2dekCGv1FdYDEakw3EU9daz+e3eGanbBqVI
	40OGltp7HHhw+2zHMv+BTDwvfXXMc1L4=
X-Gm-Gg: AfdE7clGTGsiFHnZ/7zB7pNzVFiBAKZB9YFshk0u1eS/mC1lpmn2RvhHBqjJ/osiJ9h
	v0CHe5GZdhzKdZYu3z4aIyGYuZxLYBnNF0Gs279SCKrUrZck9/yqLTXt6ppFEp10fhw30lBQ91U
	pShzy/BzGEuL/b8z7gMh4C+rY56FG52f1ieBwmUy1HDypSctY3XbJKw2/7UwIUViMb8i6pyGbHW
	2z3+41K1/rqrOuZ1oIsW1EPeEK2cBOboKfw7mjsugbM6HQ1sLf+/9p7B608YxQllIQOqioInnje
	r/Q2sCL4cTnyHnEn/skdx61mV6P6NoyglZBbmW02363UDM/UBU6ifqX7o8kOIHjBPZtk66qW
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id
 98e67ed59e1d1-38dc77c6073mr661104a91.38.1783722951858; Fri, 10 Jul 2026
 15:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
In-Reply-To: <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 05:35:40 +0700
X-Gm-Features: AVVi8CcV1gryT8dmwOHw2o14YhUF82x6D_iNoN6GwcJljlfAz-HFYF2Z94CVwBU
Message-ID: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_153552_782039_E20346FF 
X-CRM114-Status: GOOD (  10.43  )
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

Hi Mark,

Thanks for the review.

> This function does also have some goto based unwinding, there's a
> similar thing in the rt721 changes.

It seems this goto block was added recently, and I missed it after rebasing.
Sorry for the inconvenience.
However, looking at the goto path, it seems we might need to unwind the
states more completely. What do you think about rewriting it like this?

------------------
regcache_cache_only(rt712->regmap, false);
    ret = regcache_sync(rt712->regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_mark_dirty(rt712->regmap);
        return ret;
    }

    regcache_cache_only(rt712->mbq_regmap, false);
    ret = regcache_sync(rt712->mbq_regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_cache_only(rt712->mbq_regmap, true);
        regcache_mark_dirty(rt712->mbq_regmap);
        return ret;
    }

    return 0;
--------------------


Best regards,
Phuc

