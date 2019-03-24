From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] mfd: mt6397: Don't call irq_dispose_mapping.
Date: Sun, 24 Mar 2019 14:39:34 +0100
Message-ID: <20190324133934.GH30105@piout.net>
References: <20190311075540.26117-1-pihsun@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190311075540.26117-1-pihsun@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek RTC DRIVER" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek RTC DRIVER" <linux-mediatek@lists.infradead.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On 11/03/2019 15:55:40+0800, Pi-Hsun Shih wrote:
> The IRQ mapping was changed to not being created in the rtc-mt6397
> driver, so the irq_dispose_mapping is no longer needed.
> Also the dev_id passed to free_irq should be the same as the last
> argument passed to request_threaded_irq.
> This prevents a "Trying to free already-free IRQ 274" warning when
> unbinding the driver.
> 
> Fixes: e695d3a0b3b3 ("mfd: mt6397: Create irq mappings in mfd core driver")
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> 
> ---
>  drivers/rtc/rtc-mt6397.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
