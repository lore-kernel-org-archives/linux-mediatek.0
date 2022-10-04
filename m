Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91787C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/p2RgiEeNYzdFVMuGHIRymiP+okodEm7ce8FkPN/fM=; b=kfGDwv2IcjDGyH8pU97gIUlwS2
	zlV7SM5rWaWqPiHMJDSihenlbWpYAlLmgV1Jy0Mfea4WI4mxSfih76azBjyeN45YPst0fM2iDTT9d
	KpJMzoNuJJB7EW13C4bLbNEETrUlc4G5z4ljZrHtZPoSaFEaFcGnHKFZus3gWJrB6HSkyw7pfrsJB
	CZYBfMDxtjrQdXidUscGqjzjZ3YPC0xVaedAiirgtLsPMDzJ56LgKR5zHfnoYQUC4xFk4RkGKakSG
	a0mjqNzY3CujkxZ/dgfy98+rHPGUTURnMLW38+717VmX0NBh8omfHxZIgoPYa1H9GXYFCxwqUXtuY
	2Pr7MVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1off46-009LUG-VS; Tue, 04 Oct 2022 10:22:18 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1off3w-009LQv-26; Tue, 04 Oct 2022 10:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664878927; x=1696414927;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tYiX0livaZV54Tpug1MQVrKJH6mQ7IQHkmnz80pYNMc=;
  b=byhlVbwm5/inJ6r9SaNghyx1SGXJET5zISNRwPYYBvc1FGa0ao+ouSyV
   lxKObIAGJ53WlMMYn0unUAkYi2ff2TFZQ5+TJHtFwV6DcJq6KYrrfIRCg
   tITLIrJMYkqEJ6LgPodi/ib+FfmvZEUOsSki+GT8dDftECHhOy7+XTc0m
   YcOJBjiDGtlCczusohJ1y92tJ92wKRzJblexf8aPvHejZiUaFPvYMcI0i
   KRX5IajSWN2zltAgqhWshB3ZHa070wakKIApyDjsOtxzeFfB+lFn66Zt6
   DKh6Nz8KwHsbei3OlUKe4I3FKWvt0btsh5Yd3ncW4HAi/0ayMaalPNF8H
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="389167471"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="389167471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 03:22:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="657081017"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="657081017"
Received: from kmreisi-mobl.ger.corp.intel.com ([10.252.39.196])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 03:21:55 -0700
Date: Tue, 4 Oct 2022 13:21:52 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Irui Wang <irui.wang@mediatek.com>
cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, 
    Rob Herring <robh+dt@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Tzung-Bi Shih <tzungbi@chromium.org>, 
    angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com, 
    Tiffany Lin <tiffany.lin@mediatek.com>, 
    Yunfei Dong <yunfei.dong@mediatek.com>, 
    Maoguang Meng <maoguang.meng@mediatek.com>, 
    Longfei Wang <longfei.wang@mediatek.com>, 
    Project_Global_Chrome_Upstream_Group@mediatek.com, 
    linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6, 6/8] media: mediatek: vcodec: Refactor encoder clock
 on/off function
In-Reply-To: <20221001031737.18266-7-irui.wang@mediatek.com>
Message-ID: <3645b24f-436e-d6a5-27cd-287712eab22@linux.intel.com>
References: <20221001031737.18266-1-irui.wang@mediatek.com> <20221001031737.18266-7-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_032208_120923_4730D02C 
X-CRM114-Status: GOOD (  18.87  )
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

On Sat, 1 Oct 2022, Irui Wang wrote:

> when enable multi-core encoding, encoder cores use their own clock,
> refactor clock management functions with used encoder hardware id.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 89 ++++++++++++++++---
>  .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  6 +-
>  .../platform/mediatek/vcodec/venc_drv_if.c    |  4 +-
>  3 files changed, 84 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
> index 213c3f50e9eb..2f83aade779a 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
> @@ -60,7 +60,9 @@ EXPORT_SYMBOL_GPL(mtk_vcodec_init_enc_clk);
>  static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
>  {
>  	struct mtk_venc_hw_dev *sub_core;
> +	struct mtk_vcodec_clk *clk;
>  	int ret, i;
> +	int j = 0;
>  
>  	/* multi-core encoding need power on all available cores */
>  	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
> @@ -73,12 +75,27 @@ static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
>  			mtk_v4l2_err("power on sub_core[%d] fail %d", i, ret);
>  			goto pm_on_fail;
>  		}
> +
> +		clk = &sub_core->pm.venc_clk;
> +		for (j = 0; j < clk->clk_num; j++) {
> +			ret = clk_prepare(clk->clk_info[j].vcodec_clk);
> +			if (ret) {
> +				mtk_v4l2_err("prepare clk [%s] fail %d",
> +					     clk->clk_info[j].clk_name, ret);
> +				goto pm_on_fail;
> +			}
> +		}
>  	}
>  	return ret;
>  
>  pm_on_fail:
>  	for (i -= 1; i >= 0; i--) {
>  		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
> +
> +		clk = &sub_core->pm.venc_clk;
> +		for (j -= 1; j >= 0; j--)
> +			clk_unprepare(clk->clk_info[j].vcodec_clk);
> +
>  		pm_runtime_put_sync(&sub_core->plat_dev->dev);

There's more than one thing wrong here.

pm_runtime_put_sync() won't be called for the ith entry when the later 
goto pm_on_fail is taken because the loop decrements i right at the 
start.

Similarly, i and j will mismatch for the ith entry because i was 
decremented.

Third, j does not start from clk->clk_num - 1 for the other entries 
(for those lower "i"s).


-- 
 i.


