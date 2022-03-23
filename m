Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDA6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/7a7iz9AOUpC8t0iMCoYdXALQk/IjqjfbAEx1TJ1gU=; b=TFEhTJ5/UcHJ+1
	wPi/QIWZCr/v60YQWdctVKuQMXhGTpbQn4+Ku4wZtCTpQTPpZG9wzus0QIcRoKbK5iZq4BIORsaXX
	jPTTgiBm5mFzcbJO8/jbgPdVYHKaEDbsPNZ+DSOzosm2LdL96jiIqa04H9bI2G4sp4JsPrrrkLbxR
	A18EOyhyvfCpEDfjczjMBWR+cRk2RabLPvnBx0cWKs3VvCvnApksqb3qjO4hlzz1nzVD0xUhJ6Ch4
	cXw3DfLLwwZbYt9B9Dzb47nAQpHMtb1b9HnYkYvVk5m/Y5SWtu3p7w1TUWG9aXDjSj928aU/fA2Yj
	ikUdhWBG8whSo/KO3deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwtp-00DAge-97; Wed, 23 Mar 2022 09:03:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwtd-00DAee-OL; Wed, 23 Mar 2022 09:03:15 +0000
X-UUID: da27c9f555244ed0b53474308e4d41f5-20220323
X-UUID: da27c9f555244ed0b53474308e4d41f5-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 965572721; Wed, 23 Mar 2022 02:03:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 01:53:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Mar 2022 16:53:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 16:53:36 +0800
Message-ID: <7992e5fcd0ed9fdee60ee9259b3238e33c86e28e.camel@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mmsys: Add sw0_rst_offset for MT8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>
Date: Wed, 23 Mar 2022 16:53:36 +0800
In-Reply-To: <20220322092040.12010-1-angelogioacchino.delregno@collabora.com>
References: <20220322092040.12010-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_020313_803426_0DA96CBB 
X-CRM114-Status: GOOD (  16.28  )
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

On Tue, 2022-03-22 at 10:20 +0100, AngeloGioacchino Del Regno wrote:
> MT8192 has the same sw0 reset offset as MT8183: add the parameter
> to be able to use mmsys as a reset controller for managing at
> least the DSI reset line.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..f69521fabcce 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -70,6 +70,7 @@ static const struct mtk_mmsys_driver_data
> mt8192_mmsys_driver_data = {
>  	.clk_driver = "clk-mt8192-mm",
>  	.routes = mmsys_mt8192_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> +	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =
> {

Hello Angelo,

Thanks for your patch.
But from register map for mmsys, the offset is 0x160 and DSI reset bit
is 15.

datasheet: MT8192 Tablet Application Processor Software Register
Table/4.1 Display Controller.pdf

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
