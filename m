Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96366C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 04:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL85hlJEWNpWq8aoVq7T9RPrHigl/wy3kQyoeNe4Sas=; b=wLIQoAlqeYnRiGMZj/kYUgWT52
	RSmx2xg6EokO0Ob90nSZHig8nVQVdqRbgL7HcZOiYiUTDLMTe2Zmpm2M/xnblvmdhNcNi4Ab6Kpu9
	GMLJ2Hr7XhB6gGfhip1w4Wc6vU5OMsmhyIaQvlVyaMcB9B+Wr6FiFlbC3+2Rv9HyJWMGEG49wBDNN
	oqhWzg4JCifM4H0VeGqjJIsnUE6fOx+76B3GINZnwTwXYS/INRQ/6n7rC6f6QZaaSST7RCCYzudxG
	Vj+FnxPBcff0tOpkxjDvutpUH/bL03Pwc0Ia49kXsV5rqV/QmvtM8nY1pFck4uqr8VpjzrzVJbiVX
	iHj+cBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGBzE-007OHo-P9; Tue, 26 Jul 2022 04:16:00 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGBz3-007OAh-87; Tue, 26 Jul 2022 04:15:50 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 7so23561539ybw.0;
        Mon, 25 Jul 2022 21:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lL85hlJEWNpWq8aoVq7T9RPrHigl/wy3kQyoeNe4Sas=;
        b=hCdS8QSsYIw6gGaV0XS9IAV/+XD+Kk0QE5hzusxmOf5d2dTDTQQcL3NhqMYKbFY0Tn
         ALB21R/6DazMYeCAAzfSZS7P0Z41gJsw+nZjWX6PlQXwXANm3LVAqrB5PFsMuqAHqXem
         Mqmm3Ih1NTwtWzQhnAzSzRXXrf5yfCoFcjkmFFPLCmRVp2siIg3AfNjuCMTK2YESptid
         eeP9tz5wTm7qe3sotMpBO4iTSI2DKFf7D3YatBVRT/PbkAZVFycO+siEvHp7i27pNctb
         TonIMjdDnr0jjVWHRnLmYyT6Iqx8oAClUtlkGASQ6CkTyN1ePQ9WOQPU8smSEzTDkemD
         7GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lL85hlJEWNpWq8aoVq7T9RPrHigl/wy3kQyoeNe4Sas=;
        b=te28IC8itWXyf+e7/wuJUm0U3OplbzsmA7VEUBBNA+IVaUcRwIyEXE9uz7D4X5TgcI
         ghC3CLBowV0lvOsFw3o1lGjnaQFEbl8WKYMqQ4KcYx3Hd+rRLDKD4KSNR0TAfyyVGVyf
         BkfhkIXmNN8JbAIqILKTzsUCOA481Y9b79MFApnkFadJ0UWWNkyDN0Y+k0akfNggX9w5
         JfMq/z3RmlPqLpqQkRAVDsWEA5PnPNq8/CaPCbXSGtunjzYviD9tZsJwau1/A/J9AZPk
         cDGhAG8n0q+1rp4FFsziKEuypH64FHqxIP33fmx+1CNyVd0rr1AStsxpgd70XT2+cuZS
         Cg7A==
X-Gm-Message-State: AJIora/6E7SanpXL1lr2OHCPi+s1kuICZKvkEYvr94N2IGFFtHTBn8hN
	YZGvB+kRVrmBrLckBqoeh/0kAdZqqAMc4KYqsXg=
X-Google-Smtp-Source: AGRyM1uSqvDW6wRuMm0lak5Iwbp5WAlFUJEhBzOij+tqweUKRMo5toAZUB++pRBDQrYJNbxll8cTRP6sKMvIiCj1/Dk=
X-Received: by 2002:a05:6902:10c2:b0:671:73dd:e67e with SMTP id
 w2-20020a05690210c200b0067173dde67emr484158ybu.16.1658808945685; Mon, 25 Jul
 2022 21:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
In-Reply-To: <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Tue, 26 Jul 2022 12:15:34 +0800
Message-ID: <CA+hk2fYpDRw+DRRU3m=EDOP6UEQNpJLyNBHe8Zi0qOfUObTb4Q@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_211549_304684_F67CB31D 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Andy,

>
> > +#define MT6370_ITORCH_MIN_UA           25000
> > +#define MT6370_ITORCH_STEP_UA          12500
> > +#define MT6370_ITORCH_MAX_UA           400000
> > +#define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > +#define MT6370_ISTRB_MIN_UA            50000
> > +#define MT6370_ISTRB_STEP_UA           12500
> > +#define MT6370_ISTRB_MAX_UA            1500000
> > +#define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
>
> Perhaps _uA would be better and consistent across your series
> regarding current units.
>

Yes, _uA will be more consistent, but in general, using upper case in
the define macro is a convention, doesn't it?

>
> > +       /*
> > +        * For the flash to turn on/off, need to wait for HW ramping up/down time
>
> we need
>
> > +        * 5ms/500us to prevent the unexpected problem.
> > +        */
> > +       if (!prev && curr)
> > +               usleep_range(5000, 6000);
> > +       else if (prev && !curr)
> > +               udelay(500);
>
> This still remains unanswered, why in the first place we allow
> switching, and a busy loop in the other place?

If I refine the description to
"For the flash to turn on/off, need to wait for 5ms/500us analog settling time.
If any flash led is already used, then the analog is settled done, we
don't need to wait again."
is it answer the question?


Best regards,
Alice

