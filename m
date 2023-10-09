Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465B8E95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XP7xqMhAKNqUEZKvD5L9l4hvT2pSYO7u42JTWvOuPhA=; b=FQ29+zNZ7r7PVMyqV4eEhnY9Je
	3AvUfEuMQPw8F60yEf316VjM/EGenTpbPfPCjVh4rGdiUzSmOEEPsSXokWkcaKvNQd6uW6uretTYF
	Xe3jUd5ZvjGN+51jDhVqGc4akfSOTFbpr+VUcDWHKR8X4n4V9jHj4/MmsAI0XmcToGib5PbwA5oBV
	zszBLvj06+xOW3wfBdtuYeEGQRUKRevhko/O7xGOJm7aXPUL8MUpJP0fxOY/iD8QtEtPgRZQNeVmz
	Jnx+2x5/sFnVEAFhs2OA7o/Q5gC59+QlSlSOnEami59S5ltAqQJ7qLjzQZMBuazTQ/xe/VxnnIAlY
	h1WcZ+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkm8-009uCJ-0S;
	Mon, 09 Oct 2023 07:34:00 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkm4-009uBI-2H
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 07:33:58 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59bf1dde73fso51077477b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 00:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696836832; x=1697441632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP7xqMhAKNqUEZKvD5L9l4hvT2pSYO7u42JTWvOuPhA=;
        b=Ie4+LUcS7qDHFXII+ZxB7jwn+m8X6t6qYiAlG/VCIAoqmW0f+9T4+g/6iZhZNLcYII
         Yt1cdxoMClh6foeRuSQfpoBPhb6K99MGD9E1YHPesqioIBN4ZyOF05L8lkKUBgPFrrJS
         y12Q1n2W7CI5vt+Fur7lr4wzR6CuCT1XiLBYvwB/RE9QQd1vgUI+hRaYKEKe7/YEKL/D
         2D+yZy6wcdxh6R4+VIkVozuXbu6rNnQbqa/5mjy1AxwCpW+qeTIupLN0mjdcSvX0Bvfc
         1IhNFUuNT34XAdeVIRBMw/UZIYNYDTmq9cYQ/wHiEVPnhb12lB3oOl0onGoGHKi9WARj
         f7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696836832; x=1697441632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP7xqMhAKNqUEZKvD5L9l4hvT2pSYO7u42JTWvOuPhA=;
        b=C3LBwsub7mcwdeq3xzLJrBPV3Owu4dH2xxASr9Gsp56VlfHdZFydSANvrXqdzLozy+
         qrgUTbeYJiWGcgos8zDJDFrspGyxBvTLDwYhjJ2fYIZOXcq0t91Q6oj+MCeUwRGG2fuF
         DEdUjiQFYalT9Sya9I9rBensNUJS5bi2hKd+2k8P7gm8mG4Q/aiHvG844GVSxzgGtekp
         byghTC2VRONa6ByoW3Kgy2qDNi3VJdUpu0w+E6UwMUZeGU5sNa7CyfeYI0COxrLYeIxq
         4aTregSpCCm7EIQeTcZUdTulwhZ5fnKkM7Gsjx5g/G+PmMalhU3Gy/+XZkHy+etEn4xn
         pibQ==
X-Gm-Message-State: AOJu0YxQbQB5rrOfyuXRibudQ+H36hI+ftMbUC2/GS7ZICjAkWwz//Vv
	Hf8XWUb8ITvb9Zp9213xGUOtqCqD3Xgp9/+B5trhiw==
X-Google-Smtp-Source: AGHT+IEDf+tWdei5nh9+KrKswBou7fmYuReydda8UjjPzL2odlFWlTYW4DCNoTjmggrOubAGLysy56eT9xq/AxYA+4k=
X-Received: by 2002:a81:840e:0:b0:589:ca07:c963 with SMTP id
 u14-20020a81840e000000b00589ca07c963mr15807832ywf.42.1696836831997; Mon, 09
 Oct 2023 00:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org> <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
In-Reply-To: <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Oct 2023 09:33:40 +0200
Message-ID: <CACRpkdb9fQUUq5_AOwXewiWfUjmu9r2SHHy-RSjfR_33znLiFQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_003356_744984_D315E05C 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 9, 2023 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> > +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> > +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs4244=
8-machine" },
> > +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs4244=
8-machine" },
> > +#endif
>
> I suppose this is a run-time dependency only for the other patches?
> Can I just pick it up into my tree?

You can, I was just thinking about bisectability and the low risk of collis=
ions
with other patches. (Actually no-one gets hurt if it's applied to both tree=
s
either, which IMO is perfectly fine in cases like this.)

Yours,
Linus Walleij

