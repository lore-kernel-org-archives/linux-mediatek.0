Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F831125854
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=; b=HRIyP+EZarqyRN7Xm2h4x/ItAu
	cVga06sIaR7o40Hed4ocXk8aHNhxszFgTvcwJ3bcf/LxCAl8B3Yu3L5KzXv1SuhlhhvxOeuzEnXOb
	x2z60o1uV+K1m5kMc42v95FwhanrxXMoXjBeBEigmr5W7WmH29E2Egu71MuF79eJg7ArwdRO6jkJr
	bnKTVBz5G2JB4VqWe5VwUDM6dkohylqR6qXk/8M1/kgG4l05DlPd6WT3r6k1AUlpbnrdtSTZyyxAX
	0MLRypExvda510Q79tr0zQpxb2S52f2lsX8tTgB5jl09E+hzPxT7a+Kfbv8ZpgPcAt6D79HeoWdei
	VgDLDFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NNr-0000000C1uV-3bhM;
	Wed, 11 Mar 2026 17:30:11 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NNp-0000000C1tf-1DIh
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 17:30:11 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso188779e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 10:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773250206; cv=none;
        d=google.com; s=arc-20240605;
        b=JPOOlsDjur6FNisk820AZmXKFm25JlykN6oGlVBN2ZioKZUwMdkAhbJylY6sjN7uUH
         Or3SLYfEywu+B4Rt55oWFnA3kDlVSeU6YPAb4AwTO6nmeEI6Jok3tszwny7T5AP2bzcU
         JbqBTGaEVFhK1Sxy00KNCbpFj+reo1TezG+ar2ffEsKOjQADq8YWQm/65pFTs4hY3a71
         oFqfPBZxdcBLgx8Uach9oOIHEEL/5SLlu8u2cAGnIhA/R+/AoO4zRwO1YW7XrYLQbUS6
         wrYupKHt3cUhJyviPa+HKcAfRc+gSfeNQkWU6A8kw4//uLhalpR3ZszapLoyi7NQsQyA
         WHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        fh=hAYFVEFV3eZgQsJl4prSZPf7T0Ak7Ot5/8z11VKJrM8=;
        b=CHWbILUIipWzp/DttVOFCsIcV58Vglss6EXufPIzKb0aFAjKZvZLb3pJLZXVVOSeKa
         WBCrAF6g8BAht8ZWlAZOZXCkunXaH3slym3jkElc+guG2+JK2OIt49vGkTm58i9x/3hK
         x4udAK9PpKJFycPfon7Q7ZUgUI3DiwXH+nt0Al3F9s2GbLwDmnKGmhurtyEOXd3Ja9d8
         HbQUJ5CqwrVeqIQtLaqG0mRY6bR2b6qOlC9wQkQIPNeMTy2JUDUg7lB9cSTCsuDH0oAR
         qOwsIFgIEC9UKOHpPSqfCI7a2mvNyb5CMyWsSE3ZdqlwGcp2harxH8K2WyssIgrIk8l8
         dagA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773250206; x=1773855006; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        b=lrAYS8Rz0fIdPXvzk8D7yT0xPyip9msfH40smepgyMuntAFu6cYl/gSqfzpLXVJL69
         lodbsnymnw2cylSEnWziWxQbKv+HjzPgbSEPI8+sQb8JdsED50nW0cXP61s68pVD34UO
         V7rpNa2Ed6kA4it35Bl9mhY1W8ozRbY+ogZHvb6XnZbf1fPch5lJwnCMfp6TNfCSxdWP
         mgbCsnIeKJSMFhWCjhV6m2dmEfd69t6+qK5j/lDx7uJTxMeHqS1z9kg92aV5u/idOeaR
         LMwTUF7ycPzU0oHEZRfdCikk9nKDm1QZc4i1tuMFXPwUdbzRVLF9EiRbAlScSguYYLYd
         LXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250206; x=1773855006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        b=MViKCGj4SzDCbZEdGmnCCBJxuy84fQCAVPdm6GVAuwDamTvAA/iKKeXf4D22pMNBfJ
         JvDqtzhet2EMnbhhCdq/DM5OECX4fZ16mH8FVszv6ly7ABtQtpYWgM1IYImxqAMdIhIB
         k5AT/jRDZmwtXyIEHYAmMsg0eWk3i3dCtbeqAQyu+LnUUaw9RURuIUkiL91oFERExQo+
         wN0gZu/e7RUbh8WWitIC65Hge36R641wrA1IbB8KK5Vie8wpiDu1bQhhY10SNZi68e4C
         h51SgZXvpRVpvRdabq2crJXw/AT+lxRAliqYIGmZSYWfVfVhiXs53j0wbrL0c8lM8FQP
         Ysrg==
X-Forwarded-Encrypted: i=1; AJvYcCUEQUTfR9xfJASGO8cVo/DDEFKhfRkl85u5O8oiJDpRnAY+zoGkPs2y5kAwg1y/FsTCRVDOMULlsZbYPhgrjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKTVhpMaB0PkYLXtTxDahpxsS7YwwHhjPtaLareOZ2giXSSKpT
	/xtZfMQxvj/8pGMLV34qJzQiVJsQLIHzhxARaJXMteVhJmtf6Z/9dXTeApqsT8nyb0/oDaKjPDI
	XSnOScnIMoMcoQkSm9AdRqxYpH8yfDHdYT5pJrtnhbA==
X-Gm-Gg: ATEYQzz/Ni7i5SfqH8p7FmnyxSDcbh0NGYYErKFzBnbSLvzYJ9MJ/Yu0eAMw8VQOAPc
	bYHSJrJtiemkIXHp/5+RXNQ2G73gaw7Rd8r878iuQUlgKnbTSTY8sHN9FZY+FxL2Yk7A7QKfp8a
	s5S5jRCx8at3KFYymRnGlWBRBNkE2dv/YlvTHwgxCJ4RTF7j7FjXmOtwjA3okfxKudwwk5NXKEa
	uWnIl89KWBtbim6xHbfln2SEvlGDHcT+q9eaSBcuLl17QiXc9xeZPzI5tprw8GmzuGnvAGL1yp+
	PJxzDabEQMyLt7KUkW4=
X-Received: by 2002:a05:6512:2c0d:b0:5a0:ee11:8d94 with SMTP id
 2adb3069b0e04-5a156ba88f7mr1283885e87.1.1773250206343; Wed, 11 Mar 2026
 10:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com> <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
 <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
In-Reply-To: <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Mar 2026 18:29:30 +0100
X-Gm-Features: AaiRm52dneMJr0I61s4TTlnxGT0AaZqfVcItp2PRBKI4_FSf_MRvM1HPHY0fnQg
Message-ID: <CAPDyKFqbS+PUkLXkjoHjbiVFCYM4FxQeHdJk_LVVfLA5nGEZ-A@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Adam Ford <aford173@gmail.com>, linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_103009_363932_EB8C615A 
X-CRM114-Status: GOOD (  27.64  )
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

On Fri, 6 Mar 2026 at 10:50, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/02/26 12:34, Ulf Hansson ha scritto:
> > On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
> >>
> >> The wrong value of the number of domains is wrong which leads to
> >> failures when trying to enumerate nested power domains.
> >>
> >>   PM: genpd_xlate_onecell: invalid domain index 0
> >>   PM: genpd_xlate_onecell: invalid domain index 1
> >>   PM: genpd_xlate_onecell: invalid domain index 3
> >>   PM: genpd_xlate_onecell: invalid domain index 4
> >>   PM: genpd_xlate_onecell: invalid domain index 5
> >>   PM: genpd_xlate_onecell: invalid domain index 13
> >>   PM: genpd_xlate_onecell: invalid domain index 14
> >>
> >> Attempts to use these power domains fail, so fix this by
> >> using the correct value of calculated power domains.
> >>
> >> Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > We should have a fixes tag for this too I think:
> >
> > Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
> > Voter power domains")
> >
> >
> >> ---
> >>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> index 58648f4f689b..d2b8d0332951 100644
> >> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
> >>          scpsys->soc_data = soc;
> >>
> >>          scpsys->pd_data.domains = scpsys->domains;
> >> -       scpsys->pd_data.num_domains = soc->num_domains;
> >> +       scpsys->pd_data.num_domains = num_domains;
> >
> > Not sure this is the complete fix, as scpsys_add_one_domain() seems to
> > be using the wrong value of "num_domains" too, no?
> >
>
> No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
> which is expected. Maybe that can be improved, but it's how it is supposed to work.
>
> So yeah, this patch is resolving an issue, and it is a complete fix.

I had a closer look and unfortunately, it still looks weird to me.

More precisely, we are allocating and registering a number of genpds,
that corresponds to the sum of "soc->num_domains +
soc->num_hwv_domains". The index each genpd gets in the array (struct
genpd_onecell_data) must correspond to the index specified in DT, for
both a consumer-node and a child-domain-node, right?

It seems like adding them dynamically changes the index. In other
words, the index specified using the "reg" property in a
child-domain-node, may not match what a consumer-node should specify
in its "power-domains" property. Isn't that a problem? Perhaps not,
because we never have both "scpsys_domain_data" and
"scpsys_hwv_domain_data", but then why are we adding them in ->probe()
with "soc->num_domains + soc->num_hwv_domains"?

[...]

Kind regards
Uffe

