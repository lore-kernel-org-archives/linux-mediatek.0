Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B680AC46467
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Jan 2023 20:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKwJoKKJXwc7yt9ypgLP9wcR/2GEiXgGzz9+CO4kFl8=; b=OnxJScGbMUchHAKcBfXg6zv1qn
	e1Hp+0jCsSjpyF4AaFqD7oexTK7L+AQ66/eHUteXI31HruKbx2v6urOMqFKyGde1aOOAAntaKRBR5
	6+UHiw4qAK17lYpX6eTbAUgS17MCM1vGoVovGaP9oxj8Ej0tnKNsMZ4xUb65uPAXyC8lzjoD/Qtgg
	5Dnqz3ppohgrjSZfvIkn0T/ZvD6Ys0bX6mSV0NRXwo09A06NQOC0f/B+Mol0dmJSmrNJvN7VEU37V
	TvqIxwXsRFumx/SdqO6BHcsGW1G3bmuM3nmtPjbWAF7fUHO0mI8tq0PxYnCy3uNeEZ0O14RHwhAVw
	6A7TNVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEG3z-008KnA-WE; Sat, 07 Jan 2023 20:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEG3x-008Kla-Rd
	for linux-mediatek@bombadil.infradead.org; Sat, 07 Jan 2023 20:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OKwJoKKJXwc7yt9ypgLP9wcR/2GEiXgGzz9+CO4kFl8=; b=LYhhMu7fxdnOsqKoTLXIy2ZkX6
	pgrjYd3eEeO4Csm+so1piYMQqu73Fj92RRMa7uVhAeAmc18iFS9JI/VRI3mdsz5f03j/FJPROFRwn
	MFg7ycgFRbB1EUJHwdZTGRvo8bjMiPRLIhfz+vS4p2wItkbNyGlP5qK3NCbd80UxdTreKW4FP6Zds
	9O9uIWqWCUbsv1xFTzkVOoMOIlhFMy/ziecilbmS4ehrUpdRSMfsflsXxy5JovAu8PBnwsnuSPs21
	ZmB1AaG3HJL8P1e3BfZVKKeLuN98gbe0q82/tOge+el1b/oAvcEHj4ZFgqdMz84Nil6PxMPc/dVeB
	rSjN/2gQ==;
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:402::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEG3j-002Cw9-2s
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Jan 2023 20:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=OKwJoKKJXwc7yt9ypgLP9wcR/2GEiXgGzz9+CO4kFl8=;
	b=kvdfOG7QHhfJrWGUORioRmy9O0xW4kcyiToa4UkWwBhfJyJBLZAbK7qWZ3J4A1OE2jhg0+CAPnO6y
	 VzxY4CJvPmA2ebBnUSQMqbGKD/oCmixb/Dl14hRDNPNaZUETuhtlyb/8/hJZIIw5M8CLVT4hdbY8AZ
	 ZBS+rOnUTePDqkkUWcpB/QVET/01rsz3NVyf5EbrqA//mpSVgxtv2E3oPYKr5vWNGjAoRDMp4Zj+10
	 eVuJCM0n66qq42In7qobcKCMM9rlhwzzzrdqOUl9CaVifYp2Uh5BsMORq/oGDWScW+quu0JEQQIjPt
	 be7SA6GitieZs5wOvouDZ5kqyhT+P0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=OKwJoKKJXwc7yt9ypgLP9wcR/2GEiXgGzz9+CO4kFl8=;
	b=hnooveo3yjFo0mVbCvtInFozqKRmSzDRj3x/a4FgiV25pZ8/9l53+QW05rDSy5Zwng5tzOzL63pKc
	 eFUbSxnBg==
X-HalOne-ID: dfa8968f-8ec9-11ed-b757-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay3 (Halon) with ESMTPSA
	id dfa8968f-8ec9-11ed-b757-ede074c87fad;
	Sat, 07 Jan 2023 20:28:43 +0000 (UTC)
Date: Sat, 7 Jan 2023 21:28:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yangcong <yangcong5@huaqin.corp-partner.google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
Message-ID: <Y7nV+aeFiq5aD0xU@ravnborg.org>
References: <20230106030108.2542081-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106030108.2542081-1-swboyd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_204458_078859_DE312B20 
X-CRM114-Status: GOOD (  32.54  )
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

Hi Stephen.

On Thu, Jan 05, 2023 at 07:01:08PM -0800, Stephen Boyd wrote:
> The unprepare sequence has started to fail after moving to panel bridge
> code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> 
>    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> 
> This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> to set the panel into sleep mode. Performing those writes in the
> unprepare phase of bridge ops is too late, because the link has already
> been torn down by the DSI controller in post_disable, i.e. the PHY has
> been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> on the DSI .
> 
> Split the unprepare function into a disable part and an unprepare part.
> For now, just the DSI writes to enter sleep mode are put in the disable
> function. This fixes the panel off routine and keeps the panel happy.
> 
> My Wormdingler has an integrated touchscreen that stops responding to
> touch if the panel is only half disabled too. This patch fixes it. And
> finally, this saves power when the screen is off because without this
> fix the regulators for the panel are left enabled when nothing is being
> displayed on the screen.
The pattern we use in several (but not all) panel drivers are that
errors in unprepare/disable are logged but the function do not skip
the remainder of the function. This is to avoid that we do not disable
power supplies etc.

For this case we could ask ourself if the display needs to enter sleep
mode right before we disable the regulator. But if the regulator is
fixed, so the disable has no effect, this seems OK.

Please fix the unprepare to not jump out early, on top of or together
with the other fix.

	Sam

> 
> Fixes: 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 857a2f0420d7..c924f1124ebc 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1193,14 +1193,11 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
>  	return 0;
>  }
>  
> -static int boe_panel_unprepare(struct drm_panel *panel)
> +static int boe_panel_disable(struct drm_panel *panel)
>  {
>  	struct boe_panel *boe = to_boe_panel(panel);
>  	int ret;
>  
> -	if (!boe->prepared)
> -		return 0;
> -
>  	ret = boe_panel_enter_sleep_mode(boe);
>  	if (ret < 0) {
>  		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> @@ -1209,6 +1206,16 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>  
>  	msleep(150);
>  
> +	return 0;
> +}
> +
> +static int boe_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct boe_panel *boe = to_boe_panel(panel);
> +
> +	if (!boe->prepared)
> +		return 0;
> +
>  	if (boe->desc->discharge_on_disable) {
>  		regulator_disable(boe->avee);
>  		regulator_disable(boe->avdd);
> @@ -1528,6 +1535,7 @@ static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *pa
>  }
>  
>  static const struct drm_panel_funcs boe_panel_funcs = {
> +	.disable = boe_panel_disable,
>  	.unprepare = boe_panel_unprepare,
>  	.prepare = boe_panel_prepare,
>  	.enable = boe_panel_enable,
> 
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> -- 
> https://chromeos.dev

