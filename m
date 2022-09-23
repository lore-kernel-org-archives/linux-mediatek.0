Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8599C07E9D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tSqnggIyDo6YUr0zNltSFoKVKbExYQv0L5PsQaqx/s=; b=Y1/Mb2bcwb5pijd4ti2VeEmntt
	oUibiQwmXVC6ig71qwl8XZXlHh/4RwSFEkvXvq0LGhXSPnvnmX8Idgj9hRM9O5kXyZXTdii7VlFc5
	2TGcqP3ycbvlm47cQ650fWfAkZADWoazg1QdLlXiITIXU6mATkqzCDqxFJ7XoHEsGVd5g3A5FaPqN
	fbsCxoiyLkT0788tJr74lx9WJul/jzkXJ+zKZORQ4w9wBnlCLPQ9EkeOQsgNO7aMyqT6Fd4V0Vs+L
	1fKa7dn8d3/aeVuoul90B5/7Vhh4x2rFFeLTMAb01oIIBuQca9RB6yXQt3ncbF2/osPGs1OBZLYVm
	DRby/hIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqJd-005l4S-Dm; Fri, 23 Sep 2022 21:34:34 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqJS-005l1c-AX; Fri, 23 Sep 2022 21:34:23 +0000
Received: by mail-ed1-x52b.google.com with SMTP id m3so1820296eda.12;
        Fri, 23 Sep 2022 14:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2tSqnggIyDo6YUr0zNltSFoKVKbExYQv0L5PsQaqx/s=;
        b=mC5OTEroAwnh1aV0/k1oPe+NXV0TA7Ze+A1xSqjAYtWFHQmQllTO2D5NFTgRNAaYmT
         9ftX5WSLtzU2ypfDMT3O8sHcHAnbhOQyP3iw/qBmEo1MS7KrHK9T7qMSNgKzSJ+gKYID
         /abixiX9djqlc0Y/J/wim5USaRy8aF+H2vHddS2/BtkRSL/9hE50+MF2PbOdi3Sk2Gl6
         VosQoBRGmWXFe5bsDbIbt+mPWxWzs9fsS3VkuvMuKTsQce3IGe9Tc+oS/HXH/f+GD3ev
         uHxxaisRU0SVBPc0aV+ppRW6J8ERcyNX4rsfpw6JIQ1m3AX4/2lvWnFKGIrpL0hEOzl5
         cXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2tSqnggIyDo6YUr0zNltSFoKVKbExYQv0L5PsQaqx/s=;
        b=SLv7Z8joFejbpu9oNF5ob7BrU1Phc4m/i73gzyFlNUPe9GD/DEgWqzIRjheWFA7vNB
         Pe7Jnx5o1oKZH/bX3eGv4IeZdoaVNmuhsBsFkSOhDGBQYwlv/Af+u+C0CLxZ6aFGFNz+
         s8Htt5+nbq2n8DnJqEshaQXxBkZANYdI2cuFkSbgarZrlztizneTNGGylc+xdVCJ7JQC
         nCQxS7ASM0tkA4RnUmpKRiU8z1GAgj7SoS0dk1TiXjl/rT4eCeIKG09LDbj9BmfSH4CH
         J5g/LYwFI+4+GHY7QypIqpRYkQ5SYqLUOiGhxamT1VFzFvyfV7A8IA3p4BkLiJBSNiN0
         7YeQ==
X-Gm-Message-State: ACrzQf1RuAamTzHX+bHPejcdnQ1pbGjp203W8wCWQQogoScXv70w+sOs
	stdDdPZFOgUyCAV0iyE5XS0dnAv2m6oYKHQWJyuMNcIDtEtCkXMh
X-Google-Smtp-Source: AMsMyM5IZsfJ8dcFfC0J6aK5kWjLl/L84uf2axz39u9HVDC/sm5vNCQLHxNNHmrmfV4MxviVVR/a5HiZQAJ2yKDCUpw=
X-Received: by 2002:a05:6402:1e8c:b0:44f:f70:e75e with SMTP id
 f12-20020a0564021e8c00b0044f0f70e75emr10298957edf.405.1663968858816; Fri, 23
 Sep 2022 14:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034042.9354-2-peterwu.pub@gmail.com> <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
 <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com> <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
In-Reply-To: <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
From: Han Jingoo <jingoohan1@gmail.com>
Date: Fri, 23 Sep 2022 14:34:07 -0700
Message-ID: <CAPOBaE7mcNqgQvsPpqewmq=Na9MC9RH5AW8CHn5ZJFAUsq6_eg@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>, torvalds@linux-foundation.org, 
	Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Julia.Lawall@inria.fr, 
	krzysztof.kozlowski@linaro.org
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org, 
	Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Helge Deller <deller@gmx.de>, 
	Mark Brown <broonie@kernel.org>, mazziesaccount@gmail.com, 
	andriy.shevchenko@linux.intel.com, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Alice Chen <alice_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_143422_407139_D6C1E187 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Sep 21, 2022 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 21, 2022 at 4:48 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wrote:
> > > On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > > > +#define MT6370_ITORCH_MIN_uA           25000
> > > > +#define MT6370_ITORCH_STEP_uA          12500
> > > > +#define MT6370_ITORCH_MAX_uA           400000
> > > > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > > > +#define MT6370_ISTRB_MIN_uA            50000
> > > > +#define MT6370_ISTRB_STEP_uA           12500
> > > > +#define MT6370_ISTRB_MAX_uA            1500000
> > > > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
> > >
> > > Use upper letters as below:
>
> For microseconds (and other -seconds) the common practice (I assume
> historically) is to use upper letters, indeed. But for current it's
> more natural to use small letters for unit multiplier as it's easier
> to read and understand.

(CC'ed Linus Torvalds, Andrew Morton, Joe Perches, Julia Lawall,
Krzysztof Kozlowski,)

Yep, it is common practice. Long time ago, I met the same problem on
how to present micro-ampere:
visibility vs coding practice. At that time, I followed the coding
practice. So, was there anyone who
rejected this decision to mix upper and lower letters when you gave
your comment last July?
If there is no objection, or most of maintainers and long-term
contributors agree with that,
I am ok with that.

To Tovalds, Andrew, Joe, Julia, Krzysztof,

I just need your feedback on coding styles. Are you ok with mixing
upper and lower letters for visibility
to present micro-seconds or micro-ampere? Andy (one of very-active
contributors) gives his opinion that
mixing upper and lower letters can be acceptable. I remain neutral on
this coding style issue.

e.g., #define MT6370_ITORCH_DOUBLE_MAX_uA    800000

Thank you.

Best regards,
Jingoo Han

>
> > > #define MT6370_ITORCH_MIN_UA           25000
> > > #define MT6370_ITORCH_STEP_UA          12500
> > > #define MT6370_ITORCH_MAX_UA           400000
> > > #define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > > #define MT6370_ISTRB_MIN_UA            50000
> > > #define MT6370_ISTRB_STEP_UA           12500
> > > #define MT6370_ISTRB_MAX_UA            1500000
> > > #define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
> > >
> > > > +#define MT6370_STRBTO_MIN_US           64000
> > > > +#define MT6370_STRBTO_STEP_US          32000
> > > > +#define MT6370_STRBTO_MAX_US           2432000
> >
> > Hi Jingoo,
> >
> > This coding style is in accordance with Andy's opinion in this mail:
> > https://lore.kernel.org/linux-arm-kernel/CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com/
>
> True.
>
> --
> With Best Regards,
> Andy Shevchenko

