Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F675C2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 08:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A6920714
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 08:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uTHl4V9N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oLhNGi+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60A6920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fg/XVLBK1rWauLzUoua9fNBWSPIbfC6OqIEOA2gU4M=; b=uTHl4V9N5qeMK5
	nskpSmD4MuThQSw7qfYY99ZH7ATMAveLJDKEyKgnfecwhJ+PoVZwHdoL4x0j0kBeoKIXH9bp13lQU
	m4aSgtrd0q/z19qDIVcAPFm39z9R/i9KH37T6wXld3FP85aHJohWoD+WangaKOtYmnsBtu5s0XfJ5
	J2/r6mI9uSWRryGhY9mHZyiZv1dYfQcULMaMZCAaq6cOMeqVh4KpjKKfphajCdRbSIDC/XQ6C+gEp
	TCToEknycOIz62dxzcCiR2FSpW27RhU9WGDbr97K1PUI6/bmR7OCUE4/LgHGOpTQbnX5grknVEYJW
	2VG5Mh2iigPk5tbrAcVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1nF6-0007GG-Iz; Wed, 12 Feb 2020 08:19:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1nF3-0007Fi-6S; Wed, 12 Feb 2020 08:19:30 +0000
X-UUID: 1177e930cf794b7484d5f6296ab89741-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WTR3IyGTtiHoAq1wxcteE4V4GBjK4qM6cnQ1Vs7Y5e4=; 
 b=oLhNGi+I+Rma92S81fCP0y77PVdsTJDZmWur1Ou+uMLG7m1Jjf1OSTtFg9/apKKesd4YcQWwFvOEniTA4bZZ191ouvazyElHbawHgrd0FLQ1m5aWyVC4I88H8cZNSGOVi3Fy7+iJ+qyGp4Lll98mWkoZZFKurC+uXxqF3kTA6+4=;
X-UUID: 1177e930cf794b7484d5f6296ab89741-20200212
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1332018070; Wed, 12 Feb 2020 00:19:17 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 00:19:25 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 16:17:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Feb 2020 16:19:42 +0800
Message-ID: <1581495554.22603.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 12 Feb 2020 16:19:14 +0800
In-Reply-To: <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_001929_248736_5688E53B 
X-CRM114-Status: GOOD (  16.17  )
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Tzung-Bi:

On Thu, 2020-02-06 at 11:17 +0800, Tzung-Bi Shih wrote:
> 1.
> Provides a callback (i.e. mtk_hdmi_audio_hook_plugged_cb) to hdmi-codec.
> When ASoC machine driver calls hdmi_codec_set_jack_detect(), the
> callback will be invoked to save plugged_cb and codec_dev parameters.
> 
> +---------+  set_jack_  +------------+ plugged_cb  +----------+
> | machine | ----------> | hdmi-codec | ----------> | mtk-hdmi |
> +---------+  detect()   +------------+ codec_dev   +----------+
> 
> 2.
> When there is any jack status changes, mtk-hdmi will call the
> plugged_cb() to notify hdmi-codec.  And then hdmi-codec will call
> snd_soc_jack_report().
> 
> +----------+ plugged_cb  +------------+
> | mtk-hdmi | ----------> | hdmi-codec | -> snd_soc_jack_report()
> +----------+ codec_dev   +------------+
>              connector_status
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 23c2b0e8693d..fccdd975947d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -169,6 +169,8 @@ struct mtk_hdmi {
>  	bool audio_enable;
>  	bool powered;
>  	bool enabled;
> +	hdmi_codec_plugged_cb plugged_cb;
> +	struct device *codec_dev;
>  };
>  
>  static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
> @@ -1194,13 +1196,23 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
>  	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
>  }
>  
> +static enum drm_connector_status
> +mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
> +{
> +	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +
> +	if (hdmi->plugged_cb && hdmi->codec_dev)
> +		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +
> +	return connected ?
> +	       connector_status_connected : connector_status_disconnected;
> +}
> +
>  static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
>  						  bool force)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> -
> -	return mtk_cec_hpd_high(hdmi->cec_dev) ?
> -	       connector_status_connected : connector_status_disconnected;
> +	return mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
>  static void hdmi_conn_destroy(struct drm_connector *conn)
> @@ -1648,20 +1660,36 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
>  	return 0;
>  }
>  
> +static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
> +					  hdmi_codec_plugged_cb fn,
> +					  struct device *codec_dev)
> +{
> +	struct mtk_hdmi *hdmi = data;
> +
> +	hdmi->plugged_cb = fn;
> +	hdmi->codec_dev = codec_dev;
> +	mtk_hdmi_update_plugged_status(hdmi);

I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
called in different thread. So it's necessary to use a mutex to protect
this.

Regards,
CK

> +
> +	return 0;
> +}
> +
>  static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
>  	.hw_params = mtk_hdmi_audio_hw_params,
>  	.audio_startup = mtk_hdmi_audio_startup,
>  	.audio_shutdown = mtk_hdmi_audio_shutdown,
>  	.digital_mute = mtk_hdmi_audio_digital_mute,
>  	.get_eld = mtk_hdmi_audio_get_eld,
> +	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
>  };
>  
>  static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>  	struct hdmi_codec_pdata codec_data = {
>  		.ops = &mtk_hdmi_audio_codec_ops,
>  		.max_i2s_channels = 2,
>  		.i2s = 1,
> +		.data = hdmi,
>  	};
>  	struct platform_device *pdev;
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
