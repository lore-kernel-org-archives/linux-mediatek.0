From: Honghui Zhang <honghui.zhang@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Use
 devm_of_pci_get_host_bridge_resources() to parse DT
Date: Wed, 7 Nov 2018 11:19:04 +0800
Message-ID: <1541560744.11281.15.camel@mhfsdcap03>
References: <1539833014-1738-1-git-send-email-honghui.zhang@mediatek.com>
         <1541140583.10519.1.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541140583.10519.1.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>, Jianjun Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BB=BA=E5=86=9B=29?= <Jianjun.Wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-11-02 at 14:36 +0800, Ryder Lee wrote:
> On Thu, 2018-10-18 at 11:23 +0800, Honghui Zhang (张洪辉) wrote:
> > From: Honghui Zhang <honghui.zhang@mediatek.com>
> > 
> > Use the devm_of_pci_get_host_bridge_resources() API in place of the PCI OF
> > DT parser.
> > 
> > Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 109 +++++++++------------------------
> >  1 file changed, 29 insertions(+), 80 deletions(-)
> > 
[......]
> > 
> 
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> 
> 

Hi, Lorenzo, could you help take a look at this patch?

Thanks.
