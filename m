Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9E2C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB216140A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AB216140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePe/0lW80JzmRr8uTm69fj38R8jwrPOhJAF1OiXnAxE=; b=rLMv8iUARhKrBs
	z5GUUPRixwuNz0Pg7b2zA4Dh7MivMUWia5imvY++TMV8dqMheT74oOe1Cttpvt/riujGgzH3u8tpU
	TWMid3zxMyRLWc3zNHu8Ce5Iuv2C8kjOxD/StNwuo0PHtU/EDwbjFVkIcUXALvcGU/qGcsAvyeAaA
	vpMz0gC7tlU3Wdk4qb/CWBHb+RS4AtNgMjhFBigdOMs370cc1rwy7DK8+N2yeX3B25gRytZlHLDPU
	tqS8FJN8D9qpWyT+mWjklptXpCKwWLRBEdMiRqItVEShzjmQcLr3vx3fyPkBxL8YmeUJRLiZ9zi29
	M6ipb//hWQjAiLleP3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFRK5-00FxRD-He; Mon, 16 Aug 2021 01:21:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFRJb-00FxHQ-LX; Mon, 16 Aug 2021 01:21:27 +0000
X-UUID: 9a2c473ec2134826abce5eeb7a699865-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zMgcmilrnOZK5/KKJ2IXdoMtIXHDBZKsjT73O5khxW4=; 
 b=Q7FLlNeq6vWEv6PmGu3iRJL9/MMeaZ2fxCpraMg20ywYiU0NV6XpK1sLVRuit3+lXbubDc7zq6XLffknGZMW2wcazd+Kq71nE8We7mgDmO/JvwAPkTP94QqDtJrfRNF/fIA51FZHb56nb+naOEL/qbJmAQMiuLhMiuuYaU30Kgk=;
X-UUID: 9a2c473ec2134826abce5eeb7a699865-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1765855688; Sun, 15 Aug 2021 18:21:20 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 18:18:20 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 09:18:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:18:15 +0800
Message-ID: <cba6ccf59101225150d0b9f6020753adc22221ed.camel@mediatek.com>
Subject: Re: [PATCH v6 6/9] soc: mediatek: mmsys: instantiate mdp virtual
 device from mmsys
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "wenst@chromium.org" <wenst@chromium.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Mon, 16 Aug 2021 09:18:16 +0800
In-Reply-To: <20210802220943.v6.6.Ie4214d2cc73ab276dd7c41d4f63c98e011fb42d4@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.6.Ie4214d2cc73ab276dd7c41d4f63c98e011fb42d4@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D1B8CF45BE547C01305672B36FAAF841C10023D9984BDBA7059507DD2D056FB62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_182123_735672_259F6428 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon, 2021-08-02 at 20:12 +0800, Eizan Miyamoto wrote:
> A virtual device that is probed by the mtk_mdp_core driver is
> instantiated by the mtk_mmsys driver.
> 
> This better reflects the logical organization of the hardware and
> driver: there are a number of hardware blocks that are used by the
> MDP
> that have no strict hierarchy, and the software driver is responsible
> for driving them properly.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

> (no changes since v1)
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..e681029fe804 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -97,6 +97,7 @@ static int mtk_mmsys_probe(struct platform_device
> *pdev)
>  	struct platform_device *clks;
>  	struct platform_device *drm;
>  	struct mtk_mmsys *mmsys;
> +	struct platform_device *mdp;
>  	int ret;
>  
>  	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
> @@ -122,10 +123,27 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  					    PLATFORM_DEVID_AUTO, NULL,
> 0);
>  	if (IS_ERR(drm)) {
>  		platform_device_unregister(clks);
> -		return PTR_ERR(drm);
> +		ret = PTR_ERR(drm);
> +		goto err_drm;
> +	}
> +
> +	mdp = platform_device_register_data(&pdev->dev, "mtk-mdp",
> +					    PLATFORM_DEVID_AUTO, NULL,
> 0);
> +	if (IS_ERR(mdp)) {
> +		ret = PTR_ERR(mdp);
> +		dev_err(dev, "Failed to register mdp: %d\n", ret);
> +		goto err_mdp;
>  	}
>  
>  	return 0;
> +
> +err_mdp:
> +	platform_device_unregister(drm);
> +
> +err_drm:
> +	platform_device_unregister(clks);
> +
> +	return ret;
>  }
>  
>  static const struct of_device_id of_match_mtk_mmsys[] = {
> -- 
> 2.32.0.554.ge1b32706d8-goog
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
