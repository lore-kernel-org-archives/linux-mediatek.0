From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] pinctrl: mediatek: add pinctrl driver for MT7622 SoC
Date: Tue, 9 Jan 2018 12:55:52 +0300
Message-ID: <20180109095552.33amqzg5i2qrunhl@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello Sean Wang,

The patch d6ed93551320: "pinctrl: mediatek: add pinctrl driver for
MT7622 SoC" from Dec 12, 2017, leads to the following static checker
warning:

	drivers/pinctrl/mediatek/pinctrl-mt7622.c:1419 mtk_gpio_get()
	error: uninitialized symbol 'value'.

drivers/pinctrl/mediatek/pinctrl-mt7622.c
  1412  static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
  1413  {
  1414          struct mtk_pinctrl *hw = dev_get_drvdata(chip->parent);
  1415          int value;
  1416  
  1417          mtk_hw_get_value(hw, gpio, PINCTRL_PIN_REG_DI, &value);
                ^^^^^^^^^^^^^^^^
No error handling.

  1418  
  1419          return !!value;
  1420  }

regards,
dan carpenter
