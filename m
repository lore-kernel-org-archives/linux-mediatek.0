Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8276C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0z0crHHMT2rf7RGbtujC157WhK66ylvy7hCVDe/Xcs=; b=NsMNCuHIne4zyU
	EYmYp495PD42vFj+UhN0waKejBdYSPcoGwXgvmOFYKJOlOeUn3VWihvOyB5+bpdcUVbMHmBJnNvLB
	Hw3ZNhCLbdxUzcZgTEYd1LrKu9EqHBxdcPgmprzC3OwSUPlHSYVXYN60TeSpjaFoxLmppuHsJocC+
	cowyT5NadBhiQbCyqfXv/AOI5/bPvxEi3zluAvLNn8TQe3vJRNQiBjhJ8MS7njNRV1LI3SJ+03Z3F
	cNYy5LOOXwKr+2K0h3vC1xW+QH72vs3dgIQRkeQi8gkwvCZay4Knfe5vqA/UWeuCuru2MIS73MQQQ
	5aw2e3KjbTbgZBD5H4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrMW-00EMDP-6W; Wed, 23 Feb 2022 13:07:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMr3V-00EFDh-TT; Wed, 23 Feb 2022 12:47:43 +0000
X-UUID: dd22fa95b6544030b4eb7a5a4c738afc-20220223
X-UUID: dd22fa95b6544030b4eb7a5a4c738afc-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1670194089; Wed, 23 Feb 2022 05:47:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 04:37:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 20:37:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 20:37:34 +0800
Message-ID: <4ed2a3b20a74fe1479d68ae81a8c7fe867f89114.camel@mediatek.com>
Subject: Re: [2/2] mtk-vcodec: Support encoder for MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: kyrie.wu <kyrie.wu@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
 <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Wed, 23 Feb 2022 20:37:35 +0800
In-Reply-To: <1645617086-18841-3-git-send-email-kyrie.wu@mediatek.com>
References: <1645617086-18841-1-git-send-email-kyrie.wu@mediatek.com>
 <1645617086-18841-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_044741_980161_E73C8915 
X-CRM114-Status: GOOD (  15.06  )
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

Hello Kyrie,

Why not just use compatible of mt8183?
The data of 8186 is the same with 8183.

In this case, I think we just need to add dt-binding of 8186 and no
need for this patch.

BRs,
Rex

On Wed, 2022-02-23 at 19:51 +0800, kyrie.wu wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Adds MT8186's compatible "mediatek,mt8186-vcodec-enc".
> Adds MT8186's device private data.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 65207f5b6c1c..e1b91ae9a164 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -437,6 +437,7 @@ static const struct of_device_id
> mtk_vcodec_enc_match[] = {
>  	{.compatible = "mediatek,mt8183-vcodec-enc", .data =
> &mt8183_pdata},
>  	{.compatible = "mediatek,mt8192-vcodec-enc", .data =
> &mt8192_pdata},
>  	{.compatible = "mediatek,mt8195-vcodec-enc", .data =
> &mt8195_pdata},
> +	{.compatible = "mediatek,mt8186-vcodec-enc", .data =
> &mt8183_pdata},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
