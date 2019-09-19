From: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] mfd: mt6360: add pmic mt6360 driver
Date: Thu, 19 Sep 2019 10:20:53 +0800
Message-ID: <CAE+NS37XG+kfbj6yJrL5A-d2O_aiRU90yV5TUk3Kfa0Rv7dWmw@mail.gmail.com>
References: <1568801744-21380-1-git-send-email-gene.chen.richtek@gmail.com> <20190918105121.GB5016@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918105121.GB5016@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, shufan_lee@richtek.com
List-Id: linux-mediatek@lists.infradead.org

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2019=E5=B9=B49=E6=9C=8818=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 18 Sep 2019, Gene Chen wrote:
>
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add mfd driver for mt6360 pmic chip include
> > Battery Charger/USB_PD/Flash LED/RGB LED/LDO/Buck
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com
> > ---
>
> This looks different from the one you sent before, but I don't see a
> version bump or any changelog in this space.  Please re-submit with
> the differences noted.
>

the change is
1. add missing include file
2. modify commit message

this patch is regarded as version 1

> >  drivers/mfd/Kconfig                |  12 +
> >  drivers/mfd/Makefile               |   1 +
> >  drivers/mfd/mt6360-core.c          | 463 +++++++++++++++++++++++++++++=
++++++++
> >  include/linux/mfd/mt6360-private.h | 279 ++++++++++++++++++++++
> >  include/linux/mfd/mt6360.h         |  33 +++
> >  5 files changed, 788 insertions(+)
> >  create mode 100644 drivers/mfd/mt6360-core.c
> >  create mode 100644 include/linux/mfd/mt6360-private.h
> >  create mode 100644 include/linux/mfd/mt6360.h
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
