Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABAC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 18:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNymKOoqcg3pGTMnfjGRMvDmuCkOCa01F2ZxFC/A6/w=; b=AxYkyoJIbOFsRY+HzcgksOnoDr
	CgYaDxRbIJJZFVpSBWST2IPfHpW9ufq+kNt7y2NHXJbdIj1xb/GDKiVi8wQ5VaABj9T0+kVMRyBLa
	UPF/OvXxO9f4sDUkPIYkNyNUx5Ki35lP9DAoXu0wakMrNjIFsowY7dUaSbi/+nxBl9o+SUQ3HbRa2
	LRcQPB4ga6/W36CJb6cOXho0Cz3Ufc7m/TqSGzdMV7KsouhjHDnVKqZ1uxLv6hl3L2J0cv68byAJb
	rfVk7qOs1UZb0iffPMWHVvMIz1SGqOGxZwy7/u1168RWJYqGGpKWRhIgcGhgoBxAt7nWRhCqzsp/Y
	QMFML/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4nlc-003QAJ-W9; Fri, 24 Jun 2022 18:10:53 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4nlQ-003Q0o-7N
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 18:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=VNymKOoqcg3pGTMnfjGRMvDmuCkOCa01F2ZxFC/A6/w=;
	b=W96F2JjHh8CDcsJSZvfKw5C4AGufkvTf+lF8ecT/ZguDNkCJCdIVF/3xcGS5qEXVtkVKA+clvSb0S
	 42vavh7CYg9GA9awDHJ9ZUcBaRdc0zunoMdqlPhe/wNWpr/tExfuiI0IXK9Kyk5TvlucCdPw3gg8XE
	 eFs7+Pgbbgp6uvmyp7I7MMJdr9THlvG5vj3w0JypQqGumcyxf41cgser+QdAF0wZ8XDzfQz8SzHJaY
	 vhv7P74zi1icGvbX2N9ISNw5L84gmWd0AOLdtXm57v+vtw9wfRYGIJUxmfvIYNdcBr0LHBUgs4XK0C
	 7p9ztRCzhQRwHFtzPrRyYVFRbpDey5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=VNymKOoqcg3pGTMnfjGRMvDmuCkOCa01F2ZxFC/A6/w=;
	b=1b5J72DSnPYK8nZWg70GlTAiNPwhCRsGn6Xj/QYy6JxRwSLhHbirlBE7WXSYi3R1NhtqiwNoZMBMG
	 dxYuiu9AQ==
X-HalOne-Cookie: c7b4917d86e3993e0abb9103ff3df1cade167dbb
X-HalOne-ID: ee825b54-f3e8-11ec-8233-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id ee825b54-f3e8-11ec-8233-d0431ea8bb10;
	Fri, 24 Jun 2022 18:10:30 +0000 (UTC)
Date: Fri, 24 Jun 2022 20:10:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: allen <allen.chen@ite.com.tw>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	Kenneth Hung <Kenneth.Hung@ite.com.tw>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
	David Airlie <airlied@linux.ie>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Robert Foss <robert.foss@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Pin-yen Lin <treapking@chromium.org>,
	Hermes Wu <Hermes.Wu@ite.com.tw>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH] drm/bridge: add it6505 driver read config from dt
 property
Message-ID: <YrX+FOAycejw8wV0@ravnborg.org>
References: <20220623093154.52701-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623093154.52701-1-allen.chen@ite.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_111040_570405_64388957 
X-CRM114-Status: GOOD (  21.68  )
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

Hi allen.

On Thu, Jun 23, 2022 at 05:31:54PM +0800, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> add read max-lane and max-pixel-clock from dt property
> 
> Signed-off-by: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
Can you fix so your s-o-b mail and author mail matches?
As it is now an error is flagged as they do not match.

	Sam

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 35 ++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 4b673c4792d77..c9121d4635a52 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -436,6 +436,8 @@ struct it6505 {
>  	bool powered;
>  	bool hpd_state;
>  	u32 afe_setting;
> +	u32 max_dpi_pixel_clock;
> +	u32 max_lane_count;
>  	enum hdcp_state hdcp_status;
>  	struct delayed_work hdcp_work;
>  	struct work_struct hdcp_wait_ksv_list;
> @@ -1466,7 +1468,8 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
>  	it6505->lane_count = link->num_lanes;
>  	DRM_DEV_DEBUG_DRIVER(dev, "Sink support %d lanes training",
>  			     it6505->lane_count);
> -	it6505->lane_count = min_t(int, it6505->lane_count, MAX_LANE_COUNT);
> +	it6505->lane_count = min_t(int, it6505->lane_count,
> +				   it6505->max_lane_count);
>  
>  	it6505->branch_device = drm_dp_is_branch(it6505->dpcd);
>  	DRM_DEV_DEBUG_DRIVER(dev, "Sink %sbranch device",
> @@ -2895,7 +2898,7 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		return MODE_NO_INTERLACE;
>  
> -	if (mode->clock > DPI_PIXEL_CLK_MAX)
> +	if (mode->clock > it6505->max_dpi_pixel_clock)
>  		return MODE_CLOCK_HIGH;
>  
>  	it6505->video_info.clock = mode->clock;
> @@ -3057,6 +3060,8 @@ static void it6505_parse_dt(struct it6505 *it6505)
>  {
>  	struct device *dev = &it6505->client->dev;
>  	u32 *afe_setting = &it6505->afe_setting;
> +	u32 *max_lane_count = &it6505->max_lane_count;
> +	u32 *max_dpi_pixel_clock = &it6505->max_dpi_pixel_clock;
>  
>  	it6505->lane_swap_disabled =
>  		device_property_read_bool(dev, "no-laneswap");
> @@ -3072,7 +3077,31 @@ static void it6505_parse_dt(struct it6505 *it6505)
>  	} else {
>  		*afe_setting = 0;
>  	}
> -	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %d", *afe_setting);
> +
> +	if (device_property_read_u32(dev, "max-lane-count",
> +				     max_lane_count) == 0) {
> +		if (*max_lane_count > 4 || *max_lane_count == 3) {
> +			dev_err(dev, "max lane count error, use default");
> +			*max_lane_count = MAX_LANE_COUNT;
> +		}
> +	} else {
> +		*max_lane_count = MAX_LANE_COUNT;
> +	}
> +
> +	if (device_property_read_u32(dev, "max-dpi-pixel-clock",
> +				     max_dpi_pixel_clock) == 0) {
> +		if (*max_dpi_pixel_clock > 297000) {
> +			dev_err(dev, "max pixel clock error, use default");
> +			*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
> +		}
> +	} else {
> +		*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
> +	}
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %u, max_lane_count: %u",
> +			     it6505->afe_setting, it6505->max_lane_count);
> +	DRM_DEV_DEBUG_DRIVER(dev, "using max_dpi_pixel_clock: %u kHz",
> +			     it6505->max_dpi_pixel_clock);
>  }
>  
>  static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
> -- 
> 2.25.1

