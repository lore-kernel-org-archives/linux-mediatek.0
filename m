From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] MT7621-SPI: spi-mt7621: Fix alignment and style problems
 Fixed Coding function and style issues
Date: Fri, 5 Apr 2019 11:05:26 +0800
Message-ID: <CAJsYDVKHmW7TtvuUb8mhZ0X1Or15EEA39eNtQqVf9F8vqVoEig@mail.gmail.com>
References: <20190404185235.5257-1-nilhase25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404185235.5257-1-nilhase25@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nilesh Hase <nilhase25@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, Stefan Roese <sr@denx.de>, sankalpnegi2310@gmail.com, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi!

On Fri, Apr 5, 2019 at 2:53 AM Nilesh Hase <nilhase25@gmail.com> wrote:
>
> Fix checkpatch issues: "CHECK: Alignment should match open parenthesis"
>
> Signed-off-by: Nilesh Hase <nilhase25@gmail.com>
> ---
>  drivers/staging/mt7621-spi/spi-mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
> index b509f9fe3346..6fa9876f5a92 100644
> --- a/drivers/staging/mt7621-spi/spi-mt7621.c
> +++ b/drivers/staging/mt7621-spi/spi-mt7621.c
FYI This file doesn't exist now. The driver has been moved into
drivers/spi by this commit:
cbd66c626e16 spi: mt7621: Move SPI driver out of staging

It's in linux-next-20190329 and later tags.
> @@ -303,7 +303,7 @@ static int mt7621_spi_setup(struct spi_device *spi)
>         struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
>
>         if ((spi->max_speed_hz == 0) ||
> -               (spi->max_speed_hz > (rs->sys_freq / 2)))
> +           (spi->max_speed_hz > (rs->sys_freq / 2)))
>                 spi->max_speed_hz = (rs->sys_freq / 2);
>
>         if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
> --
> 2.20.1
>
Regards,
 Chuanhong Guo
