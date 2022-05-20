Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB62DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 03:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZI3q6IVecf2tOpm7LU8OWLeZf6wkCVzheGxNmLbmLsY=; b=BZBweEx4RgNUKj
	D8uVvWd9YOcg0zi4sp0btBR8L9LTUo0nJbNy+aK/xUcqJFsbuTFcyssY/P6k2ZmSEc3rkTbUiTUCO
	bKZMXWY+o2PasHaLufUMwOhNAdmh5x3TpLMcNW0He3AIXbUPdKdy4nNmbsqBf83/Oaj33qXrDeJQW
	2GPT6weH9alQggCTCWK9fa9Xz0htRc6RMgOjv/I8qFwbNoGP/Nlyl36JeClSaaFf5gQ4MAVKu9Cul
	l1ayw8eEOUPmOjURaUeBBIUZCh6QaOrHZAYV81b5V78Y/QQaSK6ODXrU0PtR8TPeXsKHPiylPHwQB
	PSiHxHe/SG3gnTUhUW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrt8T-00AFjn-8r; Fri, 20 May 2022 03:17:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrt8G-00AFeL-Kt; Fri, 20 May 2022 03:16:53 +0000
X-UUID: 5601203e942040458ff64b40487ed6b6-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1f566995-fbbb-4df7-8061-d5ec3dda89d5, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:14,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:19
X-CID-META: VersionHash:2a19b09, CLOUDID:39d0f179-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 5601203e942040458ff64b40487ed6b6-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 285957398; Thu, 19 May 2022 20:16:43 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 20:16:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 11:16:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 11:16:40 +0800
Message-ID: <a65669e0f66bc61490abcaa733a85cecd40200ce.camel@mediatek.com>
Subject: Re: [PATCH v7,1/4] drm/mediatek: Modify dsi funcs to atomic operations
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Fri, 20 May 2022 11:16:40 +0800
In-Reply-To: <1653012007-11854-2-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_201652_747431_C96E283A 
X-CRM114-Status: GOOD (  14.15  )
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

On Fri, 2022-05-20 at 10:00 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Because .enable & .disable are deprecated.
> Use .atomic_enable & .atomic_disable instead.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
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

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
