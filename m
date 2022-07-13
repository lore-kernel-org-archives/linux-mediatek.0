Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B5C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDp5NtLIxNT/y/y4TV28JKQZE5KPsmeDwau7U2nvfbI=; b=T8Q37yKN4xoU2PlVJUtv1j9kGa
	B0JZg+kPV7DlQe5gQQIIW41nf9+EcCaVCtbzLQuSDpeA9Sct0Ej73zQ1X0xhA+swjvgCnuVUJPAvV
	LlO7WnjBUfZ+MY4NZuHpHAw9mtUZ9mp/Kmsl12gw0ZImqm1AqYkGuussaPrTxJOpKi0I5fB2ufc72
	PVQpmKUcIqLnVX6Z0GayeqQiWMGdQV8l4RRTYV7SIGqVwYPjkylYaF+OJa8YCMWRcJ80hpj1ryIRM
	7KZideN4nqSoyQtCHGPfW8U42sL9KO1HilEEeBjLWPmpfExQjq8OBojOI3rXjRMO76SpH1zv0JwKG
	/u/R7WCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBc5j-003nAX-6N; Wed, 13 Jul 2022 13:07:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBc5d-003n6L-MH
	for linux-mediatek@lists.infradead.org; Wed, 13 Jul 2022 13:07:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id d16so15408958wrv.10
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Jul 2022 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZDp5NtLIxNT/y/y4TV28JKQZE5KPsmeDwau7U2nvfbI=;
        b=ykcE/L76OyKjfmB6gW/9PEIXPb7KX9wbY5QZt6rzoJ7cx+NshQnf3zYFk9CJJmZ/WM
         Yjn5tpbDrFkjNkWS+WFrkqjSfGYuauzrhkLnPgPWJ+ijDPIFajS1TTDtmC2uQEI2eXJq
         v/PjSpgG/525Lm1jJ94ez4EFFEytapEdMWKLq79xQRBWSawK2YgrGJjhf+6mviSVU3q3
         kOx9C54FFQzStrBSdTBuFlQdgkenCIZH2XWgb8DLkaqKQZ3XbPUtvaJN7A3d1aNdPv+L
         MOY47XiJ+MoxEz7XvBmRhEiBH0MhBUFHBMZQFzRyd4+1IQ/e0LRFMgzPqoPQQ++2EeCE
         bFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZDp5NtLIxNT/y/y4TV28JKQZE5KPsmeDwau7U2nvfbI=;
        b=kcxjcr4Rik/3SOUnZ0OKocTRmEoH5x5n5CDPYY3EwYH94Kp0m9MnT4aX1Fk2kk/li7
         3JgpeTe2+GIKz061ReBy7c7PB6cXKEKF7k8b2829WfpUJVTsDyMgxAbcAdWOv1rqAfN0
         GzVf+3QbK8OgFZGoYaVoFFsNu/G/rlAPhETPQpr+A9Rz2SgM1yTfTQUR9oyktmy1fFHL
         TbroU7FJVTM09Dh0cWc8Qd0soLCFh/cwMZsswd83gQcu3PHeqAOmk5yZl1BFzqGUFpFl
         ZHUscYVNgLFWa6fjKXASxRLaEB/1M0PIRy8QLnVKvhC4CR7hpkjvFVAdFcdTeCH2W7h7
         R7fA==
X-Gm-Message-State: AJIora/d0Z6quK2btiC5mqsr1IDlGinEJSw04xxJ1Uthsu1hCwAJDYsz
	vmXJhNP4FPyGCju75Zmqf3a1iQ==
X-Google-Smtp-Source: AGRyM1v3Wejcmcef1+JLx2OGnt8FIDdBIQxbNYoMtF21Qn+Urzq7T2tg4YCX+P2hq8vPNX2sKjEQ7Q==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id q7-20020a5d5747000000b0021d65e9be07mr3162978wrw.215.1657717658781;
        Wed, 13 Jul 2022 06:07:38 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id l29-20020a05600c1d1d00b0039749b01ea7sm2628398wms.32.2022.07.13.06.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 06:07:38 -0700 (PDT)
Date: Wed, 13 Jul 2022 14:07:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
	Helge Deller <deller@gmx.de>, ChiaEn Wu <chiaen_wu@richtek.com>,
	Alice Chen <alice_chen@richtek.com>,
	cy_huang <cy_huang@richtek.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux LED Subsystem <linux-leds@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	linux-iio <linux-iio@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	szuni chen <szunichen@gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <Ys7Dl1oApfww27MJ@google.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_060741_750075_E0A808CD 
X-CRM114-Status: GOOD (  13.75  )
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

On Wed, 13 Jul 2022, Andy Shevchenko wrote:

> On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> 於 2022年7月5日 週二 清晨5:14寫道：
> > > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> 
> Please, remove unneeded context when replying!
> 
> ...
> 
> > > > +               brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > > > +               brightness_val[1] = (brightness - 1)
> > > > +                                   >> fls(MT6370_BL_DIM2_MASK);
> > >
> > > Bad indentation. One line?
> >
> > Well... if indent to one line, it will be over 80 characters(or called columns?)
> > From my understanding, it is not allowed, right??
> 
> It's allowed to some extent.Use your common sense.
> Here it's obviously broken indentation.

Refrain from going crazy though - hard limit is 100 chars.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

