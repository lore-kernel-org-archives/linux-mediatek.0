Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D69C87FD1
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4Kz+0M++8wkHThtIz8edv/c+YcSRG12fi9jswJR/MU=; b=q9f6QoPj0kcwTt2BF1Q1I87gqQ
	UukjNL9NorOrCBCHcYIYnAryTyM/TKGUrMwFJxTs7aomv9zE3mXBXVD098TdMcjB5cRtToOwogDSB
	DBuUNF3THXOXra/jefCyLeK4nzr9SQS0IwCjvmJn6QzRrsCOLneXB+lyhOKRdx7MCZu1UaW2bRMST
	pVf+0/93J8AHr3zY0Tb+5O7gVlj4EgeWfOo0pCvrJxyq/QtTjOtmrLueF0mi8Qfo3NNpcubGiFn1O
	kISpMbawIDdjsVURxqEtmbRuXdC1DrEZNZKMeQqgWmiZ+e9sdZ3YgfXE+I0Kf3bY6ubqlkDOIMuSu
	aXwPJhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCGx-0000000C2gQ-10PI;
	Tue, 05 Aug 2025 07:39:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCGu-0000000C2fJ-0Kel
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Aug 2025 07:39:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1ujCGr-0005yg-GC; Tue, 05 Aug 2025 09:39:41 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1ujCGr-00C0KZ-0d;
	Tue, 05 Aug 2025 09:39:41 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1ujCGr-00A7fC-02;
	Tue, 05 Aug 2025 09:39:41 +0200
Date: Tue, 5 Aug 2025 09:39:40 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Christian Gromm <christian.gromm@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Daniel Almeida <daniel.almeida@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 29/65] media: allegro: Access v4l2_fh from file
Message-ID: <aJG1PC0poVY-QZRb@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Christian Gromm <christian.gromm@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Daniel Almeida <daniel.almeida@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-29-eb140ddd6a9d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250802-media-private-data-v1-29-eb140ddd6a9d@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_003944_291607_E04D2E8B 
X-CRM114-Status: GOOD (  24.63  )
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

Hi Jacopo,

On Sat, 02 Aug 2025 11:22:51 +0200, Jacopo Mondi wrote:
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> While at it remove the only left user of fh_to_channel() and remove
> the macro completely.

Thanks for the cleanup!

Minor suggestion below, but even without it

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 5e3b1f5d7206d84b8ccb9ea3b3f3f1fe75becf99..81c6afcf2d06f9e39015e49d355346238c5033d8 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -197,8 +197,6 @@ static const struct regmap_config allegro_sram_config = {
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> -#define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
> -
>  struct allegro_channel {
>  	struct allegro_dev *dev;
>  	struct v4l2_fh fh;
> @@ -3284,7 +3282,7 @@ static int allegro_enum_fmt_vid(struct file *file, void *fh,
>  static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  
>  	f->fmt.pix.field = V4L2_FIELD_NONE;
>  	f->fmt.pix.width = channel->width;
> @@ -3326,7 +3324,7 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
>  static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	struct vb2_queue *vq;
>  	int err;
>  
> @@ -3350,7 +3348,7 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
>  static int allegro_g_fmt_vid_out(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  
>  	f->fmt.pix.field = V4L2_FIELD_NONE;
>  
> @@ -3397,7 +3395,7 @@ static int allegro_try_fmt_vid_out(struct file *file, void *fh,
>  static int allegro_s_fmt_vid_out(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	int err;
>  
>  	err = allegro_try_fmt_vid_out(file, fh, f);
> @@ -3438,7 +3436,7 @@ static int allegro_channel_cmd_start(struct allegro_channel *channel)
>  static int allegro_encoder_cmd(struct file *file, void *fh,
>  			       struct v4l2_encoder_cmd *cmd)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	int err;
>  
>  	err = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
> @@ -3488,7 +3486,7 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
>  				  enum v4l2_buf_type type)
>  {
>  	struct v4l2_fh *fh = file_to_v4l2_fh(file);
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);

You could remove the local fh entirely, if you change

	return v4l2_m2m_streamon(file, fh->m2m_ctx, type);

to

	return v4l2_m2m_streamon(file, channel->fh.m2m_ctx, type);

in the allegro_ioctl_streamon() function.

Michael

>  	int err;
>  
>  	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> @@ -3503,7 +3501,7 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
>  static int allegro_g_parm(struct file *file, void *fh,
>  			  struct v4l2_streamparm *a)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	struct v4l2_fract *timeperframe;
>  
>  	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> @@ -3520,7 +3518,7 @@ static int allegro_g_parm(struct file *file, void *fh,
>  static int allegro_s_parm(struct file *file, void *fh,
>  			  struct v4l2_streamparm *a)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	struct v4l2_fract *timeperframe;
>  	int div;
>  
> 
> -- 
> 2.49.0
> 
> 

