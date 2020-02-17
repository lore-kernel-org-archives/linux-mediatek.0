Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BF0C35242
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47321206E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cUD2WFh1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gFbOVRIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47321206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4mjUEBSc2DgUINiWVTtvwoGW2fDo6v5SeEJqT9UhVA=; b=cUD2WFh1DzPPUZ
	Cm5tyltgQ1RJ45RvXTEGkKMhP0ceDyrFv36f4q0T51rUtUPyiffUBMWsA/aQS82aacdm8ezTPJrLy
	RH9P7b1XJCuGOwSmXfTfI0VbWBvbbQQjjD6bKB8Bm5dwJ6OIGpmkFnFsWBeJdEP4XgB+tRMR+VbvD
	ayPzTZRboFsvZT3dy//erC9XEXq7i31J5M1Z+EoGU9bECLMW/ZsVCWGpHt61jcS+0JGaaAxN57y3P
	M8EsWyzLBB2R92gG8C+A+ewdvOJZ74ABvmgf76A17dQ1BvSwXF+Fk2eNroRm08rZVpQgcEVkBzJna
	p+PkfwL9fX5RBK8IxZBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3XMZ-0001M3-Ts; Mon, 17 Feb 2020 03:46:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3XLs-0000qD-Ot; Mon, 17 Feb 2020 03:45:47 +0000
X-UUID: f8ec10930c894453bd64bd6fd6cfe2b1-20200216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t94t8oVrB/2x1V0xqotqa7NVwVrZU5xruUOUaNPm/Ck=; 
 b=gFbOVRIfs89aOPosJ7mvekkKq5sEBx1Hdsy8fEb3HeB6MnqVWYt6cN6wxDemI+95zAVePzF+g+tXzbrccuA9GvEhEkAeRlo1oN/wmQJ8JS1M9RhCIDqmjWTnkZMCBVG63ZVrnkSN360Ee5sLf2zTLVWd52v1lvMl/CLEKxl/ngg=;
X-UUID: f8ec10930c894453bd64bd6fd6cfe2b1-20200216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 905077273; Sun, 16 Feb 2020 19:45:33 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 16 Feb 2020 19:44:39 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 11:44:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 11:43:55 +0800
Message-ID: <1581911058.12629.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/2] drm/mediatek: fix race condition for HDMI jack
 status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:44:18 +0800
In-Reply-To: <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
References: <20200217031653.52345-1-tzungbi@google.com>
 <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_194545_806940_DA602E40 
X-CRM114-Status: GOOD (  15.86  )
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
Cc: alsa-devel@alsa-project.org, p.zabel@pengutronix.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 dgreid@google.com, linux-arm-kernel@lists.infradead.org, cychiang@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Tzhung-Bi:

On Mon, 2020-02-17 at 11:16 +0800, Tzung-Bi Shih wrote:
> hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
> by different threads.
> 
> Imaging the following calling sequence:
>            Thread A                            Thread B
> --------------------------------------------------------------------
> mtk_hdmi_audio_hook_plugged_cb()
> mtk_cec_hpd_high() -> disconnected
>                                      hdmi_conn_detect()
>                                      mtk_cec_hpd_high() -> connected
>                                      plugged_cb(connected)
> plugged_cb(disconnected)
> 
> The latest disconnected is false reported.  Makes mtk_cec_hpd_high
> and plugged_cb atomic to fix.
> 
> Also uses the same lock to protect read/write of plugged_cb and codec_dev.
> 
> Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")

This patch looks good to me, but please merge this patch with the patch
it fix.

Regards,
CK

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 03aeb73005ef..d80017e3d84a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/mutex.h>
>  #include <linux/of_platform.h>
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
> @@ -171,6 +172,7 @@ struct mtk_hdmi {
>  	bool enabled;
>  	hdmi_codec_plugged_cb plugged_cb;
>  	struct device *codec_dev;
> +	struct mutex update_plugged_status_lock;
>  };
>  
>  static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
> @@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
>  static enum drm_connector_status
>  mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
>  {
> -	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +	bool connected;
>  
> +	mutex_lock(&hdmi->update_plugged_status_lock);
> +	connected = mtk_cec_hpd_high(hdmi->cec_dev);
>  	if (hdmi->plugged_cb && hdmi->codec_dev)
>  		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
>  
>  	return connected ?
>  	       connector_status_connected : connector_status_disconnected;
> @@ -1669,8 +1674,11 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
>  {
>  	struct mtk_hdmi *hdmi = data;
>  
> +	mutex_lock(&hdmi->update_plugged_status_lock);
>  	hdmi->plugged_cb = fn;
>  	hdmi->codec_dev = codec_dev;
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
> +
>  	mtk_hdmi_update_plugged_status(hdmi);
>  
>  	return 0;
> @@ -1729,6 +1737,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	mutex_init(&hdmi->update_plugged_status_lock);
>  	platform_set_drvdata(pdev, hdmi);
>  
>  	ret = mtk_hdmi_output_init(hdmi);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
