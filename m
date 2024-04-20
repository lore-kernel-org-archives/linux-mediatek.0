Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE49EC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 23:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=; b=yxGvvY8uSGHoDL+tiaGlmmJ82Y
	teF444OHqtGeTAYsN+bGwmARJcTWRPzmkbLg4TQJhBRhHy4swA+pH/a2eJV3ZrwGwWUFJcyJoio6b
	5H4EKyy833iHFXGr3YEjfRE/rEZDoB0S80D7NiERQ4ZcF7U/KnIOSeYkFR3yOsAYBZ0a/Wq7VARpR
	+WKKl/tKSo7ms4AlvP9NY3boZHJVE0lMo0mBVDV7dW0pSONpm6cgI2FZlzmNFaIejG3MZzLRm5h8T
	nPi0bS4woW3if6p8g4b/spozKek1dMqZv/1xmgyZLs+UGzVW6R9FPPwCVrZwEj+axKn3PkRvLsSm8
	DGmNDCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryK3B-00000009OLG-0fO5;
	Sat, 20 Apr 2024 23:23:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryK38-00000009OKG-1o6r
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 23:23:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso356011866b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713655391; x=1714260191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=tfHuD5hNb0YPAVqNTXLz+2NY7+VHBzvYpqOBk0t/4dhvN2Oa727tMGUAPijqngiecb
         Xbkc/T7whifWQyii0JnAt+S/melcam3+0n9g7RyAYPW/puuta7cDURN21FHQqh7KoCX9
         Zaqwes2sxzgcWcFDcB053grd6Se02EmyBLrt/7fcQie5SG1ED1Ygdza+YSNBAtlnoIwY
         v0iZD3vTSA/V5mQn/E2tNCRxNSkln5oInJegiYaAkuwZLBBfQhsqPJDJZiuc9xSZqUeM
         VWvIf4qpZn2hj9p75dZ5MYDtuPLTukGRIWauCIelVFKo2o1EZnxnl5zuBp9OfWUIJfeB
         tbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713655391; x=1714260191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=N3jup2/+ZLGCCdmu+HD9Ppe5Th+/VcE51+ykuhp7i5WuTScuV7LYUfI6G4NRU4gDuN
         hRb+iAfqcN5D77R1DhOCC8efN0e/en22KSZnpwaiYqMy3VcpnSkrpgaKi+ks/gtQcqT1
         IoGOhoqO/sQqkW4N8mV/g8+guhahzDq1MPiSinS9VQiRjFHCZCgv/ztVdBGDjoa0RCxs
         DLlCX58EF5KJSsyyIvPglN05+a+NFoOjJaya+ZiaDY33rCFpSaa500jvMsmwDW5YZqXt
         hyg2//w7Dl2NmUheAMmlmiVbSUT16Feqd1+7jW1+nmRB9jOJ1OaDULpyqxXWAvhUsg0P
         mJyA==
X-Forwarded-Encrypted: i=1; AJvYcCW+96Lh2fub8lpSNdvI+ckOxo4viZKaNP1bbnUdfZZgLqdJIutrVMQ9Q75MuhJk/Spaj4VOfIBKyR9owik4k5Prd2f52xyaUuRE5lfLnfwsjOUn
X-Gm-Message-State: AOJu0Yz11aCtcLOWsMLusfdH4knVAFO7QvCUYoUktykOvt62TPXd3st0
	Q9su3+mFAaBNkHK0l0FLV5ktSHUYdroaI9hLn7/1PVZc6N6RkNOdmt8wkTXuE84=
X-Google-Smtp-Source: AGHT+IHIgAHqaBHAo2tv0s9P7hAH/P161Q1ck8771gq2FLpa0nizkFWxKtOsbHWkZLUsCdT//bfy9g==
X-Received: by 2002:a17:906:c24d:b0:a4e:5137:9969 with SMTP id bl13-20020a170906c24d00b00a4e51379969mr4156927ejb.32.1713655391076;
        Sat, 20 Apr 2024 16:23:11 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906339800b00a521904b548sm3889268eja.166.2024.04.20.16.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:23:10 -0700 (PDT)
Message-ID: <27513574-3131-4704-9c3d-f699cc9edb9b@linaro.org>
Date: Sun, 21 Apr 2024 00:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_162314_555966_F0B4412D 
X-CRM114-Status: GOOD (  16.24  )
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

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/v4l2-core/v4l2-async.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..915a9f3ea93c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>   static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   					     struct v4l2_subdev *sd)
>   {
> -	struct media_link *link = NULL;
> +	struct media_link *link;
>   
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> +		return 0;
>   
>   	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>   	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   
>   	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>   
> -#endif
> -
>   	return IS_ERR(link) ? PTR_ERR(link) : 0;
>   }
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

