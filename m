Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A3CE79AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 04:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oz7azZo6W32sAYSfgYrh6I15vH6WNt1KpOD5gToflE=; b=2DEqziXenZVGuxFqImz5SOiaLJ
	pGrdycEa3T2dxTkTwLpjuelbPTdYIEEGOB4gD5TyymZ26YrfVkgqpY/Vmu5X982EaBacKyx6in3V1
	Lt1V6ZgWgJh9xaS9W2D/rfc52ikKcOM8KFMYriJn+YB9reNM7FsCEYagMzHLSmoyJYurFxikNQM3V
	q584fREazAI0HBMNSUAc006zYyXGFN553LTr1ek16VoZ4H0sEgrAURRMwjETqFh1kJx8eEVVYFDsa
	KCwvIQPb3zoEqxKIKFGtJc+ELZZ46IKQ6fc/1D1HVfgcwKdOL+JLFp6c1bmE/N1Fdro7j7S+YoqkA
	KjCN1UQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qip8V-001rBe-2Z;
	Wed, 20 Sep 2023 04:48:27 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qip8S-001r8T-0A
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 04:48:26 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-34961362f67so1465055ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 21:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695185297; x=1695790097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oz7azZo6W32sAYSfgYrh6I15vH6WNt1KpOD5gToflE=;
        b=k+h1FjMv6kYxIkhrGDs+MyZtXoCMzReunhJaSU7w/+Lr5Bufia8PYT19pJ2788954L
         p7tP96sLwBBCUx146lxwH4FT8uhk/TVIR7Hu1Kayc84jjtPgiGgMCxBr2tNptGzvAhNy
         pvgQ2q7sIrJcQiCr0Z6wc66w4jBKTZKiygRQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695185297; x=1695790097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Oz7azZo6W32sAYSfgYrh6I15vH6WNt1KpOD5gToflE=;
        b=qWXQvtgDoenmO+CjmIRd4kLJeHZUKVx/XG2dUniavmj9tnDQtgz1nWURJPLxAJGK+O
         lifQQADedgWKcRVvIB/2axVqDGeiOk5wfizw4gLi4z4kQ7ASk4rOHWQgy5wpJhpP8VKO
         D2uxneiH97ttN8lATDXhLzxaDDGnad1HsHHGQcgsZqBUfKEo0JariYP27nkIv6+rB9M7
         DZK+ho88SQZkWV/n+JPkw8BvehiWwYS28kGA69+DCoBs6Kcd2DEM8LL6BAfkwX9n1m2/
         Ppt7t/PbUBRKDWf9/oitCAlkqvGwa+/oRGdRY9ZXkk4sDuQtMBosG0aEjYKB2OTbIlk2
         4fTg==
X-Gm-Message-State: AOJu0YzKXWiZRho4ek5GnUvD626fo9HLKMjLPiStpIFQ2IiXcMOp288U
	F0uzL6e77m1HooZLtxbY3zCVvvN8s2VYgmY+fuc=
X-Google-Smtp-Source: AGHT+IF8srQAg4f/T3OI0j+p/UvYKNc0VVlFHHUbbE0TmsDSDrB4yp/cVjgPpCpZA5cQAAXhp6muOg==
X-Received: by 2002:a05:6e02:1d14:b0:34f:d79b:85bd with SMTP id i20-20020a056e021d1400b0034fd79b85bdmr4531542ila.2.1695185297383;
        Tue, 19 Sep 2023 21:48:17 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id q18-20020a02cf12000000b004302760aa6bsm3813612jar.4.2023.09.19.21.48.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 21:48:16 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7926b7f8636so14505839f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 21:48:16 -0700 (PDT)
X-Received: by 2002:a5d:9da4:0:b0:79d:2d66:9b3f with SMTP id
 ay36-20020a5d9da4000000b0079d2d669b3fmr5407772iob.7.1695185296364; Tue, 19
 Sep 2023 21:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230919014439.5795-1-chun-jen.tseng@mediatek.com>
 <20230919014439.5795-3-chun-jen.tseng@mediatek.com> <0009f224-aac4-6681-fde5-cf1ead94c604@collabora.com>
 <acd2cba7db6d4e523f84fa4725e9bd6b596023ba.camel@mediatek.com>
In-Reply-To: <acd2cba7db6d4e523f84fa4725e9bd6b596023ba.camel@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 20 Sep 2023 12:47:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng5wkZa6LzASUNDW9miG_ev7FGhw_8Xumom4y0oy3QN0w@mail.gmail.com>
Message-ID: <CAC=S1ng5wkZa6LzASUNDW9miG_ev7FGhw_8Xumom4y0oy3QN0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] soc: mediatek: svs: add support for mt8188
To: =?UTF-8?B?Q2h1bi1KZW4gVHNlbmcgKOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "khilman@kernel.org" <khilman@kernel.org>, 
	=?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_214824_090960_6E5E89DF 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, Sep 19, 2023 at 8:38=E2=80=AFPM Chun-Jen Tseng (=E6=9B=BE=E4=BF=8A=
=E4=BB=81)
<Chun-Jen.Tseng@mediatek.com> wrote:
>
> On Tue, 2023-09-19 at 12:52 +0200, AngeloGioacchino Del Regno wrote:
> > Il 19/09/23 03:44, Mark Tseng ha scritto:
> > > MT8188 svs gpu uses 2-line high bank and low bank to optimize the
> > > voltage of opp table for higher and lower frequency respectively.
> > >
> > > Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> > > ---
<snip>
> > > +
> > > +   /* For voltage bin support */
> >
> > I already asked you to please send the voltage bin support as a
> > separated commit
> > because this is for *all SoCs* and not only for 8188.
> >
> > Again, please separate the voltage bin support from the MT8188
> > support.
> >
> Hi Angelo,
>
> I have already checked "voltage bins turn point" with DE, it is support
> for *all SoCs* , not only for MT8188.

I think Angelo's point is that you should separate this patch into two, whe=
re:
- "soc: mediatek: svs: Add support for voltage bins" contains changes
only related to the "For voltage bin support" part.
- "soc: mediatek: svs: Add support for MT8188 SoC" contains code that
is specifically for MT8188, i.e. svs_mt8188_efuse_parsing,
svs_mt8188_banks etc.

It'd be easier for people to review, manage and cherry-pick patches if
you add the generic changes apart from the platform-specific code.
For example, someone will be able to simply pick up the patch for
voltage bin support solely if they are not interested in MT8188.

Regards,
Fei
>
>
> > soc: mediatek: svs: Add support for voltage bins
> > soc: mediatek: svs: Add support for MT8188 SoC
> >
> > Regards,
> > Angelo
> >

