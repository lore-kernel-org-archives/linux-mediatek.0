From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 26/50] pinctrl: spear: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 07:40:07 +0530
Message-ID: <20160225021007.GA31255@vireshk-i7>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-27-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456319775-3216-27-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Viresh Kumar <vireshk@kernel.org>, spear-devel@list.st.com
List-Id: linux-mediatek@lists.infradead.org

On 24-02-16, 18:45, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and remove
> need of .remove callback.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: spear-devel@list.st.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/pinctrl/spear/pinctrl-spear.c     | 11 +----------
>  drivers/pinctrl/spear/pinctrl-spear.h     |  1 -
>  drivers/pinctrl/spear/pinctrl-spear1310.c |  6 ------
>  drivers/pinctrl/spear/pinctrl-spear1340.c |  6 ------
>  drivers/pinctrl/spear/pinctrl-spear300.c  |  6 ------
>  drivers/pinctrl/spear/pinctrl-spear310.c  |  6 ------
>  drivers/pinctrl/spear/pinctrl-spear320.c  |  6 ------
>  7 files changed, 1 insertion(+), 41 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
