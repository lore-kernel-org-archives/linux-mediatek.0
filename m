Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1409C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tV/KVA60N8wCrcyq8E7sO7XclkqoZK3ThaqZXfyJ8nU=; b=35+xsMBvvEm5GYp1xdFJENevyy
	15twfNYWGniMqHtGBOXP3mZQhAce2hpO9zUVOrg3azka3qjGmnyKYGVcEBLazvxcm5mh09+gYuNDB
	VtDiUDxF04J8TQEB0gihG06UBm2QuXw/AZYTFSrJTelwJqwmU9QBmpdiclYTJSbY439belYZ98xF5
	Q2zmBxEQejIvzEMEKqMzTCaWBKyQrgSrMQ0LNrAqvqlhplaB4+BG4DXGeBfjVq+AWw99jPswDZEOa
	iGvSf0v6KCaCN4wYZBJ8s4waXesod4IyD+h55a7eSnqi1zjTCrzSpOsIMM8Tk+x0joPaE59QxOxQh
	WWu7rWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEtD-0093jr-2I; Fri, 30 Sep 2022 12:13:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEt6-0093dx-75
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 12:13:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AC7666022C7;
	Fri, 30 Sep 2022 13:12:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664539973;
	bh=S/w2ZgDqdlLU+Y5Jz0E2rWA2oIr8YVBO+H3Z2byFScQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hevf7fljW2fs3JHeop1tzitdLhD8iz5jrvS7rn8C/rOSMgWjZRC1Q4lLTJ0mP7CI8
	 /8Qi8JZUNjqKWTyeQepFo0BGGdmrDWmKfUFDZ/GLVQ+GaO7NGULQQKyLELx+vah0Pk
	 ZCkZVykNQA3PB+GlOgmkayfWBlGopjGyizLGZCm6pZu03exvacZbXE9eW+Bh9iihpz
	 aJ5TNK1jiHC/w0ULE6VFqYXSYCegkqrNfvR4yXBUnJzNOX8mxg+8YuVSnnrt4YpwuX
	 UoPrv90Gm8hGWsWj1iMvh/aNYSO2O1UKLcdu+cr92ZVIdRWtfH5rlPjyWvvqYVLkH0
	 f+0wlhOZm0mYQ==
Message-ID: <8afa9c8e-079e-6e50-a8d7-21e0b1698f76@collabora.com>
Date: Fri, 30 Sep 2022 14:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 2/2] media: platform: mtk-mdp3: fix error handling
 about components clock_on
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220930102306.13201-1-moudy.ho@mediatek.com>
 <20220930102306.13201-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930102306.13201-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_051304_430743_FF519E13 
X-CRM114-Status: GOOD (  20.67  )
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

Il 30/09/22 12:23, Moudy Ho ha scritto:
> Add goto statement in mdp_comp_clock_on() to avoid error code not being
> propagated or returning positive values.
> This change also performs a well-timed clock_off when an error occurs, and
> reduces unnecessary error logging in mdp_cmdq_send().
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  4 +---
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24 ++++++++++++++-----
>   2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index e194dec8050a..124c1b96e96b 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -433,10 +433,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
>   	cmd->mdp_ctx = param->mdp_ctx;
>   
>   	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd->num_comps);
> -	if (ret) {
> -		dev_err(dev, "comp %d failed to enable clock!\n", ret);
> +	if (ret)
>   		goto err_free_path;
> -	}
>   
>   	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
>   				   cmd->pkt.pa_base, cmd->pkt.cmd_buf_size,
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index d3eaf8884412..fe6a39315e88 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -699,12 +699,22 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>   			dev_err(dev,
>   				"Failed to enable clk %d. type:%d id:%d\n",
>   				i, comp->type, comp->id);
> -			pm_runtime_put(comp->comp_dev);
> -			return ret;
> +			goto err_unwind;
>   		}
>   	}
>   
>   	return 0;
> +
> +err_unwind:

For this label to be clearer, I would rename it as `err_revert`, or
`clocks_off`, or even simply `err`, as the `unwind` word may create
some confusion here.

> +	while (--i >= 0) {
> +		if (IS_ERR_OR_NULL(comp->clks[i]))
> +			continue;
> +		clk_disable_unprepare(comp->clks[i]);
> +	}
> +	if (comp->comp_dev)
> +		pm_runtime_put_sync(comp->comp_dev);
> +
> +	return ret;
>   }
>   
>   void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
> @@ -723,11 +733,13 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
>   
>   int mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
>   {
> -	int i;
> +	int i, ret;
>   
> -	for (i = 0; i < num; i++)
> -		if (mdp_comp_clock_on(dev, &comps[i]) != 0)
> -			return ++i;
> +	for (i = 0; i < num; i++) {
> +		ret = mdp_comp_clock_on(dev, &comps[i]);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	return 0;
>   }
> 

