Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdkYZGaxLg7PX5l+4niPTavh+4t6ME6xIJhILomd4lE=; b=rotx0uThzY59vfTJiXVaBpPsRP
	18rnslyFBoBk6e6F01GSW4YOfUlkQmP/XUO6LpeK8C6Y45JwGFP8YtKFPb95As4OR2VN8Hb487trZ
	lCCt+OoLMqf6qj5tf34hN3BvtFM74F/jCJVbAfGwSDyH8s6wZG5fI0RZSe/v9EnYkwm8sTeyn8DF+
	w3tsVupPzSESRRYZ2XmccQXF5CESILvApJkpSXf2/LA5V9uOHXDszZVcefwgSEOSxh7fELUm6VrI4
	iGOs91nuqMgqXO59nzknFa1F0ERDbxMxVhpdBSUIuGq9MxNsYmnFlFCbXJlfVvDGT9mAO8+bdOhUV
	tLT+hNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNRh-00CHIm-JP; Mon, 18 Jul 2022 09:53:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNRM-00CH88-SE; Mon, 18 Jul 2022 09:53:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C8A1566019EC;
	Mon, 18 Jul 2022 10:53:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658138003;
	bh=VIxBxxLSa4ktKCkPs1Dc1qanYxk7HSJmo+nuBsN7108=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OBajxEXF7nCoTgF3jxiCtm5jkVJ0bfYA7QQQ+phsgTLNBe3qALrKrFevNxzq1pi5j
	 ou4TpCn3QHWujcYDsVhQ/WseMdBg4juX++2gVr+gej3wLI8p5yHuwGa4Ix/suF9dnC
	 vf2a+lL8dgCe//fPycaXNZMZEi+EsAtVQ4xozsUNNCcxlsCZ1Q0YEtkE8rnISpIQJC
	 dzGssWz9ZP6JdHbbpr/FFupdseeOfYzPAo2X/O+br1JJD3PxmBOzL7UTHE6HV7abhO
	 cyyzlZl0/Hj9PBT6LBzEOtAcBeFCs471mK0VR+cHvm6jdVjZq53zy8HFwPdXcIfIkh
	 vkGpmPo5c2XPg==
Message-ID: <98b0edfa-9669-3adb-894d-5d6fce9e2f8f@collabora.com>
Date: Mon, 18 Jul 2022 11:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] media: mediatek: vcodec: Add mt8188 encoder driver
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220716093808.29894-1-irui.wang@mediatek.com>
 <20220716093808.29894-4-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220716093808.29894-4-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_025325_085227_1BDE4A21 
X-CRM114-Status: GOOD (  18.27  )
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

Il 16/07/22 11:38, Irui Wang ha scritto:
> Add mt8188's compatible "mediatek,mt8188-vcodec-enc".
> Add mt8188's device private data "mt8188_pdata".
> Remove platform_get_resource API to get IRQ resoure.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>   .../mediatek/vcodec/mtk_vcodec_enc_drv.c      | 21 ++++++++++++-------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> index 95e8c29ccc65..6b0688b4872d 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> @@ -228,7 +228,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   {
>   	struct mtk_vcodec_dev *dev;
>   	struct video_device *vfd_enc;
> -	struct resource *res;
>   	phandle rproc_phandle;
>   	enum mtk_vcodec_fw_type fw_type;
>   	int ret;
> @@ -272,13 +271,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_res;
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);

This needs to be a separated commit with a Fixes tag!

> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "failed to get irq resource");
> -		ret = -ENOENT;
> -		goto err_res;
> -	}
> -
>   	dev->enc_irq = platform_get_irq(pdev, 0);
>   	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
>   	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
> @@ -428,6 +420,18 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
>   	.core_id = VENC_SYS,
>   };
>   
> +static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
> +	.uses_ext = true,
> +	.capture_formats = mtk_video_formats_capture_h264,
> +	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
> +	.output_formats = mtk_video_formats_output,
> +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
> +	.min_bitrate = 64,
> +	.max_bitrate = 50000000,
> +	.core_id = VENC_SYS,
> +	.is_34bit = true,
> +};
> +
>   static const struct of_device_id mtk_vcodec_enc_match[] = {
>   	{.compatible = "mediatek,mt8173-vcodec-enc",
>   			.data = &mt8173_avc_pdata},
> @@ -436,6 +440,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
>   	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
>   	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
>   	{.compatible = "mediatek,mt8195-vcodec-enc", .data = &mt8195_pdata},
> +	{.compatible = "mediatek,mt8188-vcodec-enc", .data = &mt8188_pdata},

Please keep this list alphabetically sorted.

>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);


