Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65505C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 06:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ifgp8XQJuQ7Qx/6Y+QsVqWttUXrIxQuwDhtERHC98EY=; b=1UnGjzU1zSmtzL
	ZO4jaf/OvXHt4XkjiQ4AZKYHVZ5QYkqfBAlrVPdXVIwrG13QA+H0ZuMVMgWqLbUWUo7384Ji6nEpw
	htSCU4m5557kVCZKaKqyiZfwumweWM+DyaSXhiTXRXA1gh7o2D260AX338n8KsLJVE78+WDFEe3eD
	GPcJrtukD5TUUeW+9cBh4y1Qg8SpnGFlSDnRyp6XFvtroeXcBpqPIrzdXqe4EufhCHY83F06IMDEo
	3jq6qeGbOjfD7LIX/xI+f0MFohKRtEaO4GYSwkQxemR0yFpqApJtE/swRfOo4VNnrGFJF3Qj9cbk9
	CJUTe5FOg3PhNkA93Rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUNSY-00BipV-A9; Wed, 16 Mar 2022 06:48:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUNST-00BioE-32; Wed, 16 Mar 2022 06:48:36 +0000
X-UUID: bf3eb1e912e14a80b2e284946dfb419c-20220315
X-UUID: bf3eb1e912e14a80b2e284946dfb419c-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998626393; Tue, 15 Mar 2022 23:48:27 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 23:48:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 14:48:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 14:48:24 +0800
Message-ID: <75015615bbd69d68e42c1fff70872ebc4bd48be5.camel@mediatek.com>
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
 <linux-fbdev@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Mar 2022 14:48:24 +0800
In-Reply-To: <20220218145437.18563-18-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-18-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_234833_184507_C9D823D2 
X-CRM114-Status: GOOD (  24.69  )
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

Hello Guillaume,

Thanks for your patch, and here is some tests we do and I will explain
the HPD deboucing. Maybe you can put these in commit message next time:

From the DP spec 1.4a chapter 3.3, upstream devices should implement
HPD signal de-bouncing on an external connection.
A period of 100ms should be used for detecting an HPD connect event.
To cover these cases, HPD de-bounce should be implemented only after
HPD low has been detected for 100ms.

Therefore,
1. If HPD low (which means plugging out) is more than 100ms,
   we need to do de-bouncing (which means we need to wait for 100ms).
2. If HPD low is less than 100ms,
   we don't need to care about the de-bouncing.

In this patch, we can see the timer start to count 100ms and clear the
need_debounce to false.

There will be two situation when HPD high:
1. If the timer is expired (which means it's more than 100ms):
   - need_debounce will be set as true.
   - When HPD high (plugging event comes), need_debounce will be true
     and then we need to do de-bouncing (wait for 100ms).
2. If the timer is not expired (which means it's less than 100ms):
   - need_debounce keeps as false.
   - When HPD high (plugging event comes), need_debounce will be false
     and no need to do de-bouncing.

HPD_______             __________________
          |            |<-  100ms   ->
          |____________|
          <-  100ms   ->

Original issue is that we do not implement the HPD de-bouncing and the
device (Dell Adapter - USB-C to HDMI) will not be detected.
After applying this patch, we can detect the device
(Dell Adapter - USB-C to HDMI) successfully.

We test the following devices and they can be detected successfully:
- Dell Adapter - USB-C to HDMI
- Acer 1in1 HDMI dongle
- Ugreen 1in1 HDMI dongle
- innowatt HDMI + USB3 hub
- Acer 2in1 HDMI dongle
- Apple 3in1 HDMI dongle (A2119)
- J5Create 3in1 HDMI dongle (JAC379)

Tested-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

BRs,
Rex
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
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
