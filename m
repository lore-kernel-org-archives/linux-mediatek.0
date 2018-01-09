From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [bug report] pinctrl: mediatek: add pinctrl driver for MT7622 SoC
Date: Tue, 9 Jan 2018 22:13:46 +0800
Message-ID: <1515507226.31546.12.camel@mtkswgap22>
References: <20180109095552.33amqzg5i2qrunhl@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180109095552.33amqzg5i2qrunhl@mwanda>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2018-01-09 at 12:55 +0300, Dan Carpenter wrote:
> Hello Sean Wang,
> 
> The patch d6ed93551320: "pinctrl: mediatek: add pinctrl driver for
> MT7622 SoC" from Dec 12, 2017, leads to the following static checker
> warning:
> 
> 	drivers/pinctrl/mediatek/pinctrl-mt7622.c:1419 mtk_gpio_get()
> 	error: uninitialized symbol 'value'.
> 
> drivers/pinctrl/mediatek/pinctrl-mt7622.c
>   1412  static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>   1413  {
>   1414          struct mtk_pinctrl *hw = dev_get_drvdata(chip->parent);
>   1415          int value;
>   1416  
>   1417          mtk_hw_get_value(hw, gpio, PINCTRL_PIN_REG_DI, &value);
>                 ^^^^^^^^^^^^^^^^
> No error handling.
> 

Nice catch, Will fix it soon. 

	Sean

>   1418  
>   1419          return !!value;
>   1420  }
> 
> regards,
> dan carpenter
> 
