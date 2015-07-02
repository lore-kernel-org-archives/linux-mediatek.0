From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc-mt6397: enable wakeup before registering rtc device
Date: Thu, 2 Jul 2015 21:09:39 +0200
Message-ID: <20150702190939.GE3467@piout.net>
References: <1435826216-11982-1-git-send-email-wnhuang@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435826216-11982-1-git-send-email-wnhuang@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei-Ning Huang <wnhuang@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Wei-Ning Huang <wnhuang@google.com>, eddie.huang@mediatek.com, a.zummo@towertech.it, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, rtc-linux@googlegroups.com
List-Id: linux-mediatek@lists.infradead.org

On 02/07/2015 at 16:36:56 +0800, Wei-Ning Huang wrote :
> rtc_sysfs_add_device checks if device can wakeup before creating the
> wakealarm file in sysfs. Thus the driver must set wakeup capability
> before registering the rtc device.
> 
> Signed-off-by: Wei-Ning Huang <wnhuang@google.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Applied on rtc-fixes, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
