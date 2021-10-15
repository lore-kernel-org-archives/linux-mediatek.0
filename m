Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1E2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AC761037
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97AC761037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpNBc0uK+uETG6cDTqcbk5WhEHr5//H8q9k6WcswWLI=; b=UrKUCcwHRgsNiZL8eHYVN3dlpK
	I5CFZQjCSY0TJVrf+dtZtNeG8BD7q3Pz9VSzdJ8eoIQeBdQu326mC6Ax/Wq+FtkiYmQ03L2rJ5xIA
	hMdgn6bASgKaVD5ARLqraEykatKQB+BG8kCbRkXQdFVQr+EipqZQijpHxahmobC2ujOgHqKzjo4PJ
	j0W06VffRwevyNgjz1gW96dQ3VP9xMETRUUz7HSZL7947mOv/uwHvs5e16GpOc7Yc9UK89C0kcA2w
	V3Y0ZJi49CsU65NVgVAy9XElP5dwHUyVBu4Aw/4t3zX8eDFXaBGKAnjpliQ3+ZV4h1gBYWof3OW9y
	0JnoFiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNtc-007T8Q-7m; Fri, 15 Oct 2021 14:09:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNQB-007Ijs-Ms; Fri, 15 Oct 2021 13:38:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 92E011F4536E
Subject: Re: [PATCH v4 03/13] memory: mtk-smi: Use clk_bulk clock ops
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Ikjoon Jang <ikjn@chromium.org>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
 <20210914113703.31466-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e466b3fb-d9fe-bb20-23c2-f9766a35f120@collabora.com>
Date: Fri, 15 Oct 2021 15:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914113703.31466-4-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_063851_949207_766AC296 
X-CRM114-Status: GOOD (  21.12  )
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

> Use clk_bulk interface instead of the orginal one to simplify the code.
> 
> For SMI larbs: Require apb/smi clocks while gals is optional.
> For SMI common: Require apb/smi/gals0/gal1 in has_gals case. Otherwise,
>                  also only require apb/smi, No optional clk here.
> 
> About the "has_gals" flag, for smi larbs, the gals clock also may be
> optional even this platform support it. thus it always use
> *_bulk_get_optional, then the flag has_gals is unnecessary. Remove it.
> The smi_common's has_gals still keep it.
> 
> Also remove clk fail logs since bulk interface already output fail log.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Hello Yong,
thanks for the patch! However, I have an improvement to point out:

> ---
>   drivers/memory/mtk-smi.c | 143 +++++++++++++++------------------------
>   1 file changed, 55 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index c5fb51f73b34..f91eaf5c3ab0 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -60,6 +60,20 @@ enum mtk_smi_gen {
>   	MTK_SMI_GEN2
>   };
>   
> +#define MTK_SMI_CLK_NR_MAX			4

This refers to mtk_smi_common_clks[] and should be probably moved after that.
In any case, I don't think that there's any need to manually define this as 4,
as you can simply use the macro ARRAY_SIZE(mtk_smi_common_clks).
Using that will make you able to not update this definition everytime an update
occurs to the mtk_smi_common_clks array.

> +
> +/* larbs: Require apb/smi clocks while gals is optional. */
> +static const char * const mtk_smi_larb_clks[] = {"apb", "smi", "gals"};
> +#define MTK_SMI_LARB_REQ_CLK_NR		2
> +#define MTK_SMI_LARB_OPT_CLK_NR		1
> +
> +/*
> + * common: Require these four clocks in has_gals case. Otherwise, only apb/smi are required.
> + */
> +static const char * const mtk_smi_common_clks[] = {"apb", "smi", "gals0", "gals1"};
> +#define MTK_SMI_COM_REQ_CLK_NR		2
> +#define MTK_SMI_COM_GALS_REQ_CLK_NR	MTK_SMI_CLK_NR_MAX
> +

Apart from that,
Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
