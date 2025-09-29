Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31628CAC5B9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD/ZRIRPRoD4eeilEpQ/Ax8KbRLZBttE2gusXUBy/7U=; b=ajeWQJbHwfqXfZvZloTa5gfwqu
	FhVujkDToewij83Iu46/N1DAZeosYsPPGD6ZeTF7ioN544ThBnidov4I+OMt4/Td9RTNCT80DNROS
	FcN4w8IwfHApQ8oRvafalrKqFtGW+MDsPcQLf8u5B1H4wWD4OaSosCpYZhCyAmw7QE8UhncD+iB0b
	+5F7D0xtRzbo1K1JLHO1l3P5sCrT2N/upuKPnx0NwDGhJuibFy3Aggp4nSzktFn8tCD7JSacB0uXg
	HQAVNKvUKpZvWuufFusbYALxAx+R3sjh2J+QnX61VvmuD1kFaOZ6VkjKmLsAajNJI2d0KZ1yH2NIt
	ZFA69lHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FmH-00000002mo5-15jd;
	Mon, 29 Sep 2025 15:27:01 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FmD-00000002mmo-2xR4
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 15:27:00 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-362e291924aso40045351fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759159615; x=1759764415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD/ZRIRPRoD4eeilEpQ/Ax8KbRLZBttE2gusXUBy/7U=;
        b=YYTIc2jZHZLROPB1u44+vCBM/89/CdLLjjG/HoLv25VU5WcCwGfV/d6ue6upT+LhrZ
         X89mcs/0q5fxNLXAFu/l4m9YOtVspGCsPk2UVKVKhMwUzv0xYpeuznOogSQCA7ECaxHg
         PlqGuEinVJ49TxjCYWuSF5fBCMbH6FBjhmg74n4MTKmaWLo6dBTo7XxYJfvp+nzt56Uz
         A5EXDJvpWzKvqVJM1v9Rqn4c5ggRIGBeHLdAVPLkwcaf+TuS6FK6BRSEgATjthLwWGYd
         p4tWorrVvGTMQe0t2WDD0xyWVupgUjxA8UdIE31NQbp2tXuA44wWNXRCgbWaRXiUwRpQ
         AMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159615; x=1759764415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD/ZRIRPRoD4eeilEpQ/Ax8KbRLZBttE2gusXUBy/7U=;
        b=lZnR8yNJLLQUMbJYNKFrjbBHz+GJg0R1AcKmG69Adqj0U5Xv+lypf4JjKujIfuCL23
         u7LHgTm50bL/ZGnSjfFh0JYUK6vDwuIaor7I7CA4MTRMai+nB9XEv8s1ILNwtiH8p4gO
         4kIzw71EKxud5nExLgFTj8kxB0lbtCSpqhuaz4K5E22ot9p8+dPJe/laY9V4GGPDtumf
         dVeJF25sLDvPXf3AtnDABP1KS6M1rdd7Vg8ov1UuRgetbuXH1zawwpYQcGJD6OzUMBe5
         ghyvyVwJKt+C2NJu23r7Q+yN6mCLgiX86FG5iIkQVMXYLzsCpMVJlp32a53qh0Nr/6O8
         9kjw==
X-Forwarded-Encrypted: i=1; AJvYcCWit0zeHGSqRWuwmwfrRqisx+PKK3gp+gvxlUXNJ/5jnyAFrNYWS3f9cDs8CzBecVKwP5t54LKA3LKsSFBaQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzaq0fVot/1O8Jf9BOJHCXYEVtUZYzIZGzHjkjSaWmUd7Ep6KAy
	diLcPPWoqB+bph9aw2xTEsJRXlOiod+6qSnqdw+f2SEN+rbITbonIIwa9kJBd8WuvnEKWNDJ8rw
	ZWgkL341k6xCpISLvEqLhidSEjHl1aXXJ1dDGHm2KJw==
X-Gm-Gg: ASbGncs7eff1LhBMKOUavdF7MLVCq9liknia7CFc1vE1L8x0kO+nbU/C8R/duaenytk
	5Xu8P0KzbTVK82X+arG/4gx+BL04uR46irP8NpUX7OwMY3ZfaBrUGm7eLeOqZsiskMeYVEq0m70
	LOCm3qml5Wm8vNYi3fhGnvMmYVNzjiU7JoIkW74oLN3Fxxct+E++EA1YDcpFwFXSazQEENIKESs
	IikcOTw2kAA8D/T/g==
X-Google-Smtp-Source: AGHT+IEtN2lUKLnGoQ7WbW57ONBR/QKmzEKKycsDkK+DioqKXixXXuBeSvK0yyrJ+ATSRroRyWJm9ggSxHWFJcUI9/Y=
X-Received: by 2002:a05:651c:25d3:10b0:372:950f:2ae2 with SMTP id
 38308e7fff4ca-372950f3057mr14578111fa.5.1759159615153; Mon, 29 Sep 2025
 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250929025358.2064-1-vulab@iscas.ac.cn>
In-Reply-To: <20250929025358.2064-1-vulab@iscas.ac.cn>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 29 Sep 2025 17:26:44 +0200
X-Gm-Features: AS18NWC2Vrzn89dFO6i3Pc5PcwsDZZtJqDcKNUIw8w9lRMGluo4z28T9Y4iCLNQ
Message-ID: <CAMknhBFm1HPKv6bPnYALc_=wGBHWB3SKnWmnBZ82Pan9z9TPVw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: mt6360: Handle error in cleanup path correctly
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_082658_002273_D694B930 
X-CRM114-Status: GOOD (  20.40  )
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

It looks like you missed the IIO mailing list in the CC, so this might
not show up in Jonathan's queue.

On Mon, Sep 29, 2025 at 4:54=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:
>
> The return value of a regmap_raw_write() in the cleanup path was
> being ignored.
>
> Fix this by checking the return value and propagating the error.
>
> Fixes: 1f4877218f7e ("iio: adc: mt6360: Add ADC driver for MT6360")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/iio/adc/mt6360-adc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
> index 69b3569c90e5..97c4af8a93fc 100644
> --- a/drivers/iio/adc/mt6360-adc.c
> +++ b/drivers/iio/adc/mt6360-adc.c
> @@ -70,6 +70,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_da=
ta *mad, int channel, int
>         ktime_t predict_end_t, timeout;
>         unsigned int pre_wait_time;
>         int ret;
> +       int cleanup_ret;
>
>         mutex_lock(&mad->adc_lock);
>
> @@ -130,11 +131,15 @@ static int mt6360_adc_read_channel(struct mt6360_ad=
c_data *mad, int channel, int
>  out_adc_conv:
>         /* Only keep ADC enable */
>         adc_enable =3D cpu_to_be16(MT6360_ADCEN_MASK);
> -       regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG, &adc_enable, =
sizeof(adc_enable));
> +       cleanup_ret =3D regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCF=
G,
> +                               &adc_enable, sizeof(adc_enable));
> +       if (ret >=3D 0)
> +               ret =3D cleanup_ret;

This overwrites the original return error, which is IIO_VAL_INT on
success or an error code. In either case, changing the return value
will break things.

In cleanup paths, there really isn't anything we can do with return
values other than ignore them like we were already doing or log an
error message.

>         mad->last_off_timestamps[channel] =3D ktime_get();
>         /* Config prefer channel to NO_PREFER */
>         regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PRE=
FERCH_MASK,

The return value here is also being ignored. If we decide that we
should add error messages, then we should add one here as well.

>                            MT6360_NO_PREFER << MT6360_PREFERCH_SHFT);
> +
>  out_adc_lock:
>         mutex_unlock(&mad->adc_lock);
>
> --
> 2.50.1.windows.1
>

