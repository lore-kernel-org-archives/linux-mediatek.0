Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C5CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 06:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fujdSkc9eVxgyWYomkDxyOFUPMUvnH+M6aDbN1/mils=; b=NSTsPguwgn5V6A
	xUG1NmOjyhPQ8lffgLpWbwQcMdG0YIkyx12Cx2mpu6acMw2rFldxuTogeOiPL/pbAp1MV5zeqguDv
	/ReQ1odhp7WFR3aD/D7ZfmS0mKDRnePH3u237PTTDo5/MXSFGOjegXz9C1MT5+7BG1g3H+W5UBDse
	ATuA5LrdKjClb/girj27ciaQ7TP0C2QE96yy1lVQJ1po6LCnI8MjFcopbh3SoTXmzudXeS3KTPfIV
	h2pM6Pizje+XY5Kw2ZKAKF/x215Iyj3XkCbynRJNlNOC6PncxiWZuvKeCF1nvSLU4EmDmlKazbTmU
	T3rjJl6WcCMkVn5Smm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweIg-001jAx-FM; Thu, 02 Jun 2022 06:27:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweIU-001j2q-Sp; Thu, 02 Jun 2022 06:27:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id s12so3769544plp.0;
        Wed, 01 Jun 2022 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sgetwGF1PvFvysoUcKKwVGNS/40oEtUezOmpaPDogiY=;
        b=ZMFPdPunvlYPQPU3WvFgrloJ8uyHxXAWCOMTRSZ9UdgD6rlNisHeAFF5/aY9eRXA0W
         RVgqJzVwNnaI7+v11DYXSCOX+1qoTZ4UHTG6/wQD/YlQrYt1Hwg51G8tJEPipcv4GY66
         4jWv5S3N+GmyqU6l+K858iXVMtXZSPnh1xSRU4u2GJihLrDkY356tc/U6/el6POMbuSC
         BVjvraKgPJFIcs7OPE4lDWq0kSaW9OyCoibbg40N5i4AFl2cRDJlVWQrlLKvz816fS2X
         IAmGmyJ+ToO08AHPxyjQEN6ZAc0PXhytlp05lepN1qcMlsN3si+QLc1JoCpWctNrxLBb
         JqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sgetwGF1PvFvysoUcKKwVGNS/40oEtUezOmpaPDogiY=;
        b=fjjG7J72+ji1wvHOQ4FIbcY6LGvP2vKsNdYiXHI2eWMWF9QXTiqNqr4xC8Phlh/rn6
         lBU5CMBSD0NAwNuJBTcDQSI03q0Ruj8wBdUXNvL/b20NKeh43maFd8cXYXSmTcMVzWoH
         oLh1e6Fiy3Ioupow9JXQ4QKyZmGmV6Xz4btXbVFC2XNRD4t0vTG8zwAlD/lUn+SRQVWj
         Dre61Gav4WZib+2QgY6aAry13gHKJHefOC1tEaD+M+RgoMzC7iUpyX53UxR36GYAvvyE
         BXdb5VX2py6A37+jKLyKTO0lNIi3zfCeCqfzBe8bHLIQgfrqH1PtNFgV0By/OSUDbSRv
         WJ8Q==
X-Gm-Message-State: AOAM531Ci+wlumEaTSx5bZw1sEe9241mnz8KDk/eso2FmumtSOufQ4xO
	JgmNshhKdboV2CMu0f2zh0s=
X-Google-Smtp-Source: ABdhPJw/XVMZxQqn7LbpCVPeOLw0PRZZYK3mOXAw1YPVhpRYJee8hLeBKf1SThBKLbxC47OMbHQhGw==
X-Received: by 2002:a17:903:40ce:b0:164:248:1464 with SMTP id t14-20020a17090340ce00b0016402481464mr3355617pld.16.1654151225424;
        Wed, 01 Jun 2022 23:27:05 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:569:e4e7:9594:e92e:b3a9:bf26])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902714e00b0015e8d4eb1f9sm2650433plm.67.2022.06.01.23.26.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:27:04 -0700 (PDT)
Date: Thu, 2 Jun 2022 14:26:51 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>,
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
	Helge Deller <deller@gmx.de>, cy_huang@richtek.com,
	alice_chen@richtek.com, chiaen_wu@richtek.com, u0084500@gmail.com,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux LED Subsystem <linux-leds@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	linux-iio <linux-iio@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
Message-ID: <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_232706_994491_D24429C9 
X-CRM114-Status: GOOD (  26.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 01, 2022 at 11:48:58AM +0200, Andy Shevchenko wrote:
> On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
> 
> All below comments are applicable to the rest of the series as well
> (one way or another), so please fix all your patches where it's
> appropriate.
> 
> >
> > Add Mediatek MT6370 Indicator support
> 
> What indicator?
It's RGB curent sink type LED driver (maximum supported current is only 24mA).
> Please also keep attention on English punctuation (missed period).
> 
Ack in next.
> ...
>
> > +       help
> > +         Support 4 channels and reg/pwm/breath mode.
> > +         Isink4 can also use as a CHG_VIN power good Indicator.
> 
> be used
> 
Ack in next.
> > +         Say Y here to enable support for
> > +         MT6370_RGB_LED device.
> 
> ...
> 
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> 
> > +#include <linux/of.h>
> 
> Are you sure this is the correct header? Seems you need
> mod_devicetable.h instead.
> 
It's the correct header and be used for the struct 'of_device_id'.
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> 
> ...
> 
> > +struct mt6370_priv {
> > +       struct mutex lock;
> 
> Do you use regmap locking?
>
MFD regmap register already the access lock.

This lock is just to guarantee only one user can access the RGB register
part.

Sorry, from the comment, do you want us to rename or remove this lock?
> > +       struct device *dev;
> 
> > +       struct regmap *regmap;
> 
> > +       struct regmap_field *fields[F_MAX_FIELDS];
> > +       const struct reg_field *reg_fields;
> > +       const struct linear_range *ranges;
> > +       struct reg_cfg *reg_cfgs;
> > +       unsigned int leds_count;
> > +       unsigned int leds_active;
> > +       bool is_mt6372;
> > +       struct mt6370_led leds[];
> > +};
> 
> ...
> 
> > +static const unsigned int common_tfreqs[] = {
> > +       10000, 5000, 2000, 1000, 500, 200, 5, 1
> 
> Leave a comma at the end.
> 
Ack in next.
> > +};
> > +
> > +static const unsigned int mt6372_tfreqs[] = {
> > +       8000, 4000, 2000, 1000, 500, 250, 8, 4
> 
> Ditto.
> 
Ack in next.
> > +};
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
