From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH] media: platform: mtk-mdp: mtk_mdp_core: Add
 of_node_put() before goto
Date: Fri, 12 Jul 2019 15:37:12 +0800
Message-ID: <1562917032.29653.7.camel@mhfsdcap03>
References: <20190709172454.13648-1-nishkadg.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190709172454.13648-1-nishkadg.linux@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>, Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>, houlong.wei@mediatek.com, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-10 at 01:24 +0800, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a goto from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the goto in two
> places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index fc9faec85edb..d0a3f06ad83d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -145,13 +145,16 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
>  		if (!comp) {
>  			ret = -ENOMEM;
> +			of_node_put(node);
>  			goto err_comp;
>  		}
>  		mdp->comp[comp_id] = comp;
>  
>  		ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(node);
>  			goto err_comp;
> +		}
>  	}
>  
>  	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);

Thanks Nishka for fixing the bug.

Acked-by: Houlong Wei <houlong.wei@mediatek.com>
