From: Armando Miraglia <arma2ff0@gmail.com>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in spi-mt7621.c
Date: Wed, 13 Mar 2019 13:31:23 +0100
Message-ID: <CAOcbMd2njzr8+6tLTh7k+1zq_VTkU3-fJYODzG0ZwoomO5F9ag@mail.gmail.com>
References: <20190313122403.248873-1-armax@google.com> <eb85ea17-babd-fe3a-f0ff-9c7f13498bd1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eb85ea17-babd-fe3a-f0ff-9c7f13498bd1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Neil Brown <neil@brown.name>, Armando Miraglia <armax@google.com>, gregkh@linuxfoundation.org, sr@denx.de, Sankalp Negi <sankalpnegi2310@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

That might be fun to try :) I should get an mt7621 dev board of sorts though.

On Wed, Mar 13, 2019 at 1:28 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 13/03/2019 13:24, Armando Miraglia wrote:
> > Running Lindent on the mt7621-spi.c file in drivers/staging I noticed that the
> > file contained style issues. This change attempts to address such style
> > problems.
> >
> > Signed-off-by: Armando Miraglia <armax@google.com>
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Apart from fixing styling issues it would be usefull to see if we can add
> support for mt7621 to drivers/spi/spi-mt65xx.c
>
> Not sure if that is something you want to work on :)
>
> Regards,
> Matthias
>
> > ---
> > NOTE: resend this patch to include all mainteners listed by get_mantainers.pl.
> >  drivers/staging/mt7621-spi/spi-mt7621.c | 27 +++++++++++++------------
> >  1 file changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
> > index b509f9fe3346..03d53845f8c5 100644
> > --- a/drivers/staging/mt7621-spi/spi-mt7621.c
> > +++ b/drivers/staging/mt7621-spi/spi-mt7621.c
> > @@ -52,14 +52,14 @@
> >  #define MT7621_LSB_FIRST     BIT(3)
> >
> >  struct mt7621_spi {
> > -     struct spi_master       *master;
> > -     void __iomem            *base;
> > -     unsigned int            sys_freq;
> > -     unsigned int            speed;
> > -     struct clk              *clk;
> > -     int                     pending_write;
> > -
> > -     struct mt7621_spi_ops   *ops;
> > +     struct spi_master *master;
> > +     void __iomem *base;
> > +     unsigned int sys_freq;
> > +     unsigned int speed;
> > +     struct clk *clk;
> > +     int pending_write;
> > +
> > +     struct mt7621_spi_ops *ops;
> >  };
> >
> >  static inline struct mt7621_spi *spidev_to_mt7621_spi(struct spi_device *spi)
> > @@ -303,7 +303,7 @@ static int mt7621_spi_setup(struct spi_device *spi)
> >       struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
> >
> >       if ((spi->max_speed_hz == 0) ||
> > -             (spi->max_speed_hz > (rs->sys_freq / 2)))
> > +         (spi->max_speed_hz > (rs->sys_freq / 2)))
> >               spi->max_speed_hz = (rs->sys_freq / 2);
> >
> >       if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
> > @@ -316,9 +316,10 @@ static int mt7621_spi_setup(struct spi_device *spi)
> >  }
> >
> >  static const struct of_device_id mt7621_spi_match[] = {
> > -     { .compatible = "ralink,mt7621-spi" },
> > +     {.compatible = "ralink,mt7621-spi"},
> >       {},
> >  };
> > +
> >  MODULE_DEVICE_TABLE(of, mt7621_spi_match);
> >
> >  static int mt7621_spi_probe(struct platform_device *pdev)
> > @@ -408,9 +409,9 @@ MODULE_ALIAS("platform:" DRIVER_NAME);
> >
> >  static struct platform_driver mt7621_spi_driver = {
> >       .driver = {
> > -             .name = DRIVER_NAME,
> > -             .of_match_table = mt7621_spi_match,
> > -     },
> > +                .name = DRIVER_NAME,
> > +                .of_match_table = mt7621_spi_match,
> > +                },
> >       .probe = mt7621_spi_probe,
> >       .remove = mt7621_spi_remove,
> >  };
> >
