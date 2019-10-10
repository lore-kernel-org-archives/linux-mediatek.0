From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
Date: Thu, 10 Oct 2019 18:00:09 +0900
Message-ID: <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com>
References: <20191010075004.192818-1-tfiga@chromium.org>
 <1570697118.32135.20.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1570697118.32135.20.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Changqi Hu <Changqi.Hu@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Shik Chen <shik@chromium.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Chunfeng,

On Thu, Oct 10, 2019 at 5:45 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Hi, Tomasz,
>
> On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
> > MediaTek XHCI host controller does not support 64-bit addressing despite
> > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > because xhci_gen_setup() overrides it according to hardware
> > capabilities.
> >
> > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > 32-bit DMA mask instead.
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index b18a6baef204a..4d101d52cc11b 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> >       xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> >       if (mtk->lpm_support)
> >               xhci->quirks |= XHCI_LPM_SUPPORT;
> > +     /*
> > +      * MTK host controller does not support 64-bit addressing, despite
> > +      * having the AC64 bit of the HCCPARAMS1 register set.
> > +      */
> > +     xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> Somes SoCs support 64bits in fact, so can't support this quirk, do you
> encounter any issues without this quirk?
>

Thanks for taking a look at this patch.

Yes, on MT8183 the DMA mask ended up being set to 64 bits, but
according to the information I received from MediaTek, the controller
on that SoC only supports 32 bits.

If some SoCs support only 32 bits and some support 64 bits, we may
either need to use different DT compatible string for them or add a DT
property and set the quirk based on that. Right now in upstream we
have:

1) "mediatek,mt8173-xhci", used by:
MT8173

2)"mediatek,mtk-xhci", used by:
MT2712
MT7622
MT8183 (not yet upstream, but I suppose it's on the mailing lists)

Would you be able to check which of the SoCs above report 64 bits but
support only 32? (and so would need this quirk)

Best regards,
Tomasz

> >  }
>
> >
> >  /* called during probe() after chip reset completes */
> > @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >               goto disable_clk;
> >       }
> >
> > -     /* Initialize dma_mask and coherent_dma_mask to 32-bits */
> > -     ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > -     if (ret)
> > -             goto disable_clk;
> > -
> >       hcd = usb_create_hcd(driver, dev, dev_name(dev));
> >       if (!hcd) {
> >               ret = -ENOMEM;
>
>
