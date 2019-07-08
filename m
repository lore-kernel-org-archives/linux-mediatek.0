From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] [media] media: mtk-mdp: fix reference count on old device
 tree
Date: Mon, 8 Jul 2019 11:06:43 +0200
Message-ID: <e4d178ae-f43e-21d0-b0ab-78cc2ac71e7e@gmail.com>
References: <20190621113250.4946-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621113250.4946-1-matthias.bgg@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, djkurtz@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 21/06/2019 13:32, Matthias Brugger wrote:
> of_get_next_child() increments the reference count of the returning
> device_node. Decrement it in the check if we are using the old or the
> new DTB.
> 
> Fixes: ba1f1f70c2c0 ("[media] media: mtk-mdp: Fix mdp device tree")
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Any comments on that?

> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index bbb24fb95b95..bafe53c5d54a 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -118,7 +118,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  	mutex_init(&mdp->vpulock);
>  
>  	/* Old dts had the components as child nodes */
> -	if (of_get_next_child(dev->of_node, NULL)) {
> +	parent = of_get_next_child(dev->of_node, NULL);
> +	if (parent) {
> +		of_node_put(parent);
>  		parent = dev->of_node;
>  		dev_warn(dev, "device tree is out of date\n");
>  	} else {
> 
