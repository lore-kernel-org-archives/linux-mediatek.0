Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E62C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZn0LiTdQtU+I+p0i68hg8qrgMO2nDoGgZHQrMDan0c=; b=TVEzVUqIAmRP0y
	KX2rhcFnI8Yqpnw9ymyHM7MP3zvFS8+v3sXNAWX7063Y1tDBBJbzf1t6ql+K5k2LflevHn617u2hB
	aGqQxtHEoFtRCn8r/yTwOTdI+nhe2j9SsV3qdbUpS5zi/S7fcKPsCzZN0qZBl2OA/enRrK8VjSxlD
	CuHfmHZEmqYEkwvzsTMLsyRRXPkBW7CwEDFhlaOyHZSJzEum59Kq20My3/CUYqBj9teh62b7e0aso
	t1aoM7zjLiBYE7zbwuo7rH0O01VMyGsx2lKYuyhgtw3ODQpILaHCu97U/oBttXrqMIeWJH04qcpPB
	HZRwnx4qXes9frpU63bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWCQF-006oYb-4m; Mon, 21 Mar 2022 07:25:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWCPV-006oJZ-8P; Mon, 21 Mar 2022 07:25:04 +0000
X-UUID: 030567ac65544feeafb518f5e19c86ec-20220321
X-UUID: 030567ac65544feeafb518f5e19c86ec-20220321
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1114861679; Mon, 21 Mar 2022 00:24:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 00:24:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Mar 2022 15:24:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 15:24:52 +0800
Message-ID: <dae3ccb3e2f658418d6b1c061181a0b9291c108f.camel@mediatek.com>
Subject: Re: [PATCH v8 17/19] drm/mediatek: add hpd debounce
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
 <deller@gmx.de>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>
Date: Mon, 21 Mar 2022 15:24:52 +0800
In-Reply-To: <20220218145437.18563-18-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-18-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_002501_340712_4CF91E85 
X-CRM114-Status: GOOD (  18.57  )
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

On Fri, 2022-02-18 at 15:54 +0100, Guillaume Ranquet wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> Implement the DP HDP debounce described in DP 1.4a 3.3.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2a3d5f15b651b..fe91ab8b2fd89 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -178,6 +178,8 @@ struct mtk_dp {
>  	struct device *codec_dev;
>  	u8 connector_eld[MAX_ELD_BYTES];
>  	struct drm_connector *conn;
> +	bool need_debounce;
> +	struct timer_list debounce_timer;
>  };
>  
>  static struct regmap_config mtk_dp_regmap_config = {
> @@ -1698,6 +1700,9 @@ static irqreturn_t mtk_dp_hpd_event_thread(int
> hpd, void *dev)
>  	if (event < 0)
>  		return IRQ_HANDLED;
>  
> +	if (mtk_dp->need_debounce && mtk_dp-
> >train_info.cable_plugged_in)
> +		msleep(100);
> +
>  	if (mtk_dp->drm_dev) {
>  		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
>  		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> @@ -1776,6 +1781,13 @@ static irqreturn_t
> mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
>  	}
>  	train_info->cable_state_change = true;
>  
> +	if (train_info->cable_state_change) {
> +		if (!train_info->cable_plugged_in) {
> +			mod_timer(&mtk_dp->debounce_timer, jiffies +
> msecs_to_jiffies(100) - 1);
> +			mtk_dp->need_debounce = false;
> +		}
> +	}
> +
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -2239,6 +2251,13 @@ static const struct drm_bridge_funcs
> mtk_dp_bridge_funcs = {
>  	.detect = mtk_dp_bdg_detect,
>  };
>  
> +static void mtk_dp_debounce_timer(struct timer_list *t)
> +{
> +	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
> +
> +	mtk_dp->need_debounce = true;
> +}
> +
>  static int mtk_dp_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dp *mtk_dp;
> @@ -2319,6 +2338,9 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  	else
>  		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
> +	mtk_dp->need_debounce = true;
> +	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
> +
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> @@ -2332,6 +2354,7 @@ static int mtk_dp_remove(struct platform_device
> *pdev)
>  	platform_device_unregister(mtk_dp->phy_dev);
>  
>  	mtk_dp_video_mute(mtk_dp, true);
> +	del_timer_sync(&mtk_dp->debounce_timer);
>  
>  	pm_runtime_disable(&pdev->dev);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
