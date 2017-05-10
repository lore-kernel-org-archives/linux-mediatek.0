From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] dts changes for v4.11-next
Date: Wed, 10 May 2017 17:03:25 +0200
Message-ID: <091c7270-0acc-f114-6548-0720c13a1f6b@gmail.com>
References: <c45eb019-56ac-7482-5d75-8271f3890ef8@gmail.com>
 <CAK8P3a1HimTo8hJOs+dnuAYNHzDvdipQba_6JqSDUPAU5-_czA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAK8P3a1HimTo8hJOs+dnuAYNHzDvdipQba_6JqSDUPAU5-_czA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,

On 10/05/17 15:33, Arnd Bergmann wrote:
> On Tue, May 9, 2017 at 7:07 PM, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Arnd and Olof,
>>
>> Really late, so please have a look if you are willing to take these ones.
>> For the mt7623 most of the HW block are basically found already on mt2701 or
>> mt1835.
>> New HW blocks are PWM, crypto engine, remote controller and the random
>> generator.
>>
>> For mt8173, we have two dts patches touching the usb phy ports.
>>
>> Please let me know, if you are willing to take these as an exception.
>> If not I'll queue them up for the next merge window.
> 
> Thanks for collecting them now. The patches all look fine, and I considered
> whether we can still merge them in 4.12, but overall it seems that there
> is just a little more in the branch than I can justify pulling in this late.
> 
> Please submit them again for 4.13.
> 

Ok, I pushed them to v4.12-next and took the opportunity to create a 
32bit and 64bit branch.

Thanks for the information.

Best regards,
Matthias
