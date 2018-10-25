From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mt6397: Do not call irq_domain_remove if PMIC
 unsupported
Date: Thu, 25 Oct 2018 10:10:01 +0100
Message-ID: <20181025091001.GM4939@dell>
References: <20181022025505.27919-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181022025505.27919-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 22 Oct 2018, Nicolas Boichat wrote:

> If the PMIC ID is unknown, the current code would call
> irq_domain_remove and panic, as pmic->irq_domain is only
> initialized by mt6397_irq_init.
> 
> Return immediately with an error, if the chip ID is unsupported.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>  drivers/mfd/mt6397-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied for v4.21, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
