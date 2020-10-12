Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A3DC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:07:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C66E20735
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BsXmr+w4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekcRy/FN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C66E20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LM/XLkWHvuFZge6s79KnjqGwKId6lnv7eT2QbJUhPqw=; b=BsXmr+w4OG7iMYfmS2NXik+6b
	pkv+sjiKs3rcMnMD8M9nGUdb/hYYNEwXC3QZWYkNSf8pPgm/pu/kL1B4WnMYsJbVXD8fwYMRsGgHo
	i3XEHNcfSMMlzDgTthCEHuI6kSsvtRxHg3GKrI+/mZT4a5iVhKvWkN2iyl+LJPagKcOZ2xqh9a08K
	iJxocLKWqXiH3u7uFOufwCAleHRhH/9ruwuJ32ZQ+E4GOqIZt5fPlUkkKIRA3ZG7nQhGskR4qZIap
	YoFexfZxHmSNje/ke1lXHRJzLgGOACKfOwCNrJhnWWfqNSg4xKGKGcFqPV2yJixEwSJUqn934TrLK
	EvqQHrztQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRwcE-00076q-LA; Mon, 12 Oct 2020 12:07:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRwcD-00075z-1T; Mon, 12 Oct 2020 12:07:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id k18so17297521wmj.5;
 Mon, 12 Oct 2020 05:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyLQqnsPp2QoVdD4Le8oIZ3NiV3JMjhazdAHbl+D9wU=;
 b=ekcRy/FNerrYq8mtZClP73dij3+euY9uxtnkcEGlMlV8MZqFJ2h2HlCRPN7vUpmD+E
 E3EaWddH3zQ5nNyp0FYQrcx3YrR9+HFIzMqwRQNz2j2t2MciWm3Q13tYSlL1u7M9xMSW
 /baaGrFZEiYjDOWq7ANLWzMqDORmEK6+SVqOlO7SDgGlFdUeP5xRztTpvHEp1wAdjAKO
 gkhjI3bbztIsQnnhJL/LcdQzZqfokPcKc8sTB/1egrWEA/y+FtRQZB9cHB8rqOT5t/yp
 txfGLiAcCcb2YklH61lAcf65+RJDa7P8NqcBfPPTFEfaXHED2Bo6//ktag1HY8LIUmYE
 42uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyLQqnsPp2QoVdD4Le8oIZ3NiV3JMjhazdAHbl+D9wU=;
 b=EOLSXlo01xZ0shbKHFeoyy5assjKsiqo426qtd7ndbIx8RBIRJP8gGQCdsYemkawr5
 cDO+4Jtagq8z7GGfz8MvIixrGBlXqXSuJuM+CUx4lTdtLwFGyJKY9A1zlhltLbDshq8E
 oRyfvxT8vR2Cjz9CZ20K3wXiAn7jHfqKwCv7zTsLxP11J56Xm0zilqgxrAFfotwq3u05
 EG5mzRQYqjN5Eb6E5dFh+D7GFfDVfc2UcIYsKhwib3VxneTYZqq+dBUA2kGXVpmDo5SM
 HUGOIPQlRtt/g1QKFEIBYyJ1fD3cDf/34Pj7zAuUBEtLQuPdZ3o3e75w3xRuCuKUrAtB
 rEtw==
X-Gm-Message-State: AOAM530s2Dn1zqB2C9QgGZI61HfG1enWEfit27V41Zi3VC2F1AKFonJR
 qCsrnOBS+AJBL7oxYGKdquM=
X-Google-Smtp-Source: ABdhPJwUfj7Av4Hl9jD8LHoYMEWgeUV0AjRwanMiqDbt+5CmZuFGRVLDSBGWKu5ymbYpQDPIw0414w==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr6322560wml.92.1602504461204; 
 Mon, 12 Oct 2020 05:07:41 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id q4sm24238151wru.65.2020.10.12.05.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:07:40 -0700 (PDT)
Date: Mon, 12 Oct 2020 17:07:30 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 1/2] Revert "drm/mediatek: dsi: Fix scrolling of
 panel with small hfp or hbp"
Message-ID: <20201012170730.582d4b96@a-VirtualBox>
In-Reply-To: <20201010070910.11294-2-jitao.shi@mediatek.com>
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
 <20201010070910.11294-2-jitao.shi@mediatek.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_080745_095093_69F358E3 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao,

On Sat, 10 Oct 2020 15:09:09 +0800
Jitao Shi <jitao.shi@mediatek.com> wrote:

> This reverts commit 35bf948f1edbf507f6e57e0879fa6ea36d2d2930.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c index 80b7a082e874..16fd99dcdacf
> 100644 --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -466,13 +466,14 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) horizontal_sync_active_byte = (vm->hsync_len *
> dsi_tmp_buf_bpp - 10); 
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -		horizontal_backporch_byte = vm->hback_porch *
> dsi_tmp_buf_bpp;
> +		horizontal_backporch_byte =
> +			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
>  	else
> -		horizontal_backporch_byte = (vm->hback_porch +
> vm->hsync_len) *
> -					    dsi_tmp_buf_bpp;
> +		horizontal_backporch_byte = ((vm->hback_porch +
> vm->hsync_len) *
> +			dsi_tmp_buf_bpp - 10);
>  
>  	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> -			  timing->da_hs_zero + timing->da_hs_exit;
> +			  timing->da_hs_zero + timing->da_hs_exit +
> 3; 
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
>  		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >

Reviewed-by: Bilal Wasim <bilal.wasim@imgtec.com>
Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>

Thanks,
Bilal

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
