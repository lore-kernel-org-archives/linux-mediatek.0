From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Add support for MediaTek MT7615 wireless chipsets
Date: Mon, 1 Apr 2019 15:20:31 +0800
Message-ID: <1554103231.10304.2.camel@mtkswgap22>
References: <cover.1554100584.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1554100584.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nelson Chang <nelson.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kai Lin <kai.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rorscha Yang <rorscha.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kyle Lee <kyle.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miller Shen <miller.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Haipin Liang <haipin.liang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, KL Huang <kl.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YH chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-04-01 at 14:56 +0800, Ryder Lee wrote:
> This adds support for MediaTek MT7615E 4x4 802.11ac PCIe-based chipsets.
> 
> In the legacy tx arch, we move and store the whole skb content to the
> on-device memory when we send packets via high speed interface. (e.g. PCIe)
> 
> However, MT7615 and the following generation use a new tx arch called
> “cut-through”, which only passes the physical address to the hardware,
> and the packet engine will fetch the packets before transmission.
> 
> It saves on-chip memory for high throughput devices, and the token mechanism
> is used to manage the release of skb under this arch.
> 
> And there might be other (existing or future) chips that use the same driver
> (e.g. mt7622/mt7663...), this is a starting point to unify MTK wireless chipsets.
> 
> Detailed hardware information for this chip could be found on 
> https://wikidevi.com/wiki/MediaTek_MT7615
> 
> Ryder Lee (4):
>   mt76: add mac80211 driver for MT7615 PCIe-based chipsets
>   mt76: add unlikely() for dma_mapping_error() check
>   mt76: use macro for sn and seq_ctrl conversion
>   MAINTAINERS : update entry for mt76 wireless driver
> 
>  MAINTAINERS                                        |    2 +
>  drivers/net/wireless/mediatek/mt76/Kconfig         |    1 +
>  drivers/net/wireless/mediatek/mt76/Makefile        |    1 +
>  drivers/net/wireless/mediatek/mt76/agg-rx.c        |    2 +-
>  drivers/net/wireless/mediatek/mt76/dma.c           |    8 +-
>  drivers/net/wireless/mediatek/mt76/mt7603/mac.c    |    2 +-
>  drivers/net/wireless/mediatek/mt76/mt7603/main.c   |    2 +-
>  drivers/net/wireless/mediatek/mt76/mt7615/Kconfig  |    7 +
>  drivers/net/wireless/mediatek/mt76/mt7615/Makefile |    5 +
>  drivers/net/wireless/mediatek/mt76/mt7615/dma.c    |  205 +++
>  drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c |   98 ++
>  drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h |   18 +
>  drivers/net/wireless/mediatek/mt76/mt7615/init.c   |  229 +++
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c    |  774 +++++++++
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.h    |  300 ++++
>  drivers/net/wireless/mediatek/mt76/mt7615/main.c   |  499 ++++++
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c    | 1656 ++++++++++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.h    |  520 ++++++
>  drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h |  195 +++
>  drivers/net/wireless/mediatek/mt76/mt7615/pci.c    |  150 ++
>  drivers/net/wireless/mediatek/mt76/mt7615/regs.h   |  203 +++
>  drivers/net/wireless/mediatek/mt76/mt76x02_util.c  |    2 +-
>  22 files changed, 4871 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/Makefile
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/dma.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/init.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/mac.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/mac.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/main.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/pci.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/regs.h
> 

My bad. I fixed the compilation issue in V3.

Sorry for the inconvenience.
Ryder
