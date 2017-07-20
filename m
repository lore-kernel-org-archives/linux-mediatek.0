From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 06/30] arm: dts: mt7623: add clock-frequency to the
 a7 timer node to mt7623.dtsi
Date: Thu, 20 Jul 2017 11:14:46 +0800
Message-ID: <1500520486.25149.7.camel@mtkswgap22>
References: <1493197474-3718-1-git-send-email-sean.wang@mediatek.com>
 <1493197474-3718-7-git-send-email-sean.wang@mediatek.com>
 <1498015701.3383.4.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1498015701.3383.4.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi, Matthias

ditto, just another gentle ping on this missing patch

	Sean

On Wed, 2017-06-21 at 11:28 +0800, Sean Wang wrote:
> Hi Matthias,
> 
> the patch seems to be gone in your tree which would make the unit not
> boot, but 5/30 and 7/30 have been accepted. Have any concern ? 
> 
> 	Sean
> 
> 
> On Wed, 2017-04-26 at 17:04 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> > 
> > We need to tell the driver what the timers frequency is and that the core
> > has not be configured by the bootrom. Not doing so makes the unit not
> > boot.
> > 
> > Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/mt7623.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> > index adb2393..3cc0a3a 100644
> > --- a/arch/arm/boot/dts/mt7623.dtsi
> > +++ b/arch/arm/boot/dts/mt7623.dtsi
> > @@ -77,6 +77,8 @@
> >  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> >  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> >  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> > +		clock-frequency = <13000000>;
> > +		arm,cpu-registers-not-fw-configured;
> >  	};
> >  
> >  	topckgen: syscon@10000000 {
> 
