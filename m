From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: mt7622: fix module autoloading for OF platform
 drivers
Date: Tue, 3 Apr 2018 16:57:41 +0200
Message-ID: <20180403145741.GB6444@piout.net>
References: <4231c0b6038764f68324297a40b18b15ecda5a92.1522055289.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4231c0b6038764f68324297a40b18b15ecda5a92.1522055289.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: a.zummo@towertech.it, linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 26/03/2018 18:05:52+0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> It's required to create a modules.alias via MODULE_DEVICE_TABLE helper
> for the OF platform driver. Otherwise, module autoloading cannot work.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/rtc/rtc-mt7622.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
