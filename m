Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD3C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGTl5W3lU5EPUSxceW+3YfZM8YTmZNPLhO3+yi0Lxxo=; b=Nz4WJsSGT0R86q6qVIErhgQADS
	ES52B5xNalqhhlf3StOfRENJH48+on2IXXyEf4nz/N3xUttUBueDtOxMRghZnpZkXKr5AG8JWyS+Q
	tvXd04RNga8CXn1ym/A5pGaOJFRIEbQDavmF9uuLsv3Pcbyiuarsh+3B/d9SW/FtsoDS2owU3GpHK
	3S5I2qO6UUZ1Cy2m9VlOCMV6puD+g0/Jkwhvlq9MzoVCBuqElldVQoMTyt6gG760SnKVi2C6mKK2A
	jPuJJyZmtWZF79tZrIegubF3DOqlamKhkv3cVil8CLZhJACvAIAu3j3ZJZpt2vIwCaZ5Y7ALKDUX3
	hvTLt64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtU4-006uvC-KC; Mon, 25 Jul 2022 08:30:36 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtTt-006uQg-1C; Mon, 25 Jul 2022 08:30:26 +0000
Received: by mail-qk1-x736.google.com with SMTP id c24so8087419qkm.4;
        Mon, 25 Jul 2022 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eGTl5W3lU5EPUSxceW+3YfZM8YTmZNPLhO3+yi0Lxxo=;
        b=SchD1OSJhqZUbaDH3npCvBVhvgdsTgcai4JGkAeNGwKszMwOXVv1jP2YUfdpVF00gi
         M7W+LOBWkm3fvR7QR5Oi7Rr243ZKrwIRGyjvM4fEdp3ybWcWAtUz3ifU5jDZ2eCRBBLb
         hVRD5fVGR5o7NHR3kRn8qM+u20mgIRdugneUsK0DRfgczIFrKpOhBB+f9+/lUqaYKRv+
         zCqM+TkCzfpywtt7PK8+F+XO4TuRbG4FDiDPWiwIK0+yYxleqIJNXSwBHMHq6a6DI1r4
         IHORJbjxNq0t+3W70uo7ZSMhJhotvD3N/NslNtJkOTvO+ulZgz6/dODRy4NI0YAEC0V6
         1QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eGTl5W3lU5EPUSxceW+3YfZM8YTmZNPLhO3+yi0Lxxo=;
        b=lHMgzlOJJzRx/PC4acEjWiry+BlUMIVhkKN8nkYAsCuO9BTGttMqBZDjmrxfqUtzTL
         GynIVb7VGNonAWSkf7Hgx8lTaUz4DJnKfwVdsO5ewh+AJkztG6OThPLptMfofgnL0IK9
         LZn+wnJhelCGOsg+NaSGN0lq5R1uzkQ3V9jxBqGP7v2QE2u6prcmmxbcoWiiY067rjo0
         VNOhoDFqMLI8qPnLGnvy9A1/E86KTBCsnQZEnkchLpUJqGcFGkBHeJdecENAL1Dzc2M3
         8mNNRkGUNqn1sqSoGSS/xlEv37QXFkUbuauw3gUqnCMbWRJlV0l95ryCBM3UGRE8ZH2R
         mevA==
X-Gm-Message-State: AJIora+rqkkTPiHz7kYaQRw+JrEsOH1e4XO292h/c8Pewh0zxNKKL2k7
	fYM/9nAIeJnZHHIDt5cfz/d6SyJjyZ3ce+m+cKw=
X-Google-Smtp-Source: AGRyM1tT9zd1NbQQxCDwlfF4CX1SIOVXegpCvtscSaJImwYFwZu4GtSNklBiffb6QTC6/u0h5ukzMhHUITILaRb40TA=
X-Received: by 2002:a05:620a:2942:b0:6b5:e33a:1771 with SMTP id
 n2-20020a05620a294200b006b5e33a1771mr8042028qkp.665.1658737820011; Mon, 25
 Jul 2022 01:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
In-Reply-To: <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 25 Jul 2022 16:29:43 +0800
Message-ID: <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20220725_013025_085836_6D5CF37C 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Jul 25, 2022 at 4:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>

...

>
> > +#define MT6370_REG_DEV_INFO    0x100
> > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > +#define MT6370_REG_CHG_MASK1   0x1E0
> > +
> > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > +
> > +#define MT6370_NUM_IRQREGS     16
> > +#define MT6370_USBC_I2CADDR    0x4E
>
> > +#define MT6370_REG_ADDRLEN     2
> > +#define MT6370_REG_MAXADDR     0x1FF
>
> These two more logically to have near to other _REG_* definitions above.

Hi Andy,
Thanks for your review.
Do you mean that we should move '#define MT6370_USBC_I2CADDR' and
'#define MT6370_REG_MAXADDR' after the line '#define
MT6370_REG_CHG_MASK1'?
-------------------------------------------------------------------
#define MT6370_REG_DEV_INFO    0x100
#define MT6370_REG_CHG_IRQ1    0x1C0
#define MT6370_REG_CHG_MASK1   0x1E0
#define MT6370_USBC_I2CADDR    0x4E
#define MT6370_REG_MAXADDR     0x1FF

#define MT6370_VENID_MASK      GENMASK(7, 4)

#define MT6370_NUM_IRQREGS     16
#define MT6370_REG_ADDRLEN     2
-------------------------------------------------------------------
Like this?

>
> --
> With Best Regards,
> Andy Shevchenko

-- 
Best Regards,
ChiaEn Wu

