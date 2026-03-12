Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A746106703F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 14:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=; b=cqFwEkXVejljBXDgJQtEXffaPN
	hMu+XIA44IC5QvIN04GDGNPPGt2gOM1Lj3bqIE7An7yynubbz1Vo5yPFzwk+9pA05ze2UCLQQoq64
	WhXT+KCQDWtmESHxoCoj7F666Hx0jfSLFtg2nlAICGV5TAB1VcSYgdZFEVt7u3aae4V2AeKJu4uDs
	hf1GROtTZ9ej+7DAEOEvkq9wfbmlvDTzfvjfyaSJ6yWJQw3vI3oiZvU8Pkh77OhxC/pCVNclbFzzO
	EL2H4mFXwVI2fSV7PXMMTiB+6MM+RmLfvc20njyWzVh87kcsrFhQ/akHiqwRKHu0Y/nn9w2fJ/AB5
	OWJhNQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hFQ-0000000EE8Q-3BCH;
	Thu, 12 Mar 2026 14:42:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hFO-0000000EE6q-0teV
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 14:42:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so1598088e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 07:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773326564; cv=none;
        d=google.com; s=arc-20240605;
        b=BdVUS1Q/iro73k2bd7Vfwl2Akqo2Cc8pMqjzSAofys50Z64xshd+qAdNLHafilgFF1
         Bn8REYtD2P2+qRAMwYWsoCt6CBZ/qL4DMqoCJFxL9lulYlq+zkXYPS058JSKRV8rszM+
         mlHmEQyn8/ebr+xEujh5HtlIRj0YGf7EDq5VSOMh3fSslraFGflUv4L+m2iRwFv/X61L
         GwMZSEQ0daFCIkZPJTGXomOq1WDtAECaHChEQWY1COk07VAEiWhkHq6K4GTCVaOoP5b7
         D9WZg8N2n5z2N4mtgNCZaOJiF/Kq5atm0ehOZErV6WKiGiRsnh/7gaN749+j54oAXdf/
         eJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=;
        fh=wMNaPfjjatg4RHeW7DuBBT7QPKmS3LzUM3D3cp9buzo=;
        b=Z8DKvZ6V9ZoEFetxNXgm4wBO6tWIEwpZMwUKejDrmyJda2HlwqFza7V1idqdbU6Mbh
         s9YFCvuumSiJC3r45Y0A89V13wT8nsWxoT/Hqj81lzELezdv6+Kzz34RLfVBNwJJewZw
         WN+AiMtlHjfp53P88orazb+CusA5eZi54Aq+0PS3gEjs4nsbYx+ozhmaDfo5aS9SbrS3
         6oOqUo8Pzev3ksYedC/RXsQuWzCJBLDNEdzmZIz+hNztBQNFdbMp8GI0k7D9MBWYUFbL
         Xx2yta9AromksBzvl7z3VnajTwbvVJBRKMyFIizBE+N6V2T+rVCN/clpfBU0pJEwZxGe
         isLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773326564; x=1773931364; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=;
        b=DvlQJlFZZmdC9Zt+xvIjGDG3PWbSn8RhqkNypxsSfjkG5MhwmwQ79WNENfQygI65LT
         LEpw0iBaQyRMJGxBuUvlyco87lvmKYmE0x+ke7hDirifgX0epGLtPFDLuurr6Xpa/At5
         XPopBuNgPG3rHXsVVXYnccUrLzY9ieSjyeonWnmyBjzKwUA+nUfPHnG71QctiJm7dOjz
         sANYXbtjszzuAUohxOzlVkfl57yZy6DfEciFUOnPEG7epqdJvrNi0hFXz230Cou6+HPo
         sn+Go1qy6kfmFSOdtVjBT4FxnBs0XbBHEWWyBdCAcFOzTNPBMqzbgB4l4uO0suP13sK3
         P/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773326564; x=1773931364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=;
        b=oH2lg1v6gFMax10dliNZvb6RM63U5KdWFgAfP0YkAQHx0vSndE+PfNXQB/aFfF4pFI
         NrDQvnu9weCgNKlGVkdsnrYVOq0fOhLmXzVUpM3sQghNcTgNeVJ7kBcOFJCFIY+zJpQW
         4U5dc9j/Bc0zrBscM3j62wJ/IkP9ORo/YNWDEuVZZdAEJpAtmmyH4ubOVG95CkJgOGoN
         z7IwJLSL4+O6GMYchyY+JRf8uNq0l05J4EWc7hxgduNwwZQFZmu4+ZPK5jNbcpoBHHEq
         Xqsspg2Z4jciA6ELv0S8ClsCF7mPy/yn3uA1ld3s3YsEMg+pnQ4db8Z2coGjPSZLItkq
         wx/g==
X-Gm-Message-State: AOJu0YyQPMybjfGuaNAKMOmuE/K0h5ltwBY5kyLCZmD7yr3CgTbYYPg1
	+R0LL75MldxE/ocyOla7MX2HWo8wLDVwTzvSX9FhHkrNWftWsltDB67wh9hVJQVIv8fXAw2bSOI
	mQcRHV5PpRS7rjtjtkODBHnKblBohRZFn9xuXpgDIPw==
X-Gm-Gg: ATEYQzw5tReR5flg0ZRpMbinlwAx/RDU2OzaQK1kiaglk7NhVShvpVu1tBXJJqetu3M
	bTd5UGClzBA1ELdoRdgGOxsaDYiYhVLHHUVjMFaTNewIJpo2bfrN2ldR29H6QoiWM69aC/BOhEp
	4hsxKRA3FDoOz0SK+4wtdJBcz7TjPvYAU2oDdoxng46/NQO6ETjzUg1F73w9FHa2HmSxxQR+Tpr
	Gc0Mtog82vQhca+IlMjGN5Etn48ph33LgTKT2wj910IBFVu3RoN94bafotabyv+PSOUBCGie+z5
	DOMk3WE=
X-Received: by 2002:a05:6512:3405:b0:5a1:2ea2:3683 with SMTP id
 2adb3069b0e04-5a156ddd92cmr2624715e87.44.1773326563685; Thu, 12 Mar 2026
 07:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com> <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
 <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com> <CAPDyKFqbS+PUkLXkjoHjbiVFCYM4FxQeHdJk_LVVfLA5nGEZ-A@mail.gmail.com>
 <108e6fad-401c-427a-bc30-8ddd00bd93a5@collabora.com>
In-Reply-To: <108e6fad-401c-427a-bc30-8ddd00bd93a5@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Mar 2026 15:42:07 +0100
X-Gm-Features: AaiRm53Syf4tONBWunUd9bjmXw_xdyFjtpRQ2mt1ntlqT4z8S3DYLkSeLVjeLKo
Message-ID: <CAPDyKFoY+pdSh-h_=Ko9L7QaFo4V4iA2_A0jA3BfnuKmiCyzCA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Adam Ford <aford173@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074246_302920_43FE0389 
X-CRM114-Status: GOOD (  41.66  )
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

On Thu, 12 Mar 2026 at 13:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/03/26 18:29, Ulf Hansson ha scritto:
> > On Fri, 6 Mar 2026 at 10:50, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 12/02/26 12:34, Ulf Hansson ha scritto:
> >>> On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
> >>>>
> >>>> The wrong value of the number of domains is wrong which leads to
> >>>> failures when trying to enumerate nested power domains.
> >>>>
> >>>>    PM: genpd_xlate_onecell: invalid domain index 0
> >>>>    PM: genpd_xlate_onecell: invalid domain index 1
> >>>>    PM: genpd_xlate_onecell: invalid domain index 3
> >>>>    PM: genpd_xlate_onecell: invalid domain index 4
> >>>>    PM: genpd_xlate_onecell: invalid domain index 5
> >>>>    PM: genpd_xlate_onecell: invalid domain index 13
> >>>>    PM: genpd_xlate_onecell: invalid domain index 14
> >>>>
> >>>> Attempts to use these power domains fail, so fix this by
> >>>> using the correct value of calculated power domains.
> >>>>
> >>>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>>
> >>> We should have a fixes tag for this too I think:
> >>>
> >>> Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
> >>> Voter power domains")
> >>>
> >>>
> >>>> ---
> >>>>    drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >>>> index 58648f4f689b..d2b8d0332951 100644
> >>>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >>>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >>>> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
> >>>>           scpsys->soc_data = soc;
> >>>>
> >>>>           scpsys->pd_data.domains = scpsys->domains;
> >>>> -       scpsys->pd_data.num_domains = soc->num_domains;
> >>>> +       scpsys->pd_data.num_domains = num_domains;
> >>>
> >>> Not sure this is the complete fix, as scpsys_add_one_domain() seems to
> >>> be using the wrong value of "num_domains" too, no?
> >>>
> >>
> >> No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
> >> which is expected. Maybe that can be improved, but it's how it is supposed to work.
> >>
> >> So yeah, this patch is resolving an issue, and it is a complete fix.
> >
> > I had a closer look and unfortunately, it still looks weird to me.
> >
> > More precisely, we are allocating and registering a number of genpds,
> > that corresponds to the sum of "soc->num_domains +
> > soc->num_hwv_domains". The index each genpd gets in the array (struct
> > genpd_onecell_data) must correspond to the index specified in DT, for
> > both a consumer-node and a child-domain-node, right?
> >
> > It seems like adding them dynamically changes the index. In other
> > words, the index specified using the "reg" property in a
> > child-domain-node, may not match what a consumer-node should specify
> > in its "power-domains" property. Isn't that a problem? Perhaps not,
> > because we never have both "scpsys_domain_data" and
> > "scpsys_hwv_domain_data", but then why are we adding them in ->probe()
> > with "soc->num_domains + soc->num_hwv_domains"?
> >
>
> As you understood, having both is not really supported right now, and the
> intention there was to have the flexibility to do so without restructuring
> the entire thing in the future.

Thanks for clarifying!

Although, having both seems problematic for the reasons I pointed out
above. At least, it looks like some more re-work will be needed to
support that case.

>
> Though, from what I understand, the confusion comes from a single line (and
> reading it again, I do agree, because I got confused myself for a moment as
> well, and I'm the one who wrote this, so that's bad bad bad):
>
>         num_domains = soc->num_domains + soc->num_hwv_domains;
>
> where, to avoid confusion, this should've been:
>
>         num_domains = soc->num_domains ?
>                       soc->num_domains : soc->num_hwv_domains;

Agreed.

>
> (perhaps with a check `if (num_domains && num_hwv_domains) dev_err(only one
>   supported)` but being this taken from hardcoded data, I'm not really for it)

Agreed, a print would be superfluous.

>
> ...and still, like the proposed fix does:
>
>         scpsys->pd_data.num_domains = num_domains;
>
>
> While I agree, again, in that the code could be improved (and it shall be),
> how the logic behaves, right now, with the proposed fix, still looks good to me.

Okay, I'm queuing the $subject patch as a fix and by adding a stable/fixes-tag.

>
> I can eventually just send a patch that clarifies the `num_domains` if you prefer.

Well, actually, I would suggest splitting the driver into two drivers
(each handling its own type of match data) and adding some shared
helper functions, that both drivers can use.

It's more work, but we should end up with more maintainable code, I think.

What do you think?

[...]

Kind regards
Uffe

