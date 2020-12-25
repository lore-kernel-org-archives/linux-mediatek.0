Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACCBC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 03:06:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479EF22D57
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 03:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479EF22D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mI3TCSPu8550iv+7+Mr9SCeMgFhKGdz3iZrKm8iQVrw=; b=cteZAtUIW6p1wPDxqSnPXtpmw
	GH+Kpmc6OORG3I7CXhfbUJTdwro8CH18G/pPOeqpakCSkH7lfJXhmFd+bPApf81j8xXyvVrao4K4A
	3Z5esls/UtoYFsd/u7BjEXkhyQX1+Ll9zJwS2PL3GN9vHhmCaA1kqhQKdPaPal67a9KCzz/Npjl5y
	CHbAyPKqijQuFncoCHVF1Uu/gA+vVKkQ34fi0wqFmLgn6VKT8Z2BFpqUF5QzV6LNBz34LpBfI0oBP
	CA1fbNr8oZyXPwnZ3N2iwMeDBtNIe4cmymvsMbNzTMSxS58g9z4XJHbQfkZxiKERje46zw5owFLZi
	K8dQzxvNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksdQj-0004At-UH; Fri, 25 Dec 2020 03:06:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksdQf-0004AM-Tk
 for linux-mediatek@lists.infradead.org; Fri, 25 Dec 2020 03:06:11 +0000
X-UUID: b40c5950a5e24eddaf90a4667b9b93ae-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e6d/ZDiJzN/PkyONx34VeYu401D2YFYejNJdKEUj+M8=; 
 b=rGV4kVVbuRihJ66sD7/ZRky2URSc0stGY+sBnXmscc150r6Eib1miZHR853pk+gWHP1rAC/ApB8fDqvBwr733xsLhuvBKwvyBcs7HDefVkd2Kwxg7UHpTtBHUgAnildg9IUQUo1gWbaSQxjCD/DC9LHEV3ZpQG6/xNNgWNUN6SU=;
X-UUID: b40c5950a5e24eddaf90a4667b9b93ae-20201224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 781221825; Thu, 24 Dec 2020 18:55:46 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 18:55:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 10:55:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 10:55:44 +0800
Message-ID: <1608864944.19292.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq
 trigger type
From: CK Hu <ck.hu@mediatek.com>
To: Huijuan Xie <huijuan.xie@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 25 Dec 2020 10:55:44 +0800
In-Reply-To: <1608803643-7351-1-git-send-email-huijuan.xie@mediatek.com>
References: <1608803643-7351-1-git-send-email-huijuan.xie@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_220610_156353_BA4487A2 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Chun-Kuang, Philipp:


This mail has been sent to dri devel and linux mediatek, but why it does
not exist in mail lists?

Regards,
CK


On Thu, 2020-12-24 at 17:54 +0800, Huijuan Xie wrote:
> The interrupt trigger is already set by OF. When do devm_request_irq()
> in driver, please use IRQF_TRIGGER_NONE and don't specify trigger type
> again.
> 
> Signed-off-by: Huijuan Xie <huijuan.xie@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4a188a9..1d62489 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1128,9 +1128,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  		goto err_unregister_host;
>  	}
>  
> -	irq_set_status_flags(irq_num, IRQ_TYPE_LEVEL_LOW);
>  	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
> -			       IRQF_TRIGGER_LOW, dev_name(&pdev->dev), dsi);
> +			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request mediatek dsi irq\n");
>  		goto err_unregister_host;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
