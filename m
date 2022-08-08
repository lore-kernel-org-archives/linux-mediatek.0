Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE6C00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 06:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYf6ezy+/tgRHSxGzJXfNlPkkPg4ZknRRAkBfdbZORU=; b=1azmKs1E3KJDD7ZtZZPtd0qX6L
	KDZiaj/fn9QmmP48JnHbvGmEp59GQ8YpJTjbSPy7RH8U3UdQDjDscyjX9ABkUeAixMjR//Hdknrqg
	nqClMbe/8WfSOX/syueDP5K67SOXKN2UQgiDNQ5wcb7/DzdpwnSMc87KVQahYaQ7p/Klo7w2A/r9b
	c+6cVTrdP57YRaNziWjNxSouLD4P1uQnn6MrpQ0IopjzPP7VfuEFT4iodtLsU+oaqtCBHmelPD7DW
	HCx4o6GrAiZOzbwqzo2XBCp5qupVGN6r/Yb5TmYvgHG69IeTXKa6udlZrpTsyr0dO7rHQaV3kphg+
	vGuWIp4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvvC-00BSVF-3c; Mon, 08 Aug 2022 06:07:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvv9-00BSOG-Hn; Mon, 08 Aug 2022 06:07:25 +0000
X-UUID: 59430e7eae714f3ca90e783bbf48413a-20220807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:58e718d8-1812-413c-b6ee-92ba485e8909,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:529afd48-f57f-4088-93dd-066979cdb4e6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 59430e7eae714f3ca90e783bbf48413a-20220807
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1111568478; Sun, 07 Aug 2022 23:07:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 13:46:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 13:46:39 +0800
Message-ID: <d9eb673132f643e39caeb422309bf4315f0c136e.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 8 Aug 2022 13:46:39 +0800
In-Reply-To: <20220805101459.3386-4-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
	 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_230723_601356_CEA48E13 
X-CRM114-Status: GOOD (  24.22  )
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

Hi, Bo-Chen:

On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

[snip]

> +
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +	u32 irq_status;
> +
> +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!(irq_status & RGS_IRQ_STATUS_TRANSMITTER))
> +		return IRQ_HANDLED;

If one of MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
MTK_DP_HPD_DISCONNECT exist, does it imply RGS_IRQ_STATUS_TRANSMITTER
exist? If so, I think this checking is redundant because we could
directly check MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
MTK_DP_HPD_DISCONNECT.

> +
> +	irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> +		     mtk_dp_hwirq_get_clear(mtk_dp);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;
> +
> +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> +		train_info->hpd_inerrupt = true;

train_info->hpd_inerrupt is useless, so drop it.

> +
> +	if (!(irq_status & MTK_DP_HPD_CONNECT ||
> +	      irq_status & MTK_DP_HPD_DISCONNECT))
> +		return IRQ_WAKE_THREAD;

this could be changed to

if (irq_status == MTK_DP_HPD_INTERRUPT)
	return IRQ_WAKE_THREAD;

But I find one problem. If irq_status == MTK_DP_HPD_INTERRUPT |
MTK_DP_HPD_CONNECT, the thread would not be waked up. Is this what you
want?

Regards,
CK

> +
> +	if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> +	       HPD_DB_DP_TRANS_P0_MASK))
> +		train_info->cable_plugged_in = true;
> +	else
> +		train_info->cable_plugged_in = false;
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +			   DP_PWR_STATE_MASK);
> +
> +	return IRQ_HANDLED;
> +}
> +


