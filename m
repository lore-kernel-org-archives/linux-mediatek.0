Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB4FC33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:32:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD6A20848
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPBGwTev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD6A20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJuBxELlv734PdsvfVig1WeIWDwh8C4c1BD+/SIqm8Q=; b=PPBGwTevygocDv
	X8/DltpNWJ+l2FzgI9PyBOWaTJjgrPt0kxHKn5dxWZPTL/a4bnZLHxBBoaYtYpl68qbLR44J3YW4L
	5rx/oncCi+pPnqhgs0/ZPNzxJL4a3vucUfeN7bTT6a8dHtYW2TVwii6VizDdb8kXltc2xirdGvKnZ
	stfqPbACuPOGneLLnqM+m0WVETuo6UoDoJFjLAChr7+FsvRG1nZbH4c9+RaveWzIIYugqIihan/RW
	Z+CHfVpmnu2uNPVIDXpLlIdouy5iuS94vF79TSjQzx/oFUM+B1x004hT0K5/Ao4DjGJLIvvyQwcuC
	EwlI0IdEhW2oLlfmUpvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io48T-0002vs-Vc; Sun, 05 Jan 2020 11:31:57 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io48R-0002vJ-Ln
 for linux-mediatek@lists.infradead.org; Sun, 05 Jan 2020 11:31:57 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BF8F820055;
 Sun,  5 Jan 2020 12:31:53 +0100 (CET)
Date: Sun, 5 Jan 2020 12:31:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 6/8] drm/panel: support for boe, tv101wum-n53 wuxga dsi
 video mode panel
Message-ID: <20200105113152.GB16043@ravnborg.org>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
 <20191012030720.27127-7-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012030720.27127-7-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=7gkXJVJtAAAA:8 a=8PYDNBx85CIz2eXB0hYA:9 a=CjuIK1q_8ugA:10
 a=6heAxKwa5pAsJatQ0mat:22 a=E9Po1WZjFZOl8hwRPBS3:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_033155_892676_6BDBBA8C 
X-CRM114-Status: GOOD (  14.49  )
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

Looks good.

On Sat, Oct 12, 2019 at 11:07:18AM +0800, Jitao Shi wrote:
> Boe,tv101wum-n53's connector is same as boe,tv101wum-nl6.
> The most codes can be reuse.
> So boe,tv101wum-n53 and boe,tv101wum-nl6 use one driver file.
> Add the different parts in driver data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index e6457f87bc61..7b47619675f5 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -624,6 +624,34 @@ static const struct panel_desc auo_kd101n80_45na_desc = {
>  	.discharge_on_disable = true,
>  };
>  
> +static const struct drm_display_mode boe_tv101wum_n53_default_mode = {
> +	.clock = 159833,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 114,
> +	.hsync_end = 1200 + 114 + 10,
> +	.htotal = 1200 + 114 + 10 + 40,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 19,
> +	.vsync_end = 1920 + 19 + 4,
> +	.vtotal = 1920 + 19 + 4 + 10,
> +	.vrefresh = 60,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc boe_tv101wum_n53_desc = {
> +	.modes = &boe_tv101wum_n53_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = boe_init_cmd,
> +};
> +
>  static int boe_panel_get_modes(struct drm_panel *panel)
>  {
>  	struct boe_panel *boe = to_boe_panel(panel);
> @@ -751,6 +779,9 @@ static const struct of_device_id boe_of_match[] = {
>  	{ .compatible = "auo,kd101n80-45na",
>  	  .data = &auo_kd101n80_45na_desc
>  	},
> +	{ .compatible = "boe,tv101wum-n53",
> +	  .data = &boe_tv101wum_n53_desc
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
