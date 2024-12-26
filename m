Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2A7E77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Dec 2024 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=; b=zU6H+xM/+LJxkw
	zmsYaDN7Du7yR8bvGRyR4zqEv5kKYqav3/T/+eEK5pRb5fL1eBOVXC2zJj8ymL3E3nNPlgnXwXbiy
	hJ3f1d5otuRD1oAHKf5lBzt9eSjLe2QjnE+dW1tWb4NCa9a2LUcFAEhhMQcOfTqm1Y/DABmhwt7lp
	eESc8R8wz5JJkqH7A2V+403DRTShRAskSSnF+1F2J3o+8lVvHYWw2JX3H0EX2b/awCIifb7EbchaH
	Th4B+HLHGPeOYrkuH7+/DjnChPIUchK35DVHp/LWTOzKS7W73HaDfZn9iDoWlTbt+2RrEjM34e8hZ
	mDoZYgCBNd2NAOx/BEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQjHV-0000000FTSr-49CN;
	Thu, 26 Dec 2024 08:31:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQjGI-0000000FTNN-3wlA
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Dec 2024 08:30:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso6739921e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Dec 2024 00:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735201828; x=1735806628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=;
        b=P5POj0mrh1gusbuSYDwYBBZfn2KuL+o+wGpgJV0iiQEvzX8oXIPPD2h4y3kfWajwTq
         /kVS2LHW+2I3nulOhrGLpJjrs7qkRjJDWLTuWluW3ALyoBSRuyr27Q9xXje9ZyquDtP/
         LzqesfI47CFJig0PDykY//hp6QR6MLcOCDGPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735201828; x=1735806628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=;
        b=lx2jkq7lAZUlmupv//iQjcj+CCN1/FPGaMPyFPIQWIL1qmW5YbRkibxmy1KOZN/KmK
         1iSoRBC7u7eRH1fWFEBitQwYBNAdptVN1Wu+3k51H+0X/ezl7n9gvZL22+p7SPqiLxxb
         DqgzuYnhNsSrQLeOToKZeWm3wj3RNrMGDWf4Sde180g0cJPnI6A1lhT1ccWUwiXnDgDE
         VdhbqiyIASvlSf2DbAzrOemd5ubrjFAeuUS/HZCjifHD3ih6iZsuGLK07H5KpUEm/jBx
         0zpRA0O4a80kdgNupjI1cYfzwGeieAhDMFO419/iMapGro6RHcNiPdApX60DKz4OXAp/
         dx6g==
X-Forwarded-Encrypted: i=1; AJvYcCUByGU99e9qhfD0mcQhBN6nJSy5/67SM+U+rS0FI0kG7gBEI2A3EDDGdZPfkkwRb/RjBVkAF5CuDJvVk5/HRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzatSwdZNYMaenXMxZdSQsmHKxshNVgkaxl/81SbIl7RbBA93Ff
	NNk1P9GWF1rRHiYSGmA2sa6Fa0QEMAmhVL5/SrhZUelRU6cA+1WGhyXalrvR3Jnp/EYA2taSmeV
	fkrvd6D3B4RQheUQdoGecEetfnPR0SCX0U93M
X-Gm-Gg: ASbGnctY7SEOc77GtRJvuZIOcXmX5xYIlJeSxRLtSUS/9BRXizpLfPo2g3sMIrt43Gj
	p5E6VKHQMRgdAo9sjfzI0s2vd2Ltyw7TnZPGwYFLNwZ5VwvayNjG3s1voZwwt/15yOw==
X-Google-Smtp-Source: AGHT+IGrtTwpjhhwhEtLkMigzaaB7SQidO5BfU1GsTXFJn5f4BLy579qZREaSEycCfwK3L6T9pvM3RblbNdUBiHFoWI=
X-Received: by 2002:a05:6512:4485:b0:542:2972:4e59 with SMTP id
 2adb3069b0e04-54229724f79mr7301629e87.28.1735201828402; Thu, 26 Dec 2024
 00:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
In-Reply-To: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Dec 2024 16:30:17 +0800
Message-ID: <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_003030_974800_EEE4F12D 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Dec 4, 2024 at 3:22=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> a dmic codec to be present for the driver to probe, as not every
> MT8188-based platform might need a dmic codec. The codec can be assigned
> to the dai link through the dai-link property in Devicetree on the
> platforms where it is needed.

A followup question about this. The DMICs on the Chromebooks are attached
to the PMIC codec's input side, which then converts the signals to standard
I2S and passes them out to the SoC through its AIF1. So the original code
was somewhat incorrect, though it works.

How should we describe such a connection, given that the MediaTek sound
bindings aren't a full graph?

> No Devicetree currently relies on it so it is safe to remove without
> worrying about backward compatibility.

Removing it didn't seem to cause any issues for the Chromebooks that
do actually have DMICs. I suspect the only difference would be that
the wakeup-delays no longer apply correctly.


Thanks
ChenYu

> Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board wi=
th nau88255")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediat=
ek/mt8188/mt8188-mt6359.c
> index 08ae962afeb92965109b303439419bc6e7c2a896..1550e56ab57d54b179ebe5cbd=
60db1660bb0bd2c 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -188,9 +188,7 @@ SND_SOC_DAILINK_DEFS(pcm1,
>  SND_SOC_DAILINK_DEFS(ul_src,
>                      DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
>                      DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
> -                                                  "mt6359-snd-codec-aif1=
"),
> -                                       COMP_CODEC("dmic-codec",
> -                                                  "dmic-hifi")),
> +                                                  "mt6359-snd-codec-aif1=
")),
>                      DAILINK_COMP_ARRAY(COMP_EMPTY()));
>
>  SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
>
> ---
> base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> change-id: 20241203-mt8188-6359-unhardcode-dmic-ba7649f8a72b
>
> Best regards,
> --
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
>

