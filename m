Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FABC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bSbfD0vN6/9RBWMd5uLpegXzxhisRl+aGI2mWQ1g1Y=; b=mlGxZnfO5GCiRHCYZvgZ7eIK5p
	eGoqj0eUuXWZIVdjXUJMqz9WrWFd6HhpleeL2xULZ7wn0Pe5gvZqvDIXgLPquBTOZ3dYF75VfOibF
	FpJ7TmjCIFY/WZorlkEKdapEXU3A25xVZrxZp4OyEh19+pckv7XeajaDQYUl9opKjsZ1uiSJJ0Iur
	fSs95bRaW0wKwyq+Vo3gRuDAFIiaOi7qXC+x1vdR+YjTCfkXcSbwTpD1owkMydGN9wUJkhhEDepKG
	z8cGrp0lJ7LSZZnbSj2JJii2Ra1ZZTQtdm1UXi4kXSCVV7m4Kn+Xm+dWxuVhLEi3t8AWRlEDtnwT7
	IfjEkW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZKE-004MRg-Sr; Tue, 21 Jun 2022 08:33:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZKB-004MR3-JX
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 08:33:29 +0000
X-UUID: 4449f5ea0387408a90d8d619910754e3-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:88721069-4a5d-4976-893d-c635e6a436f1,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:55f60d38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4449f5ea0387408a90d8d619910754e3-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1878314335; Tue, 21 Jun 2022 01:33:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 01:26:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Jun 2022 16:26:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 16:26:35 +0800
Message-ID: <1b58a827f2b7a4798091c785a845465ed18e331a.camel@mediatek.com>
Subject: Re: [PATCH] PM / devfreq: mediatek: Fix unnecessary check of drvdata
From: Johnson Wang <johnson.wang@mediatek.com>
To: <matthias.bgg@kernel.org>, <dan.carpenter@oracle.com>
CC: <linux-pm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
Date: Tue, 21 Jun 2022 16:26:35 +0800
In-Reply-To: <20220620154347.14756-1-matthias.bgg@kernel.org>
References: <20220620154347.14756-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_013327_695558_C5E86A69 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, 2022-06-20 at 17:43 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Probe function will error out if drvdata 'mtk_ccifreq_drv' is null.
> So when mtk_ccifreq_target get's called, the drv pointer will never
> be
> NULL. This fixes a static checker warning.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/devfreq/mtk-cci-devfreq.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-
> cci-devfreq.c
> index 71abb3fbd042..ad05b152071d 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -132,9 +132,6 @@ static int mtk_ccifreq_target(struct device *dev,
> unsigned long *freq,
>  	unsigned long opp_rate;
>  	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
>  
> -	if (!drv)
> -		return -EINVAL;
> -
>  	if (drv->pre_freq == *freq)
>  		return 0;
>  

Hi Matthias,

Thank you for improving this driver.
I've tested this patch on the MT8183 and MT8186 platforms.

Tested-by: Johnson Wang <johnson.wang@mediatek.com>

BRs,
Johnson Wang


