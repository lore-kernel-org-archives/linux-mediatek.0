Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D9EEB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLL5P5BiuY7A+ro9pJ4YRccsF4/Thu52yC/wF2yAAog=; b=tJe3EJ0NP8QWT6t2kc3H+QYtxc
	QpUe5AZmKyxL+yGNeZlz0P4FLjhNwk8PaJCwbrbtxFdQL2ytsPZIIw92oExLKXFwPGvLNDcT6ztst
	fb8vilp4ezJNorM1gOa6EnwrAZOlwDt3XVmUmZPGcwZ0lYefnmzimgd+n+JkKUuFHsQXrEDdD48dj
	m/NR8XUeOVUC4NK+guAU962q+bw5B22UbRnA+BsF0HJJ33WsFy92cXCs6DMcenW2RivWYX3QpZ3sZ
	zgbutGomf9DsEnrPV1BvDPXjSL33uxzhyae/g16ho5o8DzQ6BWNWdD0QrGuImc88NH+kygTJIuYs0
	+jXCET5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMme2-00DZfA-2z;
	Fri, 21 Jul 2023 09:41:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmdz-00DZdk-2J;
	Fri, 21 Jul 2023 09:41:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9708B61941;
	Fri, 21 Jul 2023 09:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7342FC433C8;
	Fri, 21 Jul 2023 09:41:46 +0000 (UTC)
Message-ID: <48a07b61-edb6-1c2f-8299-14d346ab7b2e@xs4all.nl>
Date: Fri, 21 Jul 2023 11:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] media: platform: mtk-mdp3: Fix resource leak in
 mdp_get_subsys_id() and mdp_comp_config()
Content-Language: en-US
To: Lu Hongfei <luhongfei@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Sun Ke <sunke32@huawei.com>,
 "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)"
 <linux-media@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: opensource.kernel@vivo.com
References: <20230613032734.34099-1-luhongfei@vivo.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230613032734.34099-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_024151_856736_DD343378 
X-CRM114-Status: GOOD (  21.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Lu Hongfei,

On 13/06/2023 05:27, Lu Hongfei wrote:
> Add a put_device() call for the release of the object
> which was determined by a of_find_device_by_node() call
> in mdp_get_subsys_id().
> 
> Add of_node_put() call for the release of the object
> which was determined by a for_each_child_of_node() call
> in mdp_comp_config().

After merging this patch from you into our media_stage tree:

https://patchwork.linuxtv.org/project/linux-media/patch/20230530101724.31412-1-luhongfei@vivo.com/

this v3 no longer applies. So I will need a v4, I'm afraid...

Regards,

	Hans

> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
> The previous version’s Subject was:
> [PATCH v2] media: platform: mtk-mdp3: Fix resource leaks in mdp_get_subsys_id()
> 
> The modifications made compared to the previous version are as follows:
> 1. Modified the patch subject
> 2. Fix resource leak issue in mdp_comp_config()
> 
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index a605e80c7dc3..85c5f89f2ed2
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -892,13 +892,16 @@ static int mdp_get_subsys_id(struct mdp_dev *mdp, struct device *dev,
>  	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, &cmdq_reg, index);
>  	if (ret != 0) {
>  		dev_err(&comp_pdev->dev, "cmdq_dev_get_subsys fail!\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto put_device;
>  	}
>  
>  	comp->subsys_id = cmdq_reg.subsys;
>  	dev_dbg(&comp_pdev->dev, "subsys id=%d\n", cmdq_reg.subsys);
>  
> -	return 0;
> +put_device:
> +	put_device(&comp_pdev->dev);
> +	return ret;
>  }
>  
>  static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
> @@ -1135,6 +1138,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
>  		comp = mdp_comp_create(mdp, node, id);
>  		if (IS_ERR(comp)) {
>  			ret = PTR_ERR(comp);
> +			of_node_put(node);
>  			goto err_init_comps;
>  		}
>  
> @@ -1144,6 +1148,8 @@ int mdp_comp_config(struct mdp_dev *mdp)
>  		pm_runtime_enable(comp->comp_dev);
>  	}
>  
> +	of_node_put(node);
> +
>  	ret = mdp_comp_sub_create(mdp);
>  	if (ret)
>  		goto err_init_comps;


