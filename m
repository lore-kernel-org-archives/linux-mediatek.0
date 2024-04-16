Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66CBC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=; b=Q5u/HEsYRsOtYVoxZQG8IFVX1l
	wMD/vUFr6d4pAxeFUsxXsJMtVdJkUalpss2xSilYBN8CNQLi07GzQYtOwB7bpid3Ot0Fh4w+7uC/i
	d3sjzP/US+x2WddPUN4SfLTA5p9dkhiCcpPzHIb16w+KbrzBKRopa8anGhdhKpFlVM9m57a8cU9th
	z+6odRD/kdwGhMk22xTRYau4RR50u0nYP+unQTH7KBmlVmeC3uuZvwTxiiQ2EOR8YxZONqkeGz8Yt
	4wXcYlFnPm4EaJvfxcX3rdCEcGg6hyBX/rEIoTZfCuavaqTCBARJPBNER/PFY9SkYuRWpoYkhO9AF
	SytWKxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwabd-0000000AqPP-39NL;
	Tue, 16 Apr 2024 04:39:41 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaba-0000000AqJ5-2nbO
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 04:39:40 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6eb86aeeb2cso699910a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242367; x=1713847167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
        b=bwfQWdps9Aer49ZICT9ILU9mu9cc8yu7EMU94Tn1g3QO9CI5BXmtst1EfgO6eGOKqI
         ac5ilvcVTPT22kcren1CfYrQOAgIUQwmS6mEmYP+r2cuJcJlntZ8QgI5WW9hOf+EyG75
         x/aAFGyKj/AYZVwcuLBqexc33LW1yt2nPZZiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242367; x=1713847167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
        b=FuWN/2JSa1EXmvUhwigK6OoaNvgm11HQg3zsb5WpSj6n+Mz76fieg6uPur2L8WzWkx
         wamXXdleU58XPUol3IElsviLFn3kUE/au34Agr4OHavZUTZfXVV3U5CAgXNt6ty20PQ+
         FEj1GVPjnOIRu77k8athUXrr7o+x6GYD/kflMn7bQmgeCaV2ON2xH/oR4aLLv4s/2QyO
         oioj4kd5NG2wS4rclHKMWrsgR6gVcK3fhSe5i8xWTjjt2DUe0zGdp4aInJ2bPyYKSxje
         5Z8Yx9KV0Fl1HxmrPjiGHJ3iJfcnROmfonH0DkVPrAil8KGrCNovt03tqMiBHKNJyAfP
         oavQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYLD3Fw8dczVNVAjq8pmSBSkBOG+sXYAA6DtRStjEQP4nNjBW60916ZODX0o+XxGkkdD+wPaGz9YTDbvkEY5Wr8Hx8ssIjJiS3us9fotAErq57
X-Gm-Message-State: AOJu0YyGHcpJOlRKw2A2bzh2hv+xPE7G8zbkR03qoot9bBfy5glI9d4V
	TOOSOQ/JLy8SiZCKkKksRTcrs9lQfTmSYAwFeeXBdcMOu4/Anj3+uJnNhexVqg==
X-Google-Smtp-Source: AGHT+IG0ppjZwpHlNVZUS9DrO9z9Zt+G6PVBJT/QRsW763QY2rUFepRZ7LeeiLPVtOHJ43Afq2vK7g==
X-Received: by 2002:a9d:7f8a:0:b0:6ea:23af:2bcb with SMTP id t10-20020a9d7f8a000000b006ea23af2bcbmr12688528otp.32.1713242366850;
        Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id b65-20020a633444000000b005dccf48e2a5sm7898637pga.54.2024.04.15.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:39:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Message-ID: <20240416043916.GA14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_213938_758975_B8C73E82 
X-CRM114-Status: GOOD (  11.39  )
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

On (24/04/15 19:34), Ricardo Ribalda wrote:
[..]
> @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> -	struct uvc_entity *entity;
> +	struct uvc_entity *entity, *iter;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	bool found;

Is `found` still used?

> @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	/* Find the extension unit. */
> -	found = false;
> -	list_for_each_entry(entity, &chain->entities, chain) {
> -		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
> -		    entity->id == xqry->unit) {
> -			found = true;
> +	entity = NULL;
> +	list_for_each_entry(iter, &chain->entities, chain) {
> +		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
> +		    iter->id == xqry->unit) {
> +			entity = iter;
>  			break;
>  		}
>  	}
>  
> -	if (!found) {
> +	if (!entity) {
>  		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
>  			xqry->unit);
>  		return -ENOENT;

