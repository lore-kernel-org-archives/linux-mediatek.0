Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFbscGfZ1HvqkolFfPgOHxRAqCYKsO6AGhI1CWcF3U0=; b=nfAxIFwhT0ddeiT6j0X/tmRVqo
	ne8wxb392gp85051024l3cT8Dwddv76xA7ka4nfEn77c2YIOOr4tzzmtLnlfGTVGATP5ERj59pe4x
	7BY9OntpLtpbJeoFXTCDcT9xZCmY3Ostmg4EN9Kea4KwLRelBdw8r+NFoPtmlwytUvFo0LHC8zUKA
	evsqyRk/1WqtkmYOxhiME78sE9poFfxAwwegT2vzW2DIbyDLSZWrqPTHh6c9JKJ0rylZQq1G+8a7/
	62ZcbkLzVrCH3A5n6xcBPmQ/PsyQF2DfOBbtDUIkfgbPTjeLkzGf7b9YZo74Wj7OzZd5IUMLIs+F2
	2SWHg9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5raz-001pPo-LF; Mon, 27 Jun 2022 16:28:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5raw-001pNo-Jp
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 16:28:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id i25so8315750wrc.13
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RFbscGfZ1HvqkolFfPgOHxRAqCYKsO6AGhI1CWcF3U0=;
        b=QL9P5fYJiAGJ0cVberqQxZgecUlCyO035Rs/RHERScTvlSGjFZWJwcJ83NKx7icnCf
         MmmkqeK7/MKYHkhThvS+4I5n6eilA1iv0cTdd1jM4UXHDDaaVEXvSnXIRzJWnCUCUcUi
         hfbpR0k3AwYuP7wFzDx1Qb4iWIpTN9nBpMOsMz5YzOvQfMZ+aNGdk1BwqtUaNtHKCBDC
         fA9t5x0TJ4kWUQmeUPz8VsbAvV+0a4AUoZiJIyO7qENghiYMyKTM8whwQHTooEBVZnfa
         hv7NO7jkwT4JYF/WPaOvNMBn/r4c0lJo2uE2cyoUPVH1HBvXxtPYqUUryaiaIppTOHk7
         Xteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RFbscGfZ1HvqkolFfPgOHxRAqCYKsO6AGhI1CWcF3U0=;
        b=QhMEb35clM+xxNLgdPxzgRejvf04BdPOa+Yuwksl+NZUPRt8fPsVk/3WldYaHaPTxV
         DR5Z/G+y7bgzoCrRPQgoPqGMmhzKRIj1GCVQqbrNEu8b1yXKSG8KWnTK3cd5krN0B9C0
         VrSm/jN7DNOY1Ufl5p89J1575+9dk/aphmXJFx2PMX/lGnNh6iMaS77QdhZ4QizHtvlQ
         29B93UvZ4tgkDRZA8dBXXAyk9m5zpVlfJEv27suCrn8/8xv4oi9XK3kYyTMeuw2QElxL
         dpi43CXKms9ZB+mkMvKDytlDjrtdQxOlKYGsQo70/jGnrmAT6GeRyLqMfLqdArOV5R1R
         BPFA==
X-Gm-Message-State: AJIora+S+e8jZYmTwekCixXtBOCa2FgPgdEOiL5K7tmHdGIAyqPrG5qT
	NctuHVZrPhjMl9sfgGqf1j8bVw==
X-Google-Smtp-Source: AGRyM1tWghCzrhvaQKuNnG4CtD67zaV7MVCuo84J73jDL9LXJFGuDL/uN51RLsUeyYqHqBL/FNulUA==
X-Received: by 2002:a5d:5966:0:b0:21b:80b5:ecc3 with SMTP id e38-20020a5d5966000000b0021b80b5ecc3mr12930472wri.130.1656347292409;
        Mon, 27 Jun 2022 09:28:12 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id m17-20020adfe0d1000000b0021b866397a7sm11132854wri.1.2022.06.27.09.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 09:28:12 -0700 (PDT)
Date: Mon, 27 Jun 2022 17:28:09 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-iio <linux-iio@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux LED Subsystem <linux-leds@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	szuni chen <szunichen@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
Message-ID: <YrnamaUx236MsNQa@google.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-9-peterwu.pub@gmail.com>
 <Yqph8jwHU8rPooJA@google.com>
 <CABtFH5KLVQFYOBGZ--9+s4GrHXbsDao-yL-KCFwL3FD_kbNhjg@mail.gmail.com>
 <Yrm7NTID16g8gM5t@google.com>
 <CABtFH5L7B_kEvG5E2Um5EANEScJPTfQthyLNfCbvoHq_YDpXxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5L7B_kEvG5E2Um5EANEScJPTfQthyLNfCbvoHq_YDpXxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_092814_761599_191605DC 
X-CRM114-Status: GOOD (  16.67  )
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

[...]

> > > > > +#define MT6370_IRQ_DSV_VPOS_OCP              124
> > > > > +#define MT6370_IRQ_DSV_BST_OCP               125
> > > > > +#define MT6370_IRQ_DSV_VNEG_SCP              126
> > > > > +#define MT6370_IRQ_DSV_VPOS_SCP              127
> > > > > +
> > > > > +struct mt6370_info {
> > > > > +     struct i2c_client *i2c[MT6370_MAX_I2C];
> > > > > +     struct device *dev;
> > > > > +     struct regmap *regmap;
> > > > > +     struct regmap_irq_chip_data *irq_data;
> > > > > +};
> > > >
> > > > Can we shove all of the above into a header file?
> > >
> > > Well... In Patch v1, we put these "#define IRQ" into
> > > "include/dt-bindings/mfd/mediatek,mt6370.h".
> > > But the reviewer of DT files hoped us to remove this header file, we
> > > put these "#define IRQ" in this .c file.
> > > Shall we leave them here or put them into the header file in
> > > "driver/power/supply/mt6370-charger.h"?
> >
> > Where are they used?
> 
> Sorry, I wrote the wrong path last time...
> What I should say last time was to put them into the header file into
> "driver/mfd/mt6370.h"
> These "#define IRQ" are just used in "driver/mfd/mt6370.c"
> I’m really sorry for making this mistake...

Yes, that would be fine.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

