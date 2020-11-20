Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17410C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 00:30:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FED122240
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 00:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQMlcdUU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC/Qm7TK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FED122240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P6xib7UGHLN+/uaobrHhbj5WmBaiQxRj0qGGlRS6i+0=; b=bQMlcdUUZlukIvdh22g3XAaQh
	h90a99a57lU975+MzHLKPDNcT+imM9QWmRtcboJsSLDbnbXXjL1/GC9I+xUDr1lFZOVWHYEeWi2im
	24aQVP/1qcqCGtnJW5aEXiOgTpMLjz9sk5KmoFC9ifCxFQJggv+Va9j7BzymBNH16gPqBlEqipNH9
	w7P7gWpMS9Vejxp+COtXrL46chqbmlCvVIZFKeNIwyS+kJJ2v4w4JmgSRZlRJ3fq6uf3IoUtbUbwm
	0xl7dJAGi09d5nZAmtT1Jg2l94L2v+ptuRuN/3KzBLxGVg1713JKT+3pZOjwwhWaQUrGRXhCSpaSI
	OeMLFfJig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfuJU-0006KL-73; Fri, 20 Nov 2020 00:30:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfuJN-0006JC-K2
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 00:30:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id c198so6950363wmd.0
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2020 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVDijfDshOZ5EX5JCLPn1kfMb9n0yaU32SCV2DQVsFg=;
 b=dC/Qm7TK0SdC/clTSEdXr+ZlvFVP6/r3El7Nj1d85rGH0xWL4QXS/SQmTtEHILh9YP
 YzWHTlI9/+08wfIiXcVSPNk4Oyo0c0oTXUP+OHKR8PC4/+irR6FX3xGZDbucyPxOF6XC
 TFHDhg10JUjzcHvg/NLWA2mBhPB44RbYU+ngMNqwotrIC0P6wSNOs7PArgE0rqkQeEEf
 xLN8Ep0UUjTav28YLp11bWjs8VKmSq8nDgW7v+YXnzQef/BqP0LhqY6fO/aZSiCgz1CQ
 uiIlxdF31UHobu8ieTnDNdtRem1oVC+3+Uz1V9I8Mjl+XxuqdBQgpwmFau0frUlWh56o
 jB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tVDijfDshOZ5EX5JCLPn1kfMb9n0yaU32SCV2DQVsFg=;
 b=XNa3Xg8HDfqK5bbpM4SpSFKA81QDxaDLKGEl7syIaBlvoPZsnBO6N2oJG9J+uUoGGj
 khutA+8S1BeWNJ0In03ZYYsN+GHCEJgQ6IEq86zKKSuvunaduQJsZXdvntbwGCW45MAB
 xdMxQ+uqZMuxLol+A0bakpJLLQUDYScErTeTR7g/GAAnb2lh1WpwNVXz5wOI1F377a76
 DOLPntSf3fnBGJxvvsLaUK3NU9YOhTfPt41/hz9UB65pHdhvRzSubn+xF4IpnL84i+Mm
 poqAlTh/6r1QPhnDdWE5JruM/REgI3XR7vtvkgGIFkNcFjXcEr+I+0jt3uwErij8/+uh
 uZ0Q==
X-Gm-Message-State: AOAM531mpItS8Z2DDzq956OGIQZeq9gG6jRFfLvHsUsCKoRqUi6M0sND
 +u8hRP8Ii/JfXze/HP5i8ko=
X-Google-Smtp-Source: ABdhPJyxtKzKptFTtq9dzV6T1By5V/tWzrHZ3dAmfuqSv6J1FS5yP9p5uuDSbEtaaBzYolhgL2Ff7g==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr7044795wmj.109.1605832199186; 
 Thu, 19 Nov 2020 16:29:59 -0800 (PST)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id 89sm2554633wrp.58.2020.11.19.16.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 16:29:58 -0800 (PST)
Date: Fri, 20 Nov 2020 05:29:50 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH] drm/mediatek: dsi: Modify horizontal front/back porch
 byte formula
Message-ID: <20201120052950.0ca597fb@a-VirtualBox>
In-Reply-To: <20201119232335.6704-1-chunkuang.hu@kernel.org>
References: <20201119232335.6704-1-chunkuang.hu@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_193001_678364_4F6B5C34 
X-CRM114-Status: GOOD (  19.78  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK, 

On Fri, 20 Nov 2020 07:23:35 +0800
Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:

> From: CK Hu <ck.hu@mediatek.com>
> 
> In the patch to be fixed, horizontal_backporch_byte become to large
> for some panel, so roll back that patch. For small hfp or hbp panel,
> using vm->hfront_porch + vm->hback_porch to calculate
> horizontal_backporch_byte would make it negtive, so
> use horizontal_backporch_byte itself to make it positive.
> 
> Fixes: 35bf948f1edb ("drm/mediatek: dsi: Fix scrolling of panel with
> small hfp or hbp")
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 61
> +++++++++++------------------- 1 file changed, 22 insertions(+), 39
> deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c index 4a188a942c38..65fd99c528af
> 100644 --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -444,7 +444,10 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) u32 horizontal_sync_active_byte;
>  	u32 horizontal_backporch_byte;
>  	u32 horizontal_frontporch_byte;
> +	u32 horizontal_front_back_byte;
> +	u32 data_phy_cycles_byte;
>  	u32 dsi_tmp_buf_bpp, data_phy_cycles;
> +	u32 delta;
>  	struct mtk_phy_timing *timing = &dsi->phy_timing;
>  
>  	struct videomode *vm = &dsi->vm;
> @@ -466,50 +469,30 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) horizontal_sync_active_byte = (vm->hsync_len *
> dsi_tmp_buf_bpp - 10); 
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -		horizontal_backporch_byte = vm->hback_porch *
> dsi_tmp_buf_bpp;
> +		horizontal_backporch_byte = vm->hback_porch *
> dsi_tmp_buf_bpp - 10; else
>  		horizontal_backporch_byte = (vm->hback_porch +
> vm->hsync_len) *
> -					    dsi_tmp_buf_bpp;
> +					    dsi_tmp_buf_bpp - 10;
>  
>  	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> -			  timing->da_hs_zero + timing->da_hs_exit;
> -
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> -		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >
> -		    data_phy_cycles * dsi->lanes + 18) {
> -			horizontal_frontporch_byte =
> -				vm->hfront_porch * dsi_tmp_buf_bpp -
> -				(data_phy_cycles * dsi->lanes + 18) *
> -				vm->hfront_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -
> -			horizontal_backporch_byte =
> -				horizontal_backporch_byte -
> -				(data_phy_cycles * dsi->lanes + 18) *
> -				vm->hback_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -		} else {
> -			DRM_WARN("HFP less than d-phy, FPS will
> under 60Hz\n");
> -			horizontal_frontporch_byte =
> vm->hfront_porch *
> -						     dsi_tmp_buf_bpp;
> -		}
> +			  timing->da_hs_zero + timing->da_hs_exit +
> 3; +
> +	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 :
> 12; +
> +	horizontal_frontporch_byte = vm->hfront_porch *
> dsi_tmp_buf_bpp;
> +	horizontal_front_back_byte = horizontal_frontporch_byte +
> horizontal_backporch_byte;
> +	data_phy_cycles_byte = data_phy_cycles * dsi->lanes + delta;
> +
> +	if (horizontal_front_back_byte > data_phy_cycles_byte) {
> +		horizontal_frontporch_byte -= data_phy_cycles_byte *
> +
> horizontal_frontporch_byte /
> +
> horizontal_front_back_byte; +
> +		horizontal_backporch_byte -= data_phy_cycles_byte *
> +
> horizontal_backporch_byte /
> +
> horizontal_front_back_byte; } else {
> -		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >
> -		    data_phy_cycles * dsi->lanes + 12) {
> -			horizontal_frontporch_byte =
> -				vm->hfront_porch * dsi_tmp_buf_bpp -
> -				(data_phy_cycles * dsi->lanes + 12) *
> -				vm->hfront_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -			horizontal_backporch_byte =
> horizontal_backporch_byte -
> -				(data_phy_cycles * dsi->lanes + 12) *
> -				vm->hback_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -		} else {
> -			DRM_WARN("HFP less than d-phy, FPS will
> under 60Hz\n");
> -			horizontal_frontporch_byte =
> vm->hfront_porch *
> -						     dsi_tmp_buf_bpp;
> -		}
> +		DRM_WARN("HFP + HBP less than d-phy, FPS will under
> 60Hz\n"); }
>  
>  	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);

Tested on Chromebook ELM.

Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>

Thanks,
Bilal

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
