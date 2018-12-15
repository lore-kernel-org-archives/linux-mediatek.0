From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt76x[02]u 802.11w support
Date: Fri, 14 Dec 2018 22:43:59 -0500
Message-ID: <CAM0KTbCMrcXNFHUFEmoHg+nseN1GkegqAM0GSuWBDHP=gVgi=w@mail.gmail.com>
References: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
 <20181213143947.GA11947@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181213143947.GA11947-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Dec 13, 2018 at 9:39 AM Lorenzo Bianconi
<lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> > Per a conversation with Lorenzo, it seems that 802.11w for mt76x[02]u
> > has only been fixed in 4.20.  As 4.19 is a LTS kernel, I'd like to
> > request that work be backported.  While the improvements in 4.20 and
> > 4.21 are already fairly obvious, a lot of people will be running 4.19
> > for years to come.  This is good hardware, with a working driver
> > (thanks team) but in the next few months excitement is going to turn
> > toward WPA3 which requires working 802.11w.
> >
> > Pretty please backport 802.11w support to 4.19
>
> IIRC the isse is just on mt76x0u, mt76x2u should work

I can confirm that it does work on mt76x2u on 4.19.5; so my request is
to backport 802.11w (software crypto I believe) support for mt76x0u to
4.19 LTS.  Pretty please :-)

Just in case it helps to confirm what is needed, here is the error
from wpa_supplicant when trying to connect to an 802.11w AP
wlan0: WPA: Failed to configure IGTK to the driver
wlan0: RSN: Failed to configure IGTK

thanks,
Zero

>
> Regards,
> Lorenzo
>
> >
> > Thanks,
> > Zero
