Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BEAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fllp2T0Fy7FDFsY2BODmviSm5/RppXQueTySbPy9xTM=; b=fCxyfZAPEicjp06ww5HX36Lh9N
	NPfmlemsDZg4MMtTEgEcrLjcJp9Iv7jY1XRagsoOx4xDxOo3hFJMKClE3jYV2ZMLjsNl3PIYEKBxv
	g6yllB+ffQeAHarKuQ71FR6GZJRHhNZGVh4ajsJSkvQkRqVro1qEZyDgaDK+yxGwiQtOpzoSATF94
	d23Zc1k/lsZWJzucbpo8/uQekSFPTJeWHAgxXVQkz7pIGcPkBwrCAhhMvuTFDjf9ge9pKm/QCs6RW
	YRVZ+SUneoqf3ciMpoqd2VBgr0KPqwGGMLaYrhVzkFJ3aINYs5Sz5mANfRnNII1PYolz9GL1ET4wd
	hC/2LB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvXQ-008NQf-Pq; Mon, 25 Jul 2022 10:42:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvXO-008NNt-9x; Mon, 25 Jul 2022 10:42:11 +0000
X-UUID: 84f20832325c470a8b77e0f1f9bdceda-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:01deb6af-bd65-4f39-b30f-a7a875763f4e,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:9b2ae0d3-912a-458b-a623-74f605a77e93,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 84f20832325c470a8b77e0f1f9bdceda-20220725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 966429852; Mon, 25 Jul 2022 03:42:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 17:51:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 17:51:11 +0800
Message-ID: <f0c930400e4a5b3723df2d257cc4bc51ee7a2806.camel@mediatek.com>
Subject: Re: [PATCH v14 06/10] drm/mediatek: Add MT8195 External DisplayPort
 support
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
Date: Mon, 25 Jul 2022 17:51:11 +0800
In-Reply-To: <20220712111223.13080-7-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-7-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_034210_389853_09EF2484 
X-CRM114-Status: GOOD (  16.39  )
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

On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP
> driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> @@ -1489,13 +1543,34 @@ static int mtk_dp_init_port(struct mtk_dp
> *mtk_dp)
>  static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>  {
>  	struct mtk_dp *mtk_dp = dev;
> +	int event;
> +
> +	event = mtk_dp_plug_state(mtk_dp) ?
> +		connector_status_connected :
> connector_status_disconnected;
> +
> +	if (event < 0)
> +		return IRQ_HANDLED;

event is useless, so drop it.

Regards,
CK

> +
> +	dev_dbg(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
> +	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
>  
>  	if (mtk_dp->train_info.cable_state_change) {
>  		mtk_dp->train_info.cable_state_change = false;
>  
> -		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -				   DP_PWR_STATE_MASK);
> +		if (!mtk_dp->train_info.cable_plugged_in) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
> +
> +			mtk_dp_update_bits(mtk_dp,
> MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL,
> +					   DP_PWR_STATE_MASK);
> +		} else {
> +			mtk_dp_update_bits(mtk_dp,
> MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL_LA
> NE,
> +					   DP_PWR_STATE_MASK);
> +		}
>  	}
>  
>  	if (mtk_dp->train_info.irq_sta.hpd_inerrupt) {
> @@ -1597,6 +1672,24 @@ static int mtk_dp_dt_parse(struct mtk_dp
> *mtk_dp,
>  	return 0;
>  }
>  


