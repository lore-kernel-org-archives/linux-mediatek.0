From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mt6360: add pmic mt6360 driver
Date: Wed, 18 Sep 2019 11:51:21 +0100
Message-ID: <20190918105121.GB5016@dell>
References: <1568801744-21380-1-git-send-email-gene.chen.richtek@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568801744-21380-1-git-send-email-gene.chen.richtek@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, shufan_lee@richtek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 18 Sep 2019, Gene Chen wrote:

> From: Gene Chen <gene_chen@richtek.com>
> 
> Add mfd driver for mt6360 pmic chip include
> Battery Charger/USB_PD/Flash LED/RGB LED/LDO/Buck
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com
> ---

This looks different from the one you sent before, but I don't see a
version bump or any changelog in this space.  Please re-submit with
the differences noted.

>  drivers/mfd/Kconfig                |  12 +
>  drivers/mfd/Makefile               |   1 +
>  drivers/mfd/mt6360-core.c          | 463 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6360-private.h | 279 ++++++++++++++++++++++
>  include/linux/mfd/mt6360.h         |  33 +++
>  5 files changed, 788 insertions(+)
>  create mode 100644 drivers/mfd/mt6360-core.c
>  create mode 100644 include/linux/mfd/mt6360-private.h
>  create mode 100644 include/linux/mfd/mt6360.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
