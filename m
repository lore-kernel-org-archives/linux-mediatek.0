Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rvI6zJris9WFqgPcMFO1vyWPVx2pQEqvWLTgiQDBug=; b=wZmLjO6P9L/3vbhy+al9eY1ylg
	SwwKGK9Y7p/LiBBmHxRur/eQ/O4rFiMceleQKwf/guhfCbLEenimlD85SbmZrgjidHW6CY96RiCsv
	oHpqYl/bPLmdYurtDtFqMOvyO1tngQiYivqc+Ja5ISoLlNF8eD2kc93/a36CnqU0FJfSvvsdjd+l4
	wQ+vMPHLLmVztbXyxCCQZUZ1dfT9ciCxBwfhYUi68khhwLQn8mIckjbzUCoXYjDhwKDYGQGfiq5Zh
	aV6n4qgyzu8Wq20h9sbidODaKm8qE1Sunb3nDnOI62pUuP6R+HxNvRPlgHMROp8JvDI+yXTJ9NAp5
	GvpBlJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odx1w-004Rge-LX; Thu, 29 Sep 2022 17:09:00 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwUR-004DRz-SS; Thu, 29 Sep 2022 16:34:28 +0000
Received: by mail-oo1-f52.google.com with SMTP id h1-20020a4aa741000000b004756c611188so463378oom.4;
        Thu, 29 Sep 2022 09:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5rvI6zJris9WFqgPcMFO1vyWPVx2pQEqvWLTgiQDBug=;
        b=VAuvVdFLqtZXEwdkLiVMyqbOlCqGWKhA520ydKgyZf9iAnNOJc0Kdg3YMK46NxoEU6
         NrZzwuEXC8PetPME1DG+Hj4/Qlqf2v+nrnYQK3+irZveKs8ZwhshJacyCkENJ1hVOQwn
         VZAHOT4sY28YJfBy7C1bn2NRxQNjQSMUsAbSnB0DGxMuv0T74nntEHFjgQS6TOWAL3fG
         q3FL481DzUKuCFbA/OSzpZ0fGF9djAbihmq7VFeZa3V5CTqonyxPY4L5VygwIzJKaScO
         84s2P/AaMoj1dl7V1RxG+76WXv4Pf0E3Bm9uyr0YLpxr9i4rFd+vtYzsdlIxj9QAXF8e
         XRfg==
X-Gm-Message-State: ACrzQf1yENjbYjZoVsXbX2FOm7NOkpbNtZa/srkGeiuNI3npAU23mZxJ
	KgjUqaNBn2zgD31l1vSBGw==
X-Google-Smtp-Source: AMsMyM5KXxUTZyDWW95TLfzjp8EOX9a/ELVcuLxOk9WAuIIsUsTln+QjVv+BLGm7pY49xlVgTMYgyw==
X-Received: by 2002:a4a:5e47:0:b0:476:2f9e:b30e with SMTP id h68-20020a4a5e47000000b004762f9eb30emr1715477oob.46.1664469259889;
        Thu, 29 Sep 2022 09:34:19 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t14-20020a056870638e00b001313ec705f3sm38106oap.37.2022.09.29.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:34:19 -0700 (PDT)
Received: (nullmailer pid 2290249 invoked by uid 1000);
	Thu, 29 Sep 2022 16:34:18 -0000
Date: Thu, 29 Sep 2022 11:34:18 -0500
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, ChiaEn Wu <peterwu.pub@gmail.com>, pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, lars@metafoo.de, andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, szunichen@gmail.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v12 3/5] iio: adc: mt6370: Add MediaTek MT6370 support
Message-ID: <20220929163418.GA2270491-robh@kernel.org>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
 <9bf36f09bc5f002f2b09b7cc26edccf109516465.1663926551.git.chiaen_wu@richtek.com>
 <20220924155525.5663bed8@jic23-huawei>
 <YzFY5FI0PrZqdAiZ@google.com>
 <CAL_JsqKKJGtacbzGqCupFniSGha610L1cay2V+AK8vehTA=F=g@mail.gmail.com>
 <YzQSnuwPjzJIgsYq@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzQSnuwPjzJIgsYq@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_093424_027770_941431CC 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Sep 28, 2022 at 10:23:42AM +0100, Lee Jones wrote:
> On Mon, 26 Sep 2022, Rob Herring wrote:
> 
> > On Mon, Sep 26, 2022 at 2:46 AM Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Sat, 24 Sep 2022, Jonathan Cameron wrote:
> > >
> > > > On Fri, 23 Sep 2022 10:51:24 +0800
> > > > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > > >
> > > > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > >
> > > > > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > > > > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > > > > driver, display bias voltage supply, one general purpose LDO, and the
> > > > > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > > > > standards.
> > > > >
> > > > > Add support for the MT6370 ADC driver for system monitoring, including
> > > > > charger current, voltage, and temperature.
> > > > >
> > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > >
> > > > This will have to either wait for next cycle, or go through mfd because
> > > > of the dt-bindings include which is in the mfd tree.
> > > >
> > > > Please make those dependencies clear in new versions.
> > >
> > > If the bindings come together in -next, then subsequently in Mainline,
> > > it shouldn't really matter.
> > 
> > Except that the bindings haven't come together and at this point may
> > not for 6.1. linux-next has been warning for weeks because the child
> > device schemas haven't been applied. I've said it before, all the
> > schemas for MFD devices need to be applied together. Or at least the
> > MFD schema needs to get applied last.
> > 
> > Furthermore, subsequent versions of this don't get tested and we end
> > up with more warnings[1].
> > 
> > It's only your IIO tree that the DT
> > > tooling with complain about, right?
> > 
> > And the MFD tree...
> > 
> > Please apply the LED bindings (patches 1 and 2) so we can get the
> > existing warnings fixed and address any new warnings.
> 
> Who usually applies LED bindings?  Looks as though they're good to go.

Pavel. The issue would be I don't know if the driver side is ready and 
those usually go together. Other than my complaining here, how's he 
supposed to know that the bindings at least need to be applied?

Again, the process here is not working. I've said before, all the 
bindings for an MFD need to go via 1 tree. You obviously don't agree, so 
propose something. The current process of no coordination doesn't work.

Rob

