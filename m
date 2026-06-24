Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E6ACDB479
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 06:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=; b=VErplK+lcfgXKffJPUd9R151eL
	xemn09LyQV+wwA1cV4pGG4eQiZ5ZWrt3fbkd3jbpXa+noMOh4ZNSZs2tCfzC0ELYOrPDwPRWgvh1a
	lRRrKOkdF+E8T+97mn1JVcFeEI03Z7EHA1sCPRPvR5r3aSDQPwacDOC0N1HnomkCVm/GvgteKM5L6
	zRyZ1uVAFYE4vmZoOw0rSHk38/fBFfOzOldEEso+Pwz+eQq9R4gurSEoKL9V4ARKAcSA3LblX8vn4
	MH1ITfkSof4KehVWd7J8JKPXJCEO1xxomDef0W4IKgBNonajxIb12fkKoW5W5I1a2EAEmdahPoHB2
	MuzwH09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGzj-00000007Dia-1B9j;
	Wed, 24 Jun 2026 06:21:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGzf-00000007DhY-2CPd
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 06:21:53 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c08922c23ebso81142266b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 23:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782282109; cv=none;
        d=google.com; s=arc-20240605;
        b=h41TvVDCSM8kPm9vHCJiHOebi/2lgioJlQ4FVOWep1UV2hTjRQ8M3oiwaGqb3EEkEK
         5WXqFNFGqIFyg+zq6OVhLzPai8ikCs6E97JRIt6ocYFWAOwyEjQgRWqXRFP8qMLu6q83
         moomdVR+MQ6XjOh2/6EL7ECsCqXHrQmQVJunvg3yyoIL2Nq1oImkuUneTmV3yfDjfge5
         YDVVx0U4gzO/FPnws9K2CpClJLqeuLes76iMiSOIW9SD+VCb1HFK/eJlfU4PqkvisF2e
         rHKDctk7RAs02hpAxwWhCKtJi8MH3bvZSpVlSSKM5faqNZodt3ORQ4s2EVftoCyXNNX0
         f4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        fh=h/TquBCxHQXrqS/PzcLum8P6bnpBmwfcaiBY9yiBlEs=;
        b=X64S66xY6buubnigpcGGsZX8VEAGqbptANiUd3qvNbU1FK8JCt+0h8pru8GpdQQRlb
         +quKesv/tJcLVkVryweg4kDlYYYn9S3wHzY7L3imHpVsLApJAhkzIb87R5Dj/zMGuLXU
         x8TOBEErhNlj9aBxdNoh6VSiIDTWYxiw1wbDsZHt9DyuW0uIDxhvQPFufP8RtEkNw1Ky
         Da2OBBJXMC7UW5N66PPjxktoEdKcjDgqFHswab0V6zjlBe+tmKNjmEUsUAi2l5NjArdY
         B+9SR8mf0B5LfH0j8fZPQI4nXNpOj+RMuFKpRgO2CI6rx+gFJR0nbOIrOFSs2r43Epme
         BDKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282109; x=1782886909; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        b=CF6OmDSRqByd3ZMu1v3T3u4X5+bM45qD3byH+d0sqCowwMgP5rd912oPeuKfHr5PWa
         UK1uYN8jhu/F82hM/v3V5OMHdv1MDpwtkIuARRDJAbYWXv0YHN2pxbONoV8cNKj45AQx
         4fRn+hTfq79xGakKlFq9oYqJNhDw6C9R5OW9JJn8HEhFFzJWbAU/yntPvtOUyAB1GxgC
         R/ltBl6UoZVSp/PYDW6rqEnoY1MPkZvNd2BToGaDRQ+VMdR9n2BMJxT5AZYxm43DPAn1
         W+MDUPugSHBRxXk4/AuPbu96G5yuT8ynMW6uQFKBPCfvbVPd2Q+dpN/Md1GR/JIePMXa
         C0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282109; x=1782886909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        b=eYvQAbRNSXxt+BAHlrkqIWppWdBT2QknlYa+g5+NczQRz7bUqcKI158wa/QTyuhpdR
         E9/Lp5vbU6RuAd6vwripCJS2YqDD+eV6evdrK+6L/CyH1Wm7vFP0BQmC7+UjPX+V5hdk
         DCfcw80d7KafrulTnljjf/cIz+4+7JEs4bSApzzzeGsffuYScsA8qUo+gfrE697lVUWa
         qemYcFFKSUIravy0KsDiF26g8wwqhEx0H7xkyJMHIyv4YhsaPPisQ33MP/uavpq/lPdH
         CChAdJrajFDouAAsKg7NPW0lcWr1er/1mwNKMcIeGwYKH7haAS7bNrI1yTnVGxwt0l0v
         WMjA==
X-Forwarded-Encrypted: i=1; AFNElJ88VJqOrMWy4RWxCsSSDzPdpY74zA2ExNY+abB6JqQj7Q4FSfviUmAYZrCAd0xWAgD78ak6Bnbf4Fyy0RrNUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB68AlKXOYcCiSkK3Tjx/E8LBH1c9VuAEzEAVistEkGToOSGYK
	Nn4cxadQ5gh6JtMVXmbUcHU+KLYjli/hzSZLX4n4h01LVuyNehrizjoivTaDw7ypyi4+TNwjzM0
	reD/v9apQHSpamz8O3g5ndcZWy6wDEg==
X-Gm-Gg: AfdE7ckjg1AjiDkLYMlBO0R3hbVT0RJXl+tIzcHnJPE6bQfk+W4C01VSqBfBQQJYRI6
	i4CvXJ3KI4It0IUpQeZkHZOEoB8oR3L6LAObZejy2l8Zw900UnGXs93LKhsjKMtX6pT11xc/qpj
	rwtVANM0AwN5zrO4VHKddnz/OtsnEKRdocc8SavRHau6Hwq3ZnE+TQcnZUUuRRUPeuVi4eiZ2WS
	Ir5mzLxarT0yOI66gTesvjqEgX8IxxbX+II4nrbsCCvsFJOn25U1MfrUfaGaV7ePrYOn+bmzTaW
	1sGXRKk4xT4j35T7QDJXOJMT
X-Received: by 2002:a17:907:c001:b0:c08:22ae:6f46 with SMTP id
 a640c23a62f3a-c10810aa410mr290153966b.53.1782282109214; Tue, 23 Jun 2026
 23:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260623094125.95791-1-mhun512@gmail.com> <ajqZoOv-TvmOMLCh@redhat.com>
In-Reply-To: <ajqZoOv-TvmOMLCh@redhat.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 24 Jun 2026 15:21:36 +0900
X-Gm-Features: AVVi8Ce3Z-6QUrlwc1vKC_mNWrwGm9QCSsydSqBSnSiXLAHJBuAdHPRbOQVKR9I
Message-ID: <CAGEsz8H7FAq8yRp+GqQeWZosB55ABzShCX8pgz0HvS0Cccni1w@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
To: Brian Masney <bmasney@redhat.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_232151_591552_00C95F72 
X-CRM114-Status: GOOD (  22.12  )
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

Hi,

Thanks for the review.

I will send a v2 with mtk_clk_unregister_plls() moved directly into the
devm_of_clk_add_hw_provider() failure branch, and I will make sure it passe=
s
checkpatch before sending.

Best regards,
Myeonghun

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:35, =
Brian Masney <bmasney@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Myeonghun,
>
> On Tue, Jun 23, 2026 at 06:41:11PM +0900, Myeonghun Pak wrote:
> > mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, w=
hile
> > clk_mt6735_apmixed_remove() unregisters them on driver removal.
> >
> > If devm_of_clk_add_hw_provider() fails after the PLL registration succe=
eds,
> > probe returns the error directly and the remove callback is not run. Th=
is
> > leaves the registered PLL clocks behind on the probe failure path.
> >
> > Add an unregister_plls error path so provider registration failures unw=
ind the
> > PLLs before returning the error.
>
> Please run your patches through checkpatch.pl before sending.
>
> >
> > Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 ma=
in clock and reset drivers")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> >  drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk=
/mediatek/clk-mt6735-apmixedsys.c
> > index 9e30c089a2..04cf9665ec 100644
> > --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> > @@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platfo=
rm_device *pdev)
> >
> >       ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell=
_get,
> >                                         clk_data);
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(&pdev->dev,
> >                       "Failed to register clock provider: %d\n", ret);
> > +             goto unregister_plls;
> > +     }
> > +
> > +     return 0;
> >
> > +unregister_plls:
> > +     mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_pl=
ls),
> > +                             clk_data);
> >       return ret;
> >  }
>
> This fix is correct. Since only one path will encounter this, personally
> I would just put the call to mtk_clk_unregister_plls() inside the if
> statement above to simplify this further.
>
> Brian
>

