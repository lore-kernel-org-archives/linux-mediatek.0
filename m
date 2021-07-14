Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545EAC07E9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:33:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A3F2613AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A3F2613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOB5A+q8O/hZN5RSMhsf9oF24ISKiuJD/p5EyP7191g=; b=m2iZGYIEMKHcTHat/jsjanenv2
	reBHQLmmIFNG+FSMmj462erLu7kMamjocFpvKK6ydQgMUo2XLnKzLRtpGESHLIeBd9XpMMqE7Fcay
	IdFUN81AEYogHo3Z8q/lqoSoemkECuVPPfs5sqdPlbW2/CeG1LJmMDD53i1rrInIzBGs4h97Fc7jH
	RM+0+IFhezf5Irh/wX2WmRH1+I83njL6T/0rA2U/2aiZIeCQIiYE1k91xPEiQQN9mD08BzkIzkukb
	Yc6CgwC7kzMAgsZKaYTKIPZgYOsgEEE5noYXP1hVsqmNsFPpSwpD41TAso7ljqS34sfAUGplG03xX
	ISm0rzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3aKx-00Chjk-Be; Wed, 14 Jul 2021 08:33:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3aJe-00Ch03-7V; Wed, 14 Jul 2021 08:32:27 +0000
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 70D611F42AB2;
 Wed, 14 Jul 2021 09:32:11 +0100 (BST)
Subject: Re: [PATCH v6 09/11] memory: mtk-smi: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-10-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e6e6c16d-0415-12ad-e74d-d1faf5fb3aaf@collabora.com>
Date: Wed, 14 Jul 2021 10:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-10-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_013226_511645_C0E9484B 
X-CRM114-Status: GOOD (  22.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14.07.21 04:56, Yong Wu wrote:
> After adding device_link between the iommu consumer and smi-larb,
> the pm_runtime_get(_sync) of smi-larb and smi-common will be called
> automatically. we can get rid of mtk_smi_larb_get/put.
> 
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/memory/mtk-smi.c   | 14 --------------
>   include/soc/mediatek/smi.h | 20 --------------------
>   2 files changed, 34 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index c5fb51f73b34..7c61c924e220 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -134,20 +134,6 @@ static void mtk_smi_clk_disable(const struct mtk_smi *smi)
>   	clk_disable_unprepare(smi->clk_apb);
>   }
>   
> -int mtk_smi_larb_get(struct device *larbdev)
> -{
> -	int ret = pm_runtime_resume_and_get(larbdev);
> -
> -	return (ret < 0) ? ret : 0;
> -}
> -EXPORT_SYMBOL_GPL(mtk_smi_larb_get);
> -
> -void mtk_smi_larb_put(struct device *larbdev)
> -{
> -	pm_runtime_put_sync(larbdev);
> -}
> -EXPORT_SYMBOL_GPL(mtk_smi_larb_put);
> -
>   static int
>   mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
>   {
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 15e3397cec58..11f7d6b59642 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -19,26 +19,6 @@ struct mtk_smi_larb_iommu {
>   	unsigned char  bank[32];
>   };
>   
> -/*
> - * mtk_smi_larb_get: Enable the power domain and clocks for this local arbiter.
> - *                   It also initialize some basic setting(like iommu).
> - * mtk_smi_larb_put: Disable the power domain and clocks for this local arbiter.
> - * Both should be called in non-atomic context.
> - *
> - * Returns 0 if successful, negative on failure.
> - */
> -int mtk_smi_larb_get(struct device *larbdev);
> -void mtk_smi_larb_put(struct device *larbdev);
> -
> -#else
> -
> -static inline int mtk_smi_larb_get(struct device *larbdev)
> -{
> -	return 0;
> -}
> -
> -static inline void mtk_smi_larb_put(struct device *larbdev) { }
> -
>   #endif
>   
>   #endif
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
