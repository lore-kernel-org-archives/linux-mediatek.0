Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB8CC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 07:07:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105BD2082F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 07:07:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d21odwFc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ij1BKawu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105BD2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTBM6HKgkfpuTh0ULhlKCZsxta+Rou4O+UPghIFvwkQ=; b=d21odwFcUYbSfZ
	pn1ZqiNGKbKdqMREUF+CW9gcBxDZqwe2LKVTId9hZJW05i1zNK+Mnh1NNw6b8lLudxXd8FizTdZtx
	0oBLPK49TMCd/eBENRfOAAYQpvLdEkCZ2y76owSJd6Lfot33hO2atiIkrjAILQbEHNb88Y8zpbu5m
	KvPXJ7zNYlwm/TBGdhzavUW35Jqyfr2ZzFNXZiraunId10bZl4ZTwEAaOIqLR4SySwihL0ygPdBVX
	46RZ5L7l/GV8spNyP0rsS6h8676LrOupH8uTTU0rCFyFYe9wurXMsJPfOooi0+0q6lVzBXdwV5fyU
	+AiIShCJwCGcP8QCHLXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2V4c-00021p-MB; Fri, 14 Feb 2020 07:07:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2V4T-0001uV-Ml; Fri, 14 Feb 2020 07:07:31 +0000
X-UUID: 8507b27d505242bcbb5c8bc6580aa21a-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AAKmt3psV2g2K8EVhgPpwHcYTt/PyKL1ctLHR7lIS6k=; 
 b=ij1BKawuDxx6m4M9NOhNWshiLpr6/8t96cXtzq1Ezlt///aK3HTxOLs7egK+M9Rdfjos+YMM/x6/EHsZrwNSMHMcOQkxDUgfnghJTOhqRE24YTwcFwyCdda4awt7XIBdU/8AiJMVE7crCaqWcaau5pxfAziSFj9rW89jheQLhoE=;
X-UUID: 8507b27d505242bcbb5c8bc6580aa21a-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 907225622; Thu, 13 Feb 2020 23:07:25 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 23:07:37 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 15:06:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 15:07:21 +0800
Message-ID: <1581664042.20487.4.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 15:07:22 +0800
In-Reply-To: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_230729_752057_7B3DD55D 
X-CRM114-Status: GOOD (  16.44  )
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

Hi, Tzung-Bi:

On Thu, 2020-02-13 at 15:59 +0800, Tzung-Bi Shih wrote:
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
> plugged_cb and codec_dev are also in danger of race condition.  Instead
> of using mutex to protect them:
> - Checks NULLs first.
> - Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
>   after codec_dev).
> - Uses codec_dev as a signal to report HDMI jack status.
> 
> Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Previous discussion: https://patchwork.kernel.org/patch/11367625/
> Previous attempt: https://patchwork.kernel.org/patch/11378413/
> 
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 03aeb73005ef..b1e5d0c538fa 100644
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
> -	if (hdmi->plugged_cb && hdmi->codec_dev)
> +	mutex_lock(&hdmi->update_plugged_status_lock);
> +	connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +	if (hdmi->codec_dev)
>  		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
>  
>  	return connected ?
>  	       connector_status_connected : connector_status_disconnected;
> @@ -1669,8 +1674,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
>  {
>  	struct mtk_hdmi *hdmi = data;
>  
> -	hdmi->plugged_cb = fn;
> -	hdmi->codec_dev = codec_dev;
> +	if (!fn || !codec_dev)

I think sound driver could be removed for some reason, and fn should be
set to NULL before sound driver removed. In this case, codec_dev != NULL
and fn == NULL.

Regards,
CK

> +		return -EINVAL;
> +
> +	/* Use WRITE_ONCE() to prevent store tearing. */
> +	WRITE_ONCE(hdmi->plugged_cb, fn);
> +	WRITE_ONCE(hdmi->codec_dev, codec_dev);
>  	mtk_hdmi_update_plugged_status(hdmi);
>  
>  	return 0;
> @@ -1729,6 +1738,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
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
