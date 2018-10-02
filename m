From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: defconfig update for v4.20
Date: Tue, 2 Oct 2018 13:09:08 +0200
Message-ID: <0e713ca2-b8e4-dbf1-8160-f8e40ab21558@gmail.com>
References: <8bb0af1d-8323-9833-ee1c-bbbb9d65a686@gmail.com>
 <CAK8P3a1jtA77tunDWEjqAvYgNac-EFVdg07Va6neya4r2HSdQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAK8P3a1jtA77tunDWEjqAvYgNac-EFVdg07Va6neya4r2HSdQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 01/10/2018 18:06, Arnd Bergmann wrote:
> On Sat, Sep 29, 2018 at 5:16 PM Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>
>> for you to fetch changes up to f718739d1c219decf2e4e4f0121753439850e5ab:
>>
>>   ARM: defconfig: add mediatek_v7_defconfig (2018-09-25 16:18:15 +0200)
>>
>> ----------------------------------------------------------------
>> - add arm32 defconfig for mediatek SoCs.
> 
> You probably don't want CONFIG_DEBUG_LL=y, or CONFIG_COMPILE_TEST=y
> in there. Please review the file for additional options that might be incorrect.
> 

Correct. Apart I just realized that it only enabled mt7623 and leaves alone the
other armv7 mediatek SoCs. So there is more work to be done here.

I propose you drop the merge request for this release.

Sorry for the inconvenience.

Matthias
