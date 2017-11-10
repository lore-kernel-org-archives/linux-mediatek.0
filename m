From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: Frequent TX timeouts on a MT7623 (MT7530)
Date: Fri, 10 Nov 2017 17:55:42 +0800
Message-ID: <1510307742.9363.9.camel@mtkswgap22>
References: <CAKfDRXjU4wYXBfi=PV5fjsss_-4a2a4M24xKwEOVFXvk9daVTg@mail.gmail.com>
 <1510283908.20663.27.camel@mtkswgap22>
 <CAKfDRXjW_7F=hP4-mpn3KOcMYrag+XKWZaNi55FcY905e5XG0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXjW_7F=hP4-mpn3KOcMYrag+XKWZaNi55FcY905e5XG0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2017-11-10 at 10:00 +0100, Kristian Evensen wrote:
> Hi Sean,
> 
> On Fri, Nov 10, 2017 at 4:18 AM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Do you use both eth0 and eth1 for routing those packets ?
> 
> Only eth0, it seems every port on my board is connected to gmac1. I
> found a switch with port mirroring today, so I will take a look to see
> if there is anything interesting going on on layer 2.
> 

One reason for skb watchdog timeout might be that the whole TX patch is 
enabling flow control on each joint, which makes the internal hardware
circuit queue got full and then would cause the hardware can't serve
following incoming packets and can't send TX complete interrupt on time.

You could disable FC between GMAC and MT7530 switch, just by remove the
setup with PMCR_RX_FC_EN in the line.

https://elixir.free-electrons.com/linux/latest/source/drivers/net/dsa/mt7530.c#L686

But so far I have no much idea why it also happens in low rate.

> -Kristian
> 
