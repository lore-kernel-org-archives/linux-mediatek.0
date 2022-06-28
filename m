Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBCEC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDiG0zOZX3Sizj/ghIU5lNot5zP3U/orBdxlpUlssCU=; b=v99q0DtLqa0BwS4CFrGaRFm3k/
	8z9vKLtUTA0Bzs51KKeFQYk+URd2UDaiiceQQsUVaIW+iP2iijTCK0KrbPuW/+Kh4MU6HA0ZYo7Bj
	jk7P1Zpeyec2YzZILuMaq24BONXsZHcURdL9fLn3iv7gnuoDDtbh+xQuX8Wl460kyVCDsRTtooURi
	m7R/gF2xFXcIDzLdFWx4072PnK7HkECl74oU2T4JmjpVoAk6Bd5j5dJP7UEvBzSqI5H7mY+VyfH+J
	GVRhxUHYm2HH1fDw81ARoHG/Rhf1Iumx7rdXdIedogpVN5ccACdHJelFa2v+fsoXrklj7ika+vwsZ
	d9XLHhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Pq-004asY-1N; Tue, 28 Jun 2022 06:09:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Ee-004VXI-7U; Tue, 28 Jun 2022 05:58:07 +0000
X-UUID: 19d05da1f94a42efbade9c608ba90129-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:888bafa4-0e60-4a9e-8a41-eee558e6c43f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:4c75d262-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 19d05da1f94a42efbade9c608ba90129-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 895758532; Mon, 27 Jun 2022 22:57:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 09:42:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:42:03 +0800
Message-ID: <026149c3a069eaf13f83bb3f57669d6853a4e795.camel@mediatek.com>
Subject: Re: [PATCH v23 09/14] drm/mediatek: add mediatek-drm plane color
 encoding info
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Tue, 28 Jun 2022 09:42:03 +0800
In-Reply-To: <20220620091930.27797-10-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
	 <20220620091930.27797-10-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225804_349116_3698A67F 
X-CRM114-Status: GOOD (  14.45  )
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

Hi, Nancy:

On Mon, 2022-06-20 at 17:19 +0800, Nancy.Lin wrote:
> Add plane color encoding information for color space conversion.
> It's a preparation for adding support for mt8195 ovl_adaptor mdp_rdma
> csc control.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index e5fae4ec2337..39cb9a80d976 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -138,6 +138,7 @@ static void mtk_plane_update_new_state(struct
> drm_plane_state *new_state,
>  	mtk_plane_state->pending.width = drm_rect_width(&new_state-
> >dst);
>  	mtk_plane_state->pending.height = drm_rect_height(&new_state-
> >dst);
>  	mtk_plane_state->pending.rotation = new_state->rotation;
> +	mtk_plane_state->pending.color_encoding = new_state-
> >color_encoding;
>  }
>  
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index d454bece9535..2d5ec66e3df1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -24,6 +24,7 @@ struct mtk_plane_pending_state {
>  	bool				dirty;
>  	bool				async_dirty;
>  	bool				async_config;
> +	enum drm_color_encoding		color_encoding;
>  };
>  
>  struct mtk_plane_state {


