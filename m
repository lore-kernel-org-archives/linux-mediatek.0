Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE996EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxiIpre8BtT2o5ohskrPILCsifwze+9MwdmGxDHNlyw=; b=gBkgqYLbtXOtKhfIPHJSQJ0KK6
	PihUJybAXicJxwU1JsT1e/PwAfK0zljkbn0FlLX5/FYLBWkiQCZm+7wQz3PoI0WXu0nHpdbVwUsrJ
	HBijKKc7hhpJoSdlEwZIFQF9cK9OU6VnMNOTaQ78px1fYPRxZTHPFsMzYz2em9VAiP7DWy9tuqs+Z
	URuxkdpzLu8FgwWK48awXetC9U+DJSlD6XVO0HG4AJLIYp2pBqSA1+3ZSrwykFEqGuAYrrlB4tCir
	wvH2pYFZLMiYwUmnwA4YxfQrbCBGWMj7vw5qxx0ayNrD9Dp3vIWnCTJKAoS2et6fS1lmFtHj2/aCA
	ix2mFwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeha-000LZ0-2n;
	Mon, 11 Sep 2023 11:03:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfehV-000LWX-2b;
	Mon, 11 Sep 2023 11:03:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BFB6066072FC;
	Mon, 11 Sep 2023 12:03:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694430208;
	bh=toQiYutVle+i27Bqgs6ZEGNKjIE11r2s6PXTNuIUBLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BOsOOsKe7nx8QyxFFqapO85pc3cpScbG26NcaLQ+4pM/bVHwXKA3N8HzuoVKPCbd+
	 qVz7WdDbO+JRhSvqM8QYxZccZffeHPIDSe08gnLdvpzVmBzl2CN/DeIKZeeZGX3MNX
	 FN6ZoqqBva5HC8zvidePc1HKeaSU7w8Eip7Cv+ojCZq6x9UHyRvO2j+/oiZWNXJ4XM
	 1VRLeuPL5fh3EcEgVN2S5CVWiIY4e8+mHRm3D0nzhxgZ1RkB0+3vQtzyRZaoD5lAxN
	 XLgQsqhVgu2BHVAXJy2yjrwmlrzz6Iql/i18Q0596zJjA6hhXfebejW3hIeBteMnL2
	 1LsZ/nmyWfFFg==
Message-ID: <14e03873-3723-8293-0190-445a71828b25@collabora.com>
Date: Mon, 11 Sep 2023 13:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3,2/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel
 initial code
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230911105736.11752-1-shuijing.li@mediatek.com>
 <20230911105736.11752-3-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911105736.11752-3-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040329_974481_2ACC6177 
X-CRM114-Status: GOOD (  19.23  )
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

Il 11/09/23 12:57, Shuijing Li ha scritto:
> For mt8188, add dsi cmdq reg control to send long packets to panel
> initialization. MT8188 hardware has been changed to automatically
> set the cmdq_size value by default when sending long packets.
> In this patch, the cmdq_size value is set manually instead.
> Remain consistent with previous IC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
> Changes in v3:
> reorder patch 2/3 and 3/3, and describe more about why mt8188 need this
> patch,
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/411ddbf95e2c2298b84899065691d478069ec273.camel@mediatek.com/
> Changes in v2:
> use mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL); directly,
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d8bfc2cce54d..e83705394ada 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -86,6 +86,7 @@
>   
>   #define DSI_CMDQ_SIZE		0x60
>   #define CMDQ_SIZE			0x3f
> +#define CMDQ_SIZE_SEL		BIT(15)
>   
>   #define DSI_HSTX_CKL_WC		0x64
>   
> @@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
>   	const u32 reg_cmdq_off;
>   	bool has_shadow_ctl;
>   	bool has_size_ctl;
> +	bool cmdq_long_packet_ctl;
>   };
>   
>   struct mtk_dsi {
> @@ -996,6 +998,8 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
>   
>   	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
>   	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
> +	if (dsi->driver_data->cmdq_long_packet_ctl)

Please add a comment here, like:

		/* Disable setting cmdq_size automatically for long packets */

after which
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
>   }
>   
>   static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,


