Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C599C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyZoalxD9bjX2Ic1sqBMXCwc0NyQ2ESU8BAWtxZMM8A=; b=CJU3EL+QZ0DfWd
	hsDTUO3pAzoeQUX5injdeZHVRblzj0VbsbDAZEm+lDR5HVB2EJ8zcJeVQujUaG47TeTupkQvwr4nd
	hIoHSVFb5pox448eKm5L2N6hsKDpirgS+eRVLSJgY3nrsQ75yzmP6U8mJey9SAJrwrrBpBQFKyiiS
	7ESN22HsqLl71sWJqT6FAogg+kFQMusUExomacRiv8+k60Bhm1U+r5gvbPj3rkGufuAFHiPNkR+iM
	WDTOFjuvjrHSeXHFeZnt24FrF5bjZfjMOQI3Ws9PlgyPQ/YCfmC0sqidsEJYbP/vml6k64L/Yf0JT
	KcC7Z+dN+Aia3wnAYgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvcKZ-006EWe-Io; Mon, 30 May 2022 10:08:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvcKO-006ES9-Cx; Mon, 30 May 2022 10:08:50 +0000
X-UUID: fcaae020de7348fb9e61c7497d61bd2c-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ea7a6186-1b05-4bd0-8d0c-b6ff392be814,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:88ba0248-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: fcaae020de7348fb9e61c7497d61bd2c-20220530
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1907799424; Mon, 30 May 2022 03:08:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 03:08:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 18:08:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 18:08:33 +0800
Message-ID: <828da579f872747943dbb7684b35f58bc592c6ca.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Mon, 30 May 2022 18:08:33 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_030848_470386_2ADD4FD6 
X-CRM114-Status: GOOD (  23.03  )
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

Hi, Guillaume:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
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
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  

[snip]

> +
> +static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
> +{
> +	bool connected;
> +	u16 swirq_status = mtk_dp_swirq_get_clear(mtk_dp);
> +	u8 hwirq_status = mtk_dp_hwirq_get_clear(mtk_dp);
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	train_info->irq_status |= hwirq_status | swirq_status;

You mix software control variable and irq status here. Break each flag
in irq_status to variables in train_info to decouple software control
variable and irq status.

> +
> +	if (!train_info->irq_status)
> +		return IRQ_HANDLED;
> +
> +	connected = mtk_dp_plug_state(mtk_dp);
> +	if (connected || !train_info->cable_plugged_in)
> +		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
> +	else if (!connected || train_info->cable_plugged_in)
> +		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
> +
> +	if (!(train_info->irq_status &
> +	      (MTK_DP_HPD_CONNECT | MTK_DP_HPD_DISCONNECT)))
> +		return IRQ_HANDLED;
> +
> +	if (train_info->irq_status & MTK_DP_HPD_CONNECT) {
> +		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
> +		train_info->cable_plugged_in = true;
> +	} else {
> +		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
> +		train_info->cable_plugged_in = false;
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
> +	}
> +	train_info->cable_state_change = true;
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
