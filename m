From: Talel Shenhar <talel@amazon.com>
Subject: Re: [PATCH -next 13/15] thermal: thermal_mmio: use
 devm_platform_ioremap_resource() to simplify code
Date: Wed, 4 Sep 2019 16:15:48 +0300
Message-ID: <228fdf20-9f3a-4809-6fed-448e2bb349d3@amazon.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-14-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904122939.23780-14-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, miquel.raynal@bootlin.com, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, mmayer@broadcom.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, matthias.bgg@gmail.com, agross@kernel.org, heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, marc.w.gonzalez@free.fr, mans@mansr.com, jun.nie@linaro.org, shawnguo@kernel.org, phil@raspberrypi.org, gregkh@linuxfoundation.org, david.hernandezsanchez@st.com, horms+renesas@verge.net.au, wsa+renesas@sang-engineering.com, linux-pm@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, talel@amazon.com, ronenk@amazon.com
List-Id: linux-mediatek@lists.infradead.org

Thanks.

Talel.

On 9/4/19 2:29 PM, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-By: Talel Shenhar <talel@amazon.com>
> ---
>   drivers/thermal/thermal_mmio.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
