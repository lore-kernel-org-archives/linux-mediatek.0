Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eVg+406eTsolKdS/7Duz/rtJ3Q0pxBhkIljEXOiK+Q=; b=jNhA6MPniT2r9XuO500BK3R/hr
	6Xttx+UmhlFtjvW+9xY7mkcQ6Zu1JR3xaTwh6G/hx+QxM6aHkBgQgNa/spVJr6h2mw0XkWodgfdJq
	sNdhqBIybOvuKsnLAIL0/qzhGhwjyfi9A/AGglNzcdTe3rBHoT++kMriJhSFsoJ7PQdPoZFqF6JGx
	0QgVufphta/PqA20f60/VzdSZlXfe8CeZqYrq6HqbG5KlCVoVuKDmLjXQCWWLl9qCZ8g0qiH9zVdA
	Llyipd/QV4jYg/SuodpLBSGdS4D4Pth2/KYOawMnBw5uLAgpiTd/fdrm7LiBJBEXPPqX2w07zgTye
	4f1Lkt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBv1R-00ClLy-OP; Thu, 14 Jul 2022 09:20:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBv1P-00ClJm-8s; Thu, 14 Jul 2022 09:20:36 +0000
X-UUID: 7222eb78d50849dc97315fa9540e0938-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:92581aa0-7fa3-4fa6-a358-c312d5c07724,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:fbc7f932-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7222eb78d50849dc97315fa9540e0938-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2062221574; Thu, 14 Jul 2022 02:20:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 17:09:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 17:09:22 +0800
Message-ID: <1f698bb3d5d50a6e508cd48e905c8c69415c2fd9.camel@mediatek.com>
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
Date: Thu, 14 Jul 2022 17:09:22 +0800
In-Reply-To: <24726b8a5994961b966cf90b1f56c71a844d274a.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
	 <24726b8a5994961b966cf90b1f56c71a844d274a.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_022035_323648_4D18F452 
X-CRM114-Status: GOOD (  28.77  )
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

On Thu, 2022-07-14 at 14:51 +0800, CK Hu wrote:
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
> > +static int mtk_dp_train_tps_2_3(struct mtk_dp *mtk_dp, u8
> > target_linkrate,
> > +				u8 target_lane_count, int
> > *iteration_count,
> > +				u8 *lane_adjust,  int *status_control,
> > +				u8 *prev_lane_adjust)
> > +{
> > +	u8 val;
> > +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> > +
> > +	if (*status_control == 1) {
> > +		if (mtk_dp->train_info.tps4) {
> > +			mtk_dp_train_set_pattern(mtk_dp, 4);
> > +			val = DP_TRAINING_PATTERN_4;
> > +		} else if (mtk_dp->train_info.tps3) {
> > +			mtk_dp_train_set_pattern(mtk_dp, 3);
> > +			val = DP_LINK_SCRAMBLING_DISABLE |
> > +				DP_TRAINING_PATTERN_3;
> > +		} else {
> > +			mtk_dp_train_set_pattern(mtk_dp, 2);
> > +			val = DP_LINK_SCRAMBLING_DISABLE |
> > +				DP_TRAINING_PATTERN_2;
> > +		}
> > +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> > +				   DP_TRAINING_PATTERN_SET, val);
> > +		drm_dp_dpcd_read(&mtk_dp->aux,
> > +				 DP_ADJUST_REQUEST_LANE0_1,
> > lane_adjust,
> > +				 sizeof(*lane_adjust) * 2);
> > +
> > +		mtk_dp_train_update_swing_pre(mtk_dp,
> > +					      target_lane_count,
> > lane_adjust);
> > +		*status_control = 2;
> > +		(*iteration_count)++;
> > +	}
> > +
> > +	drm_dp_link_train_channel_eq_delay(&mtk_dp->aux, mtk_dp-
> > > rx_cap);
> > 
> > +
> > +	drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);
> > +
> > +	if (!drm_dp_clock_recovery_ok(link_status, target_lane_count)) 
> 
> I think this checking is redundant. I think we could just keep
> drm_dp_channel_eq_ok() and drop drm_dp_clock_recovery_ok() here
> because
> if drm_dp_clock_recovery_ok() fail, it imply that
> drm_dp_channel_eq_ok() would fail. So just check
> drm_dp_channel_eq_ok()
> is enough.
> 
> Regards,
> CK
> 
> > {
> > +		mtk_dp->train_info.cr_done = false;
> > +		mtk_dp->train_info.eq_done = false;
> > +		dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (drm_dp_channel_eq_ok(link_status, target_lane_count)) {
> > +		mtk_dp->train_info.eq_done = true;
> > +		dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> > +		return 0;
> > +	}
> > +

Hello CK,

do you mean like this?
if (drm_dp_channel_eq_ok(link_status, target_lane_count)) {
  mtk_dp-
>train_info.eq_done = true;
  dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
  return 0;
} else {
  mtk_dp->train_info.cr_done = false;
  mtk_dp->train_info.eq_done = false;
  dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
  return -EINVAL;
}

BRs,
Bo-Chen

> > +	if (*prev_lane_adjust == link_status[4])
> > +		(*iteration_count)++;
> > +	else
> > +		*prev_lane_adjust = link_status[4];
> > +
> > +	return -EAGAIN;
> > +}
> > +
> 
> 


