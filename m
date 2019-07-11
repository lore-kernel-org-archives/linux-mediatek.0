From: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2, 1/3] dt-bindings: soc: Add MT8183 emi dt-bindings
Date: Thu, 11 Jul 2019 14:37:13 +0800
Message-ID: <1562827033.22938.0.camel@mhfsdcap03>
References: <1558670066-22484-1-git-send-email-xixi.chen@mediatek.com>
 <1558670066-22484-2-git-send-email-xixi.chen@mediatek.com>
 <668e6ccb-709b-a93a-7113-a22362048972@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <668e6ccb-709b-a93a-7113-a22362048972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org


On Tue, 2019-06-18 at 23:32 +0200, Matthias Brugger wrote:
> 
> On 24/05/2019 05:54, Xi Chen wrote:
> > Add emi dt-bindings of MT8183 in binding document.
> > 
> > Signed-off-by: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../bindings/memory-controllers/mediatek,emi.txt      | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt
> > new file mode 100644
> > index 0000000..a19e3b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt
> > @@ -0,0 +1,19 @@
> > +EMI (External Memory Interface)
> > +
> > +Required properties:
> > +- compatible : must be one of :
> > +	"mediatek,mt8183-emi"
> > +- reg : the register and size of the EMI block.
> 
> Please name the registers explicitly.
	the "reg" is emi reg base.
> 
> > +- interrupts : includes MPU, CGM, ELM.
> > +
> > +Example:
> > +	emi@10219000 {
> > +	compatible = "mediatek,mt8183-emi";
> 
> Please do the indention right.
	Yes, I do the indention right.
> 
> > +	reg = <0 0x10219000 0 0x1000>, /* CEN EMI */
> > +		  <0 0x10226000 0 0x1000>, /* EMI MPU */
> > +		  <0 0x1022d000 0 0x1000>, /* CHA EMI */
> > +		  <0 0x10235000 0 0x1000>; /* CHB EMI */
> 
> This looks quite spread out over the IO space. Is this really one HW block or
> did you add various blocks into one driver?
	Yes, you are right. I removed the unused reg addr and interrupts.
> 
> > +	interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW>, /* MPU */
> > +			 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>, /* CGM */
> > +			 <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>; /* ELM */
> > +};
> > 
