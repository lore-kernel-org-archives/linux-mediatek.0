Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA2AC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QJWHcQRNdZ++xNr9XAli49/YD9Wnzb7ytJ9y9YhSe4=; b=Oky+oLMxV5ZZX4Wzl+nMl+sUq7
	OEYpHAHaqqQyxJO//nX2nz+SVFo0TxJwNZHiZ1t5ulkPjh3U2MPLnqb5G3+DduIxsHgtuKQ4PXWMx
	f5zAn0WYBaTR9cnjRirRcnNjLacxh65q1jVqLsVD+wABJA2GaEH4hluBhzls3p06LEYVcdN1exFce
	GnVGdlPmbQQ1GRgtdjh5qvzWoSWA7BahZctD/WAjBckYgl35XGUTepSWGm7oHdyfnv8oAxzIa66Oo
	bTDpBWqtyGtwtn5osncYkEcNwUCDo3uVynFtjxhB3ZZazCMzZ9XkOWemiP51qbBkC6/2j4MqL6dgm
	TlRa9rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgMs-0000000AWjc-0251;
	Wed, 07 Feb 2024 11:45:30 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgMp-0000000AWiw-2DAJ
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 11:45:28 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-604819d544cso5422717b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 03:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707306326; x=1707911126; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0QJWHcQRNdZ++xNr9XAli49/YD9Wnzb7ytJ9y9YhSe4=;
        b=r6EwT5kD/UcGxgPEyAPvBhc6wCOfq4wXSDrovmgb45V8jB2MYQDdnxcAK2cmIx4HKD
         b7hHSgOGpoZ+7e5OtSVzldbopwGUPIljs5Ah47qEvVxJXVgddLKT4ry+dnWv1e2DKFhe
         DT3eF+/kh1jQZeAOSz/qkFtVH1Z/w+RYQC7zOJ3QudpslrXuEu6ZRoYMqTpaOSDr6Hhq
         TjjlfPlQPrJS0hxVQr2Hk3p06lMNBUy3Ibk4xwucZF8BK5mmOci1/LlNFcqkIzBVRXId
         4PIL64Gq2pO/ICUA2RuC80LwvFHqVJbce9yx8doLiFK1LnACgR8rN+pYX9INriUpkq3r
         jH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707306326; x=1707911126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QJWHcQRNdZ++xNr9XAli49/YD9Wnzb7ytJ9y9YhSe4=;
        b=bIld5C7yi1RWCBP2qDs8ylnoLUlHPuFaQbxq6JKm6dfKqdqTRcVKpNP9PZNnNdPb/z
         zBcCjwYgzYkzpiW21g87DVDTPINkEoeWkIazGtP2YR1ct9YOAPUv34gOZXh+SZ7fP/LU
         5DVKEi19lqLTrnaD8M7iB4NQ5fImR23kAnxI7IFk/bdfSvoCj+QHEFoUtJNJIYuUYa2B
         X54CQWDqBqIXMyXt/UBUVuBZvez3o1EeHsQlw43Jr7W1BH5AQVOfj2cnYX68womoUmnl
         vha7Naw5KnUH1RxsXpFspm32DHj7ZxLPe8tenvQedPHJSgah4Q39ag14M+VvIpUgP6pK
         gR7A==
X-Gm-Message-State: AOJu0YzPLbnf+vBbVIycSJnkOuTuJeIlz8dqmDygmUB3LWmIvehVYlE8
	TCS8jUWVtOVuvsgCtev2kcq18hGpHkwOpwEfMnlQejTUiwGNUcgas21gCfsex78PsfCY6P+jUZH
	5sWUyma6kUm2R8c1+7jj0IDS9BkyeI4xqoH6/wg==
X-Google-Smtp-Source: AGHT+IH/o53PW2EBoUiu+Xx5ucqrkx2JVhwy9re+Mvcxtl2y/qEnzuhByDLE8rDyLEGdQlkM81L0zIoLvRmrkgLGS88=
X-Received: by 2002:a05:690c:f8a:b0:5ff:4987:4ef3 with SMTP id
 df10-20020a05690c0f8a00b005ff49874ef3mr5462398ywb.24.1707306326640; Wed, 07
 Feb 2024 03:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org> <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org>
In-Reply-To: <ZcNIddeG6VHxBEOQ@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 13:45:15 +0200
Message-ID: <CAA8EJpo-16u34Yc6MLmHSqFrQ0VrZAq6TwGeVc5WFwMmhruqoA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_034527_589886_79646F16 
X-CRM114-Status: GOOD (  32.92  )
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

On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
> > On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> > > > On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > > >
> > > > > Some newer SPMI controllers support multiple bus masters.
> > > > > Such a master can control multiple slave devices. The generic
> > > > > framework needs to be able to pass on the master id to the
> > > > > controller-specific driver. So do that. The framework will
> > > > > check if the devicetree child nodes are actually bus masters
> > > > > and will register the devices for each master. The legacy
> > > > > approach will still be supported for backwards compatibility.
> > > >
> > > > Please remind me, are those two actual bus musters driving a single
> > > > bus in parallel or two SPMI buses being handled by a single device? In
> > > > the latter case this implementation is incorrect. There should be
> > > > multiple spmi_controller instances, one for each bus. Allocate them in
> > > > a loop and set ctrl->dev.of_node after allocating.
> > >
> > > It's two SPMI buses (two sets of wires) handled by the same controller,
> > > HW-wise.
> > >
> > > If we register two spmi controllers with the kernel framework, it will
> > > be HW inaccurate, because there is just one controller which has
> > > multiple masters.
> >
> > struct spmi_controller is a controller for a single bus. Inside your
> > device you have two SPMI buses, each can be controlled by its own
> > struct spmi_controller. Just like devices that control multiple I2C,
> > SPI or USB busses register a separate instance of the bus controller.
>
> Well, this is what this patchset is trying to do in the generic part.
> The SPMI controller supports multiple buses (HW-wise) and therefore SW
> implementation shouldn't be tied to single bus requirement.

So, after the off-line discussion:
- add new compatible string for sm8450+
- register two spmi controller instances
- drop the master-id from the SPMI interface
- optionally: think about having a new separate driver for v7 SPMI.

>
> >
> > >
> > > I'm not saying it might not work. But, to me, it looks more like a hack.
> > >
> > > Basically, we would be mapping HW bus masters to kernel controllers.
> >
> > Buses, not just masters.
> >
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> > > > >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> > > > >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> > > > >  include/linux/spmi.h         | 10 +++---
> > > > >  4 files changed, 67 insertions(+), 35 deletions(-)
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

