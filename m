From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH V0 3/7] [media] dt-bindings: mt8183: Added DIP-SMEM
 dt-bindings
Date: Sat, 9 Feb 2019 20:20:34 +0200
Message-ID: <20190209182034.GC4505@pendragon.ideasonboard.com>
References: <1549020091-42064-1-git-send-email-frederic.chen@mediatek.com>
 <1549020091-42064-4-git-send-email-frederic.chen@mediatek.com>
 <20190209155935.afrrtf3twjmj23sm@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190209155935.afrrtf3twjmj23sm@valkosipuli.retiisi.org.uk>
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

Hello Frederic,

On Sat, Feb 09, 2019 at 05:59:35PM +0200, Sakari Ailus wrote:
> Hi Frederic,
> 
> Thanks for the patchset.
> 
> Could you also cc the devicetree list, please?
> 
> On Fri, Feb 01, 2019 at 07:21:27PM +0800, Frederic Chen wrote:
> > This patch adds the DT binding documentation for the shared memory
> > between DIP (Digital Image Processing) unit of the camera ISP system
> > and the co-processor in Mediatek SoCs.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,dip_smem.txt           | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,dip_smem.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,dip_smem.txt b/Documentation/devicetree/bindings/media/mediatek,dip_smem.txt
> > new file mode 100644
> > index 0000000..5533721
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,dip_smem.txt
> > @@ -0,0 +1,29 @@
> > +Mediatek ISP Shared Memory Device
> > +
> > +Mediatek ISP Shared Memory Device is used to manage shared memory
> > +among CPU, ISP IPs and coprocessor. It is associated with a reserved
> > +memory region (Please see Documentation\devicetree\bindings\
> > +reserved-memory\mediatek,reserve-memory-isp_smem.txt) and
> 
> s/\\/\//g;
> 
> > +and provide the context to allocate memory with dma addresses.

Does this represent a real device (as in IP core) in the SoC ? There
seems to be no driver associated with the compatible string defined
herein in this patch series, what is this node used for ?

> > +Required properties:
> > +- compatible: Should be "mediatek,isp_smem"
> 
> s/Should/Shall/
> 
> > +
> > +- iommus: should point to the respective IOMMU block with master port
> 
> s/should/shall/
> 
> > +  as argument. Please set the ports which may be accessed
> > +  through the common path. You can see
> > +  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for the detail.
> > +
> > +- mediatek,larb: must contain the local arbiters in the current Socs.
> 
> Perhaps "SoCs"?
> 
> > +  Please set the larb of camsys for Pass 1 and imgsys for DIP, or both
> > +  if you are using all the camera function. You can see
> > +  Documentation/devicetree/bindings/memory-controllers/
> > +  mediatek,smi-larb.txt for the detail.
> > +
> > +Example:
> > +	isp_smem: isp_smem {
> > +		compatible = "mediatek,isp_smem";
> > +		mediatek,larb = <&larb5>;
> > +		iommus = <&iommu M4U_PORT_CAM_IMGI>;
> > +	};

-- 
Regards,

Laurent Pinchart
