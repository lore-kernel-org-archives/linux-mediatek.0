Return-Path: <SRS0=62P0=YP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F61CCA9EB7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 11:15:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AF0218AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 11:15:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLmoW3ff";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="at9VuQVu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AF0218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7rQKIfkuIJ7sbKUigFYE+gh3L1Mwcyr1MGZePxlDBw=; b=CLmoW3ffYsko7A
	+19v/khPYs9UaeEVvKuBv8XKnyKZh2pCOZWhFioS66voRdcg7cLDXQiLWJALXXrD6X4uhKTguF0d1
	bKijpZ+TEvL9gSshSdSi+wBdGd+De2oT9E/FQvjeX97BMWSOB1IrbkGCxMeNN5b4xXFZqb0gBxxcB
	fkgFmgHCp1tyUpuem8uOfJhLEakC75KvLD/raEcydBrqCx0SPAPyDQX9SCZ6HQNVRRGgedO9e2Woi
	mIRBQmdege/ibeRhzAO1s7ioQczRvVsKPyd4MgzKOuRo2pZ3AqLNrYO/39hwKgWF4PnZFX5sxQAS0
	tfwJvPhjtBXEZxWWkcxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMs89-0008LV-Ve; Tue, 22 Oct 2019 11:15:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMs7r-0006vS-JW; Tue, 22 Oct 2019 11:14:57 +0000
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net
 [93.2.121.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD2E2BA;
 Tue, 22 Oct 2019 13:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1571742888;
 bh=Dj3Cz/n7yM2z3c1Y1pZ8ZtwXXwJMfegZmbgkXpatmh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=at9VuQVua6bJSsjxoq999Oh4fFDdbfhUDULTceOmzi44ViGtr3RQM5KOuUJYi6nsS
 qq51ZKr48Q1VGZ/hiT4PTS47om8/Ep8WkHxwBZsTWwU2Pn+RjAoxPzS4M1V+uHB+Ic
 Yva6JLUo6CpypxRc4qteWjt1ao8qq4ENIBbmUrto=
Date: Tue, 22 Oct 2019 14:14:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Message-ID: <20191022111443.GE4756@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021214550.1461-3-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_041455_948194_8AD8EF3E 
X-CRM114-Status: GOOD (  21.97  )
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
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

Thank you for the patch.

On Mon, Oct 21, 2019 at 04:45:46PM -0500, Rob Herring wrote:
> Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> drm_mode_create_dumb. This flag is for internal kernel use to indicate
> if dumb buffer allocation needs a kernel mapping. This is needed only for
> CMA where creating a kernel mapping or not has to be decided at allocation
> time because creating a mapping on demand (with vmap()) is not guaranteed
> to work. Several drivers are using CMA, but not the CMA helpers because
> they distinguish between kernel and userspace allocations to create a
> kernel mapping or not.
> 
> Update the callers of drm_mode_dumb_create() to set
> drm_mode_dumb_create.flags to appropriate defaults. Currently, flags can
> be set to anything by userspace, but is unused within the kernel. Let's
> force flags to zero (no kernel mapping) for userspace callers by default.
> For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
> can override this as needed.
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/drm_client.c       | 1 +
>  drivers/gpu/drm/drm_dumb_buffers.c | 5 ++++-
>  include/uapi/drm/drm_mode.h        | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index d9a2e3695525..dbfc8061b392 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -264,6 +264,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>  	dumb_args.width = width;
>  	dumb_args.height = height;
>  	dumb_args.bpp = info->cpp[0] * 8;
> +	dumb_args.flags = DRM_MODE_DUMB_KERNEL_MAP;
>  	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
>  	if (ret)
>  		goto err_delete;
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index d18a740fe0f1..74a13f14c173 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -97,7 +97,10 @@ int drm_mode_create_dumb(struct drm_device *dev,
>  int drm_mode_create_dumb_ioctl(struct drm_device *dev,
>  			       void *data, struct drm_file *file_priv)
>  {
> -	return drm_mode_create_dumb(dev, data, file_priv);
> +	struct drm_mode_create_dumb *args = data;
> +
> +	args->flags = 0;

I would prefer returning an error if flags is set to a non-zero value,
to catch userspace errors early, but I'm also worried it would break
existing userspace by uncovering existing bugs. Still, if we later add
flags that userspace can set, those existing bugs will be triggered, so
we'll have to deal with them anyway, and we could already give it a try.

The patch otherwise looks good to me.

> +	return drm_mode_create_dumb(dev, args, file_priv);
>  }
>  
>  /**
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 735c8cfdaaa1..02712f46b94c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -796,6 +796,8 @@ struct drm_mode_crtc_page_flip_target {
>  	__u64 user_data;
>  };
>  
> +#define DRM_MODE_DUMB_KERNEL_MAP	(1<<0)	/* For internal kernel use */
> +
>  /* create a dumb scanout buffer */
>  struct drm_mode_create_dumb {
>  	__u32 height;

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
