Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C71DC27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 04:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0N5ODF55WzW9N7tClV+NF8WnSJ/yPUFLrnRCDn0qcY=; b=1C1ira9d+0lyNV76tPC7AprPHt
	0p9Swkp1yS9No8CaiU+UHIK5Y32zfvrkbdD2IOfsgO3nXDm+CnYvPqkI7ar2qOaHY8GXERh+zmISG
	2z3R/5c4VlKUlIsmQtHm1dRDOyBal5yOhLygLQKUvuPBk80ExM7djRSNoJ/OEedySpwe/qM2Xk6s9
	LSplMJybEWMJPDyQLkTcrKGxKO44TPLaSOX4zXASzd8qb8sBMHDO/XPOZrRC++/vhrWxT0+oh4lyA
	pR/tljb8dV/Kv7MH/ZPToKUO2/B7+Qq0qeGGH445Q1pbZsXyKZhME7OKfjHwN0Fs//E4vcftc1eAp
	iplcU1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKVtP-00000007e1C-2n8o;
	Fri, 21 Jun 2024 04:28:55 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKVtM-00000007dza-3FQX
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jun 2024 04:28:54 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so18249121fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 21:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718944131; x=1719548931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0N5ODF55WzW9N7tClV+NF8WnSJ/yPUFLrnRCDn0qcY=;
        b=W7RWExube0aVTWIhqvmFHspNllFujgA7mi1gfbCdeBZ7G0WH2MA3wQcMat8hsd0PVC
         In895nex25bx3MXXDuw+kRMe+BbbaFXMaYxL27C1Hu6tlV5Nov8bhTR4BEtTpeIK4YUk
         kxg3wPZwa7RV6YJ1/yYoDatxiRanyCB2wl0RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718944131; x=1719548931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0N5ODF55WzW9N7tClV+NF8WnSJ/yPUFLrnRCDn0qcY=;
        b=kyv1/TSXHevbL9UUq0D90j14qpdQbl/qvRKjE+/b3Fb3n607U0eW39Kg9Y4ICIwkZk
         4NllCSvGFUiyoMr62AbentwMQtReup9Wd82WVHoLaRFvq0viF3/5KJN8PKpDlIwxJQfo
         lxyTgRCd09rSW+cEtBb+pKgpiT4OXi+OVqkKsNraPCXG/PHtxnM1hj6BaKzxWWbZRSZH
         OvJ1gN68Iqra7TDfO8AqUvQUEHgFSMMBZ7pORk/6G/Q5HYveJ3U+e2L2dzqFBa8P8wMS
         hEXQCSiW4xYgvbdQQUYBQlxKmLAm8ik+fcvlKuD2WOT1Eh/n3y9Zx5Y4gDcJUXautT+9
         +NAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNYPSfQQ5WG0Obl0xCfrmCgFH6qIXXeohVnKbbtQNlw2vdHnlkFTmpjEdrrE2dkpS9/Bxy0n0ZIPpirNEH+SIJSD4yqyPQQUhT6Xvkp/70bIXL
X-Gm-Message-State: AOJu0YwLhVSjSTokkSFSKfczf6AaLdoXtw1EcDbDrdnRQLJVShGdJbvX
	JIpRPz2wkeZsbzJ0x2pkhvHafp3bQy8wRLnD3gA9ypcNQ69a7OQSv7Wn3a+yA+pRqPt23q14mCi
	gCu1upXUzNsAF1M0R41o1cgQF71/IRrN2zD/a
X-Google-Smtp-Source: AGHT+IEf221TRxxyD3Vt2YLv8hui8dqvwFIA+f2DRplnWv7/sZLD6TNo+ipCUSe/K76y0e7FExk9GfCSbD6ljigHWP0=
X-Received: by 2002:a2e:980e:0:b0:2ec:4f41:514 with SMTP id
 38308e7fff4ca-2ec4f410623mr3647731fa.23.1718944130818; Thu, 20 Jun 2024
 21:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240620092526.2353537-1-wenst@chromium.org> <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
In-Reply-To: <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Jun 2024 12:28:38 +0800
Message-ID: <CAGXv+5EGqGB=Bb-YxY1eCPg216FyVHT7Xs_Zoe2EBMKuRmZMow@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for
 ETDM1_OUT_BE dai link
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_212852_855064_49DEB26C 
X-CRM114-Status: GOOD (  23.86  )
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

On Thu, Jun 20, 2024 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 20/06/24 11:25, Chen-Yu Tsai ha scritto:
> > This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29da.
> >
> > Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
> > some reason. This does not have the intended effect, as the remaining
> > DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
> > entry, and the platform entry is completely gone.
> >
> > This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_pr=
obe()
> > in sound/soc/mediatek/common/mtk-soundcard-driver.c:
> >
> >       for_each_card_prelinks(card, i, dai_link) {
> >               if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strl=
en("AFE_SOF")))
> >                       dai_link->platforms->of_node =3D adsp_node;
> >               else if (!dai_link->platforms->name && !dai_link->platfor=
ms->of_node)
> >                       dai_link->platforms->of_node =3D platform_node;
> >       }
> >
> > where the code expects the platforms array to have space for at least o=
ne entry.
> >
> > Re-add the entry so that dai_link->platforms has space.
> >
>
> Ok, but wait a minute... the commit that you're pointing at in the Fixes =
tag is
> a commit that fixes a problem identified in commit
>
> 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()=
")
>
> to keep it short, after that one, without removing the COMP_DUMMY(), the =
audio
> was broken in .. some way, I don't currently remember specifically what w=
as
> happening, but I had no sound at all.

Right. But this adds back "COMP_EMPTY()", not COMP_DUMMY().

I guess I shouldn't say this is a partial revert.

After painstakingly messing with the mixer controls, I tested all three
audio paths (speaker, headphone, DP) and they all work correctly.

I'll send a v2 updating the commit message.

ChenYu

> If the problem is not showing up anymore, backporting this commit to the =
kernels
> kernels affected by the issue that I solved... will break sound!
>
> So... well.. that's the "some reason".... :-)
>
> Cheers,
> Angelo
>
> > Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component =
and rework codec link")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/medi=
atek/mt8195/mt8195-mt6359.c
> > index ca8751190520..2832ef78eaed 100644
> > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > @@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
> >
> >   SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
> >                    DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
> > +                  DAILINK_COMP_ARRAY(COMP_EMPTY()),
> >                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> >
> >   SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
>

