Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACD4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 02:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux0jnOGaCi5AGrAY19TwPwOvzXhzBjxY3Du8pDQHwZU=; b=Q/llBPDQb2uJuimz5Z7S/5Qo+B
	+eQpp8wqOjJU2q567rCbGXHBtAciT6cYcOrOIW/8L9jA0RMM1M0UbnUHt/uv3D3yoRyv1Vxwy1ceo
	chRhcqLaNDx//ozOFmWSsTLIIoJYdGiqYZztXnzxvdRijgRoZ7V/KeUlHSV0OGq8tFv/rPvU2kx6H
	xSyyOxhyrcPscf3SpdHrxawrdeOb0NFHdvWg8howHWjlRjLLRlNtI6lxlnV0JeCceAmDuiah2J/KR
	3uFvjwlsZUpYUPRjDNihWfZ+UG9p09PgOpaOOV8vaSkRG7KH12U59/KKyy8ku3V8rUd0NIOEU4zd8
	c2KMDfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMG3-00FJhC-4U; Thu, 21 Jul 2022 02:49:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMG0-00FJd7-IE; Thu, 21 Jul 2022 02:49:46 +0000
X-UUID: 506d772de97a4f4380b3dfbf20c0cb99-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:67993510-cefa-4f16-a932-550db7df4a7b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:2da08933-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 506d772de97a4f4380b3dfbf20c0cb99-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340642119; Wed, 20 Jul 2022 19:49:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 21 Jul 2022 10:38:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 21 Jul 2022 10:38:59 +0800
Message-ID: <7b1a555ab62aec8c3f5717b8827c81a2076bf569.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
	<angelogioacchino.delregno@collabora.com>, LiangXu Xu
 =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?= <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 21 Jul 2022 10:38:59 +0800
In-Reply-To: <05e7ace27af21d141c1ecd79fb45f6e5e9d32582.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
	 <05e7ace27af21d141c1ecd79fb45f6e5e9d32582.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_194944_620937_F611E33A 
X-CRM114-Status: GOOD (  27.95  )
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

On Fri, 2022-07-15 at 16:51 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
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
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> > +{
> > +	ssize_t ret;
> > +	u8 sink_count;
> > +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> > +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> > +	u32 link_status_reg = DP_LANE0_1_STATUS;
> > +
> > +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> > &sink_count);
> 
> According to your last reply, if drm_dp_dpcd_readb() fail, we could
> skip below statement. So this just for error checking? If so, the
> next
> drm_dp_dpcd_read() would also do the error checking, so the checking
> here is redundant.
> 
> Regards,
> CK
> 

Hello CK,

sorry, I don't get your point.
We use "drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg, &sink_count)"
to get sink count and use "drm_dp_dpcd_read(&mtk_dp->aux,
link_status_reg, link_status, sizeof(link_status));" to get link
status.

If we don't get any sink count, we don't need to check the link status.
Therefore, we just return if we are failed to get sink count.

BRs,
Bo-Chen

> > +	if (ret < 1) {
> > +		drm_err(mtk_dp->drm_dev, "Read sink count failed\n");
> > +		return;
> > +	}
> > +
> > +	drm_dbg(mtk_dp->drm_dev,
> > +		"read sink count from dpcd: %d\n", sink_count);
> > +
> > +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> > link_status,
> > +			       sizeof(link_status));
> > +	if (!ret) {
> > +		drm_err(mtk_dp->drm_dev, "Read link status failed\n");
> > +		return;
> > +	}
> > +
> > +	if (!drm_dp_channel_eq_ok(link_status, mtk_dp-
> > > train_info.lane_count)) {
> > 
> > +		drm_err(mtk_dp->drm_dev, "Channel EQ failed\n");
> > +		return;
> > +	}
> > +
> > +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> > +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> > DP_DEVICE_SERVICE_IRQ_VECTOR,
> > +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> > +}
> > +
> 
> 


