Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A749C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F55AsMRhAsPWlg76OYcgmZE2JHxgl3YpIg0irEUe+k=; b=RTGbwVMsfy19SBzfxcu44gdADg
	D+YHD3KVSQ5FKAgSEAjo9AAdTb+cSfEQrVuIXiiWHi9pUZBR0vxpSzrAGs/UKebZmVgTp34DvrgpW
	IOsXHV5n+N86ual37pfd+SYoLZDlUfiENPyVnNUm3E5CyS5xN9iLeJsbgZJ9zfW6waJcFWHk0JhOo
	uG7e2PHhwSTnlXQVKPO3aWHW77WVF4FMEJ/obuaWUdRJ0rpilwWLfvVV0O+NIJFeeRUVJ4lKusJgA
	Sur4cvwXncpWANGsGcKvShqEdqsnuFkmN/jfPonyOZ1Zv4eAAZiZK2AVXrMl7hL+nuj8TN2fGhC9m
	1Zn+zTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1savUu-0000000FcoB-1FoW;
	Mon, 05 Aug 2024 11:03:28 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1savUq-0000000Fcna-2AcE;
	Mon, 05 Aug 2024 11:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722855801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nMI1pHC0citcabjOHWLJOKFR43yjr/ljcaEIDwGsgTw4wXGgAdEdgBNrtijEhN4buKCIAiS0nm9lSyCkXi7t/xxQe/ntZkLzJ7HjykPsgEr9+7DFh7VucLzdV2RJOgTNaaPULK4tHKhjS0ObRHE7O9H5eJltHhfZitjwoXjNF6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722855801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3F55AsMRhAsPWlg76OYcgmZE2JHxgl3YpIg0irEUe+k=; 
	b=bTVp260vS3+wv3l+qRFpIMfSOS3qderuE3T4+8HrZAfmInGBwz49h4fdIvCzXhVsO4xkOALVPKArYLbIQ6gQCC32GQLQHa1l21oT5cMFae6pCJL0A6PnivRgCWHnzgawsvwBl0vM98AdqlnRETgQMXQ8avHTUIPC5FkNqcN99CI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722855801;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3F55AsMRhAsPWlg76OYcgmZE2JHxgl3YpIg0irEUe+k=;
	b=MA9vZ0KSYrRVoFH/4CjU6YrPRgIbjGybHaCUmrfxjpfGN7maLQmlWB4JMX+yggTY
	dXo/SSQ+vuoQs3WeY2GQy78oaXYGXKwX/xZXwlK1nYoYPk3acTxmy4nk5d35qC02KPS
	MS2o7ozyU21AwgPj4KUcGpmYyksHHSHXkKfFsHYU=
Received: by mx.zohomail.com with SMTPS id 1722855800152913.3061181095068;
	Mon, 5 Aug 2024 04:03:20 -0700 (PDT)
Message-ID: <2035c6ef-ff91-43d6-8270-7dcb3ae6fbfc@collabora.com>
Date: Mon, 5 Aug 2024 13:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] media: mediatek: jpeg: support 34bits
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240801031012.31053-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240801031012.31053-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_040324_645744_59E7D391 
X-CRM114-Status: GOOD (  16.84  )
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

Il 01/08/24 05:10, Jianhua Lin ha scritto:
> the iommu HW supported 34bits iova space(16GB),
> but mediatek jpeg enc/dec driver still is 32bit,
> then need to set the bit32/bit33 iova to jpeg HW.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> Changes compared with v3:
> - remove of_property_read_bool() for 34bit supporting check.
> - move the support_34bit into the platform data(mtk_jpeg_variant)
>    for the specific SoC supporting.
> - add mtk8188 SoC to compatible list.
> 
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 55 ++++++++++++++++-
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 59 +++++++++++++++----
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 44 ++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++-
>   7 files changed, 158 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index ac48658e2de4..101c509ab2ab 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

..snip..

> @@ -1860,6 +1863,10 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
>       { .id = "jpgenc" },
>   };
>   +static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
> +    { .id = "jpgdec" },
> +};
> +
>   static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
>       { .id = "jpgdec-smi" },
>       { .id = "jpgdec" },
> @@ -1878,6 +1885,7 @@ static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
>       .ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
>       .out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>       .cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +    .support_34bit = false,

You don't need to set this to false, as the default value is already 0 (false).

Please remove all instances of `.support_34bit = false`, and keep only the true
assignments, after which, and *only after*, on your v5:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   };
>     static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
> @@ -1894,6 +1902,7 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
>       .out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
>       .cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>       .multi_core = false,
> +    .support_34bit = false,
>   };
>     static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
> @@ -1907,6 +1916,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
>       .cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>       .multi_core = true,
>       .jpeg_worker = mtk_jpegenc_worker,
> +    .support_34bit = false,
>   };
>     static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
> @@ -1920,6 +1930,41 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
>       .cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
>       .multi_core = true,
>       .jpeg_worker = mtk_jpegdec_worker,
> +    .support_34bit = false,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
> +    .clks = mtk_jpeg_clocks,
> +    .num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
> +    .formats = mtk_jpeg_enc_formats,
> +    .num_formats = MTK_JPEG_ENC_NUM_FORMATS,
> +    .qops = &mtk_jpeg_enc_qops,
> +    .irq_handler = mtk_jpeg_enc_irq,
> +    .hw_reset = mtk_jpeg_enc_reset,
> +    .m2m_ops = &mtk_jpeg_enc_m2m_ops,
> +    .dev_name = "mtk-jpeg-enc",
> +    .ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
> +    .out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
> +    .cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +    .multi_core = false,
> +    .support_34bit = true,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
> +    .clks = mtk_jpeg_dec_clocks,
> +    .num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +    .formats = mtk_jpeg_dec_formats,
> +    .num_formats = MTK_JPEG_DEC_NUM_FORMATS,
> +    .qops = &mtk_jpeg_dec_qops,
> +    .irq_handler = mtk_jpeg_dec_irq,
> +    .hw_reset = mtk_jpeg_dec_reset,
> +    .m2m_ops = &mtk_jpeg_dec_m2m_ops,
> +    .dev_name = "mtk-jpeg-dec",
> +    .ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
> +    .out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +    .cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +    .multi_core = false,
> +    .support_34bit = true,
>   };
>   

