Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yo8L+8kj1dz3OjZJNqyceUjFSw0l0F4OgEEay/bdhOs=; b=iC+tVELspFuhik
	kMtCIxu+MhxJ6VmocZ646dVXsujPQcZI/v0IIbOZI7xEyCBiXdUyhRSqUBS3X7gumuiiInRjQMj3K
	CUTilz+mrePMX90m4qCFRU+wR0wEIawkhm72dfxmVeuGkC81Pz0sVjRfT2MhZDxt1tKx30V1FoK87
	BA3EZ/yXuFOxNGK/btIBxv7N36nweahlUtpOg+ZZdGp5SFaSDsX6ApBjDScVaL5lpGI5E4WlIhGlH
	sdAiYtLgEDGK7HR+X3vz8+JosVIcBCHLz9moNwbYhwZeh36orG58w4PhSU1MdV/qgrBdLJ3DpeMvR
	ujsRbeEoxo4NJKmTF4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCK8H-007fQB-IS; Tue, 25 Jan 2022 11:37:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCK7v-007fJF-LF; Tue, 25 Jan 2022 11:36:45 +0000
X-UUID: 6e3d9d0f317840cea1d8391c576b2a7c-20220125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MKMpLDdsBazv5mIzwHy2TvaHwqIJV5wVGWDErQ3sOkk=; 
 b=dp4SqNdf2qCqLVC9Cf/odIFtALKcAgqMBmLw7nCb6PPq7FJjBBNMEZ/caxJDPZcyxvxFo5ZFn/pndxLPoO7Bkp56bB1rDeKucXPiXwdgh/UnjGWOT2FVZtNv7DyZKwABTkZx7oGpbq6RGbji/YbQCaGcEtupHOf7qw0dkX1KnVs=;
X-UUID: 6e3d9d0f317840cea1d8391c576b2a7c-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1960271143; Tue, 25 Jan 2022 04:36:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 03:27:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 19:27:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 19:27:44 +0800
Message-ID: <1d9b53a22e307ca90cafbd6fe08fbae3c4c58531.camel@mediatek.com>
Subject: Re: [v2 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8186
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
 <yuhan.wei@mediatek.com>, <ryan-jh.yu@mediatek.com>
Date: Tue, 25 Jan 2022 19:27:44 +0800
In-Reply-To: <20220125110413.18988-3-kewei.xu@mediatek.com>
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
 <20220125110413.18988-3-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_033643_729063_D2E4FF06 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue, 2022-01-25 at 19:04 +0800, Kewei Xu wrote:
> Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
> MT8186 doesn't need handshake signal witch apdma.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c
> b/drivers/i2c/busses/i2c-mt65xx.c
> index 9ea427f53083..aa4d21838e14 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -397,6 +397,19 @@ static const struct mtk_i2c_compatible
> mt8183_compat = {
>  	.max_dma_support = 33,
>  };
>  
> +static const struct mtk_i2c_compatible mt8186_compat = {
> +	.regs = mt_i2c_regs_v2,
> +	.pmic_i2c = 0,
> +	.dcm = 0,
> +	.auto_restart = 1,
> +	.aux_len_reg = 1,
> +	.timing_adjust = 1,
> +	.dma_sync = 0,
> +	.ltiming_adjust = 1,
> +	.apdma_sync = 0,
> +	.max_dma_support = 36,
> +};
> +
>  static const struct mtk_i2c_compatible mt8192_compat = {
>  	.quirks = &mt8183_i2c_quirks,
>  	.regs = mt_i2c_regs_v2,
> @@ -418,6 +431,7 @@ static const struct of_device_id
> mtk_i2c_of_match[] = {
>  	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat
> },
>  	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat
> },
>  	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat
> },
> +	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat
> },
>  	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat
> },
>  	{}
>  };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
