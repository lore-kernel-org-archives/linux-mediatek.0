Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE14C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6AC60F14
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB6AC60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R44wRhtss4Gi0lDLRy7oIoqUoWlCyzXLVsD6UYHRyB4=; b=1sbT2kcC0VAxxqrPYgwubTxo6I
	X2WgkFJVNEFWPUcEw4UevGBrRgRWBQBkzNdFcyRn8VyQBdEmPYvL8hfqpmOPAdEqniscCPFctUegX
	/loFOBS7n5QV7EIvMUeA3Nv4x9fHQ5JIhArM+2fO5B6dZ64rHEe/xj+K/pLLDRIa6l7mhpR673orN
	USv7qWWibBwrhUa4GXUJ0PpTY5yVC5b7iMDHDLJbI5G/O7RSMz1OjEUK18hvu+B5CTO9L1p1Jujcv
	r1aJ0lDuWCRnSd8uZvIJFWi6lOIt4lDq2rj5l9cUzdmLySBKs5XXHm8hFjPpvVg2biGxdBtj36kMD
	HNBwJngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBIe4-006ZPZ-QA; Wed, 04 Aug 2021 15:17:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBIdq-006ZO2-RD; Wed, 04 Aug 2021 15:17:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id u15so1429819wmj.1;
 Wed, 04 Aug 2021 08:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b63lahstfxDW7WR12fBIuj/dzQbDGm3znqT/SxL0hWY=;
 b=FWdCKoxtqJ3hIUsGU7UV24ZqAACZyZFTzq+braR2PkoTpWDYHFdqYM+whAg3z3nZhq
 izixyOANWQZqdHGbNxztTxkv+8UFptmYvJrvnXmv4UIQsaBLdhMN8psL2mZafQ+k/32+
 wrYXFDtvyzA1TvQzZtiWf4zJ7AGwnDoAVzWO/xDZt0A1Z0LA9oyHhTK+1lfPOovpryQp
 ogWN6hIYMfoT09zkpwZTBA+mJf5cSzFOspF4UEZWxloUQeqyJ6RbpEP3L2OvMmEp9YXd
 wcbeP7UJrOJLUNfg0U3OQ+z+QOAkpUn2PbrAqRVvM4CGSB8g5vKT/MFfEv9m8RSvXYHz
 bBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b63lahstfxDW7WR12fBIuj/dzQbDGm3znqT/SxL0hWY=;
 b=djtpaecHFF4rTd3NTRfosOnjXyqxwK2771tbdkIGEmfmqSkxhro8984W69W3Wxhubu
 7+XaPA/qBPL0wKrO9bscSjeLXONnoZHvbRfCUJZpjB3qfK8ZS891BzF7pwTDVnjpji4e
 LyvDb4p5IPSS+jjbIuXvzK5NcpN8NYrrjnkKFzb2Seun3OqOYNIwoOy5zhiRAku9bWlJ
 fg+BocPd0hmNzwC21HblaNn/cGsr4yYwkrsLGiVf7zjKrzab1vH9KNeRL4YrJR2qPx3Q
 z4++/bWBg0pMQdzV/bgYrZhh9ugm4l0lNDeeL/EIztWeaRHqCpwm+71OsdmJ4X+qH+4z
 O0Og==
X-Gm-Message-State: AOAM530Q6zX9TrweGJxTQtfoerFbsjDplhXYKTFMDCxwrwI9I6ePJid9
 +KGc6gl5TI3P+oRd8sQkwPw=
X-Google-Smtp-Source: ABdhPJyseRbabhlKjED4Q8ikZikxokYgveuICNc8rwBBqUJA93qxobqci11usD4/XJtSgnt+KyGkgg==
X-Received: by 2002:a05:600c:228e:: with SMTP id
 14mr104585wmf.141.1628090229474; 
 Wed, 04 Aug 2021 08:17:09 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id z3sm6313872wmf.6.2021.08.04.08.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:17:09 -0700 (PDT)
Subject: Re: [PATCH v2] soc: mmsys: mediatek: add mask to mmsys routes
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: CK Hu <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dafna.hirschfeld@collabora.com, Frank Wunderlich <frank-w@public-files.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210729070549.5514-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e8c990b6-180d-9702-d8cc-fd1e98dfc744@gmail.com>
Date: Wed, 4 Aug 2021 17:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729070549.5514-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_081711_013770_18C685D2 
X-CRM114-Status: GOOD (  27.93  )
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



On 29/07/2021 09:05, Frank Wunderlich wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> SOUT has many bits and need to be cleared before set new value.
> Write only could do the clear, but for MOUT, it clears bits that
> should not be cleared. So use a mask to reset only the needed bits.
> 
> this fixes HDMI issues on MT7623/BPI-R2 since 5.13
> 
> Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

My understanding is, that this does not break mt8173 and other SoCs that use the
default routing table. Correct?

Added now to v5.14-next/soc
Thanks.

> ---
> code is taken from here (upstreamed without mask part)
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2345186/5
> basicly CK Hu's code so i set him as author
> ---
> v2:
> - added mask to mt8183 specific table (mask=value),
>   before val was used as mask and val itself not defined,
>   breaking display on these devices
> - as changes do not add addional code only restoring same
>   behaviour for mt8183 added reviwed-by from CK Hu from v1
> ---
>  drivers/soc/mediatek/mt8183-mmsys.h |  21 +++--
>  drivers/soc/mediatek/mtk-mmsys.c    |   7 +-
>  drivers/soc/mediatek/mtk-mmsys.h    | 133 +++++++++++++++++++---------
>  3 files changed, 112 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> index 579dfc8dc8fc..9dee485807c9 100644
> --- a/drivers/soc/mediatek/mt8183-mmsys.h
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -28,25 +28,32 @@
>  static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
>  	{
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> -		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
> +		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L,
> +		MT8183_OVL0_MOUT_EN_OVL0_2L
>  	}, {
>  		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> -		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
> +		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0,
> +		MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
>  	}, {
>  		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
> -		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1
> +		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1,
> +		MT8183_OVL1_2L_MOUT_EN_RDMA1
>  	}, {
>  		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> -		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0
> +		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0,
> +		MT8183_DITHER0_MOUT_IN_DSI0
>  	}, {
>  		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> -		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L
> +		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L,
> +		MT8183_DISP_PATH0_SEL_IN_OVL0_2L
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> -		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1
> +		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1,
> +		MT8183_DPI0_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> -		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0
> +		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0,
> +		MT8183_RDMA0_SOUT_COLOR0
>  	}
>  };
>  
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..0f949896fd06 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -68,7 +68,9 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>  
>  	for (i = 0; i < mmsys->data->num_routes; i++)
>  		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
> +			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> +			reg &= ~routes[i].mask;
> +			reg |= routes[i].val;
>  			writel_relaxed(reg, mmsys->regs + routes[i].addr);
>  		}
>  }
> @@ -85,7 +87,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  
>  	for (i = 0; i < mmsys->data->num_routes; i++)
>  		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr) & ~routes[i].val;
> +			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> +			reg &= ~routes[i].mask;
>  			writel_relaxed(reg, mmsys->regs + routes[i].addr);
>  		}
>  }
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index a760a34e6eca..5f3e2bf0c40b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -35,41 +35,54 @@
>  #define RDMA0_SOUT_DSI1				0x1
>  #define RDMA0_SOUT_DSI2				0x4
>  #define RDMA0_SOUT_DSI3				0x5
> +#define RDMA0_SOUT_MASK				0x7
>  #define RDMA1_SOUT_DPI0				0x2
>  #define RDMA1_SOUT_DPI1				0x3
>  #define RDMA1_SOUT_DSI1				0x1
>  #define RDMA1_SOUT_DSI2				0x4
>  #define RDMA1_SOUT_DSI3				0x5
> +#define RDMA1_SOUT_MASK				0x7
>  #define RDMA2_SOUT_DPI0				0x2
>  #define RDMA2_SOUT_DPI1				0x3
>  #define RDMA2_SOUT_DSI1				0x1
>  #define RDMA2_SOUT_DSI2				0x4
>  #define RDMA2_SOUT_DSI3				0x5
> +#define RDMA2_SOUT_MASK				0x7
>  #define DPI0_SEL_IN_RDMA1			0x1
>  #define DPI0_SEL_IN_RDMA2			0x3
> +#define DPI0_SEL_IN_MASK			0x3
>  #define DPI1_SEL_IN_RDMA1			(0x1 << 8)
>  #define DPI1_SEL_IN_RDMA2			(0x3 << 8)
> +#define DPI1_SEL_IN_MASK			(0x3 << 8)
>  #define DSI0_SEL_IN_RDMA1			0x1
>  #define DSI0_SEL_IN_RDMA2			0x4
> +#define DSI0_SEL_IN_MASK			0x7
>  #define DSI1_SEL_IN_RDMA1			0x1
>  #define DSI1_SEL_IN_RDMA2			0x4
> +#define DSI1_SEL_IN_MASK			0x7
>  #define DSI2_SEL_IN_RDMA1			(0x1 << 16)
>  #define DSI2_SEL_IN_RDMA2			(0x4 << 16)
> +#define DSI2_SEL_IN_MASK			(0x7 << 16)
>  #define DSI3_SEL_IN_RDMA1			(0x1 << 16)
>  #define DSI3_SEL_IN_RDMA2			(0x4 << 16)
> +#define DSI3_SEL_IN_MASK			(0x7 << 16)
>  #define COLOR1_SEL_IN_OVL1			0x1
>  
>  #define OVL_MOUT_EN_RDMA			0x1
>  #define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
>  #define BLS_TO_DPI_RDMA1_TO_DSI			0x2
> +#define BLS_RDMA1_DSI_DPI_MASK			0xf
>  #define DSI_SEL_IN_BLS				0x0
>  #define DPI_SEL_IN_BLS				0x0
> +#define DPI_SEL_IN_MASK				0x1
>  #define DSI_SEL_IN_RDMA				0x1
> +#define DSI_SEL_IN_MASK				0x1
>  
>  struct mtk_mmsys_routes {
>  	u32 from_comp;
>  	u32 to_comp;
>  	u32 addr;
> +	u32 mask;
>  	u32 val;
>  };
>  
> @@ -91,124 +104,164 @@ struct mtk_mmsys_driver_data {
>  static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
>  	{
>  		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
> -		DISP_REG_CONFIG_OUT_SEL, BLS_TO_DSI_RDMA1_TO_DPI1
> +		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
> +		BLS_TO_DSI_RDMA1_TO_DPI1
>  	}, {
>  		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
> -		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_BLS
> +		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
> +		DSI_SEL_IN_BLS
>  	}, {
>  		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_OUT_SEL, BLS_TO_DPI_RDMA1_TO_DSI
> +		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
> +		BLS_TO_DPI_RDMA1_TO_DSI
>  	}, {
>  		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_RDMA
> +		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
> +		DSI_SEL_IN_RDMA
>  	}, {
>  		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_BLS
> +		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
> +		DPI_SEL_IN_BLS
>  	}, {
>  		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
> -		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1
> +		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
> +		GAMMA_MOUT_EN_RDMA1
>  	}, {
>  		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
> -		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0
> +		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
> +		OD_MOUT_EN_RDMA0
>  	}, {
>  		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
> -		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1
> +		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
> +		OD1_MOUT_EN_RDMA1
>  	}, {
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> -		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0
> +		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
> +		OVL0_MOUT_EN_COLOR0
>  	}, {
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> -		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0
> +		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
> +		COLOR0_SEL_IN_OVL0
>  	}, {
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> -		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
> +		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
> +		OVL_MOUT_EN_RDMA
>  	}, {
>  		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
> -		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1
> +		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
> +		OVL1_MOUT_EN_COLOR1
>  	}, {
>  		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
> -		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1
> +		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
> +		COLOR1_SEL_IN_OVL1
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
> +		RDMA0_SOUT_DPI0
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
> -		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI1
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
> +		RDMA0_SOUT_DPI1
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
> -		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI1
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
> +		RDMA0_SOUT_DSI1
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
> -		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI2
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
> +		RDMA0_SOUT_DSI2
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
> -		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI3
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
> +		RDMA0_SOUT_DSI3
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DPI0
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
> +		RDMA1_SOUT_DPI0
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_RDMA1
> +		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
> +		DPI0_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
> -		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DPI1
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
> +		RDMA1_SOUT_DPI1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
> -		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_RDMA1
> +		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
> +		DPI1_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
> -		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_RDMA1
> +		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
> +		DSI0_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
> -		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI1
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
> +		RDMA1_SOUT_DSI1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
> -		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_RDMA1
> +		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
> +		DSI1_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
> -		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI2
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
> +		RDMA1_SOUT_DSI2
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
> -		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_RDMA1
> +		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
> +		DSI2_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
> -		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI3
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
> +		RDMA1_SOUT_DSI3
>  	}, {
>  		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
> -		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA1
> +		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
> +		DSI3_SEL_IN_RDMA1
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DPI0
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
> +		RDMA2_SOUT_DPI0
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
> -		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_RDMA2
> +		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
> +		DPI0_SEL_IN_RDMA2
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
> -		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DPI1
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
> +		RDMA2_SOUT_DPI1
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
> -		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_RDMA2
> +		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
> +		DPI1_SEL_IN_RDMA2
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
> -		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_RDMA2
> +		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
> +		DSI0_SEL_IN_RDMA2
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
> -		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI1
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
> +		RDMA2_SOUT_DSI1
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
> -		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_RDMA2
> +		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
> +		DSI1_SEL_IN_RDMA2
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
> -		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI2
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
> +		RDMA2_SOUT_DSI2
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
> -		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_RDMA2
> +		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
> +		DSI2_SEL_IN_RDMA2
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
> -		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI3
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
> +		RDMA2_SOUT_DSI3
>  	}, {
>  		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
> -		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA2
> +		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
> +		DSI3_SEL_IN_RDMA2
>  	}
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
