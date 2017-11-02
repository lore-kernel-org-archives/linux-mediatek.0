From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: mtu3: fix dma_addr_t printk output again
Date: Thu, 02 Nov 2017 17:38:20 +0200
Message-ID: <87y3no8zdf.fsf@linux.intel.com>
References: <20171102143027.775184-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102143027.775184-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org


Hi,

Arnd Bergmann <arnd@arndb.de> writes:
> The support for 36-bit addresses originally came with an incorrect
> printk format for dma addresses. Felipe changed the format string it
> while applying, but the result was still incorrect, since we now have
> to pass a pointer to the address instead of the integer value:
>
> drivers/usb/mtu3/mtu3_qmu.c: In function 'mtu3_prepare_tx_gpd':
> drivers/usb/mtu3/mtu3_qmu.c:261:25: error: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Werror=format=]
> drivers/usb/mtu3/mtu3_qmu.c: In function 'mtu3_prepare_rx_gpd':
> drivers/usb/mtu3/mtu3_qmu.c:300:25: error: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Werror=format=]
>
> This fixes the printk argument accordingly.
>
> Fixes: 1a46dfea0841 ("usb: mtu3: support 36-bit DMA address")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

oh, so it wants a pointer afterall :-)

sorry.

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
balbi
