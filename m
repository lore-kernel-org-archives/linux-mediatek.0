From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: get optional clock by
 devm_clk_get_optional()
Date: Sun, 31 Mar 2019 20:40:08 +0800
Message-ID: <1554036008.10179.174.camel@mhfsdcap03>
References: <1553940051-10367-1-git-send-email-chunfeng.yun@mediatek.com>
 <1554027049.21644.0.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554027049.21644.0.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Honghui Zhang <honghui.zhang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Ryder,

On Sun, 2019-03-31 at 18:10 +0800, Ryder Lee wrote:
> On Sat, 2019-03-30 at 18:00 +0800, Chunfeng Yun wrote:
> > Use devm_clk_get_optional() to get optional clock
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 46 ++++++--------------------
> >  1 file changed, 11 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index 0b6c72804e03..9a66a018489b 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -915,49 +915,25 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
> >  
> >  	/* sys_ck might be divided into the following parts in some chips */
> >  	snprintf(name, sizeof(name), "ahb_ck%d", slot);
> > -	port->ahb_ck = devm_clk_get(dev, name);
> > -	if (IS_ERR(port->ahb_ck)) {
> > -		if (PTR_ERR(port->ahb_ck) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		port->ahb_ck = NULL;
> > -	}
> > +	port->ahb_ck = devm_clk_get_optional(dev, name);
> > +	if (IS_ERR(port->ahb_ck))
> > +		return PTR_ERR(port->ahb_ck);
> >  
> >  	snprintf(name, sizeof(name), "axi_ck%d", slot);
> > -	port->axi_ck = devm_clk_get(dev, name);
> > -	if (IS_ERR(port->axi_ck)) {
> > -		if (PTR_ERR(port->axi_ck) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		port->axi_ck = NULL;
> > -	}
> > +	port->axi_ck = devm_clk_get_optional(dev, name);
> > +		return PTR_ERR(port->axi_ck);
> >  
> >  	snprintf(name, sizeof(name), "aux_ck%d", slot);
> > -	port->aux_ck = devm_clk_get(dev, name);
> > -	if (IS_ERR(port->aux_ck)) {
> > -		if (PTR_ERR(port->aux_ck) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		port->aux_ck = NULL;
> > -	}
> > +	port->aux_ck = devm_clk_get_optional(dev, name);
> > +		return PTR_ERR(port->aux_ck);
> >  
> >  	snprintf(name, sizeof(name), "obff_ck%d", slot);
> > -	port->obff_ck = devm_clk_get(dev, name);
> > -	if (IS_ERR(port->obff_ck)) {
> > -		if (PTR_ERR(port->obff_ck) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		port->obff_ck = NULL;
> > -	}
> > +	port->obff_ck = devm_clk_get_optional(dev, name);
> > +		return PTR_ERR(port->obff_ck);
> >  
> >  	snprintf(name, sizeof(name), "pipe_ck%d", slot);
> > -	port->pipe_ck = devm_clk_get(dev, name);
> > -	if (IS_ERR(port->pipe_ck)) {
> > -		if (PTR_ERR(port->pipe_ck) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		port->pipe_ck = NULL;
> > -	}
> > +	port->pipe_ck = devm_clk_get_optional(dev, name);
> > +		return PTR_ERR(port->pipe_ck);
> >  
> >  	snprintf(name, sizeof(name), "pcie-rst%d", slot);
> >  	port->reset = devm_reset_control_get_optional_exclusive(dev, name);
> 
> if (IS_ERR(...)) ?
Very sorry for my stupid mistake:(
will send new version

> 
