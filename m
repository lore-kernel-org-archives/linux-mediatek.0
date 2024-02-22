Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA399C48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 08:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WY7ACvPne560CZyJg+MeJkJtzjngPdujvSlLPIYq2Lc=; b=K4BQ+NoP/CcjIoAgJ511dNijpM
	SvPYuUA+mm4wc401pMfz1i3fAq34+UxUEdTF2vBgnqGH15qc6BR74osDj01Q/ql5+akQma0F/Dfda
	rZvqiVakgXxFcolQgq7z2JsQuEpnhiB6d+PisnMg1NGFvW88ThTEyBKD7OwXmcbrWpe4RCF2V0Vnt
	ogKUi26VSH81SZ+UeS00Uow8CPa0gK3ia/uoTNihf0/+gPomf/PBlKoOyFWty6Jd5U6IoSt/gDWX6
	U2sC31W1YD3GiN0ktu5MFWQtXgE5EDfJenSnYPE3NK/NR0hKZl62w3xhKb2+o4GQJtJfVK9fY1L9P
	clegpu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4fS-000000045ep-0nUe;
	Thu, 22 Feb 2024 08:42:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4fO-000000045bb-1bV5
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 08:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708591372;
	bh=IlWMpflOFQxVolb8BXrh83pIlZC28esiOhVlOKompcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0gnn0brfDNAz8+NazsOsMmfBjoG0Vc/JX2rRI/7PXRGXtgR9R2Q7K9sgqIW2owBms
	 IelW6tIAFLFXElsSNwGflW94vsS6GalJENUJ3ztMHwbZibdIalvwmoTm+cWIAexUQr
	 8V+y/zFFG/TL/6BY1xaefdKWlu08WwC2pRSiMcv7X5I3NIu4fV2g8JHN32+AnjknIl
	 oO7XNzjPZbGzoRBAQYMw+8UOzq7fpEEOd1UxIkkOGETTnyrxes5UYfrmROCEpdbmOe
	 ciDeKbBxXRtJwDjPlI6v1TWHvEjFUWMzyZ9vuOAPBhLiltDzqGHxckyQfODg5RpJqv
	 V+Fcn72I2JyYg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B91B337813DF;
	Thu, 22 Feb 2024 08:42:51 +0000 (UTC)
Message-ID: <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
Date: Thu, 22 Feb 2024 09:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org
References: <20240221165643.1679073-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240221165643.1679073-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_004254_868858_91936A78 
X-CRM114-Status: GOOD (  13.21  )
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

Il 21/02/24 17:56, Justin Green ha scritto:
> Add MT8188 overlay driver configuration data. This change consequently
> enables 10-bit overlay support on MT8188 devices.
> 
> Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
> BA30 overlays are confirmed to work from modetest.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> Tested-by: Justin Green <greenjustin@chromium.org>

Hello Justin,

I'm 99.9% sure that you don't need this, you can just use compatibles

compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";

as they *are* indeed compatible, and MT8188 does support AFBC as well.

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2bffe4245466..696aabe124c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -635,6 +635,17 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   	.supports_clrfmt_ext = true,
>   };
>   
> +static const struct mtk_disp_ovl_data mt8188_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +	.formats = mt8195_formats,
> +	.num_formats = ARRAY_SIZE(mt8195_formats),
> +	.supports_clrfmt_ext = true,
> +};
> +
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt2701-disp-ovl",
>   	  .data = &mt2701_ovl_driver_data},
> @@ -650,6 +661,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>   	  .data = &mt8192_ovl_2l_driver_data},
>   	{ .compatible = "mediatek,mt8195-disp-ovl",
>   	  .data = &mt8195_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8188-disp-ovl",
> +	  .data = &mt8188_ovl_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);


