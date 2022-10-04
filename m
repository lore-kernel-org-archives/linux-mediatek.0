Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF72C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e6nMFWyYvIXCpnS+qjUgouxUx+ia/SkPhnisD/yiOk=; b=Xrn9n6hJ3SG28e7a9xNyaaiL6k
	aupVMOjw2oYNHVeg2Kaiu1Lm91ehbyZBY9INikorA/jdTVDJWbkZ6n4gTjkYHrxRyCE/vM4ePpMN/
	YjDTCWXgXLNPqGVF4vLD5do7rOJ/Xgs1BlCCLa1tEZrhCAKPVPpIJFw/KqOeNerDzaSwlDJ9OKztr
	jEPT65rbbxSPgqNouYMUYd0N2LsUlgVVnUna0olfQeA4EmecAQ3drX9q7k5EoEsPUxZ/5zah+6LBW
	AVZ61ni1qfKxFy0sZ6nkf/vmzeHJZIzuES5403jF9dBfQeoQkabY0ytN1bSNR5baJzsNb68B93jC4
	I2RrM1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgs3-009bcL-IK; Tue, 04 Oct 2022 12:17:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgrk-009bXq-Or; Tue, 04 Oct 2022 12:17:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 002EA66022A9;
	Tue,  4 Oct 2022 13:17:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664885856;
	bh=cu5Yah5ck29bMkIycNvWBlc3sRFZHfkN4nV9X/MJBsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6xHqimEfiapB+IhxmaUxW10jKW1BgCkqMGc5g5ONzkgg4z40XoG2/D0Lt5PwQHKU
	 5C7Y9wDRF6C9D3UwvjEEyvVippFSbyzFCpk7fXHg0IA+JqkRFTtACW9B/hMvKUIvUT
	 rMxM2eq3TkF/uURTsaTULWftwL2IZaAa0BbpIH6qWXV/xQdTWn/Kw22CFFeJcwo2FR
	 9oYxQNopplTjR7S1qQ7r6xL7EgAsM2JmxOLZ2lMa/SsNQrwRogHpzhYK6rzJRCqxpk
	 0yfCRw1QAQIrpIfwGZ6d3RHiDN3tyo72oeEDg4fHvxLhk8UWZ2DJNJNfe/Baal24m0
	 kCM+AvoikzCaQ==
Message-ID: <15791b10-fdeb-3776-d7f5-968cb0fa85dc@collabora.com>
Date: Tue, 4 Oct 2022 14:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 3/6] soc: mediatek: mmsys: add support for MT8195
 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
 <20221004093319.5069-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221004093319.5069-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_051740_968413_8A62012E 
X-CRM114-Status: GOOD (  20.39  )
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

Il 04/10/22 11:33, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add MT8195 VPPSYS0 and VPPSYS1 driver data.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 20 +++++++++++++++++++-
>   drivers/soc/mediatek/mtk-mmsys.h |  1 +
>   2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index d2c7a87aab87..c4d15f99f853 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -149,11 +149,25 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   	.clk_driver = "clk-mt8195-vdo1",
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vppsys0_driver_data = {
> +	.io_start = 0x14000000,
> +	.clk_driver = "clk-mt8195-vpp0",
> +	.is_copies = true,
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
> +	.io_start = 0x14f00000,
> +	.clk_driver = "clk-mt8195-vpp1",
> +	.is_copies = true,
> +};
> +
>   static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
> -	.num_drv_data = 2,
> +	.num_drv_data = 4,

After a long discussion, it was chosen to not use the io_start way, but to change
the devicetree compatible....

Check this series, and rebase on top of it:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097

Cheers,
Angelo

>   	.drv_data = {
>   		&mt8195_vdosys0_driver_data,
>   		&mt8195_vdosys1_driver_data,
> +		&mt8195_vppsys0_driver_data,
> +		&mt8195_vppsys1_driver_data,
>   	},
>   };
>   
> @@ -360,6 +374,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	if (IS_ERR(clks))
>   		return PTR_ERR(clks);
>   
> +	if (mmsys->data->is_copies)

I don't get what "is_copies" means, sorry. I'm sure that there's a better name
for this one.

> +		goto out_probe_done;
> +
>   	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>   					    PLATFORM_DEVID_AUTO, NULL, 0);
>   	if (IS_ERR(drm)) {

Regards,
Angelo


