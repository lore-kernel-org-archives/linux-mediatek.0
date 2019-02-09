From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH V0 1/7] [media] dt-bindings: mt8183: Add binding for
 DIP shared memory
Date: Sat, 9 Feb 2019 20:17:05 +0200
Message-ID: <20190209181705.GB4505@pendragon.ideasonboard.com>
References: <1549020091-42064-1-git-send-email-frederic.chen@mediatek.com>
 <1549020091-42064-2-git-send-email-frederic.chen@mediatek.com>
 <20190209155907.rbgwbdablndcesid@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190209155907.rbgwbdablndcesid@valkosipuli.retiisi.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sean.Cheng@mediatek.com, Frederic Chen <frederic.chen@mediatek.com>, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, tfiga@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, hans.verkuil@cisco.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Feb 09, 2019 at 05:59:07PM +0200, Sakari Ailus wrote:
> Hi Frederic,
> 
> Could you cc the devicetree list, please?
> 
> On Fri, Feb 01, 2019 at 07:21:25PM +0800, Frederic Chen wrote:
> > This patch adds the binding for describing the shared memory
> > used to exchange configuration and tuning data between the
> > co-processor and Digital Image Processing (DIP) unit of the
> > camera ISP system on Mediatek SoCs.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  .../mediatek,reserve-memory-dip_smem.txt           | 45 ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > new file mode 100644
> > index 0000000..0ded478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > @@ -0,0 +1,45 @@
> > +Mediatek DIP Shared Memory binding
> > +
> > +This binding describes the shared memory, which serves the purpose of
> > +describing the shared memory region used to exchange data between Digital
> > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > +
> > +The co-processor doesn't have the iommu so we need to use the physical
> > +address to access the shared buffer in the firmware.
> > +
> > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > +it can use dma address to access the memory region.
> > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> 
> What kind of purpose is the memory used for? Buffers containing video data,
> or something else? Could the buffer objects be mapped on the devices
> based on the need instead?

And could CMA be used when physically contiguous memory is needed ?

> > +
> > +
> > +Required properties:
> > +
> > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> > +
> > +- reg: required for static allocation (see reserved-memory.txt for
> > +  the detailed usage)
> > +
> > +- alloc-range: required for dynamic allocation. The range must
> > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > +  addressing limitation
> > +
> > +- size: required for dynamic allocation. The unit is bytes.
> > +  If you want to enable the full feature of Digital Processing Unit,
> > +  you need 20 MB at least.
> > +
> > +
> > +Example:
> > +
> > +The following example shows the DIP shared memory setup for MT8183.
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +		reserve-memory-isp_smem {
> > +			compatible = "mediatek,reserve-memory-dip_smem";
> > +			size = <0 0x1400000>;
> > +			alignment = <0 0x1000>;
> > +			alloc-ranges = <0 0x40000000 0 0x50000000>;
> > +		};
> > +	};

-- 
Regards,

Laurent Pinchart
