Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A66FCC062
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=; b=kDDWcewrP4mdlO/aS0HCOlzENj
	mcUd4tY1VA1UM3GJ7vgP8rbJXAIjSgmNX9H0ej9zFGVBQNF5u+z7u24ukJ8dQ4I5tG5jAnapFiWnE
	rzNJKx73zm12Ab4SoBJf6bnqVYQeRgjVBrGYvuJGFdGyF8hanqj17opsl7a32cirAcc1ch342WThE
	XMFO97a5gdCKOqFcktXC6EW5mG3vyW21RtKwVc0TPovHevHxB5qnA4yZlulZ4DhT0hxO/X1Qgfnd7
	nFEu9woPWn+tf+e3+ry42uFmIiuNvMD3tOQfvZtCfP+GC/TkSkEiuAYo/PsXb/ozAFB8KaU56Pwz9
	lgpRQc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyana-00000004Ooz-0a2k;
	Fri, 06 Mar 2026 19:25:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyanW-00000004OoE-2UdD
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 19:25:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-661b08b04deso847960a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 11:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772825116; cv=none;
        d=google.com; s=arc-20240605;
        b=V3xFVoNBH5O4OUZ9Lv8WnQtOkMrDuRFt31vh5sv9dG5+/Bw3Mkf0oO+1sGtpJ0vv8c
         YnawjPvWDxwFRZ18Ftntn3NECGValANZzXQslQDDYE8u0nXk7KIK+iMs3P1WsEzkPagp
         0gwaVQx1HkhV4zMrbuIPnrU/mbDjduFmM5ON7OaR/VlQx1czjt6MnfkEocR8WbAG7B/e
         jsgRMWLrxTFB+t3vo0TR6Jc2h7AwlFPebzbnfQ898AYpP94nhSGWnMQlF3EXAnpMKuK/
         zsw7CN/pSna7Ap8afvQja/6ABlbgcAf/fv2DqWlsgxqvGHxqWIRKxKzckBlA5AOW9ZkG
         G4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=;
        fh=LhTxN3uGI8B5v9etQOT7uyLd7hu/FCTmnDbv9wfXMmg=;
        b=dVwL2QxMb71IKr2NqPXVF4Izx0zvR/KTzQkUUhGP9umBEWzlp6WGTnXvPBqqyVyWFb
         vo5foBWzmf8i8sGJJb6jzIxrQEntQtRpI0ZMPLmwcGI2ijGN4LKPyUYTJrmNCpIolnnG
         CRQ5qi7vujYhTLxinPW2OMQ8fEkhhRKUFtBrRTdteHjHxJMvC05YRqoR8qJmnW4bgBW9
         4KTl3ID/3ZnzInrJ9YmkgNYlL2Ce1krwTRaOUo/NoFxnsQAYTR7yRE7iPdalYZmEpUJJ
         6bXQ8lS0ij9URNgLGcG4ENRzQ+6rkoMmqdnyItgGwJcui6AHei2eK7O3PmgbIwFMwZtJ
         gE7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772825116; x=1773429916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=;
        b=ngmS6mZ2g8tP5RFAD4F/KYAd3exBHsPI9QpiGWeoQvLSDjAJXObsGJQx3jtKP12yLK
         onlhv5ufn6BcYYiWaE4S1BfcclvpSqcJWFnH7WmOqLa/AayyWLNIQtJxf/NhPRb97rag
         mKowK2c5uRgG8jse9fGaQC3GdDfuNmZbkmzPjH+QIT8gkLgwVcld3Yj1rCxVsk25SdgK
         4qtM34ilqbhG6RTU/HSG3hDKTB4uf1ypVA9QKJOVAhHFjLvCj92wARpMlY4UY8RR1+9t
         UAPUYVS88j5Tfd5RRnh+XPA2mPF99nMqU3MIZTCQwouHPgtgwZlGQYgdDh289lhVqCr9
         MYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772825116; x=1773429916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=;
        b=KY9AtNONmPIFLqvIr0SXP3MDIYcqAkklzS/n7Tj6ZixWnrs5s0s6q1VtqM3xAkVvYM
         0lj3c3HuV4M+x3Z5uFMCUQATfK9YHwQNF1lkgQUaWC1qObnMeccQwWGw+IvXrHbM4/Yr
         TDw/c6Lbg1Wx+zAX2IvaiEmHi5UZeDUl9B/YpGG2oaxxTOQ7NFFx6u/NkHC547lM1D9w
         cBkkhXNB/WyUER4Jt1xA5hCoZqR8WPAtYXKU6AxRrfl/ti8/Tupj77FYsLgHLYLHfU95
         FH0WZZpox0Y4X58IUQmkXfL3sEoXWZGUQThnzdQaR15gan6RGETHvAohEDKKdlS5jJHN
         c2kw==
X-Gm-Message-State: AOJu0YwvQv22CPuxaJKn0b+jyWa1v8ArmQqT7HNavSDYCU+JSlJGqFCF
	eKff21ocxu7in3YotBkfTuBpr0yFM+J6/Ux5Lqc5ikvh8Zsog7qw4z3pkowqZ/HtYxUTvhZXrQO
	SirOb8RS8hEuzBlK51P4gTvBQHCzfpsQ=
X-Gm-Gg: ATEYQzyMkOtaZaXNYSkWpaxXdH8AW2Je7G4xCY53hIEbOg6IouIJCDd6/AuWeYR12oU
	cp4/ZT1oe0C2G+s/I/GxVghqIW2jic1PM5aMjyxNyqlwj3aCNG+z+nGOegf2njEfNQtpj1UwihA
	Bme+d7JWYURTUuYsF0A3/UXE44lGJeVt0qFR1aAbEXv5QbnEYifO5DKnirzFGHeiw18ZmPdlJrV
	cGVI2wDqPjq94sqrDc6/7G2MHie1odDQwG1jGmSohg1pjiv1pUqZllgykewb9v0b4kgIC/Gu9DA
	3APSzEJjXRYQZvUlRLK2LMd1PwOZBubfgg/eVwP2tEt7hbiFNTUaWKV9oYNQrCEfsKy+oWNy7C+
	U4XKNjw==
X-Received: by 2002:a17:907:e8e:b0:b94:1f00:1ffc with SMTP id
 a640c23a62f3a-b942dfaa0c5mr185959666b.35.1772825115820; Fri, 06 Mar 2026
 11:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20260304232014.164408-1-rosenp@gmail.com> <9dbf5b85-66ec-4d3f-99d6-17cc74a8f912@embeddedor.com>
In-Reply-To: <9dbf5b85-66ec-4d3f-99d6-17cc74a8f912@embeddedor.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 6 Mar 2026 11:25:04 -0800
X-Gm-Features: AaiRm52RG8EIUK4taryf8i0vskX73hh0iig_Nc3FNuaefwD5gTxikZtojl4SYPM
Message-ID: <CAKxU2N9q8c3jE3Ao46BsGERb73jEsBVjWnBFVf=B78=0TNbrxg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_112518_653403_849464D5 
X-CRM114-Status: GOOD (  17.22  )
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

On Fri, Mar 6, 2026 at 11:21=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 3/5/26 08:20, Rosen Penev wrote:
> > Simplifies allocation from kzalloc + kcaloc to one allocation.
> >
> > Allows extra runtime analysis with __counted_by.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/soc/mediatek/mtk-dvfsrc.c | 18 ++++++------------
> >   1 file changed, 6 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/m=
tk-dvfsrc.c
> > index 548a28f50242..48b1fcf3e101 100644
> > --- a/drivers/soc/mediatek/mtk-dvfsrc.c
> > +++ b/drivers/soc/mediatek/mtk-dvfsrc.c
> > @@ -71,8 +71,8 @@ struct dvfsrc_opp {
> >   };
> >
> >   struct dvfsrc_opp_desc {
> > -     const struct dvfsrc_opp *opps;
> >       u32 num_opp;
> > +     struct dvfsrc_opp opps[] __counted_by(num_opp);
> >   };
> >
> >   struct dvfsrc_soc_data;
> > @@ -489,7 +489,6 @@ static u32 dvfsrc_get_opp_gear(struct mtk_dvfsrc *d=
vfsrc, u8 level)
> >
> >   static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
> >   {
> > -     struct dvfsrc_opp *dvfsrc_opps;
> >       struct dvfsrc_opp_desc *desc;
> >       u32 num_opps, gear_info;
> >       u8 num_vcore, num_dram;
> > @@ -520,24 +519,19 @@ static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsr=
c *dvfsrc)
> >                num_opps, num_vcore, num_dram, num_emi);
> >
> >       /* Allocate everything now as anything else after that cannot fai=
l */
> > -     desc =3D devm_kzalloc(dvfsrc->dev, sizeof(*desc), GFP_KERNEL);
> > +     desc =3D devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_op=
s + 1), GFP_KERNEL);
>
> Mmhh... You should really consider building your code before submitting a=
ny patches.
This one specifically I failed at the make parameters.

This patch should be rescinded. Not correct.
>
> -Gustavo
>
> >       if (!desc)
> >               return -ENOMEM;
> >
> > -     dvfsrc_opps =3D devm_kcalloc(dvfsrc->dev, num_opps + 1,
> > -                                sizeof(*dvfsrc_opps), GFP_KERNEL);
> > -     if (!dvfsrc_opps)
> > -             return -ENOMEM;
> > +     desc->num_opp =3D num_opps + 1;
> >
> >       /* Read the OPP table gear indices */
> >       for (i =3D 0; i <=3D num_opps; i++) {
> >               gear_info =3D dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
> > -             dvfsrc_opps[i].vcore_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INF=
O_VCORE, gear_info);
> > -             dvfsrc_opps[i].dram_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO=
_DRAM, gear_info);
> > -             dvfsrc_opps[i].emi_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO_=
EMI, gear_info);
> > +             desc->opps[i].vcore_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO=
_VCORE, gear_info);
> > +             desc->opps[i].dram_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO_=
DRAM, gear_info);
> > +             desc->opps[i].emi_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO_E=
MI, gear_info);
> >       };
> > -     desc->num_opp =3D num_opps + 1;
> > -     desc->opps =3D dvfsrc_opps;
> >
> >       /* Assign to main structure now that everything is done! */
> >       dvfsrc->curr_opps =3D desc;
>

