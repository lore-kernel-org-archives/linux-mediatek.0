Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965C3C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjp35FYW2DvIAP0zoNwUfgH2L5GQoLJfswI5u8d0Szo=; b=XZodN8yi3On+Ik7/tRKLnq7/dU
	6/SAcyCmNR+Md9tDyt89Glob9Un3OmmU8LqFOfpVTtA2HMgp/rO36ZxwjvYYyqB3yi0oXPCN30xo8
	pgdF3JmfVLrpfFcaB0rG8cgcmL85VetGJEQhNopwKZ7Vah2h9ZP/zNtIdpKxJMViptLuJlWtYH9UF
	IHUnpON6URMEWqCmRCMdQ4fe6Ae7sZ+Tt6veKvUrSN9fOPMRBg8msJmIwKvE//XqVtJUsHvhLgMcc
	ghA/iP6SV9m0Is831FfKHKgJPsbKxrUM9D7go24J7m3igywUxhFTQgJDq7N1q0ew5pCZgUtgq0JG7
	sWqmmT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MbD-00F5kA-Ke; Thu, 07 Jul 2022 08:10:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MbA-00F5f5-AW; Thu, 07 Jul 2022 08:10:57 +0000
X-UUID: 45e4e3fe98d541f58e1eeee429d8381b-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5968a2d1-1864-4cf8-ab25-4bdd94ea73ba,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:12e1a863-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 45e4e3fe98d541f58e1eeee429d8381b-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1786758055; Thu, 07 Jul 2022 01:10:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 15:50:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 7 Jul 2022 15:50:12 +0800
Message-ID: <d7078ff355a797081fcbd374c33fa5f4c74f4c98.camel@mediatek.com>
Subject: Re: [PATCH v13 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Thu, 7 Jul 2022 15:50:12 +0800
In-Reply-To: <20220701062808.18596-6-rex-bc.chen@mediatek.com>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
	 <20220701062808.18596-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_011056_404637_6C56FD9A 
X-CRM114-Status: GOOD (  29.01  )
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

On Fri, 2022-07-01 at 14:28 +0800, Bo-Chen Chen wrote:
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
> ---

[snip]

> +/*
> + * We need to handle HPD signal in eDP even though eDP is a always
> connected
> + * device. Besides connected status, there is another feature for
> HPD signal -
> + * HPD pulse: it presents an IRQ from sink devices to source devices
> (Refer to
> + * 5.1.4 of DP1.4 spec).
> + */
> +static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
> +{
> +	bool connected;
> +	bool hpd_connect_sta;
> +	u32 irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> +			 mtk_dp_hwirq_get_clear(mtk_dp);
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> +		train_info->irq_sta.hpd_inerrupt = true;
> +	if (irq_status & MTK_DP_HPD_CONNECT)
> +		hpd_connect_sta = true;
> +	if (irq_status & MTK_DP_HPD_DISCONNECT)
> +		train_info->irq_sta.hpd_disconnect = true;

hpd_disconnect is used only in this function, so let it be local
variable.

> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;

Move this to top of this function.

> +
> +	connected = mtk_dp_plug_state(mtk_dp);
> +	if (connected || !train_info->cable_plugged_in)
> +		train_info->irq_sta.hpd_disconnect  = false;

The truth table of (irq_status & MTK_DP_HPD_DISCONNECT, connected,
cable_plugged_in, hpd_disconnect) is

0 0 0 0
0 0 1 0
0 1 0 0
0 1 1 0
1 0 0 0
1 0 1 1
1 1 0 0
1 1 1 0

So the only case that hpd_disconnect is true is

(irq_status & MTK_DP_HPD_DISCONNECT) && !connected && train_info-
>cable_plugged_in)

And train_info->cable_plugged_in is the previous status. The previous
status is connected. And irq_status and connected is the new status.
The new status is disconnected.

I have a question. Why we need both irq_status and connected for new
status? I think connected is enough for new status, so we could ignore
irq_status.

Regards,
CK

> +	else if (!connected || train_info->cable_plugged_in)
> +		hpd_connect_sta = false;
> +
> +	if (!(hpd_connect_sta || train_info->irq_sta.hpd_disconnect))
> +		return IRQ_WAKE_THREAD;
> +
> +	if (hpd_connect_sta) {
> +		hpd_connect_sta = false;
> +		train_info->cable_plugged_in = true;
> +	} else {
> +		train_info->irq_sta.hpd_disconnect = false;
> +		train_info->cable_plugged_in = false;
> +	}
> +	train_info->cable_state_change = true;
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +


