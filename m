From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: mt6397: implement suspend/resume function in
 rtc-mt6397 driver
Date: Wed, 5 Aug 2015 03:46:11 +0200
Message-ID: <20150805014611.GY3486@piout.net>
References: <1438267994-13934-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438267994-13934-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Eddie Huang <eddie.huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 30/07/2015 at 22:53:14 +0800, Henry Chen wrote :
> Implement the suspend/resume function in order to control rtc's irq_wake flag and handle as wakeup source.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
