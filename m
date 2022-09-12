Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24D6ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxx8anyTPqLD6IpIuxNvy6wCEtVE3iPrvGwuk8QvkJo=; b=QtjaWPNzlduVOLf1altgJ0kHSE
	jAHEVxacTg+XOWoX8AQdHdX2RYMf3dlBwGSL7BIUv95L3zuou1wGSwPLSNwqd/aGng/p0ZjVKSGdP
	cbE6zvJWf11fFIz81Vu67VVytGHq+9JeY3MDDu8mwpZQd7Mdhv6ZPluJZ8WFfdae1lx6a7akWiXS7
	eIX/pe/r8jfzeeJaBcKwwg3pRk+g7zOUHmgIc7BKUss6p9VKyAy/cZlHKxdIlf8HX5aOWvedxTnYR
	D+DAFyilAIM821qYOIOZglU4M53wAlZvaKy4OBcOqaOFGipW4M+zrgeXTCwf1D2dmZFM8wjN13pOw
	qkDbKH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgkd-008my5-Bv; Mon, 12 Sep 2022 10:33:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgdV-008jCQ-7v; Mon, 12 Sep 2022 10:25:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F18E6601FD2;
	Mon, 12 Sep 2022 11:25:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662978351;
	bh=S2j6FckD5en6WxMDbzNsp0VoO6RaAb/LrcxvSl/+ggA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N1vZdOBOrPOkP2QC4pmbO5o5LLbhmyqOSOvJGNuSnHNuH2/7pXI38JjRXBB5iYYTd
	 XUDvKvb1Mfjukws+gUgUlpp1vd/R4dmHsMFqwONVturlhnH6f/wClnzMs4Xfe0hjFG
	 3QoezZJXJEeKSUuQKqP03Q0qmSx23UGfRlnf5rMFxsdrbFZcn4ie3IMKKawbweWnSJ
	 hAbaxpNoYh5CoDwQLSDHOOxPEFIt02ilLiwF9vQPQPrYQGxJ6r9l6/GZFjRn40JN1a
	 rFRXEzVpepeNREc2twwyGlOwAbun4a/xjeyIiCG0sxnHvEr6PrUvGGR7ZxI0ok/jYw
	 E/DKCKznp8/EA==
Message-ID: <5419b691-1b89-9878-ac52-4c99fa3af322@collabora.com>
Date: Mon, 12 Sep 2022 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 5/9] drm/mediatek: Add gamma support different lut_bits
 for other SoC
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_032553_474016_30307D35 
X-CRM114-Status: GOOD (  16.80  )
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

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> Add lut_bits in gamma driver data for each SoC and adjust the usage
> of lut_bits in mtk_drm_gamma_set_common().
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++-------
>   1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index e69d0b205b9a..155fb5d94d79 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -25,11 +25,14 @@
>   
>   #define LUT_10BIT_MASK				0x03ff
>   #define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
> +#define LUT_BITS_DEFAULT			10
> +#define LUT_INPUT_BITS				16 /* input lut bit from application */
>   
>   struct mtk_disp_gamma_data {
>   	bool has_dither;
>   	bool lut_diff;
>   	u16 lut_size;
> +	u8 lut_bits;
>   };
>   
>   /*
> @@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
>   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>   	bool lut_diff = false;
>   	u16 lut_size = LUT_SIZE_DEFAULT;
> +	u8 lut_bits = LUT_BITS_DEFAULT;

Please fix this double assignment like shown in the comment for patch [4/9].

Thanks,
Angelo


