Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7DCC33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503DA20848
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fzhHVGRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 503DA20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doQgp1USw7brm5ZcijXBayB32GUrEaOb/DCFOiNRIC0=; b=fzhHVGRsCpBKJT
	TjG0VgLXa1Mys0ZqertQqARf/RgzP1Luvcv2HS6z1uyhuoXbxr0ZlvagVyir90g3nIeYRjMPlos0c
	9AjWzy4Wna22w0qeFgyb4rrTZN9j/NB8Ths2L6gkzzUxtffiZ8a1FUrf8fsf+l4RxPfg8CRQ8FePc
	XHgj8/TEqWFXIy58eGKRh64+LqsGN9mhQQTmkt97xxoxdkaelGp3Aq6tVmcuGspUMnpNcZp69me3x
	n7eclpVCkn3LhakLQHhgKPbkeBCIWDvGVieDHxEJg4vYLTLRjsf+cE8mzPE2adO/rnwjKntneOf17
	hy045r3nHvVCTRXzP5LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io47i-0002qw-Fw; Sun, 05 Jan 2020 11:31:10 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io47f-0002qb-2Z
 for linux-mediatek@lists.infradead.org; Sun, 05 Jan 2020 11:31:09 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EC42D20052;
 Sun,  5 Jan 2020 12:31:04 +0100 (CET)
Date: Sun, 5 Jan 2020 12:31:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 4/8] drm/panel: support for auo,kd101n80-45na wuxga
 dsi video mode panel
Message-ID: <20200105113103.GA16043@ravnborg.org>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
 <20191012030720.27127-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012030720.27127-5-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=Hn34YwpbHf-pG3iUBb8A:9 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_033107_482488_D536D0AD 
X-CRM114-Status: GOOD (  21.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

A few comments in the following.

	Sam

On Sat, Oct 12, 2019 at 11:07:16AM +0800, Jitao Shi wrote:
> Auo,kd101n80-45na's connector is same as boe,tv101wum-nl6.
> The most codes can be reuse.
> So auo,kd101n80-45na and boe,tv101wum-nl6 use one driver file.
> Add the different parts in driver data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  6 +-
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 86 ++++++++++++++++---
>  2 files changed, 75 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index afcadb3585fb..0e887c978796 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -19,13 +19,13 @@ config DRM_PANEL_ARM_VERSATILE
>  	  in the Versatile family syscon registers.
>  
>  config DRM_PANEL_BOE_TV101WUM_NL6
> -	tristate "BOE TV101WUM 1200x1920 panel"
> +	tristate "BOE TV101WUM and AUO KD101N80 45NA 1200x1920 panel"
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	help
> -	  Say Y here if you want to support for BOE TV101WUM WUXGA PANEL
> -	  DSI Video Mode panel
> +	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
> +	  45NA WUXGA PANEL DSI Video Mode panel
>  
>  config DRM_PANEL_LVDS
>  	tristate "Generic LVDS panel driver"
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index af68236ea0e8..e6457f87bc61 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -35,6 +35,7 @@ struct panel_desc {
>  	enum mipi_dsi_pixel_format format;
>  	const struct panel_init_cmd *init_cmds;
>  	unsigned int lanes;
> +	bool discharge_on_disable;
>  };
>  
>  struct boe_panel {
> @@ -372,6 +373,15 @@ static const struct panel_init_cmd boe_init_cmd[] = {
>  	{},
>  };
>  
> +static const struct panel_init_cmd auo_kd101n80_45na_init_cmd[] = {
> +	_INIT_DELAY_CMD(24),
> +	_INIT_DCS_CMD(0x11),
> +	_INIT_DELAY_CMD(120),
> +	_INIT_DCS_CMD(0x29),
> +	_INIT_DELAY_CMD(120),
> +	{},
> +};
> +
>  static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
>  {
>  	return container_of(panel, struct boe_panel, base);
> @@ -452,20 +462,30 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>  	if (!boe->prepared)
>  		return 0;
>  
> -	ret = boe_panel_off(boe);
> -	if (ret < 0) {
> -		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> -		return ret;
> +	if (boe->desc->discharge_on_disable) {
> +		msleep(150);
> +		regulator_disable(boe->avee);
> +		regulator_disable(boe->avdd);
> +		usleep_range(5000, 7000);
> +		gpiod_set_value(boe->enable_gpio, 0);
> +		usleep_range(5000, 7000);
> +		regulator_disable(boe->pp1800);

The panel is not put into sleep mode in this case.
(Done by boe_panel_off() - which is not the most descriptive name for
that function).
If this is on purpose then consider adding a comment.


> +	} else {
> +		ret = boe_panel_off(boe);
> +		if (ret < 0) {
> +			dev_err(panel->dev, "failed to set panel off: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		msleep(150);
> +		gpiod_set_value(boe->enable_gpio, 0);
> +		usleep_range(500, 1000);
> +		regulator_disable(boe->avee);
> +		regulator_disable(boe->avdd);
> +		usleep_range(5000, 7000);
> +		regulator_disable(boe->pp1800);
>  	}
>  
> -	msleep(150);
> -	gpiod_set_value(boe->enable_gpio, 0);
> -	usleep_range(500, 1000);
> -	regulator_disable(boe->avee);
> -	regulator_disable(boe->avdd);
> -	usleep_range(5000, 7000);
> -	regulator_disable(boe->pp1800);
> -
>  	boe->prepared = false;
>  
>  	return 0;
> @@ -495,10 +515,14 @@ static int boe_panel_prepare(struct drm_panel *panel)
>  	if (ret < 0)
>  		goto poweroffavdd;
>  
> -	msleep(100);
> +	usleep_range(5000, 10000);
>  
>  	gpiod_set_value(boe->enable_gpio, 1);
> -	usleep_range(10000, 12000);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(boe->enable_gpio, 0);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(boe->enable_gpio, 1);
> +	usleep_range(6000, 10000);

This looks like a geneeral change.
Consider pushing to the initial commit.
>  
>  	ret = boe_panel_init(boe);
>  	if (ret < 0) {
> @@ -530,6 +554,8 @@ static int boe_panel_enable(struct drm_panel *panel)
>  	if (boe->enabled)
>  		return 0;
>  
> +	msleep(130);
> +
>  	ret = backlight_enable(boe->backlight);
>  	if (ret) {
>  		dev_err(panel->dev, "Failed to enable backlight %d\n",
> @@ -567,6 +593,35 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
>  	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>  		      MIPI_DSI_MODE_LPM,
>  	.init_cmds = boe_init_cmd,
> +	.discharge_on_disable = false,
> +};
> +
> +static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
> +	.clock = 157000,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 80,
> +	.hsync_end = 1200 + 80 + 24,
> +	.htotal = 1200 + 80 + 24 + 36,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 16,
> +	.vsync_end = 1920 + 16 + 4,
> +	.vtotal = 1920 + 16 + 4 + 16,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc auo_kd101n80_45na_desc = {
> +	.modes = &auo_kd101n80_45na_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = auo_kd101n80_45na_init_cmd,
> +	.discharge_on_disable = true,
>  };
>  
>  static int boe_panel_get_modes(struct drm_panel *panel)
> @@ -693,6 +748,9 @@ static const struct of_device_id boe_of_match[] = {
>  	{ .compatible = "boe,tv101wum-nl6",
>  	  .data = &boe_tv101wum_nl6_desc
>  	},
> +	{ .compatible = "auo,kd101n80-45na",
> +	  .data = &auo_kd101n80_45na_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
