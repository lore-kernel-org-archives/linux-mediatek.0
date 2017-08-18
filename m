From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] arm: mediatek: soc updates for v4.14
Date: Fri, 18 Aug 2017 23:29:14 +0200
Message-ID: <CAK8P3a0hXrZ7CkE6hdGmY-E2DNvUuANRVZ3K8D=ix_p1-_QEiw@mail.gmail.com>
References: <9f782ba3-4c03-10a9-07c5-b2b682f81846@gmail.com>
 <CAK8P3a1ca44WqucCY0vTSpiKKnM7kHpAkRi29TdN9XN9FZCLgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAK8P3a1ca44WqucCY0vTSpiKKnM7kHpAkRi29TdN9XN9FZCLgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 18, 2017 at 11:24 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thu, Aug 17, 2017 at 3:27 PM, Matthias Brugger
> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> ----------------------------------------------------------------
>> - add mt7623a smp support
>> - scpsys: reduce code duplication
>> - scpsys: add mt7622 support
>> - pmic wrapper: make of_device_ids constant
>
> Pulled into next/soc, thanks!

Upon second thought, I removed it again from next/soc and put it into
next/drivers instead.

      Arnd
