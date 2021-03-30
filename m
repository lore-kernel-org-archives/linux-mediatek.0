Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6284C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:48:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D8A56195D
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D8A56195D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xZm6xe4PtYM+EdQWnG/LmkKvHVfWjXaKFfo+HNUgPtA=; b=Ayx2vsZM++bBPgWnmWb1mDe6/
	7b8lwbs0bg0C5Q9pmxx42nvJMGQvU/rHGgyYby6gEaeREw/W8qoaHyseGnX3XZU71Lm5thyDQFCbN
	2iAELQqlxfKtYq4wJjm7sdrLaeBCdcsJPdK+9XGpAjCBnCEUE5OO0upLDlh9ATi40E9X5YSyS3rLI
	5Ew1tAEhu5lyLyOtFZilNSASNyzqrUiZ1yjBEehB8KdjC23hwQCXAO0oPoF+BindkHRCIrr2hkSf2
	lyWvVQ6+fn1+GIL6U8fwaWTmppMX6cBTiju+YH1c7ra+G7jwHoEN7WmKgydGASvPaCJZtffDoUo9s
	50MwV1vGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR3Tr-002N5w-It; Tue, 30 Mar 2021 01:47:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR1yL-0028A8-TJ
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 00:11:11 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 132E0102;
 Tue, 30 Mar 2021 02:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617063064;
 bh=OtmjXysaK3jwvqRhlDAGqT+DeH6Z5I5DdTqxmZqQzOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFsXz7fd5fP8gpej7uSTUYBcJLg0TeErPBtcFQN+5msxzpmNK4thZeGxyQ3JP8fSn
 MYJ/ito/BRdqhFFVZtKGhF3h/qcyQSDZAN4HrJD58FSfzSOX3ozGstIO2YBuvbGOY6
 DoMas8msWu84ewY7ZreWkz9nUvsFeXaUiSrjjY+Q=
Date: Tue, 30 Mar 2021 03:10:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 dafna3@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, enric.balletbo@collabora.com
Subject: Re: [PATCH v2 3/3] drm/mediatek: in struct mtk_hdmi, replace conn
 field with curr_conn ptr
Message-ID: <YGJsa1LaiCzVrzCn@pendragon.ideasonboard.com>
References: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
 <20210329153632.17559-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329153632.17559-4-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_011110_098750_EF68CED5 
X-CRM114-Status: GOOD (  23.02  )
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

Hi Dafna,

Thank you for the patch.

On Mon, Mar 29, 2021 at 05:36:32PM +0200, Dafna Hirschfeld wrote:
> The mtk_hdmi does not support creating a bridge with a connector.
> Therefore the field 'conn' should be removed from the mtk_hdmi struct.
> It is replaced with a pointer curr_conn that points to the current
> connector which can be access through the global state.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

The patch looks good to me, but I'd squash it with 2/3 otherwise I think
you'll break bisection. On the other hand, given that the HDMI support
is already broken... :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But you need to make sure this patch will get backported to stable along
2/3, probably by adding a fixes tag. Or squashing it with 2/3, up to
you.

> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 1eeb211b1536..0d95d2cfe3de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -153,7 +153,7 @@ struct mtk_hdmi_conf {
>  struct mtk_hdmi {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
> -	struct drm_connector conn;
> +	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
>  	struct device *dev;
>  	const struct mtk_hdmi_conf *conf;
>  	struct phy *phy;
> @@ -969,7 +969,7 @@ static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
>  	ssize_t err;
>  
>  	err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
> -						       &hdmi->conn, mode);
> +						       hdmi->curr_conn, mode);
>  	if (err < 0) {
>  		dev_err(hdmi->dev,
>  			"Failed to get AVI infoframe from mode: %zd\n", err);
> @@ -1049,7 +1049,7 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>  	ssize_t err;
>  
>  	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame,
> -							  &hdmi->conn, mode);
> +							  hdmi->curr_conn, mode);
>  	if (err) {
>  		dev_err(hdmi->dev,
>  			"Failed to get vendor infoframe from mode: %zd\n", err);
> @@ -1322,6 +1322,8 @@ static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>  	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
>  	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
>  
> +	hdmi->curr_conn = NULL;
> +
>  	hdmi->enabled = false;
>  }
>  
> @@ -1385,8 +1387,13 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
>  static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>  					  struct drm_bridge_state *old_state)
>  {
> +	struct drm_atomic_state *state = old_state->base.state;
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> +	/* Retrieve the connector through the atomic state. */
> +	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
> +								   bridge->encoder);
> +
>  	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
>  	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
>  	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
> @@ -1625,8 +1632,10 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
>  {
>  	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>  
> -	memcpy(buf, hdmi->conn.eld, min(sizeof(hdmi->conn.eld), len));
> -
> +	if (hdmi->enabled)
> +		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
> +	else
> +		memset(buf, 0, len);
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
