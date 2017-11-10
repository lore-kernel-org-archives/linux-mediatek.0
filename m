From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Frequent TX timeouts on a MT7623 (MT7530)
Date: Fri, 10 Nov 2017 13:20:04 +0100
Message-ID: <CAKfDRXiuCaZZ8qj1BU23FtYpRBJJHBj8kxJL3hGCC-syLWpabA@mail.gmail.com>
References: <CAKfDRXjU4wYXBfi=PV5fjsss_-4a2a4M24xKwEOVFXvk9daVTg@mail.gmail.com>
 <1510283908.20663.27.camel@mtkswgap22>
 <CAKfDRXjW_7F=hP4-mpn3KOcMYrag+XKWZaNi55FcY905e5XG0A@mail.gmail.com>
 <1510307742.9363.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1510307742.9363.9.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

On Fri, Nov 10, 2017 at 10:55 AM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> One reason for skb watchdog timeout might be that the whole TX patch is
> enabling flow control on each joint, which makes the internal hardware
> circuit queue got full and then would cause the hardware can't serve
> following incoming packets and can't send TX complete interrupt on time.
>
> You could disable FC between GMAC and MT7530 switch, just by remove the
> setup with PMCR_RX_FC_EN in the line.
>
> https://elixir.free-electrons.com/linux/latest/source/drivers/net/dsa/mt7530.c#L686
>
> But so far I have no much idea why it also happens in low rate.

One of my earlier fixes (for MT7621 though) was to disable the pause
frame and this did make the switch a lot more stable. I will try to
remove the PMCR_RX_FC_EN and see what happens, and let you know. Just
out of curiosity, do you know what would be the equivalent
bit/register with the mt7621? Then I can test this on more devices.

-Kristian
