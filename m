Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6938CCAC587
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=; b=NeH5jh59OwjG5cfoXz3Ao7piOB
	0C+1EHA4YP0/pi1hhGAAom6zyQzf2jL+Ghof9M3hUciferMdPOkJVAImHJgRxoIubNHvQmu8L8Bfs
	VHv4xwku6iM3n1PVYTw5d+SKMyAe167TYr1VLZmH8LtOGvCaz9PAB33ll2hl8408rlHGGsGidmPBj
	xuWNZ4WXP7vIy5RdwYbz7hDO/ic5lRaEwYDMMueoKvjkM6ArxtLFe9+RdR/I6WHrD5ZgecE+HiScG
	Z1LBz6LpUwxOcLwG9KV6nrU0aHNTi0Gpn5/foDMh5/TnNxgzG+MK/2xwyXxoSjhe2eXIU0pkw1aJO
	QAHLssIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIQ-00000004xj1-2o62;
	Tue, 09 Sep 2025 06:57:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpNF-000000043PU-2YPN
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 03:50:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f6017004dso5364993e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Sep 2025 20:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757389827; x=1757994627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=;
        b=IGeGVPcWHYGgtKdkIK9zMt/d3rBc5W8r+7K1NPXvUABSt+MSSR1UGzKfmL6CVpjJnG
         eyrgCdgjip2/dktKUY3suXeAbMWgOlFcpnyCMgZ9Ufh7v1KnNz1V1GdUGlWm3BG1+Daw
         OJQJsyRURHc6eNLC8YzrIjePa3vrLYICZtzb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757389827; x=1757994627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=;
        b=rdyuPNHSZxqV0z6u59E2LetbEQzhhVgRz0fyEh9C8sImfXIEH3SUObYLGZD3L2zHq+
         WOgo+CurImketfq0XYf7iz220KLJ11ZtYQFqYyvYbtfc1lFc4bKNVeEdGLM/CXeGVRoE
         GX8HhA1gTJPyI3zs9OGJ1PCh2q5VGMEzLQN4FAN6pmrC7w+Y/+r1+ja7eOfsQqfqzFlI
         xKvXoSRwowz0xzuYmUNKOVTLU+vdFiOr0mmPC4qb08rwxUvP8XWwQ/G82tGF7VMpX1Fu
         xEPBvt4v0lyn5vcqMzCiSGiNRcxxd85dfjCIXSXZB+jHBNN3/y0tw3Xf9Li8NmRsRT8L
         AjIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQvTlTkjna1I08KU8wpr42griIvOx59rMcdDrA0RVAQ2J68ga6SgFH0d+wFQmzV24nvB0NkzpaQW5xlplWCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYe3gTzMVhtn7HCYPdzGKHTxNWMG4Dp6waoATN1Ctqwq1V/P/+
	ivj33e4rdMqQ4QJRfVIobkaA3nZ9gGuZaI+OyUCSghbOkATHM8fdPawaQGA3Ly6+h5lL6ITJLNU
	PY7XuZyk/El0mV7XwtRgMaLeg5kd2d1eU+mq2T5dz
X-Gm-Gg: ASbGncsGrsAE9BOGFXje0TvhG+nkHF5kUNKKfpkKTgRUX2GfjnJQsDbSl+qpvm3T0ef
	7DT7YMgtjeuF75BJWUlnIpqUbX1vK508IyYYLFlfXI4r2UIBkR2pu7N9E6rxoUp8dmYjM7/dEej
	7WJvzbDFqemqy6Z0+MnnvmvwC0fz5dp8PTrJOoR7Ih/u+5cE+z26g5hI4K0Ec5uHRzaM+Hm/Xj7
	t476LJwRHCo/wzFjOx6Ru/zkgPJ0mzIr1/NA9lUBD9BVsOt
X-Google-Smtp-Source: AGHT+IGj8MbtzCVC3eleE1z+3A7HLn2+wwQE3Dbn34sAVj1F0T1xg3I1Y5OtFtL3Vq/iIqiBfRs27XObu4ME5Ad0K9g=
X-Received: by 2002:a05:651c:e10:b0:335:2d39:efe8 with SMTP id
 38308e7fff4ca-33b5840d79bmr17650591fa.44.1757389827313; Mon, 08 Sep 2025
 20:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250906082652.16864-1-leilk.liu@mediatek.com> <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
In-Reply-To: <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Sep 2025 11:50:15 +0800
X-Gm-Features: Ac12FXwAUz9S8d-8r_TaFcUSUGZ-l28LM65axRib-fNazk4pPZoYccYUgggaCpc
Message-ID: <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, 
	Wolfram Sang <wsa@kernel.org>, Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_205029_686685_E06AA9BE 
X-CRM114-Status: GOOD (  23.43  )
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

On Tue, Sep 9, 2025 at 6:17=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Leilk,
>
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-m=
t65xx.c
> > index ab456c3717db..dee40704825c 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *a=
dap,
> >  {
> >       int ret;
> >       int left_num =3D num;
> > +     bool write_then_read_en =3D false;
> >       struct mtk_i2c *i2c =3D i2c_get_adapdata(adap);
> >
> >       ret =3D clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> > @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *a=
dap,
> >               if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M=
_RD) &&
> >                   msgs[0].addr =3D=3D msgs[1].addr) {
> >                       i2c->auto_restart =3D 0;
> > +                     write_then_read_en =3D true;
> >               }
> >       }
> >
> > @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter =
*adap,
> >               else
> >                       i2c->op =3D I2C_MASTER_WR;
> >
> > -             if (!i2c->auto_restart) {
> > -                     if (num > 1) {
> > -                             /* combined two messages into one transac=
tion */
> > -                             i2c->op =3D I2C_MASTER_WRRD;
> > -                             left_num--;
> > -                     }
> > +             if (write_then_read_en) {
> > +                     /* combined two messages into one transaction */
> > +                     i2c->op =3D I2C_MASTER_WRRD;
>
> i2c doesn't change for the whole loop so that it can be set only
> once outside the loop instead of setting it everytime.
>
> Something like this:
>
>         if (i2c->op =3D=3D I2C_MASTER_WRRD)
>                 left_num--;
>         else if (msgs->flags & I2C_M_RD)
>                 ...
>         else
>
> looks cleaner to me and we save the extra flag. Am I missing
> anything?

It looks correct to me, though I think it requires a comment explaining
that "in the WRRD case there are only two messages that get processed
together, and the while loop doesn't actually iterate", and reference
the block where the WRRD op is set.

Otherwise someone is going to look at this snippet and think there's
some corner case where all messages (# of messages > 2) get handled
using the WRRD op.

So maybe it looks cleaner, but it requires more context to understand.
Whereas in the original patch, the extra variable sort of gives that
context. In this case I prefer the context being more visible, since
the original corner case this issue fixes is also from missing context
and assumptions.


ChenYu

> Andi
>
> > +                     left_num--;
> >               }
> >
> >               /* always use DMA mode. */
> > @@ -1293,7 +1293,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *=
adap,
> >               if (ret < 0)
> >                       goto err_exit;
> >
> > -             msgs++;
> > +             if (i2c->op =3D=3D I2C_MASTER_WRRD)
> > +                     msgs +=3D 2;
> > +             else
> > +                     msgs++;
> >       }
> >       /* the return value is number of executed messages */
> >       ret =3D num;
> > --
> > 2.46.0
> >

