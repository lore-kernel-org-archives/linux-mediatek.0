From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH usb v6 6/6] usb: core: phy: add the
 SPDX-License-Identifier and include guard
Date: Mon, 23 Apr 2018 09:39:35 +0200
Message-ID: <20180423073935.GA2484@kroah.com>
References: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
 <20180418193951.17922-7-martin.blumenstingl@googlemail.com>
 <20180422130109.GA5781@kroah.com>
 <CAFBinCBv+zwjjjA_HeDY_e=aZwVpktzqM7wszZ-Ejvid+ZBe-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCBv+zwjjjA_HeDY_e=aZwVpktzqM7wszZ-Ejvid+ZBe-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, Apr 22, 2018 at 09:41:56PM +0200, Martin Blumenstingl wrote:
> Hi Greg,
> 
> On Sun, Apr 22, 2018 at 3:01 PM, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > On Wed, Apr 18, 2018 at 09:39:51PM +0200, Martin Blumenstingl wrote:
> >> This clarifies the license of the code. While here also add an include
> >> guard to the header file.
> >>
> >> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
> >> Suggested-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> >> ---
> >>  drivers/usb/core/phy.h | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> >> index bbc969383074..88a3c037e9df 100644
> >> --- a/drivers/usb/core/phy.h
> >> +++ b/drivers/usb/core/phy.h
> >> @@ -1,3 +1,13 @@
> >> +/* SPDX-License-Identifier: GPL-2.0+ */
> >
> > Do you _really_ mean GPLv2 or anything later?
> drivers/usb/core/hcd.c uses the same license identifier
> that code is much more "valuable" than my few lines which manage a
> list of PHYs - so I'm fine with "GPLv2 or anything later"
> 
> > I have to ask...
> if you see any problems with this (for example that phy.h couldn't be
> used from some special module with another license, ...) then please
> let me know

Nope, that's fine, thanks for the quick response, I'll go apply this
now.

greg k-h
