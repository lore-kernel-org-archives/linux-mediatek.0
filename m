Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1850C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:50:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B15E61363
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B15E61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AgWW+imvz3ORXt/hU12bmHzgn+xkepeI8c52LbjYZPE=; b=ke7ahra78xVTqkiUWq9gQW9m4
	JAM2RsJOFmvjTVVaz8Zj02NSYekDgx6TQLk/FlyabA5Sdp+5jZPtHMgemFLYlFqyztefD8PuKOcrB
	qjcKAjkERvd+gjjrZ3jOQMSXYUnp2qXUb9srVC2E9/sNM7GeTktpUCEcHP9rXsajlfDy3+lgJH5Je
	zZNCBuUbCGhz86evM07zWfrr56/dadWizgjZfebftCDBPAZyxX+1UiRSR2C5R4+XLDhZg5pSEI0sQ
	UmU1hgfCZAmoTGiBsUSdFN2ta5ucrpS6MU8ng/oX80PmLuxqdEV/2sOju9hWiIr+ubO3GYBo9tjty
	OaXU/SCtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSmZ-000HIH-OH; Tue, 11 May 2021 13:50:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSLN-0004ZV-Nm; Tue, 11 May 2021 13:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=8tXI6RaSQWGPiwXos1VnwQTR75yfl3bfpxiP+E9mf3c=; b=kqOMjTcpkECQWfE2o73McpAjSP
 fHZcj7tgA8dUQUng/g32oY29QT0aUsPU/Y5w7fhj9TDEMElNEVIJNp9J5nYHBcXjUa14wRq+oMHLn
 mOxiRiDO5RBDJZp0zU8RF0eZw9wZZktgYTkJD01rFEHxVQTtlXkSs2aaq2k/OhEfCexKDSWuP2Bis
 J0oLO904tFb7p+h7oqaBoWqkizttCKSJU0fjHT/+2CK922owW8l5mS9QUNLa1Cvwu24WVvSJKbVEz
 o0Rgkr+q0VqO/9PMBpzrhY2Ol1Csbo6ORMsx9boO0TI1L17gtib0f+nbDnrtZ1Iw0+TZB5V2rBKxZ
 kf7nBOIA==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSLK-009c4y-KN; Tue, 11 May 2021 13:22:36 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfdmY0ggjzmgDC;
 Tue, 11 May 2021 21:19:09 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 21:22:26 +0800
Subject: Re: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_dsi_probe()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
References: <20210511100001.5047-1-thunder.leizhen@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <a026fc02-7dee-9536-3a17-3ff723d050cf@huawei.com>
Date: Tue, 11 May 2021 21:22:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210511100001.5047-1-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_062234_866186_180408E1 
X-CRM114-Status: GOOD (  18.02  )
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


Hi everybody,
  Please ignore this patch and other "drm/mediatek". Looks like it would be better to combine them into a single patch.


On 2021/5/11 18:00, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ae403c67cbd922d..89e351dfab88177 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1062,7 +1062,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  	dsi->regs = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(dsi->regs)) {
>  		ret = PTR_ERR(dsi->regs);
> -		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
>  		goto err_unregister_host;
>  	}
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
