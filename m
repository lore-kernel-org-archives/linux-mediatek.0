Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07676C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgcG69wJMEDlOfrcrB66xf1fY68L8Md1TPpoFiOhk6k=; b=vgfs1TmvpYrG6YcxZvhArkp01h
	y1IgLskcKaUsgEwtXKVR5W7YMj1VKYgGKrH1XL4/UrAZGuzyDfe84lPx6rO0vRI23ktdctVgMmgBY
	NlEXYmw9HM33C2F6HxTeNzVoku2o965LDY3B1TIKKnw5wRNdqeelr/yS5EzlJyEJj7zuGlNv/3e6V
	rhZHyQEnJTiZDuz+o7eFK7ly1YfFwh7ZMcssFOwiobNGqEaDa3tLufkU2Nir+VdOJlieinGyegYVJ
	rMf6k+RI98bGZneZAP0WSq2QDnF/yj0wE9w3wpYCklonia+H4R3GL49jXIm3ttGH8U3B24Zxq/Naf
	nBPdNFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Hev-000qUU-04;
	Tue, 07 Nov 2023 08:42:05 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Hes-000qTL-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 08:42:03 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso5535031276.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 00:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699346519; x=1699951319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgcG69wJMEDlOfrcrB66xf1fY68L8Md1TPpoFiOhk6k=;
        b=SQuZvYzwAUgkuccnOxfkO7HqrX09wV7ruajWcUtL8j0L66c74ilXyDdRVIAMy+L/d4
         LVqMx7YHlvN8y4EH54XOEUVRkd9aO54uDi8uXvwlkGsTLhICZiunaRIdnLyHbd/vGTSX
         7fadrKHWzj+vJhX7B0s/EkNZucYjBWkK4gR+IagKZNW7jHWoxHBwfRYhQrgZhLLY9H0M
         2EMlh9EUJofR6z7OK9H8aa4raGMIWbkhY/tqfmOqAMujwbZFwbeFbc3Or5a/XWFjEYCb
         fn/sEEUW0PrGhnJEowdz27aGM3ylh+atNMvfZ0Gp29lkiNYjeOzURVEkSgbYhQo8w10Z
         imGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699346519; x=1699951319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgcG69wJMEDlOfrcrB66xf1fY68L8Md1TPpoFiOhk6k=;
        b=jEJMuqdiMWT6reAFRFC1ODnZ1G899X8TMVEhlMPMtpmXQD5JutsMaKBQWri9CiYXRX
         ApYTmMzbbis3NA9b3Up1nvvfAHwS6WzniBpuS4J19NxaAgzKE/Wsa/ApvtBcdqnriKeo
         4reouhO1PE2Q5XX9oEmrjXdP0iVU4coHHtkgLOLJkqvAR/vpQuE605WHdOfPuTEBcSS2
         54Cm9dyTdR5J2oC8R9uZFG8l4wDNIrQhlOp/EYbi3NVUnx+oMYLQUpXhftPDh2vlvIY8
         ksHWT59N0FP1qiLiDcgVH0MoU0rPsxGHEwBAOP32dpyiG3qvljR7+g2rFl58HNWrL1cl
         U2EQ==
X-Gm-Message-State: AOJu0Yzx9JZcSChJ/1XtllCKHqxbib5hE3QJB2tH/ae1XfGdom++pBNx
	eNCRMvH+ciWhvk3v7zbixapJeYJwNiMwmZDEmxPUgr2SOj3ohUKBxqGw7A==
X-Google-Smtp-Source: AGHT+IGTVLSK2gIuDQoj91G4Z5EOP3fL2U7X4Gbhes4gsZRCMWuotzcvgO+u0q61BWJdtvv7b5AciiQd74DIbK0k3Gg=
X-Received: by 2002:a25:6911:0:b0:d9a:41a0:54be with SMTP id
 e17-20020a256911000000b00d9a41a054bemr31068358ybc.25.1699346519090; Tue, 07
 Nov 2023 00:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-4-zhourui@huaqin.corp-partner.google.com> <9a30463b-3581-4738-9eea-b45e0c9a1d7a@collabora.com>
In-Reply-To: <9a30463b-3581-4738-9eea-b45e0c9a1d7a@collabora.com>
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Date: Tue, 7 Nov 2023 16:41:48 +0800
Message-ID: <CABRjgzu4gRAyizik9ND7tDRpyJyZCBnhdAAWLarXJ_dXKXFghA@mail.gmail.com>
Subject: Re: [v1 3/3] ASoC: mediatek: mt8188-mt6359: add two amps support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	perex@perex.cz, allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_004202_228253_296F2460 
X-CRM114-Status: GOOD (  16.43  )
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

OK, I'll revise it as soon as possible.

On Tue, Nov 7, 2023 at 4:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/11/23 04:14, Rui Zhou ha scritto:
> > Support codec rt5682 using two amps.
> >
> > Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
>
> Can you please change the commit description so that it's clear that you'=
re adding
> the two amps support to the RT5682s variant? As it is right now, it reads=
 like you
> are adding that globally.
>
> ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188_rt5682s
>
> After which:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> > ---
> >   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/medi=
atek/mt8188/mt8188-mt6359.c
> > index e994faa3556b..917640939621 100644
> > --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> > +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> > @@ -1549,7 +1549,7 @@ static struct mt8188_card_data mt8188_nau8825_car=
d =3D {
> >
> >   static struct mt8188_card_data mt8188_rt5682s_card =3D {
> >       .name =3D "mt8188_rt5682s",
> > -     .quirk =3D RT5682S_HS_PRESENT,
> > +     .quirk =3D RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
> >   };
> >
> >   static struct mt8188_card_data mt8188_es8326_card =3D {
>
>

