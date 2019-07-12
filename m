From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH] [media] media: mtk-mdp: fix reference count on old
 device tree
Date: Fri, 12 Jul 2019 15:23:37 +0800
Message-ID: <1562916217.29653.4.camel@mhfsdcap03>
References: <20190621113250.4946-1-matthias.bgg@gmail.com>
         <e4d178ae-f43e-21d0-b0ab-78cc2ac71e7e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <e4d178ae-f43e-21d0-b0ab-78cc2ac71e7e@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>, Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "djkurtz@chromium.org" <djkurtz@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org



On Mon, 2019-07-08 at 17:06 +0800, Matthias Brugger wrote:
> 
> On 21/06/2019 13:32, Matthias Brugger wrote:
> > of_get_next_child() increments the reference count of the returning
> > device_node. Decrement it in the check if we are using the old or the
> > new DTB.
> > 
> > Fixes: ba1f1f70c2c0 ("[media] media: mtk-mdp: Fix mdp device tree")
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Any comments on that?
> 

Hi Matthias,
Thanks for fixing the bug. Sorry to reply late~

Acked-by: Houlong Wei <houlong.wei@mediatek.com>


> > ---
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > index bbb24fb95b95..bafe53c5d54a 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > @@ -118,7 +118,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >  	mutex_init(&mdp->vpulock);
> >  
> >  	/* Old dts had the components as child nodes */
> > -	if (of_get_next_child(dev->of_node, NULL)) {
> > +	parent = of_get_next_child(dev->of_node, NULL);
> > +	if (parent) {
> > +		of_node_put(parent);
> >  		parent = dev->of_node;
> >  		dev_warn(dev, "device tree is out of date\n");
> >  	} else {
> > 
