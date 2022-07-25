Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184FBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3INTKFVzGpgdLiO6cm/tt/F3n1FdE/J8Gtrvuuomg/U=; b=EPlRLLXKORLHgE/4wMDujquFbj
	YWaDUGjjUuElRtIngR0FM8KL+9k+ngVGb38WlrFdpnlXQwK/31jdK85bFb2C/LSiqIK9OMAet6WGl
	S2RfIG/dGsot2Ebid/19q055JE92/BxY2qYPC0a/bYj1VhnI+HYJdHDraRnkTlGHQkCBQ008LyT7E
	TC/oxDyxziM+lHajpCEZHMHZpMoBdqKQvgzf7EvqazjygDhb2JuVxhwIgBOZA/bktCokZQEA6N8BC
	ehPSO390kkRnKVcvAAznLIbuIXo098tksKW32+RzulLUMO65B5Bigh6BRqUHlIn8LfipvMqvdAE18
	tqRoBFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtsf-007DXX-47; Mon, 25 Jul 2022 08:56:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtsI-007D5g-SQ; Mon, 25 Jul 2022 08:55:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id z22so12992824edd.6;
        Mon, 25 Jul 2022 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3INTKFVzGpgdLiO6cm/tt/F3n1FdE/J8Gtrvuuomg/U=;
        b=KGUkTvmsrFj/i/g2Txcus2neVCIeH7fS7RYDzgarpCQjAlV25rYmvRqFk4rEW2Xu6H
         dVkCJgHWlrXopXOfsXa7jLI7QUV58LjpMPEGgOlQAaOnihMKMqUORjOGJ0SyGVX6oPmr
         AMrcGRzTVPctXdbs6Q2EfqiY6PKD5GpzJSWGECpaDGigxvdYX+uHjA92klNsnuWiXkR8
         KK3MgVH2qSoijeYpB69tibPEs3jLzlYrbqnbLehlkcag6TPz7QYuNOe0ls9ksOj0BiPk
         SOG0zIupDCmFrghFibZg1nOn4XrHoUYCdTW2Pwb7i2+PJ+hXVio5/EJxBh6mFV3wBtpH
         A4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3INTKFVzGpgdLiO6cm/tt/F3n1FdE/J8Gtrvuuomg/U=;
        b=0oevN1Th3YZFJA13MtGcWfp/XeCR+qzYx0iiG0qRZqFlqJiGu0aKfBxGeALJZZX9mR
         TFpt9+YqYjMvN/zQw3+5dDoHXpKlqf7y5/d6GxPRXfFRFdwQo9AHWcFNLtgiOWr45SvH
         d7GhQjb5svgJ5Ryl/KgF7+7pPI+ypLApuuC3CmUX6YqvP1uz0vefnGuGoer9pPaCcTrr
         rENvIHqS8HSKcU7Q7zVrnGzOO8VWWcDtBkYfho5QjUW55SANl71xYry6qr9l3LaO2WtW
         d7/kKIts5opzupiTnojU5vLFi7RlRpdNZ1E24OpaWQVk4vlj2umIotfk4fpXuWKm3M10
         GF1w==
X-Gm-Message-State: AJIora/m81fb6N32jayhuMR6ZuXhOUKs2aaDl64fOfTlTScAEyqx26cs
	qbThkpSBqMV9TP9uI55umfLJ0m8dW92sEi4X3Fo=
X-Google-Smtp-Source: AGRyM1v8y+nmZhsplbXoHzO4Ve+2H3JYkbB6esC4VwvluxmYvgNwKHcXWiOtO8fBnhCqb3I9/pY7SCo8PriYmFxn6lE=
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id
 w5-20020a05640234c500b0043a8f90e643mr11947835edc.88.1658739336148; Mon, 25
 Jul 2022 01:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:55:00 +0200
Message-ID: <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_015538_949077_D35311A2 
X-CRM114-Status: GOOD (  13.16  )
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

Forgot to add a couple of things...

...

> +#define MT6370_ITORCH_MIN_UA           25000
> +#define MT6370_ITORCH_STEP_UA          12500
> +#define MT6370_ITORCH_MAX_UA           400000
> +#define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> +#define MT6370_ISTRB_MIN_UA            50000
> +#define MT6370_ISTRB_STEP_UA           12500
> +#define MT6370_ISTRB_MAX_UA            1500000
> +#define MT6370_ISTRB_DOUBLE_MAX_UA     3000000

Perhaps _uA would be better and consistent across your series
regarding current units.

...

> +       /*
> +        * For the flash to turn on/off, need to wait HW ramping up/down time

we need

> +        * 5ms/500us to prevent the unexpected problem.
> +        */
> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

This still remains unanswered, why in the first place we allow
switching, and a busy loop in the other place?

-- 
With Best Regards,
Andy Shevchenko

