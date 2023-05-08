Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAE0C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X96dgxdvJ9o915QcPKTh2Rv+glavrTF5xrnJD83Sv1c=; b=F+LlPcM4fGGKcQs+2t9lX+gi3L
	UriiapcvOhy3s5slqrItCnJBnKwyZYC0DnHaMsXTv/GfXVQ22KdZF426ix301KOGYyuIl407GmOBJ
	UOoGfXfwj+L0b0ru+QwNdkE3TSwA/2E5g0i/nw7T+QcN7XQKrhSRolOkKi250/C6TwXLIeKq/LsNw
	mZO+FNcd8HYeilYcxoMETrzLFXS2y0bnuAxdiQY8wx8YsbTZ1xSxK1qmKXSU73DFXle8Y8PY/21EX
	AfXZ8RjcxAYyQcvWOwy/14RYRCq0cI2ABMQ2h7/NJH57Wj2dQ6fM01H3fkEtDxTjUHB2+XDCd7aGs
	0qT6kF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw2rU-000sDD-29;
	Mon, 08 May 2023 15:33:16 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw2rP-000sBL-1K;
	Mon, 08 May 2023 15:33:14 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-55a00da4e53so83802937b3.0;
        Mon, 08 May 2023 08:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683559989; x=1686151989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X96dgxdvJ9o915QcPKTh2Rv+glavrTF5xrnJD83Sv1c=;
        b=ZV1rsZBlJUGN+3j/3ur6AhBC/1YbeaL+LSJPvfpRyThRRZ3aJADHg0v7e0/jChC4bJ
         SJeQLztFDK5zuIsVTJ+sKc+8+64sxkbCJwsIh8giwKld48ZjSvgK7hwSpo1/DDi77nrP
         nRCzXfQsVcDGSqNMOVq7AWqo2RvQ3BcHt3HGQ7ra1yq7/KZFqwwXcyKmJlo/lLE03oFy
         VhBOahyrAnKot+unHOA1dyh3Yk/vqsj8ohWqPDDYWp1ikQwXRWB64bh/usZ8ge6VzR5I
         rgp9NdMdtygboQcTpE/GGgxiqCN1p+MLqdctJKEqrXfB0ZjHjUbvJz7T/m3z4tcgQsiI
         hyuw==
X-Gm-Message-State: AC+VfDzRfxKErieuqFEyZ9mE0ipqZr/pbKWqf7tF65/xXKkkdftNa6LE
	7q/gisRoJMqwugBNDvBb+CfHCcuMc73Zdg==
X-Google-Smtp-Source: ACHHUZ6hbZyur0o7WJhOQgmDTS1+4vxrVS+rlcfLxXNiPdLMuZFpBgAXLt1crtqg0tjCenEaZUS2ZQ==
X-Received: by 2002:a0d:d691:0:b0:539:1b13:3d64 with SMTP id y139-20020a0dd691000000b005391b133d64mr11231919ywd.48.1683559989409;
        Mon, 08 May 2023 08:33:09 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id k205-20020a816fd6000000b0055a3420b256sm2579169ywc.55.2023.05.08.08.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 08:33:07 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b9246a5f3feso7293508276.1;
        Mon, 08 May 2023 08:33:05 -0700 (PDT)
X-Received: by 2002:a25:5015:0:b0:ba2:6aea:2b8 with SMTP id
 e21-20020a255015000000b00ba26aea02b8mr5025776ybb.3.1683559985056; Mon, 08 May
 2023 08:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiUxm-NZ1si8dXWVTTJ9n3c+1SRTC0V+Lk7hOE4bDVwJQ@mail.gmail.com>
 <20230508115727.2597864-1-geert@linux-m68k.org> <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
 <mafs035466ebk.fsf@amazon.de>
In-Reply-To: <mafs035466ebk.fsf@amazon.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 May 2023 17:32:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaeS_j5=o7Nu5oh8pOY4uggTpy2yd9P9yGMu6iNWiEWQ@mail.gmail.com>
Message-ID: <CAMuHMdVaeS_j5=o7Nu5oh8pOY4uggTpy2yd9P9yGMu6iNWiEWQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.4-rc1
To: Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Darrick J. Wong" <djwong@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	linux-um@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_083311_452018_DFD8B328 
X-CRM114-Status: GOOD (  23.93  )
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

Hi Pratyush,

On Mon, May 8, 2023 at 5:19=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
> On Mon, May 08 2023, Geert Uytterhoeven wrote:
> > On Mon, 8 May 2023, Geert Uytterhoeven wrote:
> >> Below is the list of build error/warning regressions/improvements in
> >> v6.4-rc1[1] compared to v6.3[2].
> >>
> >> Summarized:
> >>  - build errors: +9/-16
> >>  - build warnings: +1/-1439
> >>
> >> Happy fixing! ;-)
> >>
> >> Thanks to the linux-next team for providing the build service.
> >>
> >> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ac9a78681b92=
1877518763ba0e89202254349d1b/ (all 152 configs)
> >> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/457391b03803=
35d5e9a5babdec90ac53928b23b4/ (all 152 configs)
> >>
> >>
> [...]
> >
> >>  + /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uni=
nitialized [-Werror=3Duninitialized]:  =3D> 495:27, 364:27
>
> Hmm, I don't get why we get this warning. Line 495 is in
> s25fs256t_post_bfpt_fixup(). It declares 'op' and then it does
>
>     op =3D (struct spi_mem_op)
>         CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
>                       SPINOR_REG_CYPRESS_ARCFN, 1,
>                       nor->bouncebuf);
>     ret =3D spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>
>
> which initializes 'op' before using it. Same with line 364 which is in
> the function cypress_nor_set_addr_mode_nbytes().

I suspect gcc-12 became stricter, and not all members of the union
are initialized.

> Even the compiler warnings [0] don't seem to make much sense to me:
>
>     /kisskb/src/drivers/mtd/spi-nor/spansion.c: In function 's25fs256t_po=
st_bfpt_fixup':
>     /kisskb/src/drivers/mtd/spi-nor/spansion.c:495:27: error: 'op' is use=
d uninitialized [-Werror=3Duninitialized]
>     495 |         struct spi_mem_op op;
>         |                           ^~
>     /kisskb/src/drivers/mtd/spi-nor/spansion.c:495:27: note: 'op' declare=
d here
>     495 |         struct spi_mem_op op;
>         |                           ^~
>
> [0] http://kisskb.ellerman.id.au/kisskb/buildresult/14922057/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

