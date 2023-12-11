Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73071C10F05
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 04:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTd+fEPmXY/+K0C4daC2dwAWjvpJ1oG4S1yMkL+8DtM=; b=V6z1XkaJngcllprMvPVPqxBDFR
	a22XBiZOFSjjkWNjPXKHx7O2taVodu+byTjneRL3+puTg10xnyNN3GXAWzyFiXsWNi4zR8GCqNtxg
	2wnw50fH9E9oot2O5kNktFC8ylWSSErrU1HM0hE771Q8hIHWQX9iTi0TzwvW1cbDvaqLWO3WswMiw
	ACrHGp0vngS3onTO1IRVeeqbga3G0uRdr+/XkpkZvOKjQzP3kH8S3ejsf6GBt9jy8jKezovGL9p1+
	RERr8FwhNEu0Oz2Hmez9JOJU2+fVc68AqPSOmmFl+zeeLi1szN/4tvD04WL6L5/KDkFzR4afgh0aI
	HHM8Qvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCXaY-003wuI-0p;
	Mon, 11 Dec 2023 04:08:14 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCXaU-003wt9-2p
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Dec 2023 04:08:12 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-464a3b84ef7so2294670137.1
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Dec 2023 20:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702267687; x=1702872487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTd+fEPmXY/+K0C4daC2dwAWjvpJ1oG4S1yMkL+8DtM=;
        b=oLicBBjTVNxJxBRUF5Tqzh7kJZj/U0M0nQTt+xPdxS9L+2ib/nQIid6FgO0XtNK1ES
         37MdJmq2uc3aGvLdHHDrqYMmdNdr9+mxQj9s5wfwFT6aNzK2eFFWq3GXY47y5g+6gje3
         mdCVv6eQEXXpagH7VNNbx6+qAQHNa8ZAmz7mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702267687; x=1702872487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTd+fEPmXY/+K0C4daC2dwAWjvpJ1oG4S1yMkL+8DtM=;
        b=O/UH6q8U3A4OwJ17qEEtrUPm11q4nnR9qvjQ8kB95tqLHr/eYxr3yZNr+EKdnIkAoM
         aHRzVr7eUC5zuH78GSLku4r8cVD/GVTLQ3E7wXYrZU9OxT7wcssFKNbS8BRDNkfdZVa4
         aXMXFKiavGubujg/uLKg601sLRftnB+1XIT1ElyQld7ZyeBcZpwiRbjm3UElb61M8kDN
         hUc588a+4gBQz4Lwgv2S/K9wkF4MsMdQBDzrA+sFEuuNUfaTFg9DL/ZOijbke5ZEOKA2
         uFRaXA56l05HtBoem2+lNEoXyJOwNrL8pQr5ASXVkSkULTaxlenoyKD1Go9xv2T8f++c
         n5xA==
X-Gm-Message-State: AOJu0Yy5vNzBYBEiyIy3el6D4WgDiimV5emoQNXro8EGn16FAC2nsITJ
	b2kuvsIRjpsFwLNPSRvaW6eKMtHb+5oTg24uXhM=
X-Google-Smtp-Source: AGHT+IGvCcYyOaJSkDerI25iipU4jk/0OJ9SUdzljQajmo7lF1Z0c3PgpCX+r69mFduYGMDdzV5M5Q==
X-Received: by 2002:a05:6102:66d:b0:466:23a5:7ed0 with SMTP id z13-20020a056102066d00b0046623a57ed0mr763569vsf.10.1702267686833;
        Sun, 10 Dec 2023 20:08:06 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056102511100b004662865945asm161557vsb.7.2023.12.10.20.08.05
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 20:08:05 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-464a0fb3fb9so2303011137.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Dec 2023 20:08:05 -0800 (PST)
X-Received: by 2002:a05:6102:5114:b0:464:3f78:3cbe with SMTP id
 bm20-20020a056102511400b004643f783cbemr2701028vsb.4.1702267684761; Sun, 10
 Dec 2023 20:08:04 -0800 (PST)
MIME-Version: 1.0
References: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
In-Reply-To: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 11 Dec 2023 12:07:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh6twyqoSgeEXDsW=+FZRUxMN=Pkrw45KFq-z5XaGpFtw@mail.gmail.com>
Message-ID: <CAC=S1nh6twyqoSgeEXDsW=+FZRUxMN=Pkrw45KFq-z5XaGpFtw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt7986: silence error in case of -EPROBE_DEFER
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_200810_934461_959CA352 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Daniel,

On Mon, Dec 11, 2023 at 9:33=E2=80=AFAM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> If probe is defered no error should be printed. Mute it.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  sound/soc/mediatek/mt7986/mt7986-wm8960.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediat=
ek/mt7986/mt7986-wm8960.c
> index c1390b3734101..24a4b943030d7 100644
> --- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> +++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> @@ -144,7 +144,9 @@ static int mt7986_wm8960_machine_probe(struct platfor=
m_device *pdev)
>
>         ret =3D devm_snd_soc_register_card(&pdev->dev, card);
>         if (ret) {
> -               dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n"=
, __func__, ret);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "%s snd_soc_register_card fai=
l: %d\n", __func__, ret);
> +
Please consider using dev_err_probe() instead.

Regards,
Fei

>                 goto err_of_node_put;
>         }

>
> --
> 2.43.0
>
>

