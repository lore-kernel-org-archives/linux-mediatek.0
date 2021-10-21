Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34114C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 10:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F081461037
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 10:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F081461037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEiH/qBlLYFpd1EC2Me5Dy1yAb/gK3nhgxRyf+l3Y5M=; b=EV1pSWAA0CLNJxv77lYL+VT34n
	13tMJ913cym7Iv99l7FI1aBxOsLxJfHHSWBJHaarnNbPht1QQawVjH5m38TvNWD2umbOUZ5Wg39xp
	aUvxyIzOrr6zUQ1MX7W0NuMl1XJ1Knq8OnVbKmguxuH891WNwKUQVWr2+x1Sga8ugdAUB1ysGXTxZ
	qKzY1wK88qmzNAeIqr2Jp0pPwroUj8mSQ3ZUjbFthDhUvrN15kioCiDrcZp7gECWA49/WQQWx3a1w
	SuPgaKutIzuuWjq31PA2HGxddcpPIua4EVrAEe3UGfcxie9XcZkOA/MAk5OVfvKB0INjgtnrpwluf
	Mn+5EpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdVZA-007H0s-2N; Thu, 21 Oct 2021 10:44:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdVYx-007Gyc-SX; Thu, 21 Oct 2021 10:44:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E9B121F44896
Subject: Re: [PATCH v1 4/4] media: platform: mtk-mdp3: Set rdma compression
 reg in each frame
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211021063414.23663-1-roy-cw.yeh@mediatek.com>
 <20211021063414.23663-5-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4154479c-b0cc-dde4-eb73-bc6c65c9beca@collabora.com>
Date: Thu, 21 Oct 2021 12:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021063414.23663-5-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_034444_092277_DC919E2C 
X-CRM114-Status: GOOD (  19.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/10/21 08:34, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Set rdma compression reg in each frame
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c | 10 ++++++----
>   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c |  2 +-
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> index 12d6c88c68d2..dc0d1b3ff218 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> @@ -178,15 +178,17 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
>   			/* Setup Compression Control */
>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
>   				     rdma->comp_ctrl, write_mask);
> -		}
> -
> -		if (mdp_cfg->rdma_support_afbc &&
> -		    (MDP_COLOR_IS_COMPRESS(colorformat))) {
> +		} else if (mdp_cfg->rdma_support_afbc &&
> +			   (MDP_COLOR_IS_COMPRESS(colorformat))) {

Looks like you're unconditionally writing to the compression control register,

so you can just...

>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
>   				     ((width + 31) >> 5) << 5, 0x001FFFFF);
>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
>   				     ((height + 7) >> 3) << 3, 0x001FFFFF);
>   
		}
		/* Setup Compression Control */

		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,

			     rdma->comp_ctrl, write_mask);	

... and avoid repeating the same thing over and over in all of the conditionals.

> +			/* Setup Compression Control */
> +			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
> +				     rdma->comp_ctrl, write_mask);
> +		} else {
>   			/* Setup Compression Control */
>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
>   				     rdma->comp_ctrl, write_mask);
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> index 875326afb686..1a15490d45e7 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> @@ -34,7 +34,7 @@ static const struct mdp_platform_config mt8195_plat_cfg = {
>   	.rdma_support_afbc              = true,
>   	.rdma_esl_setting               = true,
>   	.rdma_rsz1_sram_sharing         = false,
> -	.rdma_upsample_repeat_only      = true,
> +	.rdma_upsample_repeat_only      = false,
>   	.rsz_disable_dcm_small_sample   = false,
>   	.rsz_etc_control                = true,
>   	.wrot_filter_constraint         = false,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
