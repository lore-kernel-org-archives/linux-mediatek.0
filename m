From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RFC PATCH 1/3] clocksource: mtk_timer: add pr_fmt define
Date: Fri, 4 Sep 2015 10:51:33 +0200
Message-ID: <55E95B95.4030207@gmail.com>
References: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Klimov <alexey.klimov@linaro.org>, daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org
Cc: yingjoe.chen@mediatek.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, klimov.linux@gmail.com
List-Id: linux-mediatek@lists.infradead.org



On 04/09/15 05:21, Alexey Klimov wrote:
> It's a bit uncler what subsystem/driver emits some messages
> to dmesg in function mtk_init_timer().
> Use pr_fmt to auto-prefix the messages appropriately.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clocksource/mtk_timer.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> index 50f0641..ca5ea9e 100644
> --- a/drivers/clocksource/mtk_timer.c
> +++ b/drivers/clocksource/mtk_timer.c
> @@ -16,6 +16,8 @@
>    * GNU General Public License for more details.
>    */
>
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
>   #include <linux/clk.h>
>   #include <linux/clockchips.h>
>   #include <linux/interrupt.h>
>
