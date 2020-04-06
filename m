Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341F6C2BA17
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 15:25:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040212336E
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 15:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="klg6cBOf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 040212336E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+K5Nb6fyjgiegN+cHOu1t4kK1u89hLZA4L/JwgOUlk=; b=klg6cBOfDvd/Rx
	LNNwCVJmCL2BUiVeLxjst1eQ/TmKhQKkcn+VlzASjGYT6UbnqUKGAgDP4+kSXoHNMJe905dWVAvO2
	L56PIElkpLiy44S68Z/vo1puFJEx8FY6sr7590gDl1nTe/RcQH36/bGtvJB2UiHoYuQN2j6tiqH2a
	VjIHrdpCCuDs/InBlmStewIuFdb4kmbCO/hAGawq2kiF+OX06C7W7NgK5pkFE4U9fxWkTe01qIpHj
	bF4TgQGhPBxNOgwxaP4mM8IOQOJgQjWnEmkVFPXrTBNxobzpPZvCf4711C57foUUGIDzTA0Xokn30
	0qlhb5krOR3fHsYlr/Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLTci-00041m-K0; Mon, 06 Apr 2020 15:25:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLTcZ-0002Fl-O3; Mon, 06 Apr 2020 15:25:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 66E2D293F03
Subject: Re: [PATCH] drm: mediatek: fix device passed to cmdq
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200406051131.225748-1-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <095576cb-7124-9b23-fe24-7a91cce57d99@collabora.com>
Date: Mon, 6 Apr 2020 17:25:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406051131.225748-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_082507_935911_5F0E2495 
X-CRM114-Status: GOOD (  16.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi

Thanks for sending the patch upstream

On 6/4/20 7:11, Hsin-Yi Wang wrote:
> drm device is now probed from mmsys. We need to use mmsys device to get gce
> nodes. Fix following errors:
> 
> [    0.740068] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
> [    0.748721] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
> ...
> [    2.659645] mediatek-drm mediatek-drm.1.auto: failed to request channel
> [    2.666270] mediatek-drm mediatek-drm.1.auto: failed to request channel
> 
> Fixes: 1d367541aded ("soc / drm: mediatek: Fix mediatek-drm device probing")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Right, the mmsys device is now the parent of the drm device.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Also I tested drm with the patch applied and adding the gce client register to
my device-tree.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
 Enric

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 6 ++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 615a54e60fe2..8621f0289399 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -822,14 +822,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  	mtk_crtc->cmdq_client =
> -			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
> +			cmdq_mbox_create(mtk_crtc->mmsys_dev,
> +					 drm_crtc_index(&mtk_crtc->base),
>  					 2000);
>  	if (IS_ERR(mtk_crtc->cmdq_client)) {
>  		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
>  			drm_crtc_index(&mtk_crtc->base));
>  		mtk_crtc->cmdq_client = NULL;
>  	}
> -	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
> +	ret = of_property_read_u32_index(mtk_crtc->mmsys_dev->of_node,
> +					 "mediatek,gce-events",
>  					 drm_crtc_index(&mtk_crtc->base),
>  					 &mtk_crtc->cmdq_event);
>  	if (ret)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index e2bb0d19ef99..dc78e86bccc0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -517,7 +517,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  				goto err_node;
>  			}
>  
> -			ret = mtk_ddp_comp_init(dev, node, comp, comp_id, NULL);
> +			ret = mtk_ddp_comp_init(dev->parent, node, comp,
> +						comp_id, NULL);
>  			if (ret) {
>  				of_node_put(node);
>  				goto err_node;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
