From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] staging: mt7621-gpio: remove driver
Date: Tue, 10 Jul 2018 17:30:09 +0200
Message-ID: <20180710153009.GA11605@kroah.com>
References: <20180710151915.2282622-1-arnd@arndb.de>
 <20180710151915.2282622-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180710151915.2282622-2-arnd@arndb.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: devel@driverdev.osuosl.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mediatek@lists.infradead.org, NeilBrown <neil@brown.name>, John Crispin <blogic@openwrt.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jul 10, 2018 at 05:18:48PM +0200, Arnd Bergmann wrote:
> The gpio-mt7621 driver has graduated out of staging and got accepted
> into the gpio tree. Since they both use the same Kconfig symbol,
> we could run into conflicts, e.g. I got this failure when the staging
> driver got enabled with the other one being unavailable but using the
> same Kconfig symbol:
> 
> drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
> drivers/gpio/gpio-mt7621.c:228:10: error: 'struct gpio_chip' has no member named 'of_node'
>   rg->chip.of_node = node;
>           ^
> drivers/gpio/gpio-mt7621.c:243:10: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   rg->chip.of_gpio_n_cells = 2;
>           ^
> drivers/gpio/gpio-mt7621.c:244:10: error: 'struct gpio_chip' has no member named 'of_xlate'
>   rg->chip.of_xlate = mediatek_gpio_xlate;
> 
> It would be trivial to rename the Kconfig symbol to avoid that problem,
> but there is also seems to be little value in keeping the staging driver
> around now.
> 
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This is already removed in my staging-next tree and will be in the next
linux-next.

thanks,

greg k-h
