Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8429FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZJ1Jf5CJYudEqktC/rZ0QlCbeNZuC3OjEas5B8DeUM=; b=ocd0kDTm+ze7Ot
	9GFqX/RQ2KwslvTJuF0/E5i8IKsImyyUsmfvo8ecI4JNAn3JLcbRqWYGUq0K5Z7zN9PXao9AWTvt9
	mVC96zfcAmiOsf+UbftDTCvrcU3qIEsoNQRo882QQyCBCWJzw3kL0a/jtvNSp5yhIS3j8wrLPyphM
	E2WhDnp8mfysVw6XlKDI+JTuqPqvsIVzjo9qqVW6GW67NyVa1YN+frqe7ojbLSaD7kybC5N/VopBZ
	0YvvAjQv2Y+IFKwc55hHgHPuDaZ0nbUEYntd4vUoEfvjo+Tkg/JbuIPU6mFiWABMlxgm+VAAnWFS/
	tHu+YDXSvGm0GnBw05rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBlv-00CWC6-1A; Tue, 12 Apr 2022 08:21:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBlj-00CW8i-6y; Tue, 12 Apr 2022 08:21:00 +0000
X-UUID: acbed3bb70624f16b9bb25cf9466b23a-20220412
X-UUID: acbed3bb70624f16b9bb25cf9466b23a-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1513364476; Tue, 12 Apr 2022 01:20:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 01:20:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 16:20:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 16:20:51 +0800
Message-ID: <17f8b17fee57115fb885e86a4b9aab4e7ed2df86.camel@mediatek.com>
Subject: Re: [PATCH v4,2/2] drm/mediatek: Add mt8186 dpi compatible to
 mtk_dpi.c
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 12 Apr 2022 16:20:51 +0800
In-Reply-To: <1649645584-13186-3-git-send-email-xinlei.lee@mediatek.com>
References: <1649645584-13186-1-git-send-email-xinlei.lee@mediatek.com>
 <1649645584-13186-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_012059_299786_6C96BF12 
X-CRM114-Status: GOOD (  15.68  )
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

On Mon, 2022-04-11 at 10:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use different .data in mt8186.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4554e2de1430..824d7da41c6a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -815,6 +815,14 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  };
>  
> +static const struct mtk_dpi_conf mt8186_conf = {
> +	.cal_factor =  mt8183_calculate_factor,
> +	.reg_h_fre_con = 0xe0,
> +	.max_clock_khz = 150000,
> +	.output_fmts = mt8183_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +};
> +
>  static const struct mtk_dpi_conf mt8192_conf = {
>  	.cal_factor = mt8183_calculate_factor,
>  	.reg_h_fre_con = 0xe0,
> @@ -942,6 +950,9 @@ static const struct of_device_id mtk_dpi_of_ids[]
> = {
>  	{ .compatible = "mediatek,mt8183-dpi",
>  	  .data = &mt8183_conf,
>  	},
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = &mt8186_conf,

If Nicolas' patch [1] is correct, this should be

.data = &mt8192_conf,

Could you help to comfirm patch [1] is correct or not?

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220408013950.674477-1-nfraprado@collabora.com/

Regards,
CK

> +	},
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = &mt8192_conf,
>  	},


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
