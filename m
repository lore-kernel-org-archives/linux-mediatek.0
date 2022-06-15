Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 03:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZ0SergphdVd91q4HJ9mce7X7/Bl6K4z5ueyPnkFLcE=; b=tCTP4xN9tg8FWB
	FUM3C9VTxFtzve4joBr08N5gyV4E2JHaMRknkX4BPXEVltAfPpxBJyAspzhJ/Su4loGvlNg5ieSPK
	XP0N2zcmpYSOsvxBw2Q8WGepmfro/f50CGf3Q0ZuGe8vpSlLXgQ0ne60QqvV2yMnvQcL8TFhGuyq7
	M0IvOBWWoxvv550xkw/ngflFwLEHhb4xp06cvcRecilf7FrTGi2Hv6/mdTS/PxxDWcaeznBI75B3U
	arpKJ+C3ynRqmphlm2rRQJFbaS+CzpW4tWEoJC4G+tVDVYJ06ONmYpN2NiZ2rkqzS5lrdR14wfhHF
	l2eSAmmawgwinm3dawtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1JN6-00CISt-3c; Wed, 15 Jun 2022 03:07:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1JMv-00CIPv-5D; Wed, 15 Jun 2022 03:06:58 +0000
X-UUID: 736eb456c064422aa00093c5a6f05147-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:bfc5cb76-9fe9-4e56-b64d-06e1306220ac,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:fe2640f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 736eb456c064422aa00093c5a6f05147-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1842716150; Tue, 14 Jun 2022 20:06:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 20:06:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 11:06:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 11:06:45 +0800
Message-ID: <6efcd9fbd86e923d2b124f7a97e8e3b8ddece252.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 15 Jun 2022 11:06:45 +0800
In-Reply-To: <20220610105522.13449-6-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
	 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_200657_231990_8FC483CD 
X-CRM114-Status: GOOD (  23.74  )
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

Hi, Bo-Chen:

On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
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
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> +{
> +	u8 val;
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
> +	usleep_range(2000, 5000);
> +
> +	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> +
> +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=
> DP_TRAINING_AUX_RD_MASK;
> +
> +	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
> +				      mtk_dp->rx_cap[mtk_dp-
> >max_linkrate]);
> +	train_info->lane_count = min_t(int, mtk_dp->max_lanes,
> +				       drm_dp_max_lane_count(mtk_dp-
> >rx_cap));
> +
> +	train_info->tps3 = drm_dp_tps3_supported(mtk_dp->rx_cap);
> +	train_info->tps4 = drm_dp_tps4_supported(mtk_dp->rx_cap);
> +
> +	train_info->sink_ssc = !!(mtk_dp->rx_cap[DP_MAX_DOWNSPREAD] &
> +				  DP_MAX_DOWNSPREAD_0_5);

I think this is redundant because next statement would set sink_scc to
false.

Regards,
CK

> +
> +	train_info->sink_ssc = false;
> +
> +	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> +	if (val & DP_MST_CAP) {
> +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> +		drm_dp_dpcd_readb(&mtk_dp->aux,
> +				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> &val);
> +		if (val)
> +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> +					   DP_DEVICE_SERVICE_IRQ_VECTOR
> _ESI0,
> +					   val);
> +	}
> +
> +	return 0;
> +}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
