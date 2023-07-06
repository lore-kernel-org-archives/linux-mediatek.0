Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6883CEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOaQqbvt1fRwPon1beIEWw+Wy/5jMRNwCuVcFPbo5gU=; b=Ns3zKxoVnNjfrBLM+i0iJm5uC/
	Z0UGP1rSTNqDXl5/cL1fLm8YcfrsvIyxRgrmQg6msjOQhpBZ2WFkU+TJlZmsor59E7FzGJ2uxNA33
	UfoYAyo8CEsfOPy4PLLZ7A2QmdqXrBcpTSJeZ1UFx8NMnjtwB0BGCtT3fHu384RsiT9b7UDfrC2Bc
	fH1agdgs06HkYDMkxgQBTTpyfEx1F5dKHywW89QJ6xORj/4GKAET01TvotbYM806NjAYOe2dqpYYK
	3zuM2kDfres2oab3E+APANcynKIwukcjJgvbw3C3TJaZMd4pxjE+7bhFMZLeqKfaIqjcSo421Aavs
	BdA47QGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMCT-001D1Q-0k;
	Thu, 06 Jul 2023 10:27:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMCP-001Czo-08;
	Thu, 06 Jul 2023 10:26:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 98A23660585C;
	Thu,  6 Jul 2023 11:26:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688639215;
	bh=6CgHdMHanq24fvS8FaBS8qQ0RlrA+kGzfVHRX7V3k+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m5giy2mCP/OsIEhQ87ulCwEghPPvsIuwbA3Q+mBAn7Jb9MxcTPtx5AtNq1BITdAZr
	 nA/Fb0ZmF6helJOemGYvB+JWK00bYzDbOu5JO1rBNhp638s3pQe6tvofWEaJ4SCMDi
	 4YoQJhQtuRhtemc6+DBW8lM0QEndAgAhYRvwEjMmZIYN6gdqiGJwzkMqonjkd5aOKn
	 6OzwQVzoYzgkeKE3lYMxwmdwcC1p+UyA0vels2urvwoOGV7bZrenay6YqK8wWBWB4B
	 EvQ7qp5SriPvb1RbAIcGOeSQRsyzDntlgKQvuJ8hV/CmqKHaDAKhqL1A3qwO7r603d
	 Ek6uHcPF9qOog==
Message-ID: <7b8d221f-107f-3352-d851-a0cb40008c1a@collabora.com>
Date: Thu, 6 Jul 2023 12:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2,2/2] drm/mediatek: dp: Add the audio control to
 mtk_dp_data struct
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230706021425.31735-1-shuijing.li@mediatek.com>
 <20230706021425.31735-3-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706021425.31735-3-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_032657_345533_BF4A7F79 
X-CRM114-Status: GOOD (  27.38  )
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

Il 06/07/23 04:14, Shuijing Li ha scritto:
> Mainly add the following two flag:
> 
> 1.The audio packet arrangement function is to only arrange audio
> packets into the Hblanking area. In order to align with the HW
> default setting of g1200, this function needs to be turned off.
> 
> 2.Due to the difference of HW, different dividers need to be set.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes in v2:
> - change the variables' name to be more descriptive
> - add a comment that describes the function of mtk_dp_audio_sample_arrange
> - reduce indentation by doing the inverse check
> - add a definition of some bits
> - add support for mediatek, mt8188-edp-tx
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 47 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ++++
>   2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 64eee77452c0..8e1a13ab2ba2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -139,6 +139,8 @@ struct mtk_dp_data {
>   	unsigned int smc_cmd;
>   	const struct mtk_dp_efuse_fmt *efuse_fmt;
>   	bool audio_supported;
> +	bool audio_pkt_in_hblank_area;
> +	u16 audio_m_div2_bit;
>   };
>   
>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
> @@ -647,7 +649,7 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
>   static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
>   {
>   	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
> -			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +			   mtk_dp->data->audio_m_div2_bit,
>   			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
>   }
>   
> @@ -1362,6 +1364,18 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
>   			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
>   }
>   
> +static void mtk_dp_audio_sample_arrange(struct mtk_dp *mtk_dp)
> +{
> +	/* arrange audio packets into the Hblanking and Vblanking area */
> +	if (!mtk_dp->data->audio_pkt_in_hblank_area)
> +		return;

There's only one remaining question: why is this done for MT8188 but *not* for
MT8195?

Thanks,
Angelo

> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
> +			   SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
> +			   SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK);
> +}
> +
>   static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>   {
>   	u32 sram_read_start = min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
> @@ -1371,6 +1385,7 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>   				    MTK_DP_PIX_PER_ADDR);
>   	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
>   	mtk_dp_setup_encoder(mtk_dp);
> +	mtk_dp_audio_sample_arrange(mtk_dp);
>   	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
>   	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
>   }
> @@ -2616,11 +2631,31 @@ static int mtk_dp_resume(struct device *dev)
>   
>   static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
>   
> +static const struct mtk_dp_data mt8188_edp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_eDP,
> +	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> +	.efuse_fmt = mt8195_edp_efuse_fmt,
> +	.audio_supported = false,
> +	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +};
> +
> +static const struct mtk_dp_data mt8188_dp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
> +	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> +	.efuse_fmt = mt8195_dp_efuse_fmt,
> +	.audio_supported = true,
> +	.audio_pkt_in_hblank_area = true,
> +	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +};
> +
>   static const struct mtk_dp_data mt8195_edp_data = {
>   	.bridge_type = DRM_MODE_CONNECTOR_eDP,
>   	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
>   	.efuse_fmt = mt8195_edp_efuse_fmt,
>   	.audio_supported = false,
> +	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct mtk_dp_data mt8195_dp_data = {
> @@ -2628,9 +2663,19 @@ static const struct mtk_dp_data mt8195_dp_data = {
>   	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
>   	.efuse_fmt = mt8195_dp_efuse_fmt,
>   	.audio_supported = true,
> +	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct of_device_id mtk_dp_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt8188-edp-tx",
> +		.data = &mt8188_edp_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8188-dp-tx",
> +		.data = &mt8188_dp_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8195-edp-tx",
>   		.data = &mt8195_edp_data,
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 84e38cef03c2..6d7f0405867e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -162,6 +162,7 @@
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(4 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
> @@ -228,6 +229,11 @@
>   							 VIDEO_STABLE_CNT_THRD_DP_ENC1_P0 | \
>   							 SDP_DP13_EN_DP_ENC1_P0 | \
>   							 BS2BS_MODE_DP_ENC1_P0)
> +
> +#define MTK_DP_ENC1_P0_3374			0x3374
> +#define SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK	BIT(12)
> +#define SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK		GENMASK(11, 0)
> +
>   #define MTK_DP_ENC1_P0_33F4			0x33f4
>   #define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
>   #define DP_ENC_DUMMY_RW_1				BIT(9)




