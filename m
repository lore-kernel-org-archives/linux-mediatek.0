From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/3] mt76: fix checkpatch warnings and errors
Date: Sun, 21 Jul 2019 13:26:45 +0300
Message-ID: <87blxnsmxm.fsf@purkki.adurom.net>
References: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
        (Ryder Lee's message of "Fri, 19 Jul 2019 14:55:34 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> Fix warnings and errors as much as possible.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/agg-rx.c   | 21 +++++----
>  drivers/net/wireless/mediatek/mt76/dma.c      |  2 +-
>  drivers/net/wireless/mediatek/mt76/mac80211.c | 30 ++++++------
>  drivers/net/wireless/mediatek/mt76/mt76.h     | 46 +++++++++----------
>  .../wireless/mediatek/mt76/mt7603/beacon.c    |  2 +-
>  .../net/wireless/mediatek/mt76/mt7603/core.c  |  2 +-
>  .../wireless/mediatek/mt76/mt7603/debugfs.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7603/dma.c   |  7 +--
>  .../wireless/mediatek/mt76/mt7603/eeprom.c    |  2 +-
>  .../net/wireless/mediatek/mt76/mt7603/init.c  |  3 +-
>  .../net/wireless/mediatek/mt76/mt7603/mac.c   |  6 +--
>  .../net/wireless/mediatek/mt76/mt7603/main.c  |  7 +--
>  .../net/wireless/mediatek/mt76/mt7603/mcu.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7603/pci.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7603/soc.c   |  2 +-
>  .../wireless/mediatek/mt76/mt7615/debugfs.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   |  5 +-
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  2 -
>  .../wireless/mediatek/mt76/mt76x0/mt76x0.h    |  2 +-
>  .../net/wireless/mediatek/mt76/mt76x0/phy.c   | 23 ++++++----
>  .../net/wireless/mediatek/mt76/mt76x0/phy.h   | 10 ++--
>  .../net/wireless/mediatek/mt76/mt76x0/usb.c   |  6 +--
>  drivers/net/wireless/mediatek/mt76/mt76x02.h  | 24 +++++-----
>  .../wireless/mediatek/mt76/mt76x02_beacon.c   |  3 +-
>  .../net/wireless/mediatek/mt76/mt76x02_mac.c  | 16 +++----
>  .../net/wireless/mediatek/mt76/mt76x02_mcu.c  | 13 +++---
>  .../net/wireless/mediatek/mt76/mt76x02_mmio.c | 11 +++--
>  .../net/wireless/mediatek/mt76/mt76x02_phy.c  |  3 +-
>  .../net/wireless/mediatek/mt76/mt76x02_regs.h | 18 ++++----
>  .../wireless/mediatek/mt76/mt76x02_trace.h    |  3 +-
>  .../wireless/mediatek/mt76/mt76x02_usb_core.c |  2 +-
>  .../net/wireless/mediatek/mt76/mt76x02_util.c | 20 ++++----
>  .../wireless/mediatek/mt76/mt76x2/eeprom.c    | 10 ++--
>  .../wireless/mediatek/mt76/mt76x2/pci_init.c  |  1 -
>  .../wireless/mediatek/mt76/mt76x2/pci_mcu.c   |  4 +-
>  .../net/wireless/mediatek/mt76/mt76x2/phy.c   |  3 +-
>  drivers/net/wireless/mediatek/mt76/trace.h    |  9 ++--
>  drivers/net/wireless/mediatek/mt76/tx.c       | 14 +++---
>  drivers/net/wireless/mediatek/mt76/usb.c      | 31 +++++++------
>  .../net/wireless/mediatek/mt76/usb_trace.h    | 11 +++--
>  drivers/net/wireless/mediatek/mt76/util.h     |  4 +-
>  41 files changed, 201 insertions(+), 185 deletions(-)

This is way too big and the commit log is too vague, please fix one
problem at a time and describe in the commit log what you fixed.

-- 
Kalle Valo
