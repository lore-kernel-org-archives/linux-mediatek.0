Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33713C47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 05:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6904613D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 05:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6904613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dM8p/w2G4l0vsUexqMBYCrzkCYtf/AJiHVWvSC1Tzc=; b=qcOYG+ASwEFQ7/4Oy8Ocr1kJ3d
	ZyAL/2BDsFMXz6KvQzNssA92rl1dhnxFJrCk1YPXyCewSUwB8PVwqh/KC/ZHk1Gqh2QFEvswWfPIW
	uoGLLFbGutNA0nQH6YdFkVvdlvIllA4BWAtizCGkPmHCRE6ZtINJ4fRtc7tVX0RFUyyBmLTslhqCa
	h1jk/R4A9ZNWP+fp0gcT7wP9OQEahgoycanbsLsw5ziMRnvbEkMBDM13H+4DcZgWzUUsRiL/fxbwY
	Ky3uKFLeGYOKOgZmZXhIaG2XTSetzC15PU4I8k1j23GYp+P5zWG9O8a3y+QZzHWHq2cm3Hov5p/iW
	BbKa4NGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmV2f-00CG9g-I1; Fri, 28 May 2021 05:28:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmV2S-00CG1U-FC; Fri, 28 May 2021 05:28:05 +0000
Received: from [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d] (unknown
 [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 53FA91F43EF3;
 Fri, 28 May 2021 06:27:55 +0100 (BST)
Subject: Re: [PATCH v4,5/6] media: mtk-vcodec: Add MT8192 H264 venc driver
To: Irui Wang <irui.wang@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-6-irui.wang@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e95b8c85-4878-eec7-f568-5f16f7fcf955@collabora.com>
Date: Fri, 28 May 2021 08:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521070139.20644-6-irui.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_222804_655715_BAEF0F99 
X-CRM114-Status: GOOD (  19.74  )
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

Hi

On 21.05.21 10:01, Irui Wang wrote:
> Add MT8192 venc driver's compatible and device private data.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
>   .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index d03cca95e99b..14893d277bb8 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
>   enum mtk_chip {
>   	MTK_MT8173,
>   	MTK_MT8183,
> +	MTK_MT8192,
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 26b089e81213..78f3dd166917 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -425,12 +425,26 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
>   	.core_id = VENC_SYS,
>   };
>   
> +static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
> +	.chip = MTK_MT8192,
> +	.uses_ext = true,
> +	/* MT8192 supports the same capture formats as MT8183*/

missing space before '*/'

> +	.capture_formats = mtk_video_formats_capture_mt8183,
> +	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
> +	/* MT8192 supports the same output formats as MT8173 */
> +	.output_formats = mtk_video_formats_output_mt8173,
> +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),

If all three models mt8173, mt8183 and mt8192 support the same formats then
we should probably not name the structs according to one of the models, so maybe:

s/mtk_video_formats_capture_mt8183/mtk_video_formats_capture/
s/mtk_video_formats_output_mt8173/mtk_video_formats_output/

or some other naming

Thanks,
Dafna


> +	.min_bitrate = 64,
> +	.max_bitrate = 100000000,
> +	.core_id = VENC_SYS,
> +};
>   static const struct of_device_id mtk_vcodec_enc_match[] = {
>   	{.compatible = "mediatek,mt8173-vcodec-enc",
>   			.data = &mt8173_avc_pdata},
>   	{.compatible = "mediatek,mt8173-vcodec-enc-vp8",
>   			.data = &mt8173_vp8_pdata},
>   	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
> +	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
