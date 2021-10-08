Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 11:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A53A61029
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 11:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A53A61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sr8a1GH2a/XSs1OQMbcc1GqGt6X8nDDwff20Kg4l5CE=; b=mnulEF5fNO9CCJ
	i6NAn90NwZFCcS3ZwSylr2443yj9BpM3+XStxd/EXDlK3QFlbtmuNHRWtLw6fq0KY9WlO7As+awlF
	3u++aDtiAlE4HMFbbVi8rPj+vfgpxBVyPNLGDuZ0Twyb4Uw10BEXejYlf/TZfTEZsjkaDM5RykxM4
	KT5ynWwrZGT+DPKXnPscOpcoGFO75I3eQrY2ScJGPBXN8IRbIpCRwUW8DxsYKe/o+TpV4itqH5Hau
	JW1eXdyo5cAc/2+R342jR9weyeghHzEgyVpxfrysub8Apd5IzdEw6LDenCs8CoQrAU7xM8UwM7Pbm
	TBmSrpiFIah9pDNvIGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYo27-002XF6-4R; Fri, 08 Oct 2021 11:27:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYo1u-002XCd-KF; Fri, 08 Oct 2021 11:27:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t8so28955462wri.1;
 Fri, 08 Oct 2021 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tLi89EnDPjR+G+5RZAaz/qdjvJ+j6uhtWnhwzVW71cE=;
 b=PIgIYvyiO7MafYMnWpo0WxprZr99rhBFPMNQhs5AwDzC/wCtL50WyZfh6AEc+c2izj
 KiU+/Yubs9ACeyRpTzAMT11XsHVu/KvttB5RIzycwJCslNgUri5qWLir7euF+CmtrQQz
 ioU9yChMm+sAq/xSkb7Su0cIFBLHEmdJl9tGp7xtoq6lHlN7k8Em4ibapqXwmtt5M7g5
 V4Tm6q276qEMZHaZKofTss89/+ytxexejyHWlc+psoaBUiTzh30/ahft8QqnIcHzSsJ0
 vSvQa1sGGDUh6Zi8gmSREgJy/QO5hnxQbVeXQAAiNhatQKXI37wYxa12wER1C7W5dCh0
 034A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tLi89EnDPjR+G+5RZAaz/qdjvJ+j6uhtWnhwzVW71cE=;
 b=Mnz8p4zkKxQhLPFdjqGyDrLVhV1tA9vDWhyuFBl8alt55xQ8m+yG/LEh02RjARevbJ
 fQJL9pQ1dbqh6P+Ei34nIjcZg26ItIBb2wAlGr84Cq6H/qIxz1/695ntl5dXZlRHNqr2
 O4zGOj6ZIB97XqWWs4TPaz3PR3k4iWSIZX4fGYx3C4eQ/nrQuNG9bp/ccRk8bxQ9OlOd
 oyPx4X4KJQ3goGnJQltPermPSIg24g3hbrSSC34k5EGHyGwXstkNnD2D/2K6+cYC3uSu
 5RmftcJH+e7JG+1FV2FWrwpAzb+7KKpdMf16HmDcwTAWmFNp6BD8lnSrXSCuFjcwvPy+
 C11A==
X-Gm-Message-State: AOAM5311qL/74RMr5dAijV58h6UeRGsvRtT9doNw7sqVGCUTTSRO8K2L
 Kn68p+9DxFIEvNJg1dNSdN8=
X-Google-Smtp-Source: ABdhPJwrkjde/Z6e4X54arkfrAdFRWNfEIUqRoReDcJ36V+ZMZwqv/l72Kt5Mb9TWy2qNeQR5oHLEQ==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr3151969wrr.332.1633692428046; 
 Fri, 08 Oct 2021 04:27:08 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id t15sm2222520wru.6.2021.10.08.04.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:27:06 -0700 (PDT)
Message-ID: <1ec3cefb-12cd-86e8-fff2-1ab0d10034b6@gmail.com>
Date: Fri, 8 Oct 2021 13:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v10, 4/5] soc: mediatek: add mtk mutex support for MT8192
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-5-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210930155222.5861-5-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_042710_709719_3CB87781 
X-CRM114-Status: GOOD (  16.39  )
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



On 30/09/2021 17:52, Yongqiang Niu wrote:
> Add mtk mutex support for MT8192 SoC.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied to v5.15-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 35 ++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2e4bcc300576..2ca55bb5a8be 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -39,6 +39,18 @@
>   #define MT8167_MUTEX_MOD_DISP_DITHER		15
>   #define MT8167_MUTEX_MOD_DISP_UFOE		16
>   
> +#define MT8192_MUTEX_MOD_DISP_OVL0		0
> +#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
> +#define MT8192_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8192_MUTEX_MOD_DISP_COLOR0		4
> +#define MT8192_MUTEX_MOD_DISP_CCORR0		5
> +#define MT8192_MUTEX_MOD_DISP_AAL0		6
> +#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
> +#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
> +#define MT8192_MUTEX_MOD_DISP_DITHER0		9
> +#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
> +#define MT8192_MUTEX_MOD_DISP_RDMA4		17
> +
>   #define MT8183_MUTEX_MOD_DISP_RDMA0		0
>   #define MT8183_MUTEX_MOD_DISP_RDMA1		1
>   #define MT8183_MUTEX_MOD_DISP_OVL0		9
> @@ -214,6 +226,20 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>   };
>   
> +static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
> +	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8192_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L2] = MT8192_MUTEX_MOD_DISP_OVL2_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8192_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
> +};
> +
>   static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>   	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -275,6 +301,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>   	.no_clk = true,
>   };
>   
> +static const struct mtk_mutex_data mt8192_mutex_driver_data = {
> +	.mutex_mod = mt8192_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +};
> +
>   struct mtk_mutex *mtk_mutex_get(struct device *dev)
>   {
>   	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -507,6 +540,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>   	  .data = &mt8173_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-mutex",
>   	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-mutex",
> +	  .data = &mt8192_mutex_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
