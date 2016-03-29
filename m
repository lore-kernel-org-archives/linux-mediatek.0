From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFCv2: PATCH 1/2] mtd: mediatek: device tree docs for MTK
 Smart Device Gen1 NAND
Date: Tue, 29 Mar 2016 09:58:47 +0200
Message-ID: <20160329095847.0ff4a400@bbrezillon>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322145258.44945c64@bbrezillon> <56F6D727.8070001@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <56F6D727.8070001-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, 26 Mar 2016 14:38:31 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On 03/22/2016 09:52 AM, Boris Brezillon wrote:
> >> > +		compatible = "mediatek,mt2701-nfc";
> >> > +		reg = <0 0x1100d000 0 0x1000>;
> >> > +		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
> >> > +		clocks = <&pericfg CLK_PERI_NFI>,
> >> > +			 <&pericfg CLK_PERI_NFI_PAD>;
> >> > +		clock-names = "nfi_clk", "pad_clk";
> >> > +		nand-on-flash-bbt;
> >> > +		status = "disabled";
> >> > +		mediatek,ecc-controller = <&bch>;
> > Now that 2 different drivers use the same way to link the ECC engine
> > and the NAND controller we can think about defining a generic property
> > (ecc-engine ?), and provide a generic framework.
> >
> > The generic framework part is not something I'm asking right now, but I
> > think we should start using a generic property here.
> >
> 
> we have done all the changes required for v3 except this one.
> so please let me check my understanding before going ahead: are you suggesting
> that we replace "mediatek,ecc-controller" for "ecc-engine" (even though this
> generic property doesn't exist yet)?
> 
> and then afterwards, generate another patch-set set to define and document
> "ecc-engine"?

Yes, that's the idea, though the NAND controller aspect is not yet
documented in Documentation/devicetree/bindings/mtd/nand.txt, and
ecc-engine is supposed to be attached to the NAND controller node.

I'll send a patch to further document the NAND chip, NAND controller
description concepts in this generic NAND DT bindings doc (as suggested
by Brian), and let you document this ecc-engine property.



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
