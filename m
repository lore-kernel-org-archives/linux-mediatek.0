Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97670CD484E
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 06:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=; b=GnPJCZC5lollYrcWI/vG1qVgnm
	/PCJCuRByAhSBFXIF2OzV7nsoRIYNTGTRV+CBC8VIJ6g1lbc1OdgxBNXTL/yCFVMJsKzE0ppXRwCt
	HunQJa020LIAy0aFvT3ecQtnr/3AVEFx9J32WCrntK0xwFngBzboWfokPJvSGDx+GPar684Lc+8lg
	eaKXAnlvYXXpwVAeTcGe1LZobFIUf+Z7xj0+xv95JpK1H9yKI5CZBnK+pJMwwsRbtd9clgakhhS5b
	07nDmPXjKTK9C9wUwXjP2KcLWKZFRMmwB4j4vNBtPzaDYzWXYqyOVrkl4n4rIXfxQeMI49oYAhdBL
	liQ6B/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgun-0000000Fp94-3N0I;
	Tue, 12 May 2026 06:48:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgul-0000000Fp81-2mzh
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 06:48:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-67e2498f3a7so8511404a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 23:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568502; cv=none;
        d=google.com; s=arc-20240605;
        b=AHNeKq1KiOuoyWHGN4gDciDBN27L/XjpTmdvx/5FwTyul9o3OgOyv4VoU/4q1+pXp7
         37j49sjgCsXJzxsM88eWuIuYrFF90TRHavhlJUU9KoqO0F9pUuvgmZUlJkL+dDvHuxiA
         YAm10kssOptVMrCl22JOEjtOWjp0ctmWUiGteM1zAb8e0QdmgTmHe4xkH7t3aKi+d2IJ
         FVKDf/0JH68ugKZq2RMve6iJc5uux9CmLevviP7zbooVBe1zfDD9UsDuDfajKOKLhLc8
         eTAAKY61b3lJ3ojSNK+JpsINVAD56xWX0+QROW31c5gKXDjUPFuvtK1QDjIZAasuuS7D
         Aocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        fh=Ow2fmbHo/yQ0wxhjOJhigxMn6rf5ZL6ZwgHCP7DKDqQ=;
        b=UqBz0m9fnThgAB9po2Y3eaBWggwDmLIHg2sHWeE2LizVhiT/r7VldvFQjxt+dU3Qn6
         6gQ12Oe+MfYH3AsAFB2JpQfb69unIo5s775SRGZ7fNiTVGdcJxic2QEnWxaQjYAV+gu9
         +JXOXwg9xfF162HYsQG5Qc1Ld6R7lIofarmRODYNzbep+BR/bxm/G9VQU8CjT2CHvwdq
         aGRIzv8xu7ZBi7RSGx2asAyoc9c4f9Qri1gEJ2o9XWkhARYTVDM17cwCtxXDREJUIjQA
         t8YdFwwdeJyWHy1xD3fZLvZ1Dz//ixn/fBk0WwuTwXrtcM1jhsPznIm7rOQnA6PIIt3z
         F+jA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568502; x=1779173302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        b=n81xxtHAKL1SV6dMz4L6vzRgskHahjmcac/RbyNUaUQb8PUwlYuuLVO9f4LxS5Ia8e
         6kvSWA+A/7hNd3k7PDXuvhfmH1O2qqtkm66/Icx2Xzg4HfFhqa2VPYOWyoMt3qcTXnJc
         kuzwEXpPz8s/vjj53HoL72TmWTpUGfPvySwLk79/o6iqfVgj7mOISDzM5muyirdX6/gp
         rSlx+lXlbhUHVoENWdY6czD3hS4XrXlyKr/GjMOAwo+Er5ThCMXEP2BuB1L1Dmaxbvgv
         ZaUuSpAjUfr0FBhNWctlZiF+ydFXlw1IgP7L2mzHGOUabDfKnEuGG+SGHD9Ot2Q49B3l
         +nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568502; x=1779173302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        b=pvoRPr3iOJyM7ILXF1oebITyKu4mRfH+BcvbGnZSVTrmZSF2yeuLqA+E/ofEQhLtHV
         Socxtjh3ydQUS1ojfeeGzdMH8RrIOBYdiTu5YX708sqW4ibEgU1HFFD32A7gfJlr7A8J
         IDtxF+vcFf0Qf6f80AMGLwdUDM+C3rzpelEBubp/LS1p3jilNPe4O8r4D29upwGKyzQ6
         PybwuGuywowU/FsoHa1sDJp0/R/fAECbpU5LUscz+4rhg1z9hVolLwIzFn8/aIGXODzh
         BOYGh2FggulROD2ENAlEJCGx19pfjm6S9uQvz/mJ2KSBup+VbpEIXoyN2xIVtCCN0PMb
         TgUg==
X-Forwarded-Encrypted: i=1; AFNElJ9FIxLhYBJn+ap6kYcRshhylZNdxq+P2SBoBEf5nznOw+XWGyh2fC2lGFAwntC8RA59SP5Q4u+bvaN/11R+bg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7X3gmO+CHSGZGGxz6ZdPr9y9bKbmnBtGHZiKsL+hXL1Y2BP8L
	HOoI87iB+WA14gzvaHWrQf9/rmZCZiNuOR3+Zeacdmmnb8qMOJhx4KqzKSx+hmMNilOWzF1hwZD
	o8kIlvFJbu2FjwegUxKBAafRkpFFnJ3k=
X-Gm-Gg: Acq92OGTMxpmvHddxcYhVTOSnrrgqeiAXH0COiKTko+JruNUVSFVlRwpGEjuGB8y3eo
	3HJYg9BW3RElpKWauMPz4veZ3HovlRX2crV2jsz/t2ieuGKZfBtChKR85wboezxX0MqxaMjJkgD
	Ws5+ipdn/hdSBZFv49cSu3byH6OoxqptWkOvcNKNiPVQlcYvWJYIob/GWfU7WwcELR1//xYVYp6
	s6MAwpR60fjUN3/qY5QnvLtMIWaTqoI7uBNqP7OMMVLAWKwSSaJlG6NVw25++iZhctO7TOAGIC2
	4XXVASnRg++xslFTczWfnlDT+ZFXjQLaiZb/mPa9w/vHhuwdnEbo0JRoqkRCW0+auog6v0AimTn
	D6FiAK5s=
X-Received: by 2002:a17:907:809:b0:bca:48de:5cce with SMTP id
 a640c23a62f3a-bcc1499a53cmr609442966b.36.1778568501606; Mon, 11 May 2026
 23:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 09:47:44 +0300
X-Gm-Features: AVHnY4LmZe6op_7Q9Zb_x2R3mJ89A3uDVU-76OXP9otXVwwfDX_cH9Q0T5k4R6I
Message-ID: <CAHp75VcR2pzdT-JbNXE_nOM-XC--4y8D81tk+7rvjA71ugTkzA@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_234823_723410_E2EDE073 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

...

> +#include <linux/err.h>

> +#include <linux/errno.h>

Doesn't seem to be used as err.h implies asm/errno.h that provides
basic error codes.

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +                            size_t bytes)
> +{
> +       struct regmap *map =3D context;
> +       u32 tmp;
> +       u16 *buf =3D val;
> +       int ret;
> +
> +       /*
> +        * Manual regmap_read with loop is needed, because PWRAP is not
> +        * a continuous MMIO space, but rather FSM which doesn't implemen=
t
> +        * necessary read callback for the regmap_read_raw and regmap_rea=
d_bulk
> +        * functions.
> +        */
> +       for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +               ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset =
+ i, &tmp);
> +               if (ret)
> +                       return ret;

> +               *buf++ =3D (u16)tmp;

Why explicit casting?

> +       }
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

