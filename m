Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C582BC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjJNON3xbO+Yh03gyOu9rx6tlrOQ/KcMrKYC4qdTMT4=; b=TzuNgJFRNFNrkH91zIqQqtlEVs
	G1fkPnhCECMV9JOdga5IUahwfSzbWbKQj21ad+R0CAb2hK1pcYYpqDxTKm0BjlWexBRG+uK6uSnFY
	2MwBTqrg7wfcNH9UDXSeMX9W/PxLq6u7ye0MEy427cRv/1DISHms/ofdD7K/AvMjVUDn4vw+JM2Wi
	jRU6Q5UJLIUxx5TJ22YhTGP1gK3oZ4SD9RlT0kqHRYuR6FC7olBMfy3UzeXU7mM6Qr0I8I96UiA1L
	I6CH/Fjo0V22H6zbhP7j7C452Yfgmkl/QbJiRzq7ctmWZi+RXw4fzY1I31qNO12+nm5boAszbLjS9
	lsj1gz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sERzB-000000025JX-1N2S;
	Tue, 04 Jun 2024 11:05:49 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sERz8-000000025IY-1lz4;
	Tue, 04 Jun 2024 11:05:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b94ad88cbso3923432e87.0;
        Tue, 04 Jun 2024 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717499140; x=1718103940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjJNON3xbO+Yh03gyOu9rx6tlrOQ/KcMrKYC4qdTMT4=;
        b=WX4r89fG5pbKvdzxyx6xfACgIlfVf2ZUCY65ifQS5gnkql28bTrlhNf0DBnFfgIL0A
         +2bazplMU2kiud+RfxCtGzwY7/RvlALWnzRTwPcWYawRxM2BVngVZEJ/U6uv5g3zD87r
         jpTyIRTXKakaohNBHSbI4PEiPG6R6V6LR4QXAVTZdFqxL6M/cMD7lkT88qu2UolLdOpk
         NGrsAPLa/V7llbnxpq0V+aaR9R06uhJgCLGfFDKte3uVaJLw4lw+9/geOYC/SidxuxXJ
         3hDDLjU0W7QdxbRjsJH6WP8lOknPpEY8eOJMtXExsCp5VLQNHOTHTyk1w+TE1+Z/tAiB
         KsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717499140; x=1718103940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjJNON3xbO+Yh03gyOu9rx6tlrOQ/KcMrKYC4qdTMT4=;
        b=CmRh/sfmBEWeYcRLEmnw+9ZXEwfFC60UPIDsfKSLYDBbwOfUJKEn4QFB9CLkcTd2dT
         udZYztMXjVoKJRGzjPGbQ1z/xiNnSm5icEwTKMgCbPm8SAKdkxsX37g79QhusIb63Y0w
         xhG/cW/PnRYg7PvuzohkU1L+wo6AKb4jYBF1hoW09BiaZbr9GwIlLPHvALhb58Ks0vBS
         nZxRKpRqi86M5SZqS/tEXw9BfjW+tgX31PQEpzdXwHH7AuA9wa9FmmU0h0gYBSAgJ7xT
         /h/I2zXpsihhTVPv+s+8Ah9MUR5kvhYnuVk5axcsMlhk5FvuEwn98ejeYHKBBx/w2frg
         b6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZTJX13u+XaNg9WL95t9CAohmrURVszR/VwUdj07lEFz3vzpTg36l/Y3iLX7ddEZgHsaoRnJRW3j72fhxEqEJtHVuus9WohKr/KZU3owb3vnhhFM5X5n/7oJIUU+fvixnkG5yf9HuSoo4E/CSGZAAyO26Nc3fcDM=
X-Gm-Message-State: AOJu0YwB/7TPYScakogib2aP3SProncIoeF5qp10zg+ruisKutIjW7DX
	cUVAR3Q5itNDKZnGcOe/pHRjocgeLiuriWeGDd1Z6tVr9YSjdVm0ldSJpOLsRyTyUCMwwCsw5T9
	hTGPjcUrVuS2yWjztM9bsQnTfcrc=
X-Google-Smtp-Source: AGHT+IGKVX7EW81SfP255Jyii0GXmIvdQOfcnZjcozuN3AC14wMPa/o28MFGzPREGwZRW/+wCvISJRXveGKYPM4NcEU=
X-Received: by 2002:ac2:5de5:0:b0:52b:9955:43b3 with SMTP id
 2adb3069b0e04-52b99554482mr4801820e87.60.1717499140011; Tue, 04 Jun 2024
 04:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
 <CAHp75Vexddt1xUGogRDZA9pM1pFp2=ZtCQnCfXePahSCb+oKpg@mail.gmail.com> <84f1c58c-0a5d-4131-a16b-b76bf28862ee@collabora.com>
In-Reply-To: <84f1c58c-0a5d-4131-a16b-b76bf28862ee@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Jun 2024 14:05:03 +0300
Message-ID: <CAHp75VcwnjrsAY1qF68MpBWV-NLFSxTP_PDL+ER==KNdBAFFTA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
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
X-CRM114-CacheID: sfid-20240604_040546_562536_6F3E2523 
X-CRM114-Status: GOOD (  26.49  )
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

On Tue, Jun 4, 2024 at 1:38=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 30/05/24 15:34, Andy Shevchenko ha scritto:
> > On Thu, May 30, 2024 at 12:34=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:

...

> >> +#define PMIC_RG_RESET_VAL              (BIT(0) | BIT(3))
> >
> > In this form it requires a comment explaining each mentioned bit.
>
> I don't have an explanation for this, I know it's two different bits from=
 some
> reveng, but the downstream driver declares that simply as 0x9.
>
> Should I just "mask" this as 0x9 instead?

In this case for all of the questionable forms, please add a oneline
comment suggesting that "these are different bits without known
purpose of each." or something like that.

...

> >> +#define MT6358_IMP0_CLEAR              (BIT(14) | BIT(7))
> >
> > As per above.
> >
>
> Same, I don't have any explanation for that.
>
> If you prefer, I can define this as 0x4080, but honestly I prefer keeping
> it as-is since I am sure it's not a magic number but really two bits to f=
lip
> in a register.

As per above.

...

> >> +       u8 r_numerator;
> >> +       u8 r_denominator;
> >
> > Can you add struct u8_fract to the math.h and use it? I will Ack/R the
> > respective patch.
>
> Yeah, I did that exactly because u8_fract wasn't there and I didn't want
> to waste more bits, but since you just asked for it... well, I'm happier =
:-)

Note, it's enough to have my Rb tag and route that change via IIO
tree. We have done similar way for other changes in math.h (or aline)
in the past.

...

> >> +       /* Assert ADC reset */
> >> +       regmap_set_bits(regmap, pdata->regs[PMIC_HK_TOP_RST_CON0], PMI=
C_RG_RESET_VAL);
> >
> > No required delay in between?
>
> No, as strange as it may look, there is no delay required in between: thi=
s is
> because the register R/W is behind the PMIC Wrapper as much as all of the=
 other
> MediaTek PMIC (sub)devices, so, missing delays was intentional here, yes.

Maybe a comment?

...

> >> +       mutex_lock(&adc_dev->lock);
> >
> > Why not use cleanup.h?
>
> I want to unlock the mutex immediately right after executing read_imp() o=
r
> mt6359_auxadc_read_adc(), and I don't want the reset to be done while a m=
utex
> is being held, as that makes no sense for this driver.

That's why we have scoped_guard(). Exactly for such cases.

> Besides, I find the macros in cleanup.h to be cryptic - in my opinion, th=
ey
> require better documentation as, for example, I don't understand when the
> guard(mutex)(my_mutex) is supposed to acquire the lock and when it's supp=
osed
> to release it.

They are cryptic due to limitations in C language. But for the end
user it doesn't matter. The behaviour is well understandable and makes
code cleaner and less prone for errors such as missing unlocks. So,
please use cleanup.h.

--=20
With Best Regards,
Andy Shevchenko

