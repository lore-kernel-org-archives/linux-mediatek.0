Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25CEE95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+gpkzJfNccB5gH7cb9zDfW4Fonw1ieJ8gLDBd6viIU=; b=qFBK+RLfElMBUBtamgAhRtEtR0
	VYTsYvZ1O6cI1ZY0ZgfhPFXLRx55lhzqx/dq/Nc17JkGpfMRLbRf9vX5lKq0TslPDS4bjJMqoTR6w
	h6ebMun+STykSFiuvtTluSr23D3jMd0BH2lxo6N0tIxrLhr6J4R3R5ZYvrrzjuvAXlVr+JGaawXJC
	+jnSLU1Nxo4uEfbFdu28DAztzkrTjh7gTeWcFpvS42f1nsCx4fNXc7Cr3IDE0q7K9uKXJg/aZSBfg
	VfMD3Y4Jlj0f+jgd3SlThy9cywTs2I3UMTFj+cLbze4X3CuW4pEvIjs6J9JakseKdksKc8UNMkpWF
	cf7WxBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpppt-00Ajd1-2N;
	Mon, 09 Oct 2023 12:58:13 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpppr-00AjcF-0a
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 12:58:12 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4577c1ae94fso392291137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696856289; x=1697461089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+gpkzJfNccB5gH7cb9zDfW4Fonw1ieJ8gLDBd6viIU=;
        b=FbxB78is7JMitOiTfZ4GdVDXxNYRrAx1iKr9V1j9q2uyCMcRYq8b8ACN7+7W2CXBjE
         RHs+jBDVWz7LdTU9YXSJtdrfqaWzoJyVxs7MIJOjIkDQx9uWK6BrCB+hmXU7qVOl045i
         UpZLendi4vlJZyfcwJi1BYALuErzQxCGA30agWSojq5Vs+Y+QFKjU0jhC8IWNZ0hkRco
         VXHeBYbD3NtM/yzhCtgJBqPrMcGmAw0wXcobq3pFEGCFFFv3cZ1M1hNY98kYLQLHWWML
         OBdiGz4RsOuy6AWxEzHbONTtWFlA7Mi7X7ErjQjP22rBWFK9+asPe84ZT5EmSR0Gn5wh
         KDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856289; x=1697461089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+gpkzJfNccB5gH7cb9zDfW4Fonw1ieJ8gLDBd6viIU=;
        b=mPZtNU/Zk4jULSDYojHBGv7f/nwf0nKRoQsLOUt8Hv1fHFrjuTi5won/cI01LiG4Vk
         jqvLnIC+NAU4v5sukLGx8EIRX2veR8YRfk81pjk9Ytubdhp9SIOA3W21C+7Iww9xINjm
         6YfcAR0GjogtUyKGWsGEfUjygF71V7BOoto2iUjKnj8LTYsw724kYHKqOPaA80QvyJTt
         zyDzjEN6PQ+rAA+luJ6KJIvgsuxbhMlyxM+YRXsdwTgFIHd/ibcZcleS+fTO1NKzdDD0
         pxSBKcKvFjpYeL3VrxI9CzL1B3UIDx5z6zjDeuf1X8Nnvhqw8MHsu/MMKXzLrknKAfy5
         5i4Q==
X-Gm-Message-State: AOJu0Yw1dZI1HFmVeHVGEg0Mf9IN/s3m3c2EHlm3AkPNsKglZn2ZWY+s
	yTR8l29AXSX5BT+fAOAQYtATT40dw4NjKUAV8FLNmg==
X-Google-Smtp-Source: AGHT+IFTAUfR1gTCm3D3XIrQD4F8FLARNjqBeGoPGST/5Xw+zvNixlquzd8Fm22XUFH6FlagNBuFNjaFz/vVg4Z8bjw=
X-Received: by 2002:a67:fdc1:0:b0:454:640e:58cb with SMTP id
 l1-20020a67fdc1000000b00454640e58cbmr14963468vsq.9.1696856289019; Mon, 09 Oct
 2023 05:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
 <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com> <CACRpkdb9fQUUq5_AOwXewiWfUjmu9r2SHHy-RSjfR_33znLiFQ@mail.gmail.com>
In-Reply-To: <CACRpkdb9fQUUq5_AOwXewiWfUjmu9r2SHHy-RSjfR_33znLiFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Oct 2023 14:57:58 +0200
Message-ID: <CAMRc=MdKRf5aZt3sYjPD_+CUR-prsN_JTDVP9fDdu5tRzNHvvg@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_055811_222078_4A60C04A 
X-CRM114-Status: GOOD (  11.45  )
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

On Mon, Oct 9, 2023 at 9:33=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Mon, Oct 9, 2023 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > > +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> > > +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs42=
448-machine" },
> > > +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs42=
448-machine" },
> > > +#endif
> >
> > I suppose this is a run-time dependency only for the other patches?
> > Can I just pick it up into my tree?
>
> You can, I was just thinking about bisectability and the low risk of coll=
isions
> with other patches. (Actually no-one gets hurt if it's applied to both tr=
ees
> either, which IMO is perfectly fine in cases like this.)
>

Nah, Stephen Rothwell will auto-yell at you for that. I'm fine either way.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we get any conflicts in next, then we'll deal with it with immutable tag=
s.

Bart

