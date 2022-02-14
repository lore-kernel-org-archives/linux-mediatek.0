Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E649C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 03:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKOONd/vlSgKF7uDz5RcTpH+dhPbUSyfcABO22rsBq0=; b=CHX3kxo7VT+LDZ
	DoF5zunYACAOt3G7fYlXR9m/YAkKH7rq4EOrBR4zOGcXZQmiwkYuAOJCXePDs/QKttqmtbmN5qytB
	iclJA+58Nr+Cd3y3vhJHjGOv0Qxbs+0/YqVsR6wPi50EbEUYiCqp/GvhJ8jj9WARViLJBn01yEjeO
	ruV/zPlxWMuNleTYq+Knj5rYk1jQinN72vqPBJZmgPbbUkh4oZ23cRTPNIxeeiPnalT3iUjTX/kwU
	9gwI05aynSshY6zvnjZAsCoJFXtOGSTDc8p5ME24AK5hoC1TCApQjSrIH9VUQlVv98fXH2f3dyVsl
	FFbYtPCBZWI4i2nBqP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJReh-00D4B7-23; Mon, 14 Feb 2022 03:03:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJReS-00D43L-Io; Mon, 14 Feb 2022 03:03:45 +0000
X-UUID: 431efcbd77dc4310b18ca12611ca4993-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=58mIrZSljGSzirTf2GaV2XtTljTDE7r7PLQIgrmZDQw=; 
 b=rpHgwm9ZaoYOxfA0oOYpP1ILI5AI/wCWOXclLINrQvdOFXzNklMuwVxTp0igFwy2v8pRuIVcR2Fb1yIsVLuRe+NvptxkwONfkcP+hzbF6U4am6kZ2M+dbV603m+IoICMdy4OqUfKxeJ6MzaDNcVTzkmBWcWiyt8qgNMptjvgzn0=;
X-UUID: 431efcbd77dc4310b18ca12611ca4993-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 393220279; Sun, 13 Feb 2022 20:03:37 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 19:03:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 11:03:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:03:29 +0800
Message-ID: <77feef2c0b8b5523ef0acc342d394f05f6caabb3.camel@mediatek.com>
Subject: Re: [PATCH v3 3/3] pinctrl: canonical rsel resistance selection
 property
From: Guodong Liu <guodong.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Feb 2022 11:03:29 +0800
In-Reply-To: <8c5cf4b7-dd73-49f6-60dd-b62b3fc3ecdb@collabora.com>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-4-guodong.liu@mediatek.com>
 <8c5cf4b7-dd73-49f6-60dd-b62b3fc3ecdb@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_190344_652883_DB91BBA7 
X-CRM114-Status: GOOD (  15.28  )
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

-----Original Message-----
From: AngeloGioacchino Del Regno <
angelogioacchino.delregno@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>, Linus Walleij <
linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 3/3] pinctrl: canonical rsel resistance
selection property
Date: Thu, 10 Feb 2022 09:50:45 +0100

Il 10/02/22 07:21, Guodong Liu ha scritto:
> Change "mediatek,rsel_resistance_in_si_unit" to "mediatek,rsel-
> resistance-in-si-unit"
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Hello Guodong,
thanks for the patch!

However, you forgot to add the required Fixes tag to this one; this
patch
should be fixing fb34a9ae383a ("pinctrl: mediatek: support rsel
feature").

Please add the required tag.

Thanks,
Angelo

Hi Angelo

We will update it for next version.

Thanks
Guodong
> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index d4e02c5d74a8..38c0f0c4cf95 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -989,7 +989,7 @@ int mtk_paris_pinctrl_probe(struct
> platform_device *pdev,
>   	hw->nbase = hw->soc->nbase_names;
>   
>   	if (of_find_property(hw->dev->of_node,
> -			     "mediatek,rsel_resistance_in_si_unit",
> NULL))
> +			     "mediatek,rsel-resistance-in-si-unit",
> NULL))
>   		hw->rsel_si_unit = true;
>   	else
>   		hw->rsel_si_unit = false;
> 





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
