From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] linux-firmware: add firmware for mt76x2u
Date: Mon, 16 Jul 2018 11:48:21 +0200
Message-ID: <20180716094820.GA3810@localhost.localdomain>
References: <20180715084032.7384-1-lorenzo.bianconi@redhat.com>
 <20180716091743.GA1297@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180716091743.GA1297-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

> Hi Lorenzo 
> 
> On Sun, Jul 15, 2018 at 10:40:32AM +0200, Lorenzo Bianconi wrote:
> > Add binary firmware for MT76x2u based devices
> > 
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  WHENCE                |  12 ++++++++++++
> >  mt7662u.bin           | Bin 0 -> 91412 bytes
> >  mt7662u_rom_patch.bin | Bin 0 -> 20686 bytes
> >  3 files changed, 12 insertions(+)
> >  create mode 100644 mt7662u.bin
> >  create mode 100644 mt7662u_rom_patch.bin
> > 
> > diff --git a/WHENCE b/WHENCE
> > index ca3f30c..afe828e 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -3814,6 +3814,18 @@ Version: 0.0.2_P69
> >  
> >  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
> >  
> > +---------------------------------------------------------------------------
> > +
> > +Driver: mt76x2u - MediaTek MT76x2u Wireless MACs
> > +
> > +File: mt7662u.bin
> > +Version: 1.5
> > +
> > +File: mt7662u_rom_patch.bin
> > +Version: 0.0.2_P48
> > +
> > +Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
> 
> This is different licence file (and text is different too) than the
> licence file pointed by Sean:
> http://lists.infradead.org/pipermail/linux-mediatek/2018-June/013759.html
> 
> The LICENCE.mediatek was not yet committed to linux-firmware tree, so
> I think we should wait for that before posting mt76xx*.bin blobs.

Hi Stanislaw,

thx for the info, I lost that email. I was thinking we can use the same license
used by mt76x2 driver.
Please drop my previous email, I will send a v2 (pointing to the right license file)
as soon as the one posted by Sean is merged.

Regards,
Lorenzo

> 
> Regards
> Stanislaw
