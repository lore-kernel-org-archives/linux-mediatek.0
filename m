Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10118C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 11:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F34611C9
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F34611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y/+FiudQ9EDlv/sWO2QgrodeeeLz/WJqnFpkgQ6RjDI=; b=B11EravTyc2z8s5gVxle3SFlFv
	9+RP5d2jB/jtzsoMbdCGja13KTMY4xgh4qlbB8hBmOPTx49ac2cYPYER+a2lgYCefNwHIw1NL0gbY
	EH+klbVTBOnEJHF40m+7uelSX+FJ8qFa2OX32VnEK7IzqW1WlnfiBONpudW/V2e0el86sdwQzB1ju
	NvRjljHwbFbLXxdmGZowc5L8A63pC3FE+N1byG76NZaw4/1EmYRsgB5iTF6q5ixvhXJegK5cYjd5E
	X/audHP9jke9STtmFegqthNg2FKcfoZ6aF+OL5QEly160wougiO8GeHiwpEX1rRH/TWVdUptkYGnU
	5oE1/MJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBy1e-00CHGt-FQ; Fri, 06 Aug 2021 11:28:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBy1a-00CHGD-VJ; Fri, 06 Aug 2021 11:28:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l18so10658799wrv.5;
 Fri, 06 Aug 2021 04:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d8FSL7ZCHhgZJIiY+idJw40OTs70Iw57nrfJP9BGnbE=;
 b=cAxKsiIaDgfRnuK/zxPsdagpkDcHcEQp5x82mqYiacbzYQa3b0Zu6LFIilYHKIVPdR
 rKu1lxz4DWx6nkMHVgdDVchdZWQjp8L7BPpKS9SQzBLXkzMDcl6alTwARujqfvTWttKd
 xIZy2d53EtPkoJN6x6qi9/OwutqKvxidTFBfqPL7gwuuazxQY1xF7um9sBOSD+M7dnW6
 iC+UO/Rgt0wnvV5NQXSkEqkDATOupE9PWXVpeOPFdrwTkhIWV8t6rQ3jwYjDB7XBrb4X
 RMO6egnUCa+vQyRJ6ivPZ/yIsG5Gn3DHedzcV+EZc1wLwFOktehl6pqlIH/L74KJNDMi
 OQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d8FSL7ZCHhgZJIiY+idJw40OTs70Iw57nrfJP9BGnbE=;
 b=mcPUvGvqWiexKYM8Qgg2Ua0U8bdQuHwxZto/HH0uhWdLPtH4V5NdtMRFd0/PvxmdDo
 HA0oCh+p2tl06revH0ygTyoYOrPJEeJ8eMocUVSCzow1qSQRyvrHVCFrMv1xLpgh2Fk9
 WvgtTLH0ZMHRKUCUjXgoycxFJE997s+gZWQB87EqHBjRoLLi0UkO31rYuC4s4RZWY6C0
 cvYUOwNQSh3nuvJZAUyI0CYYfImp2LdNolczxB0eIfbiuMKG8/enD9NPHEgv+ZQ8FdI+
 AWEOkizdjfFpMyx6wsxEUL0FVaJ5hbTyFzXsS3eV79SI4eSSgMRpB2NF1DZ192vJYLf0
 Z4yA==
X-Gm-Message-State: AOAM531W49tQAM7WwhVR2EeETvs/ct7Is7RiC37ntdfW1oALvFR7Ojnc
 KSea1ikbPGGLR0VbRaLdkO0=
X-Google-Smtp-Source: ABdhPJwVaisygyPEmh8rvqau5LUUoWi2AYDqvKoquWsOcIg0kkdBtKCdCMtJJY8NSXuStdH+ruD4dA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr9920048wrp.175.1628249302788; 
 Fri, 06 Aug 2021 04:28:22 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id j1sm11411934wmo.4.2021.08.06.04.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 04:28:22 -0700 (PDT)
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, hsinyi@chromium.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210805205226.24880-1-jason-jh.lin@mediatek.com>
 <20210805205226.24880-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 2/7] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Message-ID: <28cc4599-6eda-4784-3d8f-4570c9ab60e8@gmail.com>
Date: Fri, 6 Aug 2021 13:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805205226.24880-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_042827_053873_10553A73 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Jason,

On 05/08/2021 22:52, jason-jh.lin wrote:
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 

I'd like to see the implementation of vdosys1 as well, to better understand why
we need two compatibles.

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
> 
> [1] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210805171346.24249-2-jason-jh.lin@mediatek.com/

Please add the binding description to this series.

> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 96 ++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 11 +++
>  include/linux/soc/mediatek/mtk-mmsys.h |  9 +++
>  3 files changed, 116 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..9339a786ec5d
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN					0xf14
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN					0xf34
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 << 0)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		(0 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		(0 << 5)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 << 5)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 << 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		(1 << 8)
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		(0 << 9)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			(1 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 << 12)
> +#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			(0 << 16)
> +#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			(1 << 16)
> +#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			(0 << 17)
> +#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			(1 << 17)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		(0 << 21)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		(1 << 21)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_VPP_MERGE			(1 << 22)
> +
> +#define MT8195_VDO0_SEL_OUT					0xf38
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		(0 << 0)
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			(1 << 0)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		(0 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			(1 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		(2 << 1)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			(0 << 4)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			(1 << 4)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSI1				(0 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			(1 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			(2 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(3 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			(4 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			(0 << 11)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA0			(1 << 11)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			(0 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		(1 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			(2 << 12)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			(0 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			(1 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0

Please update the struct to the new version that includes a mask field.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
