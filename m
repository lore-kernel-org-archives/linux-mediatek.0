Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2395CC48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 22:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA+5emx4whlVpRaV+VkwsKJAojvSKO6yy2AD8lJ+MXY=; b=377ea/a4WqjAVBBEii0AoH+3Ia
	bvS27XjX8USRIQQLWiEwkxqYTVEkoGE5/p6DJbu5HtwWMQPoZE18tBTgG+ccUYE1wAWGzy79kKOI3
	oRXFNHHeZGkvANrk+PzMnTNpsGG/xIvvvtrG7siPwR0OstusRFNmdu5n2/HKDONi7mAwuwRGQjjhn
	ob0veXv25N+3oWf3e85PbqNHaw3c6emYluzb9lSVPYMKoampa0+piTRLHvECwy8DVvh8c3h3qdxO0
	OL+YJVrrYmwRHLskoT/Hio/DipGUKFi84+V3cyCdo/rp6j5hpGZLJwg5vtmFRn5tYr5VjAHZsMI6e
	vw1gQ9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfFU-00000009UgQ-3SAL;
	Thu, 01 Feb 2024 22:09:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfFR-00000009Uej-3Ydn;
	Thu, 01 Feb 2024 22:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3006C621AD;
	Thu,  1 Feb 2024 22:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0376CC433C7;
	Thu,  1 Feb 2024 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706825368;
	bh=E/2UIRa0Ph8g1t1LGEPJDYyOP+zaTTR1+LxJRQzZuxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxe6l4WZDdSVpOLVeIE4Qdg5MIw8fyuPjfsN2K1Ola6oh5m1WuTfjX12BkPZ2pPPk
	 NwdHJDa/2tP2G/9iHsCOZca8Z6whjWxmsLe2RfpdBreV0U55D5Dg6Cl32ngwoqNSo7
	 A8RUVw1nqJqy8OOddkt3ZJJh98f+sEGDa+ZMD/e6JZNcUeQE/IDuyjQa7IrcjrVqKG
	 6b5FEGrXUXMJryjaYFXmBy8KgEI9EDFeLEw0ZuRr+Tsf2trkdM4vJ6r8Bj5ALPbgrl
	 WQ4XKEqh6961T5s7A+HZQVKAX8pCRhrfHY89tWSbMwZOsueA61sa2RdEvpqPojhIoS
	 J052JZifcZksA==
Date: Thu, 1 Feb 2024 15:09:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] media: usb: pvrusb2: Fix Wcast-function-type-strict
 warnings
Message-ID: <20240201220926.GB2240065@dev-arch.thelio-3990X>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-2-1d946013a421@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128-fix-clang-warnings-v1-2-1d946013a421@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_140930_002378_3F3C764C 
X-CRM114-Status: GOOD (  17.22  )
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

On Sun, Jan 28, 2024 at 02:12:21AM +0000, Ricardo Ribalda wrote:
> Building with LLVM=1 throws the following warning:
> drivers/media/usb/pvrusb2/pvrusb2-context.c:110:6: warning: cast from 'void (*)(struct pvr2_context *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
> drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1070:30: warning: cast from 'void (*)(struct pvr2_v4l2_fh *)' to 'pvr2_stream_callback' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict] drivers/media/usb/pvrusb2/pvrusb2-dvb.c:152:6: warning: cast from 'void (*)(struct pvr2_dvb_adapter *)' to 'pvr2_stream_callback' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/media/usb/pvrusb2/pvrusb2-context.c | 5 +++--
>  drivers/media/usb/pvrusb2/pvrusb2-dvb.c     | 7 ++++---
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c    | 7 ++++---
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
> index 1764674de98b..16edabda191c 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
> @@ -90,8 +90,9 @@ static void pvr2_context_destroy(struct pvr2_context *mp)
>  }
>  
>  
> -static void pvr2_context_notify(struct pvr2_context *mp)
> +static void pvr2_context_notify(void *data)
>  {
> +	struct pvr2_context *mp = data;
>  	pvr2_context_set_notify(mp,!0);
>  }
>  
> @@ -107,7 +108,7 @@ static void pvr2_context_check(struct pvr2_context *mp)
>  			   "pvr2_context %p (initialize)", mp);
>  		/* Finish hardware initialization */
>  		if (pvr2_hdw_initialize(mp->hdw,
> -					(void (*)(void *))pvr2_context_notify,
> +					pvr2_context_notify,
>  					mp)) {
>  			mp->video_stream.stream =
>  				pvr2_hdw_get_video_stream(mp->hdw);
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
> index 26811efe0fb5..8b9f1a09bd53 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
> @@ -88,8 +88,9 @@ static int pvr2_dvb_feed_thread(void *data)
>  	return stat;
>  }
>  
> -static void pvr2_dvb_notify(struct pvr2_dvb_adapter *adap)
> +static void pvr2_dvb_notify(void *data)
>  {
> +	struct pvr2_dvb_adapter *adap = data;
>  	wake_up(&adap->buffer_wait_data);
>  }
>  
> @@ -148,8 +149,8 @@ static int pvr2_dvb_stream_do_start(struct pvr2_dvb_adapter *adap)
>  		if (!(adap->buffer_storage[idx])) return -ENOMEM;
>  	}
>  
> -	pvr2_stream_set_callback(pvr->video_stream.stream,
> -				 (pvr2_stream_callback) pvr2_dvb_notify, adap);
> +	pvr2_stream_set_callback(pvr->video_stream.stream, pvr2_dvb_notify,
> +				 adap);
>  
>  	ret = pvr2_stream_set_buffer_count(stream, PVR2_DVB_BUFFER_COUNT);
>  	if (ret < 0) return ret;
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> index c04ab7258d64..590f80949bbf 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -1032,9 +1032,10 @@ static int pvr2_v4l2_open(struct file *file)
>  	return 0;
>  }
>  
> -
> -static void pvr2_v4l2_notify(struct pvr2_v4l2_fh *fhp)
> +static void pvr2_v4l2_notify(void *data)
>  {
> +	struct pvr2_v4l2_fh *fhp = data;
> +
>  	wake_up(&fhp->wait_data);
>  }
>  
> @@ -1067,7 +1068,7 @@ static int pvr2_v4l2_iosetup(struct pvr2_v4l2_fh *fh)
>  
>  	hdw = fh->channel.mc_head->hdw;
>  	sp = fh->pdi->stream->stream;
> -	pvr2_stream_set_callback(sp,(pvr2_stream_callback)pvr2_v4l2_notify,fh);
> +	pvr2_stream_set_callback(sp, pvr2_v4l2_notify, fh);
>  	pvr2_hdw_set_stream_type(hdw,fh->pdi->config);
>  	if ((ret = pvr2_hdw_set_streaming(hdw,!0)) < 0) return ret;
>  	return pvr2_ioread_set_enabled(fh->rhp,!0);
> 
> -- 
> 2.43.0.429.g432eaa2c6b-goog
> 

