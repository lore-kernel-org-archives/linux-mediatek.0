From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: mediatek: SCPSYS: Fix double enabling of regulators
Date: Mon, 1 Feb 2016 11:28:39 +0100
Message-ID: <56AF3357.1040707@gmail.com>
References: <1453466365-24406-1-git-send-email-s.hauer@pengutronix.de>
 <CAGS+omD=ZdLoT8fZ_vq4CvdCvAwsz2tbdEzS5Q8pAL5zAKW5yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGS+omD=ZdLoT8fZ_vq4CvdCvAwsz2tbdEzS5Q8pAL5zAKW5yA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 22/01/16 20:26, Daniel Kurtz wrote:
> On Fri, Jan 22, 2016 at 4:39 AM, Sascha Hauer<s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>  wrote:
>> >
>> >With CONFIG_PM enabled do not call genpd->power_on manually as this
>> >will cause the regulators being turned on once in SCPSYS probe and
>> >then again when the genpd core turns on the domains. Instead, call
>> >genpd->power_on only with CONFIG_PM disabled and tell the genpd core
>> >that the domains are disabled when registered.
>> >
>> >Signed-off-by: Sascha Hauer<s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Take your pick:
> Tested-by: Daniel Kurtz<djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: Daniel Kurtz<djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
>> >---

Applied, thanks.
