Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E471C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 04:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvE5AsdEpX/Ru+fLUABeXhkSvQfn5RshCzfGY1aFQKc=; b=UYo6p4lCL4FrVA
	oCuhwaxDQEXwNZIC9q0qhCY8DYkLhd9ZYVZ8OlvPcj+zEzJ/2VIqE9qzREjos7h8UKFyUJ7CDPjHJ
	ZSEzJHzXYP2canFgr1A+3WmpRUF7SGdU9rDIt54EW+UhyvkKyOt9cmMUdhETg1BDDkEGJQEDS6IwR
	96tlQbDtYDGJj2veamccbY3aRjDifcM95cf05fQLugB6mlGFKn5ZllwLaDoVmC7eakkOehuJz0QIH
	VeA4Yncu8ni/dRO0dVF5zKFIfGrK7PaCkjx23yF6IEVEPSfqJcKKNxDGuenTAqXvAHlx1RwxsYX9t
	cREQI+90GrIXyjvaex7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrBWJ-00H9up-MM; Wed, 18 May 2022 04:42:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrBW6-00H9qM-DP; Wed, 18 May 2022 04:42:35 +0000
X-UUID: 5909fc6acbe44829b42279ad6834eabd-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6c5a1797-54bb-4e8f-964e-76243011b110, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:8704a679-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 5909fc6acbe44829b42279ad6834eabd-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 681397605; Tue, 17 May 2022 21:42:26 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 21:34:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 12:34:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 12:34:32 +0800
Message-ID: <9cd199a765dc760c13bfec87ea1e3f2c0341a472.camel@mediatek.com>
Subject: Re: [PATCH v6 4/4] drm/mediatek: Add MT8186 DSI compatible for
 mtk_drm_drv.c
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <airlied@linux.ie>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 May 2022 12:34:33 +0800
In-Reply-To: <20220504091923.2219-5-rex-bc.chen@mediatek.com>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-5-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_214234_484803_9E16CDC2 
X-CRM114-Status: GOOD (  14.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Rex:

On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> The compatible "mediatek,mt8186-dsi" is used by MT8186 DSI, so
> add it to mtk_ddp_comp_dt_ids in mtk_drm_drv.c.

Reviewed-by: CK Hu <ck.hu@mediatek.com>


> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 6abe6bcacbdc..0104283767ad 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -544,6 +544,8 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8183-dsi",
>  	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8186-dsi",
> +	  .data = (void *)MTK_DSI },
>  	{ }
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
