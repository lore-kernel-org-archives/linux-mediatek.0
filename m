Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E396C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLLl70Z79LCpLtPtJ575VgA7J6GLp1vLgjnBpq24JHU=; b=d9wE0lnYq699b3WOgkmvQJAz1w
	D+ZNdcmbCX02Nu1f+YKAmShU9DALa6qjY6YOt+FdrPvu1W8tPUzv+XYdy8ZsKwsP+K7VO837+M8NJ
	DV5JnFxWkaM7TeK8PTP2kAdEHifDM7r7zY6IQGBbBnn7IpnoRjhhvE1wx+Kfeys0isjjeHPyxfdK2
	54TNlZdMXeqCrrrJOW5lXf+q7Zu35xZGPfWt5+6u1TTQ+zMUPzN3E7Qf5pUYvH/jlv47Ig6j1nI7s
	s7jM2wNQ4mPMivuBdnHxEpdc3YSkHENHr9t0B4vCc53SVSeZFjjh5BEynF1leaEYYLCroJEt6PmJy
	8Jif1kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESEJ-000000027cg-3FPJ;
	Tue, 04 Jun 2024 11:21:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESEG-000000027bt-2ufg;
	Tue, 04 Jun 2024 11:21:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso89819366b.0;
        Tue, 04 Jun 2024 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717500082; x=1718104882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLLl70Z79LCpLtPtJ575VgA7J6GLp1vLgjnBpq24JHU=;
        b=a7etaR9aBwdWBfSQI47rhY7qa1qIQB0mwAfrwxe1/Rwlu99P0CKgbPNXfXYkxpT3m7
         lTZFtfSMDVF+7yYCuUGXRLHH68U4CIqcdK7uXCYNzIumJMfn4PerYuWZP2RA/HOj9pe6
         iWbrVVoCBzKzrv0la6m/Jiyi96/j8Sb942RijCIa7kFTRLty9jydsZvFFcu2pEc+l8eO
         r+cDgsql9EQ369GpiYBrYWKa1Ib2BQTXzghCY/4hmZyJmc3owQcBGP6fb787X3t6F19l
         DL4G0nwJ21+tnTc6yUEMId41tQx0QxNZ61L+xMuB/iO8P4xo5HwDpyzG85kmnI6YEYw0
         aVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717500082; x=1718104882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLLl70Z79LCpLtPtJ575VgA7J6GLp1vLgjnBpq24JHU=;
        b=HRrX4pC0TxRClHJITht2o+6NtRx958ji6GPA0YxTt0OZFZtsxv/uGT97Tn0Ft39bx+
         ACBLiZnb3lCDpqGv8P17pV/D5lRKvgvvcXAyzhgfImJJttNR736RpvsJOgOOzEDhb7YD
         Pkn9oJxzAyoHVoD6cUA/HFF6W5w6FHzxM4TIMv6XehXNYJvyxH7S+zlVLjxrQTI7mxI0
         MM9+8CdRvtpWNrQLxBFuJ7ze9WgPP1Rf3uEIykpf445Hmb2PLI/k0KqNTH/vxTkiuWFV
         Zz5y/60W/lbM4gqI/bxj03n8hGMUMLU4UD4a/leM4dW8fhOSp+Zv8axqg5qiXVnyOe/3
         NTow==
X-Forwarded-Encrypted: i=1; AJvYcCUYqUDe6uxiv2g7xg1L9jBiIfxD7HO0kJkjMiW8a+To8URXxKrgPrMwIqL/Qwrg0Q2OTgFXVbk/edRas8PppBcL2mmXTUFI9wW30VZxXrffpHY0p+TcCBtANR1WREDWjLLExsM1DIe1K7zGsLtIjZGZa7sCmlR7ghw=
X-Gm-Message-State: AOJu0YzNLQtSgwI0TyavJBJTB/mid+xjp4L1R6ejgG67Z/q6DwvXVp9L
	bB1ju9ZmcjTEAeP/l4j+/zThxs4dgoy8tGpnwzGzqbPxUeFdknwci/jeVW7q1cOq55+yyxdl4yv
	Ng5FWkB5Mxwx4B0F/SQyoshQAsIU=
X-Google-Smtp-Source: AGHT+IGC27OT+Zq/I/Lv8Mjaw8iKiBSCJHrirdp6dMLOxtJiM85gRnwSXrr6BrqJ3fjj0DmaEcJRImuGGlsGaqRBY/g=
X-Received: by 2002:a17:907:6d02:b0:a68:ed0b:8924 with SMTP id
 a640c23a62f3a-a68ed0b89b4mr502547266b.16.1717500082083; Tue, 04 Jun 2024
 04:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
 <20240602111141.0058f39e@jic23-huawei> <60e55919-2a8c-4d83-89a1-6e4ae156d34d@collabora.com>
 <CAHp75Vf5a8VVyOXQRt9P1QnM6GHZ3rLuvnBF63H_83QBHOTJ9w@mail.gmail.com>
In-Reply-To: <CAHp75Vf5a8VVyOXQRt9P1QnM6GHZ3rLuvnBF63H_83QBHOTJ9w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Jun 2024 14:20:44 +0300
Message-ID: <CAHp75VdJRCnxEQDXsEi3yRcPvX9-JLUVkbm_Fd6YFnrHWYb1VQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com, 
	marius.cristea@microchip.com, marcelo.schmitt@analog.com, fr0st61te@gmail.com, 
	mitrutzceclan@gmail.com, mike.looijmans@topic.nl, marcus.folkesson@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_042124_757576_BC2FF9A7 
X-CRM114-Status: GOOD (  16.59  )
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

On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jun 4, 2024 at 12:42=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> > Il 02/06/24 12:11, Jonathan Cameron ha scritto:
> > > On Thu, 30 May 2024 11:34:08 +0200
> > > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
wrote:

...

> > > What are IMP channels?
> >
> > Honestly? Well, it's called like that. I don't have any clear descripti=
on of that
> > and not even datasheets are unrolling the meaning of "IMP". So.. I don'=
t know.
> >
> > What I know is what I wrote in the driver, and this is:
> > * IMP has IBAT and VBAT ADCs
> > * It needs different handling from the other ADCs, as shown.
> >
> > ...and nothing else :-(
>
> I could speculate with confidence that this means IMPedance (since it's A=
DC).
>
> From MTK6329  datasheet:

The datasheet for MTK6359 I found on
https://ebin.pub/qdownload/mt6359-pmic-datasheet-15nbsped.html
also has the same wording in "3.2.7 Fuel Gauge".

> "The hardware also includes necessary modes to allow for simultaneous
> current and voltage measurement
> which can be utilized to estimate the battery impedance."
> And googling vendor trees also suggests the same.

--=20
With Best Regards,
Andy Shevchenko

