Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AAEC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkbPRxuJaFbf8hemSHK1ZWQRF0fsDq8QRKmW1NagRfM=; b=0oloSTOZSrVMxOsPfO95uurdB3
	cCmrw8JGxVkgsQAreJQTcnIFdXnTgnrkPj8UiTKOXNpOzkxy0b5Ce3tVjWQPPFJiGw3mR4UQQVqB6
	zs3LiGBZxZCBElciEWyr98t8wcYHYeJoyRfLDTZ0Jht/FP4uMVI831ZPRlV7jGeI/XOcCj9adqH7u
	opNfa17JqYMdUi1GyC6K/Q098MzxM5CnuODGCqZzRMDLVj+k7E9yPyg2PSA9nEQki6yr0RuVMnOUs
	IFWvXM10wOtan4eko+DqQumzUjZv2glBVfG3f/cqgInz6Kyu3Xrarg/UBUadG5G9PbAf3c3oom3tc
	EZCbzNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdUX-0000000BK9p-121a;
	Tue, 16 Apr 2024 07:44:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdUU-0000000BK8h-1ZAm
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 07:44:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56fd7df9ea9so4703029a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 00:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713253468; x=1713858268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkbPRxuJaFbf8hemSHK1ZWQRF0fsDq8QRKmW1NagRfM=;
        b=bFJ4cQj1kYnf+w93vT28qs/prUswEZwwZexkR6hY3t60ni4XchKQtIW2T4+IUO8Rig
         7nxKeknkrN90fFLceUS8vs31H/SPYm8LoDyD5dVW7MWkGcjYsbWXfcbczw2Hezs382tZ
         u6m4HKEHAfRwvEZbXR55fHAsVYLR2SdF/GvnphUoD4pv/OhQBbgF3xinmdiQVYgMhb17
         vl84yjH9mzT0s5KoMPrug6u1EsZBcTUuFWjgoR0sj2C/3hqz92T6DU5Zl5oUTN03FZOy
         bScq3bI5IIecRH8JmILX6jtD5A/jdamapVOdBRv60MUR365hRmOaQuT2voeio4+pnMY4
         VA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713253468; x=1713858268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkbPRxuJaFbf8hemSHK1ZWQRF0fsDq8QRKmW1NagRfM=;
        b=OpGYtll7qIPYEdc30bwdVju0hIFG8hreLpT82LpVTrspJJFHBwiu0/KtRncXFWGP1i
         iBIb6od/YGN8STQ/hSX0lCAU7n/67nnTkxZCP7BQRwzmGZjgzilcXj2K2B7PyGOesJJ2
         Jl7RduoMbSDndrrNQ8ny17exuqxO4n5aRPN0mn0pXgAt4JToZN59Ag+5fKLAAEfhPUfU
         M8NTiBXsW49V2VVRF0K/3Kf9XD3aJ8bzx5TES+g4OlSm4KXu+lgbkMiuTXZhW3jpRKEW
         lQlZB7yDTzuXB/tRT6qmPdzR5wP4yjMLgoEqA/sHek2W/cf5BxBKrzWhVr0X19DkeUkO
         IbHA==
X-Forwarded-Encrypted: i=1; AJvYcCUjlbxPW6qVnI1y9TZ/y9alUAbyO4X1ZIKTd5svQWPK3DUudPmZXfLP4FZvWWCZLi/FAyF54xsEwHFsDxtLsxf/LDSMLto+9r5N+7sQxokz2bws
X-Gm-Message-State: AOJu0YzrSaZ6UUgFWwdCfPzxcLoqrK9Dq7oqXpONhi17cQbhAkbGmeVn
	nrul4ifooEt6oJn6v0969IPIrDYGdNM71jnJVEbFg2VG4HHiGKYbMLlArfRgc4Y=
X-Google-Smtp-Source: AGHT+IHyv6GyLcCM7SuFRY2lQ0w+D3nRQ0Oogv+NgpwSUUhg8+w7A2aBnM/9CzYE2fZ/BNYLgCzdrg==
X-Received: by 2002:a50:8d0b:0:b0:570:38a:57ea with SMTP id s11-20020a508d0b000000b00570038a57eamr6318788eds.33.1713253468256;
        Tue, 16 Apr 2024 00:44:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fk27-20020a056402399b00b0056e78e90a1dsm5799411edb.49.2024.04.16.00.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:44:28 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:44:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
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
Subject: Re: [PATCH 09/35] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
Message-ID: <a1917f15-ba04-4d8b-8dd6-0c1bc9a498ca@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_004430_539446_C4C53C1B 
X-CRM114-Status: GOOD (  18.91  )
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

On Mon, Apr 15, 2024 at 07:34:26PM +0000, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..e26a011c89c4 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,8 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  					     struct v4l2_subdev *sd)
>  {
> -	struct media_link *link = NULL;
> -
>  #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	struct media_link *link;
>  

I think another way you could write this is to remove the #ifs...

	struct media_link *link;

	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
		return 0;

	if (sd->entity.function != MEDIA_ENT_F_LENS && ...

regards,
dan carpenter

>  	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,9 +325,10 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  
>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>  
> -#endif
> -
>  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> +#else
> +	return 0;
> +#endif
>  }
> 

