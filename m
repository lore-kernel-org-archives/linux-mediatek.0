Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSEtgg8+Hpw/EtiHjL5IRktNHYkZQ4l9B8QMcHNKzRs=; b=ov/wl23Qf4qrXS4OAnUG9kmLpC
	V9+84OwBrbTwzE0BgeZu5Qj+BvVHyIXo7iusDJtAoaZqOFxarHLVLNI7hBOwUak0loVZ86TQV2KSE
	IuTmmnIkwQLzaSvaT19aWtPHRl1UbA6nUQdPZoR2Nf+4NfSROdOEbfe6YTbHAv+Uxm7L/u6b6FUFS
	rNUh5DXfdguUGU151kZoq+2ybATZfQMtW39skOlYViX1X68r8QpVKGiCsKWKJO1ZKX7bT6i+AdSO8
	LbH2maoX3Us5MIOjvrHkCo3SGWjStvw4trTXZvyEebujDNVdzrbeGxyFC0V5h6Xby5ik/qVy5tSJk
	dSPTpQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu6a-007MG2-MP; Mon, 25 Jul 2022 09:10:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu6I-007M3D-G8; Mon, 25 Jul 2022 09:10:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id z23so19222420eju.8;
        Mon, 25 Jul 2022 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSEtgg8+Hpw/EtiHjL5IRktNHYkZQ4l9B8QMcHNKzRs=;
        b=DvY9h9DoO0kblI5Gb7JOwMF5uAXyYh+0N98faLjkVtDpKYgYiZXw8rUpaon1Qsb+x/
         y8PR5FRgsPRxbCvYRmi6JyQZHxlbh7MXccC1nAKDIdus48fm9phu/mVPu5c/7jnzpiUa
         CeYdC3SruNmPOz8QR4pQRYz+9lbX/PiafhwNwu9n1G7QLCs3uqxyNxwD3CM2frokPBsH
         DkjmmlsnQziUrFfN7mDBzyVBjS82vigYVYvIcaX8uI8LEUmNiadHmdk5ix5lNuZ/1UZ/
         NGL0Cy1cT3KvSr2YKUSTaA8mjLj8kGwovaeEc5qHPC+CgkPbA4CYf9Td2TeI9EthK4eN
         F2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSEtgg8+Hpw/EtiHjL5IRktNHYkZQ4l9B8QMcHNKzRs=;
        b=5YOy0BuQDm3yckBM8NCgQt2hr9Ov8Q6Ycsj5HexnB13+uxMX5LSadYZnx9Zs8rIc+0
         o6USqZmA3+fgjA/b+ajRkzh+gPB4q64vncOQlAKUUeppZt62BE2ArKZVd0POfoWsL/v2
         A+0KaxdZnlcZg60llp9MJahYxk8p/FnJClJj8Z5xB/4cAynZhtz6wKugeJ1mManaUJ1D
         qQw5Qprjd3xorLr9Jmj419N01wCDpwrxo3d1ewt+MsDYuN8+PoFL9y71Cf3NAqvh4vDi
         RRtASU3XMV6oGzbZ7n2VpC0poZdDkDFgawD3trJ0J4QoEPaDLbl6S7kpcjHHLKKduvvk
         ad1A==
X-Gm-Message-State: AJIora+DdMVay2K/SZ4PI77xyuyNaB0vUU3I9np70AyaV5JYhlE4TV/V
	JIHLORCS0dwwigP8qgHnLeMzkRANCBXjqTb9JD8=
X-Google-Smtp-Source: AGRyM1u9Nn1gh/K3al7D9YTYNDVE3nZB3C3o2fD7AeOdyqGaPbXnVSlqvpk1KEgMM6wZM2t+cB6cSp8E5+GGA2PWOz8=
X-Received: by 2002:a17:907:6297:b0:72f:9aad:fcb with SMTP id
 nd23-20020a170907629700b0072f9aad0fcbmr9108533ejc.161.1658740203874; Mon, 25
 Jul 2022 02:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
 <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
 <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com> <CABtFH5+LvvcVscRotyRYXhXs1pPkCahbVe0NcSFxC4k_WMMsuQ@mail.gmail.com>
In-Reply-To: <CABtFH5+LvvcVscRotyRYXhXs1pPkCahbVe0NcSFxC4k_WMMsuQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 11:09:26 +0200
Message-ID: <CAHp75Vd53faWJ8oD2WGQEMAVc-NfoceUUjpOJwy7piaraH8CNA@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
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
X-CRM114-CacheID: sfid-20220725_021006_561053_995500B1 
X-CRM114-Status: GOOD (  18.33  )
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

On Mon, Jul 25, 2022 at 11:06 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 4:43 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > > > > +#define MT6370_REG_DEV_INFO    0x100
> > > > > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > > > > +#define MT6370_REG_CHG_MASK1   0x1E0
> > > > > +
> > > > > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > > > > +
> > > > > +#define MT6370_NUM_IRQREGS     16
> > > > > +#define MT6370_USBC_I2CADDR    0x4E
> > > >
> > > > > +#define MT6370_REG_ADDRLEN     2
> > > > > +#define MT6370_REG_MAXADDR     0x1FF
> > > >
> > > > These two more logically to have near to other _REG_* definitions above.

...

> > You lost me. Namespace has a meaning, i.e. grouping items of a kind.
> > In your proposal I don't see that. If REG_MAXADDR and REG_ADDRLEN are
> > _not_ of the _REG_ kind as per above, why do they have this namespace
> > in the first place?

> oh... Sorry, I just got the wrong meaning
> maybe it should be revised like this, right??

I don't know. I am not an author of the code, I do not have access
(and don't want to) to the hardware datasheets, all up to you. From
the style perspective below looks good.

> -------------------------------------------------------------------
> #define MT6370_REG_DEV_INFO    0x100
> #define MT6370_REG_CHG_IRQ1    0x1C0
> #define MT6370_REG_CHG_MASK1   0x1E0
> #define MT6370_REG_MAXADDR     0x1FF // Move it to here
>
> #define MT6370_VENID_MASK      GENMASK(7, 4)
>
> #define MT6370_NUM_IRQREGS     16
> #define MT6370_USBC_I2CADDR    0x4E
>
> #define MT6370_MAX_ADDRLEN     2    // Rename



-- 
With Best Regards,
Andy Shevchenko

