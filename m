From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [SPAM][PATCH v2 00/12] Add mt76x0 driver
Date: Tue, 10 Jul 2018 14:50:30 +0800
Message-ID: <1531205430.26214.8.camel@mtkswgap22>
References: <1530875029-26274-1-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1530875029-26274-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-07-06 at 13:03 +0200, Stanislaw Gruszka wrote:
> Add mt76x0 driver for MT7610U based USB dongles. Currently driver
> support only STA mode.
> 
> mt76x0 is based on Jakub's mt7601u driver already included
> in the kernel. I would like the driver be integrated as part
> of mt76 (instead of separate driver in mediatek dir like mt7601u)
> to utilize mt76 code for adding support for MT76x0 PCIe devices
> in further development.
> 
> To do not collide with current mt76x2u work from Lorenzo, I did not
> remove some code duplication. This will be done in the future, when
> Lorenzo patches will be merged. I plan to do more close integration
> with mt76x2u into common mt76 layer and add support for MT76x0 PCIe
> devices (i.e. MT7630E). Any help with this work is obviously welcome.
> My integration efforts can be traced here:
> https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft
> 
> For full support mt7610.bin firmware blob is need, hopefully with 
> the permission of Mediatek, the blob will be pushed into linux-firmware
> git tree.
> 

Hi, Stanislaw

You can feel free to add mt7610.bin firmware blob to linux-firmware with
the license LICENCE.mediatek I added in [1].


[1]
http://lists.infradead.org/pipermail/linux-mediatek/2018-June/013759.html

	Sean

> v1 -> v2:
>  - add missed mac.c file!
>  - fix uninitialized variables reported by kbuild test
>  - fix rate estimation
>  - check for skb allocation
> 
> Stanislaw Gruszka (12):
>   mt76: add more states
>   mt76x0: core files
>   mt76x0: mac files
>   mt76x0: usb files
>   mt76x0: mcu files
>   mt76x0: phy files
>   mt76x0: init files
>   mt76x0: eeprom files
>   mt76x0: trace and debugfs files
>   mt76x0: dma and tx files
>   mt76x0: main file
>   mt76: Kconfig and Makefile for mt76x0 driver
> 
>  drivers/net/wireless/mediatek/mt76/Kconfig         |    7 +
>  drivers/net/wireless/mediatek/mt76/Makefile        |    1 +
>  drivers/net/wireless/mediatek/mt76/mt76.h          |    4 +
>  drivers/net/wireless/mediatek/mt76/mt76x0/Makefile |    7 +
>  drivers/net/wireless/mediatek/mt76/mt76x0/core.c   |   34 +
>  .../net/wireless/mediatek/mt76/mt76x0/debugfs.c    |  166 ++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/dma.c    |  522 ++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/dma.h    |  126 +++
>  drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c |  445 +++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h |  149 +++
>  drivers/net/wireless/mediatek/mt76/mt76x0/init.c   |  720 ++++++++++++++
>  .../net/wireless/mediatek/mt76/mt76x0/initvals.h   |  282 ++++++
>  .../wireless/mediatek/mt76/mt76x0/initvals_phy.h   |  772 +++++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/mac.c    |  660 +++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/mac.h    |  154 +++
>  drivers/net/wireless/mediatek/mt76/mt76x0/main.c   |  403 ++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c    |  655 +++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h    |  101 ++
>  drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h |  376 ++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/phy.c    | 1008 ++++++++++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/phy.h    |   81 ++
>  drivers/net/wireless/mediatek/mt76/mt76x0/regs.h   |  651 +++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/trace.c  |   21 +
>  drivers/net/wireless/mediatek/mt76/mt76x0/trace.h  |  366 +++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/tx.c     |  270 ++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/usb.c    |  377 ++++++++
>  drivers/net/wireless/mediatek/mt76/mt76x0/usb.h    |   61 ++
>  drivers/net/wireless/mediatek/mt76/mt76x0/util.c   |   42 +
>  28 files changed, 8461 insertions(+)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/core.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/dma.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/dma.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/init.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/initvals.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/initvals_phy.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/mac.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/mac.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/main.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/phy.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/regs.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/trace.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/trace.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/usb.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/util.c
> 
