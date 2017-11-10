From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Frequent TX timeouts on a MT7623 (MT7530)
Date: Fri, 10 Nov 2017 20:08:48 +0100
Message-ID: <CAKfDRXg1-z2_OaW_sAWi90nAhDhNVVXavtnriMxOZdhw1_jD9w@mail.gmail.com>
References: <CAKfDRXjU4wYXBfi=PV5fjsss_-4a2a4M24xKwEOVFXvk9daVTg@mail.gmail.com>
 <1510283908.20663.27.camel@mtkswgap22>
 <CAKfDRXjW_7F=hP4-mpn3KOcMYrag+XKWZaNi55FcY905e5XG0A@mail.gmail.com>
 <1510307742.9363.9.camel@mtkswgap22>
 <CAKfDRXiuCaZZ8qj1BU23FtYpRBJJHBj8kxJL3hGCC-syLWpabA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXiuCaZZ8qj1BU23FtYpRBJJHBj8kxJL3hGCC-syLWpabA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

Hi,

Sorry that it took a while before I answered, busy day.

On Fri, Nov 10, 2017 at 1:20 PM, Kristian Evensen
<kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> One of my earlier fixes (for MT7621 though) was to disable the pause
> frame and this did make the switch a lot more stable. I will try to
> remove the PMCR_RX_FC_EN and see what happens, and let you know. Just
> out of curiosity, do you know what would be the equivalent
> bit/register with the mt7621? Then I can test this on more devices.

I have now done a few more tests.

* If I add a switch between the 7623 and the other router, I do not
see the tx timeout.
* When setting up a mirroring port, I see nothing special coming from
the router that has hung. However, it could be that packets are
gobbled up by the switch itself. I will see if I can get some other
capturing equipment, or just try with a hub.
* Enabling disabling flow control (and pause frames during
auto-negotiation) has no effect. I can still see the crash.

-Kristian
