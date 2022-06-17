Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiahZdh4GoZmRz7yl9+4xmhQF8F1waN2JXZ/x8yiNiQ=; b=xQZ73N7ISdkyIy60bqERXneQvt
	5xscfHro0PfrbkdpqvyrzFUOoe2Z2chpX9EKUenwhGSLlmV/SyFfN8fW4K+7kYIIrXOMmU+m2NCim
	uQY6KxOEC7E0Hvc14Fxp+Mbz2AwaW/u+NRLWza9ZwodfXaBxmxA6ddhleDDkK5F5kefEvUsVUQB7H
	BHet/3tdB+bkKssxekfK4R619Plcs+10ZC+hF9PtSkLx1O4mBdY2CpNefTgWEsOXqKWJ7sOvqXPYX
	vu9WMJiI5jzywNgVJuH95bP6wFAED+Nvz2+JjJNDicp8Ir0Eela42q2DQ3SzZBJHo8t2+nVO8nocI
	oYEVnbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27MI-006JPS-67; Fri, 17 Jun 2022 08:29:38 +0000
Received: from mailgw02.mediatek.com ([66.171.122.166])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27Lv-006JEe-IG; Fri, 17 Jun 2022 08:29:17 +0000
X-UUID: 1783ab53d42e4a299e037450ea779b0c-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6c95fa0d-d05f-4065-8b46-9de6169ff509,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:fada9ff6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1783ab53d42e4a299e037450ea779b0c-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 445409104; Fri, 17 Jun 2022 01:29:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 01:27:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 17 Jun 2022 16:27:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 16:27:43 +0800
Message-ID: <127049c096eea15b9dad37ce1b6e4be810c24a93.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
	<deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
CC: "msp@baylibre.com" <msp@baylibre.com>, "granquet@baylibre.com"
	<granquet@baylibre.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 17 Jun 2022 16:27:43 +0800
In-Reply-To: <6efcd9fbd86e923d2b124f7a97e8e3b8ddece252.camel@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
	 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
	 <6efcd9fbd86e923d2b124f7a97e8e3b8ddece252.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_012915_663930_94F28AE6 
X-CRM114-Status: GOOD (  26.95  )
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

On Wed, 2022-06-15 at 11:06 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> > +{
> > +	u8 val;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > +	usleep_range(2000, 5000);
> > +
> > +	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> > +
> > +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=
> > DP_TRAINING_AUX_RD_MASK;
> > +
> > +	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
> > +				      mtk_dp->rx_cap[mtk_dp-
> > > max_linkrate]);
> > 
> > +	train_info->lane_count = min_t(int, mtk_dp->max_lanes,
> > +				       drm_dp_max_lane_count(mtk_dp-
> > > rx_cap));
> > 
> > +
> > +	train_info->tps3 = drm_dp_tps3_supported(mtk_dp->rx_cap);
> > +	train_info->tps4 = drm_dp_tps4_supported(mtk_dp->rx_cap);
> > +
> > +	train_info->sink_ssc = !!(mtk_dp->rx_cap[DP_MAX_DOWNSPREAD] &
> > +				  DP_MAX_DOWNSPREAD_0_5);
> 
> I think this is redundant because next statement would set sink_scc
> to
> false.
> 
> Regards,
> CK
> 

Hello Ck,

I will remove "train_info->sink_ssc = false;"

BRs,
Bo-Chen
> > +
> > +	train_info->sink_ssc = false;
> > +
> > +	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> > +	if (val & DP_MST_CAP) {
> > +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> > +		drm_dp_dpcd_readb(&mtk_dp->aux,
> > +				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> > &val);
> > +		if (val)
> > +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> > +					   DP_DEVICE_SERVICE_IRQ_VECTOR
> > _ESI0,
> > +					   val);
> > +	}
> > +
> > +	return 0;
> > +}
> 
> 


