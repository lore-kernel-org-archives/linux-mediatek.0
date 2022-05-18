Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FA8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 03:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3D/C2gYhpTlUex0xXUgKaELdDzyIEb+kVIjiOdrAVqc=; b=mArjMDJgdWxPqw
	1tiYyZ4Sh7TJWjdF7o5ZancIFy1MkEP4B8tZxg44uwibV/QLhEEIsZZQQvJURrmMzTFBYCisAfOEz
	q8NYrALQXgsrc9AP97VBqKcvgZzILzkw/C/+0yopHLqX7EbvY4IrMe+6nmROO5vPFqxrtHpHGh7/r
	Jb4JQ6BLe1GbuCYR/pR9NNU/0Eseatx6cvLCL+QQvjB6AtZAWNckMphysEV/6xVBqu/WjZlZs8pwd
	YLA74BWfNeYiUKcIJCae8rNa3qnWCga+JoyzSuBf9vCr+cX8R34SMpxC8x4RETV9hPeKFY0mer2mz
	TyCf2cXYOLg652L+hzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrAM8-00Gu6c-Uq; Wed, 18 May 2022 03:28:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrALx-00Gu3l-84; Wed, 18 May 2022 03:28:03 +0000
X-UUID: 81eff07d6a934069b22d3423c66b6742-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:cb050e33-a06c-48ae-a377-e41ba2bcd628, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:bb4da379-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 81eff07d6a934069b22d3423c66b6742-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1941344716; Tue, 17 May 2022 20:27:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 20:27:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 11:27:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 18 May 2022 11:27:49 +0800
Message-ID: <d006d5883b7053d7d4269582dfe3c597a81fdc20.camel@mediatek.com>
Subject: Re: [PATCH v6,1/4] drm/mediatek: Modify dsi funcs to atomic operations
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 May 2022 11:27:49 +0800
In-Reply-To: <1652337012-9053-2-git-send-email-xinlei.lee@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
 <1652337012-9053-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_202801_320752_11BD51B8 
X-CRM114-Status: GOOD (  15.29  )
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

Hi, Xinlei:

On Thu, 2022-05-12 at 14:30 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Because .enable & .disable are deprecated.
> Use .atomic_enable & .atomic_disable instead.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bd3f5b485085..f880136cec09 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -763,14 +763,16 @@ static void mtk_dsi_bridge_mode_set(struct
> drm_bridge *bridge,
>  	drm_display_mode_to_videomode(adjusted, &dsi->vm);
>  }
>  
> -static void mtk_dsi_bridge_disable(struct drm_bridge *bridge)
> +static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state
> *old_bridge_state)
>  {
>  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>  
>  	mtk_output_dsi_disable(dsi);
>  }
>  
> -static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
> +static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state
> *old_bridge_state)
>  {
>  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>  
> @@ -779,8 +781,8 @@ static void mtk_dsi_bridge_enable(struct
> drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
> -	.disable = mtk_dsi_bridge_disable,
> -	.enable = mtk_dsi_bridge_enable,
> +	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> +	.atomic_enable = mtk_dsi_bridge_atomic_enable,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
