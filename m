From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: mediatek: fix error handling
Date: Wed, 25 Sep 2019 18:42:36 +0200
Message-ID: <e52093c9-a519-62e5-1c1e-acd626a92798@linaro.org>
References: <20190919191315.25190-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919191315.25190-1-fparent@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: tglx@linutronix.de, matthias.bgg@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On 19/09/2019 21:13, Fabien Parent wrote:
> When timer_of_init fails, it cleans up after itself by undoing
> everything it did during the initialization function.
> 
> mtk_syst_init and mtk_gpt_init both call timer_of_cleanup if
> timer_of_init fails. timer_of_cleanup try to release the resource taken.
> Since these resources have already been cleaned up by timer_of_init,
> we end up getting a few warnings printed:

[ ... ]

> This commit remove the calls to timer_of_cleanup when timer_of_init
> fails since it is unnecessary and actually cause warnings to be printed.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied, thanks for the fix!

In the future add the 'Fixes' tag please.

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
