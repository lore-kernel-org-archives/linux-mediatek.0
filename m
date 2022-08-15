Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B818C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 05:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwr7XkJX8s+Vxxl+k0pY94n0/ODkYyQntmhI8k+Qn6I=; b=RuGqkF8jkEz0dqIzkXIwFiyhG8
	+5DNh59A6MAfDQIP187T1fsfrtTZWq23HPro5f2IPecxgdXLYrheDd+RRxYWWE/YbQDwBXkTo7PVn
	I5Syhg1YK+j3V0XyCkq8RPuUe7WtpWLd8HWOXeTONr/w6hfyENEVIEKSvVU/N2m/Nm4M8AeDQeKd8
	XZiLwF+cJqNzdXdOKMmr7AAzSb3UZHD7KvGu8OGpF/M6kpK8tBAgKT609dFz+jJva303uMaa9i4It
	d4go7RAHFfSfn6DnP5j6okONBLq/o+JBfG4nPmrHm46Vz9yteHRQxwgsB9J7suMIqn5Ljf0kmImQg
	ze20TdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSmi-00BYwZ-8l; Mon, 15 Aug 2022 05:37:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSmV-00BYrz-Jk; Mon, 15 Aug 2022 05:36:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id n4so7842636wrp.10;
        Sun, 14 Aug 2022 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iwr7XkJX8s+Vxxl+k0pY94n0/ODkYyQntmhI8k+Qn6I=;
        b=ochcn0nAwaI+uZle8oxq2CMwsp35gCjwnpn4Q/BbMfX+/bVmddN92C70y9YQzJ8bk9
         3YnkpIGDwNf+olWm8vc3x9RrD+G5wgQGS3MAgJZcxU6YZX1yYOG1exd2hYIaokrfH956
         Doh55Xz+oDkE4li+WV9kkAnFw41V9U+30TY0TOjXQoGYbM69sLBEpzhqTwYI8mV5fLKW
         WJRd6GNgOx87Afp83QtX5xz3iCja+EjwBtPFavqCbaH5k75Sbn9DsjVz5fWlEyx4T2Ao
         CVtuCECiSvCTC8jfwK39UjB58B9BqZ+H5cqPn+MwyU9fzgAhXzV+uxTye3AslKkCpQPX
         fj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iwr7XkJX8s+Vxxl+k0pY94n0/ODkYyQntmhI8k+Qn6I=;
        b=o8h/YjmmsHpmPFw8uIuniaqAqGK3PJ1TqCnOwrYtcroyHT5/ec74NscxoD9vSggoGJ
         rFGAVAIKcTGw56amEC9d3vRx1tJABJ+ao44Q2W09j0fLDeouW01hE4+yyDemoEf6sXBE
         6VqD9jZRDxA1ELOnFyVVFvaghrE0GrASusxicmwvjUEw92+Hl1dlbN2ty3ARb7WFjV89
         41V2QKdWt3+mS88qtajYI97W2aoMmwGwNtIVAyESwfixXAcFBynTv3TrbpYfJBQmb4D6
         aVovnN/M+cc0WBJ4jZI17IjI/OMaRaT7n+pV9VG2dFIpI6A2VYaDEifNXx0UUJoe9e5v
         TOzg==
X-Gm-Message-State: ACgBeo39N9Xqb0u/YZ433TPJFJC51vh2bJBivc3taz5yK8hQmTEBzIAQ
	rbNIkylVqiZw2F3Y5Qge01Xxj/Q4DSVBusgV4lY=
X-Google-Smtp-Source: AA6agR6zEn89cFvufHE8chEgz2jlIkGasvC8tMwTtwMNFTMfHDOM1OkMTmoUyaytKEWPYis+Q6YeOgEF0rN7lxUcm98=
X-Received: by 2002:a05:6000:178f:b0:221:7dcb:7cbf with SMTP id
 e15-20020a056000178f00b002217dcb7cbfmr7791842wrg.58.1660541811221; Sun, 14
 Aug 2022 22:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com> <20220805070610.3516-11-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-11-peterwu.pub@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 15 Aug 2022 08:36:39 +0300
Message-ID: <CANhJrGOmFiC42_F+vX9zxg0uP_wdjQbBCPyn6+Zy3DkBycnaGw@mail.gmail.com>
Subject: Re: [PATCH v7 10/13] power: supply: mt6370: Add MediaTek MT6370
 charger driver
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, chunfeng.yun@mediatek.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, deller@gmx.de, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, chiaen_wu@richtek.com, alice_chen@richtek.com, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	linux-usb@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, szunichen@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_223655_857874_8A8E3BAF 
X-CRM114-Status: GOOD (  14.96  )
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

Hi ChiaEn,

pe 5. elok. 2022 klo 10.09 ChiaEn Wu (peterwu.pub@gmail.com) kirjoitti:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add a support for the MediaTek MT6370 Charger driver. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.
>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>
> +
> +#define MT6370_CHG_LINEAR_RANGE(_rfd, _min, _min_sel, _max_sel, _step) \
> +[_rfd] = {                                                             \
> +       .min = _min,                                                    \
> +       .min_sel = _min_sel,                                            \
> +       .max_sel = _max_sel,                                            \
> +       .step = _step,                                                  \
> +}

Just a minor thing but I think this macro could be useful also for
other drivers. Do you think you could rename it to LINEAR_RANGE_IDX()
(or some such) and move it to the linear_range.h? That would allow
also other drivers to use it instead of reinventing the wheel :)

Best Regards
  -- Matti Vaittinen



---

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

