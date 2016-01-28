From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: MTK mt8173-evb: mainline unstable, and big-endian boot failures
Date: Thu, 28 Jan 2016 14:56:20 +0800
Message-ID: <1453964180.26397.8.camel@mtksdaap41>
References: <CAOi56cVDbkAJEDWy3+DV63a=UuD7nqpUu8X7e-OjtWM-4dj_-w@mail.gmail.com>
 <7hsi1ilczm.fsf@baylibre.com>
 <CAF-23O3ps0Wt_UCmJbArpc5iJJryJKA0k_2qAyNb7op8O=UnAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAF-23O3ps0Wt_UCmJbArpc5iJJryJKA0k_2qAyNb7op8O=UnAg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Koan-Sin Tan <freedom.tan@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, =?UTF-8?Q?=E9=99=B3=E6=9F=8F=E5=AE=8F?= <howard.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2016-01-28 at 13:41 +0800, Koan-Sin Tan wrote:
> Hi Kevin, 
> 
> On Thu, Jan 28, 2016 at 9:16 AM, Kevin Hilman <khilman@baylibre.com>
> wrote:
>         Kevin Hilman <khilman@baylibre.com> writes:
>         
>         [...]
>         
>         > It seems to be pretty stable up through v4.4 but
>         > unreliable/unpredictable in v4.5-rc1 and lots of places in
>         between.
>         > It's hard to bisect because it doesn't reliably fail, but
>         when it does
>         > fail to finish booting, it's typically after it reaches a
>         shell, and
>         > trying to run various simple shell commands fails to
>         complete, like
>         > this example from next-20160125[2].
>         >
>         > To me this suggests possibly an issue with the idle driver
>         where
>         > characters might be getting lost on the serial console,
>         which causes
>         > the automated boot scripts to fail because the shell is
>         still waiting
>         > for the command to be finished.
>         
>         FWIW, I think I confirmed my suspicion that it's an idle
>         driver issue
>         because adding 'nohlt' on the cmdline, which forces
>         cpuidle_poll mode
>         (essentially disabling cpuidle) makes mainline boot quite
>         reliably on my
>         mt8173-evb board now.
> 
> 
>    Thanks for the information. I'll try to reproduce it. The problem
> is that I have been using 4.5-rc1 based kernel for several days, but
> didn't run into such problem. Can tell me which version of firmware
> you are using? 

Hi Kevin,

I use firmware [0] to run kernel v4.5-rc1 on my MT8173-evb, both branch
v20150716 (psci-0.2 atf) and v20150902 (psci-1.0 atf) can't reproduce
this problem.

[0]: https://github.com/ibanezchen/evb-utils

Eddie

>   
>    And, YES, I can reproduce the CONFIG_CPU_BIG_ENDIAN=y problem. The
> 'nohlt' command line option didn't stop the problem. We'll investigate
> it.
> 
> 
> -- 
> // freedom
