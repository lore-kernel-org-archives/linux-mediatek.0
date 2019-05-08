From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [RESEND PATCH] gnss: get serial speed from subdrivers
Date: Wed, 8 May 2019 17:53:41 +0200
Message-ID: <20190508155341.GA1605@Red>
References: <1557322788-10403-1-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557322788-10403-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, May 08, 2019 at 03:39:48PM +0200, Loys Ollivier wrote:
> The default serial speed was hardcoded in the code.
> Rename current-speed to default-speed.
> Add a function parameter that lets the subdrivers specify their
> default speed.
> If not specified fallback to the device-tree default-speed.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> Hello,
> 
> This patch moves the currently hardcoded, default serial speed
> to the subdrivers.
> If the default speed is not specified by the subdriver then it is read
> from the device tree.
> 
> Cheers,
> Loys
> 
>  drivers/gnss/mtk.c    |  6 +++++-
>  drivers/gnss/serial.c | 21 +++++++++++++--------
>  drivers/gnss/serial.h |  3 ++-
>  drivers/gnss/ubx.c    |  3 ++-
>  4 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
> index d1fc55560daf..a1a89f0cc75c 100644
> --- a/drivers/gnss/mtk.c
> +++ b/drivers/gnss/mtk.c
> @@ -16,6 +16,10 @@
>  
>  #include "serial.h"
>  
> +static uint serial_speed = 9600; /* Serial speed (baud rate) */
> +module_param(serial_speed, uint, 0644);
> +MODULE_PARM_DESC(serial_speed, "Serial baud rate (bit/s), (default = 9600)");
> +
>  struct mtk_data {
>  	struct regulator *vbackup;
>  	struct regulator *vcc;
> @@ -69,7 +73,7 @@ static int mtk_probe(struct serdev_device *serdev)
>  	struct mtk_data *data;
>  	int ret;
>  
> -	gserial = gnss_serial_allocate(serdev, sizeof(*data));
> +	gserial = gnss_serial_allocate(serdev, sizeof(*data), serial_speed);
>  	if (IS_ERR(gserial)) {
>  		ret = PTR_ERR(gserial);
>  		return ret;
> diff --git a/drivers/gnss/serial.c b/drivers/gnss/serial.c
> index def64b36d994..706fc5b46811 100644
> --- a/drivers/gnss/serial.c
> +++ b/drivers/gnss/serial.c
> @@ -103,17 +103,13 @@ static int gnss_serial_set_power(struct gnss_serial *gserial,
>  	return gserial->ops->set_power(gserial, state);
>  }
>  
> -/*
> - * FIXME: need to provide subdriver defaults or separate dt parsing from
> - * allocation.
> - */
>  static int gnss_serial_parse_dt(struct serdev_device *serdev)
>  {
>  	struct gnss_serial *gserial = serdev_device_get_drvdata(serdev);
>  	struct device_node *node = serdev->dev.of_node;
> -	u32 speed = 4800;
> +	uint speed;
>  
> -	of_property_read_u32(node, "current-speed", &speed);
> +	of_property_read_u32(node, "default-speed", &speed);

Hello

of_property_read_u32 use u32, so no reason to use uint instead.

Regards
