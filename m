Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8635B10A62CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=; b=CF8HxWZoWqSzwet2e7CwgTVhZI
	1VYyo8MeCmMFhj2ZRjb3AY5ewwBGzC8AxzJq96j/gyJu3dv0n9N5L5BYONSj0WwOQ9LxpWgFQq1uR
	YyuhXA2h91jcq2cQPZSGmRtoozeWz6r0b98rVAlb7LccdHrfFEMbdN1ixAMzk1eXRud9RpwzUexlo
	27+LxmJpdEfAlVn5f9veyuVMPdOpXnSQZ5zm5VDQzu+ekdsAEJIA3lITQppns2UqWLrcl19as661y
	+wKgY6//kcPMQBTORZedULRdzhrGnsyVgPRCpJ+dP6+2lPCLzjyEGZHowxjp9P0ZCQXHe0mRFbLqx
	1iskk/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kSR-00000005WDK-0Rlp;
	Thu, 26 Mar 2026 13:09:07 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kSP-00000005WCP-0Me6
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 13:09:06 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-506a6cf8242so9197391cf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 06:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774530544; cv=none;
        d=google.com; s=arc-20240605;
        b=D6zMHByUkDfN4R4to02H3bqQDKCamMNVHKfSrrXn1IbUCDkWu5dco/CDAQ6ItRgdty
         8yCLR6IDyC5JJgmSzKU+ZMBdX9Y935fk1+sJ47druPaFBuabEw5q44vNA2tlohSYv9f3
         iFtTcDyeS/mi9cP753jZOLJyfC+ODclw7hueSd2uQf2wOxiRBCDV33qSCs/kMxli0pPP
         3ZU6n5Qk5MjYUSskTKF/a8ArDFWhbGvwefXHJTDnJuplOk31TTUvBuKV0hLWA5Ukhnkb
         GwbdIscZkKcnQcbxlvvKlgAqdIDcXktMMYeNszYcS+Zrc9cO1QQEn+sugCRkFePHVv88
         pshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=;
        fh=ntdaK+hC7XiuQVl6Fhw3fhyMu5ACWaTMtDQ6/HnBWxs=;
        b=Vs+FGRH9i7eq152mXq2vJJeRiuyiFI6bl3bfr4a5wWgHdXzorxyXsWuFpOLmL13INv
         Kb6Bh519NU0WGQh746OSreYoASA4meErSsy7eeT5yEV/vDT8KMOifxHLWD5CYJObjl8Z
         /XMTcdf3PN0+CCrskZhozjyw4J2L2lokmKR+8ZFim8wroyFrGHHwjK/zI+t/y0TLDTQI
         sg8RwnG46hsg+I2IJxjgqENklORbJ27EAazvJjSgvrlFwnT8Ix5q8sPqhqO3cNYmjqWN
         k4ofUkcdkrTYDn8drqpt147k8sONWP/Ct4BGPRowA6O9Uh//hKTGkw5kRiCt2mz+XHbi
         2ruQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774530544; x=1775135344; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=;
        b=iDNd1NkAH34m7fY4S8oiJFcMkuKm50V+HuwR8RWPQ3c7E2QXZ528rgkpznw2z58TjT
         sB+S6s4e/+n9svuVtDdrthYcD0wa9I9Ml1LVQKgQi9PklrJFjinQP0p/70/SnQCSJghZ
         D4iX+2sPfY8eMPlEJRtsom3qJ0LZf8FS6/OLa81HSsUhcFTtpTXQC9ZD9KAMBHB2vxKD
         U20R774JdVQCZouOKWzK1UilZXGWG+KVCWnbdv1oclxNS29dSfPAFiVmX2mCvP3odhka
         mo3AugUe8tkqDKNhG4rhCa21MRnxmY4bbbD7jw32w3gmO5Hh6vO8Q7TbfduBnAqI7zjS
         iKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530544; x=1775135344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=;
        b=Cbok3HVSrP0hbZrTqFXaKipYAXMTgGpT0F2B10OBi3tp0WO0LQFIF31GY6RBuIt4xE
         lHsH05YaIiIxMxdaNUi7fc/xqaaqauGJhYsbdZovtKC0wTp+9CE9cmOrj/pKhNJhBR2J
         uE87KynDSPmvhrTh7YjUiecZRXrcFiY646uu+sRMENvFdNPLdiYhU7+pnUyhpFaQAYPK
         y7bRsaKhgC/utjnOxgzVLR0P30ZRF2BkteJHULk5HdT8K6Qlb3b4LZjl6vleFjfLajZI
         xxUsaqIblQWv5hA8Up2CeWui3dZY1JyknpDRdIrvvIv3rc4gDYULM9aQ41LyeyN3Mcgs
         dG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoTsaPZM18bQZ6F7EmTBp1uPxhvZlp04khpoTfLrICVLCDjR+9b+ih1qAS0B9e7yHh/9NhDPEyt8J9OvLAzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRyFYYx64qWskwJangdbTloURkRPOzXDt+vhbM7wDH4Nac5Zo8
	8zszjiQ6tPZnJHEAwG72CluHFTebxwxmTx8Dc9yr/Kerkoji5yhMRssDw/cx0DsSj2S3fG88Nqy
	esllWqqeP8Y/eNVSxd0/0MArAbd+MO7k=
X-Gm-Gg: ATEYQzwTvNBWthg2Qom169j1A+Se6LCaWDOEYjYrc1YcTmrbVK5CU5sZz1Xww7GaN1Q
	8wAlPehNefQilu2/FvHTBSEF/Ubk3kT6qwl1DuCBYg0iAzM0nTxTqWDSJXQ5dHICB/ydEaV353y
	Q/RnjLeXxSZzymo2S+Eqinc20aXTuUzYEPPC7Hw4Cw5RRwUnjm3bjwlLM2Harf5JB0Sg17kMSR1
	J6R88vPFJr+ebmYG41ONEP3H0R2mNZYk+dQn8+p5icWF5a1kV2Ubam5LV/y0+yJYGr6JTw0RKUx
	pcQY8wrqXEXaKhdK56ZD5pavAg==
X-Received: by 2002:a05:622a:10f:b0:509:3cd:b22f with SMTP id
 d75a77b69052e-50b80d14417mr109502331cf.23.1774530543679; Thu, 26 Mar 2026
 06:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-archtimer-v1-1-5328574e5935@protonmail.com>
In-Reply-To: <20260326-archtimer-v1-1-5328574e5935@protonmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 26 Mar 2026 22:08:52 +0900
X-Gm-Features: AQROBzCaJ6byPUSHJ4pm3sRtScQ6quhPCnl36SS5KcV2s9wTyxyUFaEy3F2F7nE
Message-ID: <CAKr_iV6uPSCZ1BzyMOxV3ET44Ho8gP19X=g1rzG83nWUzNkhWA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: initialize GPT6 as
 system counter
To: rva333@protonmail.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_060905_130608_AA9DD72B 
X-CRM114-Status: GOOD (  18.08  )
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

On Thu, Mar 26, 2026 at 10:00=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
> On certain MediaTek SoCs like mt6572 (likely before the CPUXGPT was
> introduced), the generic arch timer is fed by the GPT6. Some bootloaders
> don't initialize it properly, leading to dead arch timer.
>
> Fix this by configuring GPT6 when the MediaTek timer is probed. This
> makes arch timer work properly and removes IPI overhead from MediaTek
> timer broadcast when arch timer is used.
>
> If the timer was configured by the bootloader, this change is no-op.
>
> Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com> # MT6589
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  drivers/clocksource/timer-mediatek.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/t=
imer-mediatek.c
> index 7bcb4a3f26fb..7de34cace572 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -22,6 +22,8 @@
>
>  #define TIMER_SYNC_TICKS        (3)
>
> +#define TIMER_SYSCNT            (6)
> +
>  /* gpt */
>  #define GPT_IRQ_EN_REG          0x00
>  #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
> @@ -335,6 +337,9 @@ static int __init mtk_gpt_init(struct device_node *no=
de)
>
>         mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>
> +       /* Configure GPT6 to feed arch timer */
> +       mtk_gpt_setup(&to, TIMER_SYSCNT, GPT_CTRL_OP_FREERUN);
> +
>         return 0;
>  }
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>
> ---

Although it has already been written,
I tested this patch on MT6589 (Lenovo YOGA Tablet 10 Wi-Fi),
and I have confirmed that MediaTek's timer and Arm Generic Timer are
working properly as before the patch was applied.
Therefore,

Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Best regards,
Akari Tsuyukusa

