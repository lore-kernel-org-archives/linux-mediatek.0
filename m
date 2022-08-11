Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3B4C25B0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61XhcT8p7U2ythcRq1ZKIH+rMJLYKYuleNkS3KVnsl4=; b=2aTSJWLyp6pwz8eQjZOPIWSYOH
	ZP/AzZkhjgt4WGN8iGtrxAY/VrPBNdyDlJ8Qba2agv6MRW+VyxylBMFeXSLN7XeybmJCGgL2ZRZw4
	opa0PXval6N6FLRBt12R0mAPe5vQvFEY5/p0BEPQzCy0Sr/CsrLSQLNSzweSN2qdus//VIotDOXov
	F7ug3xEcruFNRzyzA4dMT5cc6EkAQhgzrN+GPyiv4I5qp+uXQre7RkGQneGJAhTi1GtbsvHphL4Sb
	6znyihTyuNYVxVgkH3gT9EEPJHkUKit82NMVi6ZpTJaRAYI/MxIufDLTXMtdEcNGlBQvSrV3z0a+m
	2pHvIzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM36q-00A7xH-VZ; Thu, 11 Aug 2022 08:00:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM36o-00A7o6-5E; Thu, 11 Aug 2022 08:00:03 +0000
X-UUID: 14c9816caf0840efb1b5843e0f0660ab-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:a70ea08d-161b-4dd8-b094-04100654afe2,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:01be5d9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 14c9816caf0840efb1b5843e0f0660ab-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1408251052; Thu, 11 Aug 2022 00:59:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 15:49:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Aug 2022 15:49:13 +0800
Message-ID: <267e2c23f488756ab3256f787750ef4979398279.camel@mediatek.com>
Subject: Re: [PATCH v2] usb: common: usb-conn-gpio: Simplify some error
 message
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 11 Aug 2022 15:49:13 +0800
In-Reply-To: <7505a9dfa1e097070c492d6f6f84afa2a490b040.1659763173.git.christophe.jaillet@wanadoo.fr>
References: <7505a9dfa1e097070c492d6f6f84afa2a490b040.1659763173.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_010002_250226_529A686B 
X-CRM114-Status: GOOD (  20.47  )
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

On Tue, 2022-08-09 at 22:28 +0200, Christophe JAILLET wrote:
> dev_err_probe() already prints the error code in a human readable
> way, so
> there is no need to duplicate it as a numerical value at the end of
> the
> message.
> 
> Fixes: ddaf0d6dc467 ("usb: common: usb-conn-gpio: use dev_err_probe()
> to print log")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Change in v2:
>   * keep the message on the same line of dev_err_probe() because the
> line is
>     still < 100 char   [Chunfeng Yun <chunfeng.yun@mediatek.com>]
> ---
>  drivers/usb/common/usb-conn-gpio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/common/usb-conn-gpio.c
> b/drivers/usb/common/usb-conn-gpio.c
> index b39c9f1c375d..44c5127175b7 100644
> --- a/drivers/usb/common/usb-conn-gpio.c
> +++ b/drivers/usb/common/usb-conn-gpio.c
> @@ -208,10 +208,8 @@ static int usb_conn_probe(struct platform_device
> *pdev)
>  	if (PTR_ERR(info->vbus) == -ENODEV)
>  		info->vbus = NULL;
>  
> -	if (IS_ERR(info->vbus)) {
> -		ret = PTR_ERR(info->vbus);
> -		return dev_err_probe(dev, ret, "failed to get vbus
> :%d\n", ret);
> -	}
> +	if (IS_ERR(info->vbus))
> +		return dev_err_probe(dev, PTR_ERR(info->vbus), "failed
> to get vbus\n");
>  
>  	info->role_sw = usb_role_switch_get(dev);
>  	if (IS_ERR(info->role_sw))
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks



