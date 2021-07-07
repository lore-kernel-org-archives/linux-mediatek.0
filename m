Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A505C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541A661C7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541A661C7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FM2hXIS3uoLyiXjJJHOjZu2TDyflS4TeoaaMm4uZOs=; b=cP2VVabxED0LDJ
	pR3rdKdqtlQZ7xm8Gr+gJ8HG+nAlWhGFlGypHkKbr0YUN729tWjrUZ7qiljtS69/URd/SU6rwEsAa
	TjfQNAb3/sqaCqEqbEzk0H8hkKcbRn7pUC8cgNsgdSPCNTwrSMnmhCBPjjWxGtSvalyW0uZp2xIuR
	jOBZnX72MTMIdHyt9mcjgIFNgO/kEjg0zTgEUewEKsmf6qaO1s8vtfwUFpPrPGafZWtQh5A0iz20Y
	QNun9ZmRb2LlHdGkgl1ZCkazrjHtEa9f94jAXN2a2B/ibIhLi5iTgRZqiCmyc+gLoHGfzYY8oyu3d
	tNrcScivslXKVBA4LYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10eE-00DbEs-GL; Wed, 07 Jul 2021 06:03:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10eA-00DbDK-CI; Wed, 07 Jul 2021 06:02:59 +0000
X-UUID: 5ba7ef37eade40c2b6c9c07044019c88-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=roxq+qPCnYeAs+wUZ6rwarqSFz2T5BT7HNRZdZ00RqA=; 
 b=TYbNabPIT0xM/iiGvfXMQS4vUIwQHbbqEbwEVO/m+WhjSq2vC+rAJTyW7r/mJZ2Bdnh/OpeAes+vqYGbr5GqDh6yzAr6ilET42YSzvfJx+5cYyBWBa7yMEX2aPsXSyhELic9LNdyb9FUlcEcGn1Rxpf489SFhC9cEndP08qv94E=;
X-UUID: 5ba7ef37eade40c2b6c9c07044019c88-20210706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 86219945; Tue, 06 Jul 2021 23:02:51 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:02:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:02:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:02:47 +0800
Message-ID: <1625637767.7824.23.camel@mtksdaap41>
Subject: Re: [PATCH v1 12/17] drm/mediatek: add CCORR support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 14:02:47 +0800
In-Reply-To: <20210707041249.29816-13-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-13-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_230258_464716_A7116C1B 
X-CRM114-Status: GOOD (  13.93  )
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
> Add CCORR support for MT8195.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 ++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 141cb36b9c07..8188b220cc6d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -208,6 +208,8 @@ static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
>  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt8183-disp-ccorr",
>  	  .data = &mt8183_ccorr_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-ccorr",
> +	  .data = &mt8183_ccorr_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 28bf4a11efb0..058b50d0e64b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -440,6 +440,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_WDMA },
>  	{ .compatible = "mediatek,mt8183-disp-ccorr",
>  	  .data = (void *)MTK_DISP_CCORR },
> +	{ .compatible = "mediatek,mt8195-disp-ccorr",
> +	  .data = (void *)MTK_DISP_CCORR },

The same question as OVL and COLOR.

Regards,
CK

>  	{ .compatible = "mediatek,mt2701-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color",

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
