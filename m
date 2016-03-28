From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: mt8173-evb: failing to boot in linux-next and mainline
Date: Mon, 28 Mar 2016 08:15:20 -0700
Message-ID: <7h37raprav.fsf@baylibre.com>
References: <CAOi56cV2M_Ee2AhxTUgHhZuZ1y7LH4sKKyiq3Okorj3K+L15GA@mail.gmail.com>
 <1459165876.24094.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1459165876.24094.8.camel@mtksdaap41> (Eddie Huang's message of
 "Mon, 28 Mar 2016 19:51:16 +0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Eddie,

Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:

[...]

> Thanks your testing again. I can reproduce your case in my local
> environment using 4.6-rc1. After checking, there are two ways to avoid
> the hang:
> 1. set clk_ignore_unused to kernel command line
> 2. Revert patch "cc8ed76 soc: mediatek: SCPSYS: Fix double enabling of
> regulators"
>
> It seems there is a problem between turn on/off clock and power domain.
> We will try to fix this and send patch to public once have a solution.

Thanks for verifying.

I've confirmed that reverting the patch suggested above fixes the
problem.

Since -rc1 is out, and this problem still exists in mainline, if a
proper fix is not found very soon, I suggest reverting that patch in mainline.

Kevin
