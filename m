Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC33C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 04:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw9eqla+4WEFJzC5MXcYyWJHlS7ohQWFgUNHhet/5Oc=; b=ZpmgMYYy1MX3zWkXnkMSBmYO7p
	Jw30z18hIAdzZq4bTEj2h+TlCObDXQk3AlOSNWNi+l8iHuXJtGsH0kGr0EWw1wJr8eUGdMrOHH/PO
	lngetr9Ak7k/kiFhCzh9+7wKYwOGSoY3gC/VzNcsP2T+bVGYHO5b+l7DqdysIkNIdg1bL2z3pIki5
	SR3tbSFyQiYxT+gzy1KnUu8rhlkX8LhmQKBkMZPfWudiZN5e2YMDp/fX4Ovk4hsdaXQ9j9fg2GX82
	GuKBR7DGh2IPCIlSGcxEcJnr1631KxigbW71qMa6yCnn8qdOFF3Eo22sBLUKKYgbcaDiRAqgBJOMd
	vLSJpZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKW0l-00000007ewq-2DX2;
	Fri, 21 Jun 2024 04:36:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKW0i-00000007ewF-3y3o
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jun 2024 04:36:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52cd628f21cso238730e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 21:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718944587; x=1719549387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw9eqla+4WEFJzC5MXcYyWJHlS7ohQWFgUNHhet/5Oc=;
        b=Oc8MT3aJl/HtSxFedup+TEeNy5ut/qcF/uV5Mq5nWekWMRBIkuxqcdPJS/kGwYNf6Y
         8eKYMsW3EYCX9E9mU8KzVsBbTkBapSO3EaeNwliZc1LB7HZgdgDVCMmkZ6oQqrNTsPT6
         PQkEdx/UsTm0vAUGlAtO1xzuQvB2epQl7+WPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718944587; x=1719549387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw9eqla+4WEFJzC5MXcYyWJHlS7ohQWFgUNHhet/5Oc=;
        b=fPf47UhDZog95z3R9vyOg//Fu4NZurqa9CwIJ2uJmsg91Yw7Q6TsNeFrLZlzP6Ibxp
         yg/ng3MCNeBt/HN1kFD/7ABi416+naUP27uDwEJ/21dhWk/L4UZx6PTGyqM3tjXzHzOj
         nQcnsOKtFjX+Rr+iAxSTa7pYbdtnb1NBhFgdtG1A04eL6j8tTW1J4zn1mNwKNDFBxVbo
         LZWoTZSwl6to0b8jwdzVfICH27ZwzN+FTVdbeXDmObZsC3MiIlTosP6urs6YCoDTcEV9
         7J/LegLBOPNVdggsA8L/f9EtTCGXRxQ9RKmJqv6RfxkDMIPMvbUoD4WzKQs1BcOGGGWW
         qnow==
X-Forwarded-Encrypted: i=1; AJvYcCXiyJnlKNfR/+CPdPbVmvvcGUIQa8dLd0XWrTkcImr4qhOwajXtYODHY7UnhsnlRyqwsF81MifqrKvbRKRi97ChHX0yBOy52yZY6MRUaTTo1S6M
X-Gm-Message-State: AOJu0YzHJXTsF5eNx7eah1jZ9F23nqm4pdQ72Zqr7/14q8JJ1zdukCl2
	SwCW/h0bVsXTJzzPA0YqnyIpD95icWGYXwVgbe0TMRydZWAuIUHdw7DGmZWrkSWXSmauYPUbtLa
	Kc5QItq+02/A1OaKackCIE6pr/DwMMqrOkenr
X-Google-Smtp-Source: AGHT+IEPOx56mth/eoNVspclyTmtuDsKA4qruGwwFkV/Tvs4Ji2AC3El4RzP+9qwO2WHKD7XvJjJ5XQecwMBpwY/q40=
X-Received: by 2002:a05:6512:2087:b0:529:b632:ae4e with SMTP id
 2adb3069b0e04-52ccaa2a9b5mr3937318e87.2.1718944587158; Thu, 20 Jun 2024
 21:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240620092526.2353537-1-wenst@chromium.org> <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
 <CAGXv+5EGqGB=Bb-YxY1eCPg216FyVHT7Xs_Zoe2EBMKuRmZMow@mail.gmail.com>
In-Reply-To: <CAGXv+5EGqGB=Bb-YxY1eCPg216FyVHT7Xs_Zoe2EBMKuRmZMow@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Jun 2024 12:36:16 +0800
Message-ID: <CAGXv+5E5io6NMvdkr7gX1rrVBk5OX+pocT4qgyArJ3aE+jGXUA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for
 ETDM1_OUT_BE dai link
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_213629_037745_3AE4C3D3 
X-CRM114-Status: GOOD (  28.76  )
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

On Fri, Jun 21, 2024 at 12:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Thu, Jun 20, 2024 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 20/06/24 11:25, Chen-Yu Tsai ha scritto:
> > > This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29d=
a.
> > >
> > > Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
> > > some reason. This does not have the intended effect, as the remaining
> > > DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
> > > entry, and the platform entry is completely gone.
> > >
> > > This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_=
probe()
> > > in sound/soc/mediatek/common/mtk-soundcard-driver.c:
> > >
> > >       for_each_card_prelinks(card, i, dai_link) {
> > >               if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", st=
rlen("AFE_SOF")))
> > >                       dai_link->platforms->of_node =3D adsp_node;
> > >               else if (!dai_link->platforms->name && !dai_link->platf=
orms->of_node)
> > >                       dai_link->platforms->of_node =3D platform_node;
> > >       }
> > >
> > > where the code expects the platforms array to have space for at least=
 one entry.
> > >
> > > Re-add the entry so that dai_link->platforms has space.
> > >
> >
> > Ok, but wait a minute... the commit that you're pointing at in the Fixe=
s tag is
> > a commit that fixes a problem identified in commit
> >
> > 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY=
()")
> >
> > to keep it short, after that one, without removing the COMP_DUMMY(), th=
e audio
> > was broken in .. some way, I don't currently remember specifically what=
 was
> > happening, but I had no sound at all.

In a way, by removing COMP_DUMMY() completely, you effectively replaced it
with COMP_EMPTY() (from the platform entry), while the platform entry
effectively became COMP_DUMMY() (which is equal to a completely empty
entry).

> Right. But this adds back "COMP_EMPTY()", not COMP_DUMMY().
>
> I guess I shouldn't say this is a partial revert.
>
> After painstakingly messing with the mixer controls, I tested all three
> audio paths (speaker, headphone, DP) and they all work correctly.
>
> I'll send a v2 updating the commit message.
>
> ChenYu
>
> > If the problem is not showing up anymore, backporting this commit to th=
e kernels
> > kernels affected by the issue that I solved... will break sound!
> >
> > So... well.. that's the "some reason".... :-)
> >
> > Cheers,
> > Angelo
> >
> > > Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai componen=
t and rework codec link")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >   sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/me=
diatek/mt8195/mt8195-mt6359.c
> > > index ca8751190520..2832ef78eaed 100644
> > > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > > @@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
> > >
> > >   SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
> > >                    DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
> > > +                  DAILINK_COMP_ARRAY(COMP_EMPTY()),
> > >                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > >
> > >   SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
> >

