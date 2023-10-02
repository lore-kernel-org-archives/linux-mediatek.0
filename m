Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50733E7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdxnqbBTD21mFajYTxMcf9hxMdg8JXFBQdDjhbnjePo=; b=w88yko655TwMOH+i4vDusj3Ogw
	QNVNG+8KX3MbijevBBTxFGy35qHJX45AxeRqQYhtQGsqgVjb6gNTxiL4yZxwVn/WMPBdpMR5kJXwG
	yWYPfezlZTG5P+2VPfds06kb5XQEkdGGUti398HrQ8+2m7fQVxAXdHwy+IxOYNjDmzmv2VxbAUMMJ
	aCk717WWYc6Jge+P39wzc4ffZ8i7q30sXSHdOtToWin4U5oFoe+kxLAVvr6oUvtIeD6/KCMY8RP7M
	LmZtpk8WHs11VH/4nB+HwFNkmwAiheYYWd171x0UekZeeRcSi5VKEnx77rbpNglHjQTYns2lWCQQ5
	J0uFIxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGc9-00CVCW-0m;
	Mon, 02 Oct 2023 10:57:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGc4-00CVB6-1l;
	Mon, 02 Oct 2023 10:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 12C13B80E5F;
	Mon,  2 Oct 2023 10:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A1CC433C9;
	Mon,  2 Oct 2023 10:57:16 +0000 (UTC)
Message-ID: <4e9452b9-a02c-47eb-ba8f-5949f07f707d@xs4all.nl>
Date: Mon, 2 Oct 2023 12:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] media: platform: mtk-mdp3: fix uninitialized
 variable in mdp_path_config()
Content-Language: en-US, nl
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230922074145.11977-1-moudy.ho@mediatek.com>
 <20230922074145.11977-14-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230922074145.11977-14-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_035720_732626_A1107F33 
X-CRM114-Status: GOOD (  18.18  )
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

On 22/09/2023 09:41, Moudy Ho wrote:
> Fix the build warnings that were detected by the linux-media
> build scripts tool:
> 
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:
> 	In function 'mdp_path_config.isra':
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:443:51:
> 	warning: 'ctx' may be used uninitialized [-Wmaybe-uninitialized]
>   443 |                    out = CFG_COMP(MT8195, ctx->param, outputs[0]);
>       |                                           ~~~^~~~~~~
> drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h:137:25: note:
> 	in definition of macro 'CFG_COMP'
>   137 |         (IS_ERR_OR_NULL(comp) ? 0 : _CFG_COMP(plat, comp, mem))
>       |                         ^~~~
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:396:30:
> 	note: 'ctx' was declared here
>   396 |         struct mdp_comp_ctx *ctx;
>       |
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 15a0b944745e..4a8d941178aa 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -436,13 +436,13 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
>  		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
>  			continue;
>  
> +		ctx = &path->comps[index];
>  		if (CFG_CHECK(MT8183, p_id))
>  			out = CFG_COMP(MT8183, ctx->param, outputs[0]);
>  		else if (CFG_CHECK(MT8195, p_id))
>  			out = CFG_COMP(MT8195, ctx->param, outputs[0]);
>  
>  		compose = path->composes[out];
> -		ctx = &path->comps[index];
>  		ret = call_op(ctx, config_frame, cmd, compose);
>  		if (ret)
>  			return ret;

Hmm, this patch really should be a separate patch on top of the media
staging branch: it is wrong there as well, except you don't get a build
warning. Other changes in this patch series caused this warning to appear,
but the actual bug is already present in the current staging code.

Regards,

	Hans

