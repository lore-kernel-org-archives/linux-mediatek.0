Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE11BC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9157F61C99
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9157F61C99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3dZzsYckjlgwI351mpPE55m5cSrdAgZ+5mN28Flkwo=; b=qM9lPJZY2PRSZf
	RPbCViSgFBxg7AjDY4bHWDnzJhpa0sp9iTfazVz5XgtG8jngaFKglMbtp4lhlTTq871XqzTFK+kYb
	Zhx7Nzu99nG83gq8Sg8Qc4sJIy815fpLKw1qf3qASYdyB/18+SHkn3IPV4pKo511cF2J3fY4N1uAh
	t/Vt7zMghsA4KH0TBnzq5AfrTxyHJz9pnjL07bAdWnqezntOXKttaK+HVeuO4IcsCID4aZ9/nTK4Y
	dWD6e+8JZ/5+fBeJtzvKXLP1gmz5tL2ZyrSxXah3TB1+XuAKQx6KaXmM67D6CwZlf5D7Lxu77ef5V
	7/LwXnsIVASd3XEqVUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ziW-00DU6i-Ac; Wed, 07 Jul 2021 05:03:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ziT-00DU5s-J1; Wed, 07 Jul 2021 05:03:23 +0000
X-UUID: 40a02bdef21440a7b19bee0e3010e9eb-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BIUGJ62UY4PNNnxOEK/7j6ml+pB3mUf4ELdWPAr52iE=; 
 b=WSpkIb4zqlszE7sWrMuiDYkVtMF4myREMNZK8wI3yRbu1+bRRswk2uFe5QDYbiYdXRLPgiaxHFjLUGWH0V3HHXbM8C6qw0MCcDomJOiD4L9nZuoDhDWTyv4OFXS4raQUHqBuIi+uQvXB9bp91NjBNfno0z6So0wVH5F12fFxiiE=;
X-UUID: 40a02bdef21440a7b19bee0e3010e9eb-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 862676770; Tue, 06 Jul 2021 22:03:20 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 22:03:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 13:03:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 13:03:16 +0800
Message-ID: <1625634196.7824.13.camel@mtksdaap41>
Subject: Re: [PATCH v1 07/17] drm/mediatek: add OVL support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 13:03:16 +0800
In-Reply-To: <20210707041249.29816-8-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-8-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_220321_675844_F20E20AA 
X-CRM114-Status: GOOD (  16.14  )
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

Hi, Jason:

On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> Add OVL support for MT8195.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 9 +++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 961f87f8d4d1..99c39487026d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -455,6 +455,13 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
>  	.fmt_rgb565_is_0 = true,
>  };
>  
> +static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +};

mt8195_ovl_driver_data is identical to mt8183_ovl_driver_data, so remove
mt8195_ovl_driver_data and use mt8183_ovl_driver_data.

> +
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-ovl",
>  	  .data = &mt2701_ovl_driver_data},
> @@ -464,6 +471,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>  	  .data = &mt8183_ovl_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>  	  .data = &mt8183_ovl_2l_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-ovl",
> +	  .data = &mt8195_ovl_driver_data},

One question, is mediatek,mt8195-disp-ovl identical to
mediatek,mt8183-disp-ovl in hardware function? If so, use the compatible
as

compatible = "mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl";

And driver just keep "mediatek,mt8183-disp-ovl" and remove
"mediatek,mt8195-disp-ovl".

If the hardware function has some different, just forget this.

Regards,
CK

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5b7ead493487..65038d5b19cb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -424,6 +424,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8183-disp-ovl",
>  	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8195-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>  	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt2701-disp-rdma",

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
