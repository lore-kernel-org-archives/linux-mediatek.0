Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0EAC43603
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 08:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26AA206DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 08:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ug04WP0g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gDrWFihC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D26AA206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44U9ELDxzfibK/Q6q9sZaCRd7MtOWRPg2NZcCxmadYI=; b=ug04WP0goaVu7z
	MLhndvWVzez8v/ah/HkXpSJju6Le8HAZkbU8B4MvDQsQ1HJQnKJAMwZ/M/zkjxnEO1FOkkAGgGsoX
	wJ7qHeuylFk+afR+4TIVUdzJy1coaXJ4rM1hiybHWlV22rbUpSwYfehY7oI1D1/JfwTLJU3FluhzE
	DU+Lj6xmMUKYKvupACLQQ8iHqLsEshqPGgeSjxTajEFraVzgDUgA4tZomoavwVIiyddOQ6Ljbt50v
	Y728jsKDFE93dVqbxYqNtXoZV7m7TQxxxtsLZegPRhPNVQoQFwqCmhia1uevVfRrlto34MiXPQ7au
	eS7iWCMg6cjZfDTemUpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icmC7-0006K3-B1; Thu, 05 Dec 2019 08:09:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icmBz-00066p-JO; Thu, 05 Dec 2019 08:08:56 +0000
X-UUID: d771b070edb7431d91d19cb4157e1316-20191205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fYO5uWzyAp5Mepj7WHcXlxm3oDWpfSRVYpybAKDaNFk=; 
 b=gDrWFihCU0ORREEkqXp74G5l2/VplD0KdYEuHwJ0q4d1R9I7zgpMoGiEU943orNUrYHoy1WM2oeXme7rm6/La2TDYX2JeDk45oe9SdWSSiJyOMeSzL3eBVbOttAZs3ukAfr9BGFyZ+bKlWK/uO75xB8GqvwfQitJVjdlTQuKbbw=;
X-UUID: d771b070edb7431d91d19cb4157e1316-20191205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1660406374; Thu, 05 Dec 2019 00:08:52 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 00:09:38 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 16:08:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 16:08:12 +0800
Message-ID: <1575533323.11236.5.camel@mtksdaap41>
Subject: Re: [PATCH v2] drm/mediatek: add ctm property support
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Thu, 5 Dec 2019 16:08:43 +0800
In-Reply-To: <1575277423-31182-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1575277423-31182-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AE4A3690827D802DD0F66D5D9CC38B9F4D54BDD034A40FED4BC1007954A2A5DE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_000855_643267_6DCC33C7 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

On Mon, 2019-12-02 at 17:03 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> add ctm property support
> 
> Change-Id: I8111da7b309b1809c6302e7748dd9fd06dc97bde
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 ++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 61 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 11 ++++++
>  3 files changed, 84 insertions(+), 3 deletions(-)
> 

[snip]


> @@ -870,6 +875,12 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		}
>  
>  		mtk_crtc->ddp_comp[i] = comp;
> +
> +		if (comp_id == DDP_COMPONENT_CCORR)
> +			has_ctm = true;
> +
> +		if (comp_id == DDP_COMPONENT_GAMMA)

Not only DDP_COMPONENT_GAMMA has gamma function, but also
DDP_COMPONENT_AAL0 and DDP_COMPONENT_AAL1. I think it's no good to use
comp_id to decide what function of this component has. The easy way is
just to check weather the function point exist.

Regards,
CK

> +			gamma_lut_size = MTK_LUT_SIZE;
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> @@ -891,7 +902,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	if (ret < 0)
>  		return ret;
>  	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
>  	priv->num_pipes++;
>  #ifdef CONFIG_MTK_CMDQ
>  	mtk_crtc->cmdq_client =

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
