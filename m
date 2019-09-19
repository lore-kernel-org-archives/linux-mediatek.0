From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mt6360: add pmic mt6360 driver
Date: Thu, 19 Sep 2019 08:18:28 +0100
Message-ID: <20190919071828.GC5016@dell>
References: <1568801744-21380-1-git-send-email-gene.chen.richtek@gmail.com>
 <20190918105121.GB5016@dell>
 <CAE+NS37XG+kfbj6yJrL5A-d2O_aiRU90yV5TUk3Kfa0Rv7dWmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE+NS37XG+kfbj6yJrL5A-d2O_aiRU90yV5TUk3Kfa0Rv7dWmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, shufan_lee@richtek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, 19 Sep 2019, Gene Chen wrote:

> Lee Jones <lee.jones@linaro.org> 於 2019年9月18日 週三 下午6:51寫道：
> >
> > On Wed, 18 Sep 2019, Gene Chen wrote:
> >
> > > From: Gene Chen <gene_chen@richtek.com>
> > >
> > > Add mfd driver for mt6360 pmic chip include
> > > Battery Charger/USB_PD/Flash LED/RGB LED/LDO/Buck
> > >
> > > Signed-off-by: Gene Chen <gene_chen@richtek.com
> > > ---
> >
> > This looks different from the one you sent before, but I don't see a
> > version bump or any changelog in this space.  Please re-submit with
> > the differences noted.
> >
> 
> the change is
> 1. add missing include file
> 2. modify commit message
> 
> this patch is regarded as version 1

It's different to the first one you sent to the list, so it needs a
version bump and a change log.  There also appears to still be issues
with it, if the auto-builders are to be believed.

Do ensure you thoroughly test your patches before sending upstream.

Please fix the issues and resubmit your v3 with a nice changelog.

> > >  drivers/mfd/Kconfig                |  12 +
> > >  drivers/mfd/Makefile               |   1 +
> > >  drivers/mfd/mt6360-core.c          | 463 +++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/mt6360-private.h | 279 ++++++++++++++++++++++
> > >  include/linux/mfd/mt6360.h         |  33 +++
> > >  5 files changed, 788 insertions(+)
> > >  create mode 100644 drivers/mfd/mt6360-core.c
> > >  create mode 100644 include/linux/mfd/mt6360-private.h
> > >  create mode 100644 include/linux/mfd/mt6360.h
> >

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
