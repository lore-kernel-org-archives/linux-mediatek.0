Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F8EC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 21:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41732084D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 21:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eaTj6zEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41732084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYTPRLm4be0gXFeCaQQToYL+pgfIQsdLuiV4HyFyiEs=; b=eaTj6zEHBHesU7
	LjOfgwIkN31m2zoG0lqxBQ1fQM/ZMkah4PJfunmzJglWTRkusdUMBoA3Hd0b2AREEh19TGWwPKb1H
	HgzlKbrab2ZVM7LBjSN7kPw+QWSbj7gPvqnxy3B6oIwCdrhfEzhYh2x+4161P6yq8nw8UDhdp96Xl
	RyehA3qk3WnOc0kQWuWrI1xzmUf7jp4aHRWKg7ogMPebNxdJhHQwKDrBetxMLIaPgXVuYY0ahNAkT
	2G6liGyf2RwssbMLzLqH9fmlpQFMw9skX5rjQm4EdMQkxc8nFxlOf+g2pgPQRmsilPzEmuMF5q6UH
	FTuXZASVmYhJmI6XbqYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irq1T-0004PL-Bp; Wed, 15 Jan 2020 21:16:19 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irq1Q-0002tc-F3
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 21:16:18 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1D865804E5;
 Wed, 15 Jan 2020 22:14:05 +0100 (CET)
Date: Wed, 15 Jan 2020 22:14:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v8 2/8] drm/panel: support for BOE tv101wum-nl6 wuxga dsi
 video mode panel
Message-ID: <20200115211404.GC28904@ravnborg.org>
References: <20200115135958.126303-1-jitao.shi@mediatek.com>
 <20200115135958.126303-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115135958.126303-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=qFe5Z7MAUKcRMEBcnwwA:9 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_131616_884565_611C1D19 
X-CRM114-Status: GOOD (  10.85  )
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
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

> +
> +static int boe_panel_add(struct boe_panel *boe)
> +{
> +	struct device *dev = &boe->dsi->dev;
> +	int err;
> +
> +	boe->avdd = devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(boe->avdd))
> +		return PTR_ERR(boe->avdd);
> +
> +	boe->avee = devm_regulator_get(dev, "avee");
> +	if (IS_ERR(boe->avee))
> +		return PTR_ERR(boe->avee);
> +
> +	boe->pp1800 = devm_regulator_get(dev, "pp1800");
> +	if (IS_ERR(boe->pp1800))
> +		return PTR_ERR(boe->pp1800);
> +
> +	boe->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(boe->enable_gpio)) {
> +		dev_err(dev, "cannot get reset-gpios %ld\n",
> +			PTR_ERR(boe->enable_gpio));
> +		return PTR_ERR(boe->enable_gpio);
> +	}
> +
> +	gpiod_set_value(boe->enable_gpio, 0);
> +
> +	err = drm_panel_of_backlight(&boe->base);
> +	if (err)
> +		return err;
From the descrition of drm_panel_of_backlight():

""
drm_panel_of_backlight() must be called after the call to drm_panel_init().
""

Please do as documented.

	Sam

> +
> +	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	boe->base.funcs = &boe_panel_funcs;
> +	boe->base.dev = &boe->dsi->dev;
> +
> +	return drm_panel_add(&boe->base);
> +}
> +
> +static int boe_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_panel *boe;
> +	int ret;
> +	const struct panel_desc *desc;
> +
> +	boe = devm_kzalloc(&dsi->dev, sizeof(*boe), GFP_KERNEL);
> +	if (!boe)
> +		return -ENOMEM;
> +
> +	desc = of_device_get_match_data(&dsi->dev);
> +	dsi->lanes = desc->lanes;
> +	dsi->format = desc->format;
> +	dsi->mode_flags = desc->mode_flags;
> +	boe->desc = desc;
> +	boe->dsi = dsi;
> +	ret = boe_panel_add(boe);
> +	if (ret < 0)
> +		return ret;
> +
> +	mipi_dsi_set_drvdata(dsi, boe);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&boe->base);
> +
> +	return ret;
> +}
> +
> +static void boe_panel_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
> +
> +	drm_panel_disable(&boe->base);
> +	drm_panel_unprepare(&boe->base);
> +}
> +
> +static int boe_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	boe_panel_shutdown(dsi);
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> +
> +	if (boe->base.dev)
> +		drm_panel_remove(&boe->base);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id boe_of_match[] = {
> +	{ .compatible = "boe,tv101wum-nl6",
> +	  .data = &boe_tv101wum_nl6_desc
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, boe_of_match);
> +
> +static struct mipi_dsi_driver boe_panel_driver = {
> +	.driver = {
> +		.name = "panel-boe-tv101wum-nl6",
> +		.of_match_table = boe_of_match,
> +	},
> +	.probe = boe_panel_probe,
> +	.remove = boe_panel_remove,
> +	.shutdown = boe_panel_shutdown,
> +};
> +module_mipi_dsi_driver(boe_panel_driver);
> +
> +MODULE_AUTHOR("Jitao Shi <jitao.shi@mediatek.com>");
> +MODULE_DESCRIPTION("BOE tv101wum-nl6 1200x1920 video mode panel driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
