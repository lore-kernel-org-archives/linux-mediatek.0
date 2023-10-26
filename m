Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D8C25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG2UysggiUwoOTUDtuwATYwEsAqlGEHP6tlUqmAyNpE=; b=EbkRod0AECUGZmCBmT4cI7+ago
	2U/v2peuE+Eg+4nemkCy8c80lclGplqNEgMmEmR6P/Hani/BSMVr35vjKG5cONJh/6wokGaTzpF15
	MZLUXN6xLUA1AqleVQqLFR9bGbJeXOpQ2JfxGsoIeLj3fYrwHVjO2qMO/qUgmANIR4Et/2LmHtYe6
	bjopr/ZmFpwX6r9ytZMWel8u/owozq60hhuH6somf2vxpLK9GQN8Y6vSZ3+jbcMC0RLYPIrbh7A2W
	cLOBrgprbjdxW7p4MJnppX/HOJo1zijSEolKyobzdOe/X+vM+klR1af5z9Tp3rvrEA4JV1E7mmtY6
	CIFooudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvt9O-00Diun-1F;
	Thu, 26 Oct 2023 05:43:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvt9L-00Dit2-2a;
	Thu, 26 Oct 2023 05:43:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b9faf05f51so69605766b.2;
        Wed, 25 Oct 2023 22:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698298998; x=1698903798; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG2UysggiUwoOTUDtuwATYwEsAqlGEHP6tlUqmAyNpE=;
        b=Y8Xx/+9ITIDPzBxz2gChObCVaAYOEHkCa6/PNb4vz8cqXJLZsqm/O2vGwpLXXw0bj1
         /rowrPVcKIXpyMMQD22fROlPeZTK2+641iKxLPrtyAOlRV47EzCsGVmVXpjf+Tx757y5
         2ZPEUl11Vjb6XTwuJ8SDa9t3IqsdRwQfzaw/j692XaB1rFe8zkiRviQN7YV8OplhxBGy
         X6S9RpWmISy9dn5w77jR/AeuIR0stJYB4q/tVdukUgu9CDJZT8p1WwqdFwOHG6uyOwVB
         zHcBz8K+lGVzCfP3hGQDrmau0E4OndkMfkg7YZDGWpyWO+bgRJ2HcAizerQLNCR78eaS
         rUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298998; x=1698903798;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rG2UysggiUwoOTUDtuwATYwEsAqlGEHP6tlUqmAyNpE=;
        b=JpaF8RC291YnRT40JMGN1sajgTMOrw7It0SyiMkWWj5qJ07zGp5izvTbhG7T74NLTN
         FBce2BZ5I3MBAW5VICBkKRRkN8gO8AoFonmJbNA3cT50zN7qm/nnScvjuge3a4K7yiHw
         qutzlomA0B36ZNlo2tY4sj2zy6JhQFPnMbedOn9h1hEioMSmODRhZYc/gVVQpdaQTWvD
         3srj/v65lsH+gusRz7PWwWbvtYNOHarQ1gptrEFLop7JSXXPJ6+1JZbV27wQ4N6aGKxe
         YQdaXij25fDtdA5Dho/sCHkEIWsJku/8Bbe37q6jok+OPFeQz6qkmlRYolQSwaiFJHcv
         XMRw==
X-Gm-Message-State: AOJu0YwWDfGeZbmp3Vb75IviEf+otA7m0qxhkNndnqBUkmESNx18IDNm
	qxOqseC8r/79g7biziAmLmI=
X-Google-Smtp-Source: AGHT+IE2Vvk6/8UrLk+Fqp68uEGIMn/w0ixG329AL4BRaLr6Z9i9Tbw3TAkzOcjxqMEkG/Sa24yY7g==
X-Received: by 2002:a17:907:7285:b0:9b2:be5e:7545 with SMTP id dt5-20020a170907728500b009b2be5e7545mr13394942ejc.36.1698298997475;
        Wed, 25 Oct 2023 22:43:17 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id y19-20020a170906519300b009adc7733f98sm11085906ejk.97.2023.10.25.22.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:17 -0700 (PDT)
Message-ID: <a9bb417341ee2f13c63f13afc1a5a3be330dcf07.camel@gmail.com>
Subject: Re: [RFT PATCH 03/17] ASoC: codecs: adav80x: Handle component name
 prefix
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,  alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,  patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
Date: Thu, 26 Oct 2023 07:43:15 +0200
In-Reply-To: <20231023095428.166563-4-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
	 <20231023095428.166563-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_224319_898072_0DAFE540 
X-CRM114-Status: GOOD (  12.28  )
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

On Mon, 2023-10-23 at 11:54 +0200, Krzysztof Kozlowski wrote:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0sound/soc/codecs/adav80x.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
> index bb08969c5917..c8c0fc928211 100644
> --- a/sound/soc/codecs/adav80x.c
> +++ b/sound/soc/codecs/adav80x.c
> @@ -229,7 +229,7 @@ static int adav80x_dapm_sysclk_check(struct snd_soc_d=
apm_widget
> *source,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return strcmp(source->name, cl=
k) =3D=3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return snd_soc_dapm_widget_nam=
e_cmp(source, clk) =3D=3D 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int adav80x_dapm_pll_check(struct snd_soc_dapm_widget *sourc=
e,


