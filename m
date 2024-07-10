Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50456C3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgwNTmrtVIB+Tx5qfeottxq3AwK1J/GvAZ9ipe9tjyE=; b=aksGiSB/NSPyY58feCg28uzzjk
	opqZKaoZIwQnZ/gVjkuzMA4wYOIQ5srLdLv9BSaSwAk+ioKVDYKOLETuvmUoFfYwsjDqiRAKEGxvC
	EI9yvACVKNuFlQfM5wNnEzFuYsQCcgXh/f4PM6C4byIcfSw8aLZSs7X2JNq8mmqY2GzFzLuEmWWXL
	qJgYctU9qo6aRjT/AsC0BZynryxxYMsf6ByIJR2eQF4ZGgSibWTZCw+lTbLZLEGAA8TvM5FqMHw64
	QsMKF/5HkPn4ppTGfzTYC6lwEZ2Lg+xkDHDPM4K1zcdxCEfiaAwsqXKhLgvrekhTemb8m1HZ6IpWt
	dL7WSOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTfi-0000000A4VO-03eI;
	Wed, 10 Jul 2024 09:31:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTfP-0000000A4RS-2vsG;
	Wed, 10 Jul 2024 09:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720603872;
	bh=IqVKXZ8bzrEAVXLR1bSuGmEfouFfD3UiPXeCKpXfUBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1ZbfSaOoLHbue0Cip7tDl6DIVtZ5ZJLyzYri0l8yvRJQP2xLCSscp2fO7bJlP+45m
	 8vLM2CZZb7wPppO2lUtZKUGx+PqppwYMuYNI9b9W5GOxvNqSdGsY5V5I6rdLzDk/Lb
	 oYbln6lJ9eH9Vvojnvp1q4jkoAwZ4sLGGG/dudzLx0gcOjAhYo7FfqYYEYwqu8I+Oh
	 yJj7vP60S4WblpgaKh9oGZCDy4TTwLuso6Qi9yGOHdrg22K1fcTmBmWbIyrgS88D1n
	 oIIVSr6I+e5PfRTX3GaHVYM9rbGyqmFLrQHwGCWfyl8ckAmRt/W1kkhNx9JPe/ZCz/
	 NPivhegOYtgBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0407F3782192;
	Wed, 10 Jul 2024 09:31:11 +0000 (UTC)
Message-ID: <a1914f2b-93f2-4de4-9c4b-2e1f6b39cf3a@collabora.com>
Date: Wed, 10 Jul 2024 11:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmem: mtk-efuse: Only register socinfo device if
 needed cells are there
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240708-mtk-socinfo-no-data-probe-err-v2-1-7ae252acbcc2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240708-mtk-socinfo-no-data-probe-err-v2-1-7ae252acbcc2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_023116_051443_FA2C0325 
X-CRM114-Status: GOOD (  25.33  )
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

Il 08/07/24 21:43, Nícolas F. R. A. Prado ha scritto:
> Not every efuse region has cells storing SoC information. Only register
> an socinfo device if the required cells are present.
> 
> This prevents the pointless process of creating an socinfo device,
> probing it with the socinfo driver only to ultimately error out like so
> 
>    mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
>    mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2
> 
> This issue is observed on the mt8183-kukui-jacuzzi-juniper-sku16
> platform, which has two efuse regions, but only one of them contains the
> SoC data.
> 

I think that we should rather remove or disable the first eFuse region, as
even though that is enabled:

  - This is the only SoC having two regions
    - I'm not even sure that the region at 0x8000000 is really efuse
    - Not even referenced in datasheets....
  - It's unused, as in, it's not exposing any information and no declared cells

Don't misunderstand me, this is not an invalid change, but I rather prefer
to resolve this by disabling that (effectively unused!) node, avoiding to
add more lines to this driver that would be useless after fixing that small
single thing.

Cheers,
Angelo


> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Added missing include for of.h
> - Link to v1: https://lore.kernel.org/r/20240708-mtk-socinfo-no-data-probe-err-v1-1-fb2acd3a47bf@collabora.com
> ---
>   drivers/nvmem/mtk-efuse.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 9caf04667341..74def409bc20 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -11,6 +11,7 @@
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
>   #include <linux/property.h>
> +#include <linux/of.h>
>   
>   struct mtk_efuse_pdata {
>   	bool uses_post_processing;
> @@ -60,6 +61,8 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>   		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
>   }
>   
> +static const char socinfo_data_first_name[] = "socinfo-data1";
> +
>   static int mtk_efuse_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -69,6 +72,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	struct mtk_efuse_priv *priv;
>   	const struct mtk_efuse_pdata *pdata;
>   	struct platform_device *socinfo;
> +	struct device_node *np;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -92,10 +96,16 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	if (IS_ERR(nvmem))
>   		return PTR_ERR(nvmem);
>   
> -	socinfo = platform_device_register_data(&pdev->dev, "mtk-socinfo",
> -						PLATFORM_DEVID_AUTO, NULL, 0);
> -	if (IS_ERR(socinfo))
> -		dev_info(dev, "MediaTek SoC Information will be unavailable\n");
> +	np = of_get_child_by_name(pdev->dev.of_node, socinfo_data_first_name);
> +	if (np) {
> +		of_node_put(np);
> +		socinfo = platform_device_register_data(&pdev->dev, "mtk-socinfo",
> +							PLATFORM_DEVID_AUTO, NULL, 0);
> +		if (IS_ERR(socinfo))
> +			dev_info(dev, "MediaTek SoC Information will be unavailable\n");
> +	} else {
> +		dev_info(dev, "Efuse region does not contain SoC information - skipping socinfo driver setup\n");
> +	}
>   
>   	platform_set_drvdata(pdev, socinfo);
>   	return 0;
> 
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240708-mtk-socinfo-no-data-probe-err-d7558343dc82
> 
> Best regards,


