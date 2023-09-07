Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B0EB8FB1
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9btLs3kp/UyKO/goUcP8rjI/40XSGa7AQ400lV7JwE=; b=PO/RNE3azxuecvKnomIHoyxC43
	kJDZ818+26gd8Pdk395tyfKD6Gg/0XARNc1W2kTgswoU844pR3DSAtGVh9w7yZK06B1vZy4zExy+o
	9omdVXroBLsCwaVxZzjw4cGAH+JE1F9lL6IuzHpyr9N01rFydp2t55F/CsR7Psra8j7GBsBFNiBJx
	M3WPEBjkRXLuq2xSiPojUp9EHSn/ejnL2XGiq8oxqiYDoCT1BwBlfT6K1qR/Cdspr3C7Y1aaDj9Me
	HFD/QteG4HEyPTmOIiwFFblyWB+y3JMnyDzlC0lXe2tY449DEOs/HtmI12mHhrJI1i0+dh+Y9WGg4
	0nXMh3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDvE-00C4QC-37;
	Thu, 07 Sep 2023 12:15:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDvC-00C4Pc-1N;
	Thu, 07 Sep 2023 12:15:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7CC6B660730B;
	Thu,  7 Sep 2023 13:15:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694088941;
	bh=Eqb5pNlHdN85VbMQrGQeQIo/DXWZRBobczKrVqHb3/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtObJKO3s+O0/WucsrR/DqY6YxlESM3EcxUaqBp8cBN9FgVYjtYutDVWp43Vw3GHy
	 varInFrwfMfBPWUBDmFz6hCCvPdenkh1gILr0uQ2WCNssEQ+zX/nlRjDA447GV5YPk
	 g5GxTEMxx8wkNsvnZifOsxFeh6b0XuZ/kTqRcXUklqlwVXc4mBeZnN+v4boeuAVa4j
	 /6S+MtQ6xbgSZ96r/yA4jDNFmv+yc4lqor8d+QHIWAcffbuhR9Q/ggPmIeG2Yfpv6X
	 VVXiRqJPlWq0IeqKOco9RHo0g0EeyGqw5fYyVGeAADVgexpqJGafloYqb8Pd+70O24
	 m2gGeyZbLNavg==
Message-ID: <addaf43f-1970-0566-cf5d-8e34a61a1952@collabora.com>
Date: Thu, 7 Sep 2023 14:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 07/15] drm/mediatek: Support alpha blending in VDOSYS1
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
 <20230823151332.28811-8-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823151332.28811-8-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_051542_601036_E327D87F 
X-CRM114-Status: GOOD (  15.01  )
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

Il 23/08/23 17:13, Hsiao Chien Sung ha scritto:
> Support premultiply and coverage alpha blending modes.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_ethdr.c | 50 +++++++++++++++++++++-------
>   1 file changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> index 73dc4da3ba3b..3058c122a4c3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -5,6 +5,7 @@
>   
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
> +#include <drm/drm_blend.h>
>   #include <linux/clk.h>
>   #include <linux/component.h>
>   #include <linux/of_device.h>
> @@ -35,6 +36,7 @@
>   #define MIX_SRC_L0_EN				BIT(0)
>   #define MIX_L_SRC_CON(n)		(0x28 + 0x18 * (n))
>   #define NON_PREMULTI_SOURCE			(2 << 12)
> +#define PREMULTI_SOURCE				(3 << 12)
>   #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
>   #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
>   #define MIX_FUNC_DCM0			0x120
> @@ -50,9 +52,7 @@
>   
>   #define MIXER_INX_MODE_BYPASS			0
>   #define MIXER_INX_MODE_EVEN_EXTEND		1
> -#define DEFAULT_9BIT_ALPHA			0x100
>   #define	MIXER_ALPHA_AEN				BIT(8)
> -#define	MIXER_ALPHA				0xff
>   #define ETHDR_CLK_NUM				13
>   
>   enum mtk_ethdr_comp_id {
> @@ -153,33 +153,59 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
>   	struct mtk_plane_pending_state *pending = &state->pending;
>   	unsigned int offset = (pending->x & 1) << 31 | pending->y << 16 | pending->x;
>   	unsigned int align_width = ALIGN_DOWN(pending->width, 2);
> -	unsigned int alpha_con = 0;
> +	unsigned int mix_con = NON_PREMULTI_SOURCE;
> +	bool replace_src_a = false;
> +
> +	union format {
> +		unsigned int raw;
> +		char str[5];

Can we please use fixed size variables?

		u32 raw;
		u8 str[5];

> +	} format;
>   

Regards,
Angelo


