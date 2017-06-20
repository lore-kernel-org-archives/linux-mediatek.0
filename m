From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: Medaitek armv7 DTS for v4.13
Date: Tue, 20 Jun 2017 10:00:44 +0800
Message-ID: <1497924044.22079.3.camel@mtkswgap22>
References: <5056d433-90b3-a3ca-4df7-9ff02ab6027b@gmail.com>
 <20170619023437.GV30022@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170619023437.GV30022@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jun Gao <jun.gao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Sun, 2017-06-18 at 19:34 -0700, Olof Johansson wrote:
> On Mon, Jun 12, 2017 at 12:31:47PM +0200, Matthias Brugger wrote:
> > Hi Arnd and Olof,
> > 
> > Please find below my merge request for armv7 device tree changes.
> > 
> > Regards,
> > Matthias
> > 
> > ---
> > 
> > The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> > 
> >   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> > 
> > are available in the git repository at:
> > 
> >   https://github.com/mbgg/linux-mediatek.git tags/v4.12-next-dts32
> > 
> > for you to fetch changes up to aac5e972d4c7bc728df605f5427d9c2458c34ea9:
> > 
> >   arm: dts: mediatek: Add audio driver node for MT2701 (2017-06-07 10:47:25
> > +0200)
> 
> Thanks, merged. Comment below:
> 
> > 
> > ----------------------------------------------------------------
> > Add device tree nodes for
> > mt7623:
> > - clocks
> > - power domain
> > - pmic-wrapper
> > - pinctrl
> > - i2c
> > - spi
> > - nand
> > - mmc
> > - usb
> > - pwm
> > - ethernet
> > - crypto engine
> > - infared remote control
> > - audio controller
> > - ADC
> > - efuse
> > - thermal driver
> > - HW random generator
> > 
> > mt2701:
> > - NOR flash
> > - JPEG decoder
> > - i2c
> > - audio controller
> > 
> > ----------------------------------------------------------------
> > Garlic Tseng (1):
> >       arm: dts: mediatek: Add audio driver node for MT2701
> > 
> > Guochun Mao (1):
> >       arm: dts: mt2701: add nor flash node
> > 
> > John Crispin (9):
> >       arm: dts: mt7623: add clock controller device nodes
> >       arm: dts: mt7623: add subsystem clock controller device nodes
> >       arm: dts: mt7623: add power domain controller device node
> >       arm: dts: mt7623: add pinctrl nodes to the mt7623 dtsi file
> >       arm: dts: mt7623: add pmic wrapper nodes to the mt7623 dtsi file
> >       arm: dts: mt7623: add i2c nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add nand nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add mmc nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add usb nodes to the mt7623.dtsi file
> > 
> > Jun Gao (1):
> >       arm: dts: Add Mediatek MT2701 i2c device node
> > 
> > Rick Chang (1):
> >       arm: dts: mt2701: Add node for Mediatek JPEG Decoder
> > 
> > Sean Wang (11):
> >       arm: dts: mt7623: add spi nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add pwm nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add ethernet nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add crypto engine nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add ir nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add afe nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add rng nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add auxadc nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add thermal nodes to the mt7623.dtsi file
> >       arm: dts: mt7623: add Sean as one of authors for mt7623.dtsi files
> 
> This excessive patch splitting probably isn't warranted. In the future,
> especially for new and major updates like this, a single patch (or one per
> author) should do just fine.
> 

Hi Olof,

Got it. I will make a single patch for new SoC supported.

	Sean
> 
> -Olof
> 
