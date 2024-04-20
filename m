Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B205C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=; b=pL4KJko1wtiKe7dvALd0lsPc+w
	QxORsqQqhZqwlrmBNYfuBiQMUrD86MYhAhyznlCRrGW2LQq8d7AoC3OnrMPwbcJy4NGFBeLyUL9jC
	BUAr1OLoFSyAswoqNFJMYSTLESsPGBK/NXJ3NZtwbtmdpQ4/iSVDAsJasW2Tqh8DlgyK+ydGUMIFZ
	x8KGgG1Cs2Lk9EnRbX7NW/iP4u9p2vhn3MbCWZJGGVHd353yhdCt4I77D1ZB8A8GB9GVRDS2U4hJC
	lGos9+UTh51EkWwXCQ4OUOqGpaQS2fyBbvK/mASR8NO7RmsCKS76uHDaxZIn93UrY0V+DCN/feIR6
	qMeKZaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJUj-00000009JJB-3Iqd;
	Sat, 20 Apr 2024 22:47:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJUg-00000009JHc-0fMx
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 22:47:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-415515178ceso22334355e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713653255; x=1714258055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=lDK6DyFKbeapYPtioamDxcc4V1/i+CeNyZriNwv7VNATCkghil02IIhVdAQxMRn89i
         nx8//sT4OYHJB8dRUfX1wOM5oy51XD9KWAmUG4XOQP9jGQv0HmXX0awEn5nJ8sx4fSKH
         2dV/1rv+JHWV+UrIwSdzu4SoAvXl/5NQiAnJM+IdDhd7YoriynHw6Vtb0J339hSZlC1L
         La4YeQ/qSlv3sBCXUK0WQ9xGdfhJtCaJdwyOu6qrxAtY0s8Fbuo+mzbaXp7vLUfgVpQc
         CeR8UEaLuD6DCaXu60ZYgYo/5YTRgksJVe0KWds4g1UdnFmMpE/tMONRIrhyjeE/LIgH
         WkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653255; x=1714258055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=W7PilXAViKs1uUgUmrT+02EiBQWJUJq8JBtuELeYxJrZ4uTSmU4gn7gNafsBD8KioB
         E1Y0zC877/Oc6GTape5acjMIG5N4DNHP3nJdHuY2Qq6Yer0ahNQgGMs75o8eUVYrqlFH
         FtgvbyCm/2ydlR7atpm4N2ebdXpReaMb91/ALBKbAB9wE6qDowMLlIH8YtkRIQd1Xwrl
         0u1evgoF8kzpsqER8IUSQv1hagagv5xIJueMXbVBrjrqdccB8oNFPuGzurzZjCCaaMC5
         700UqEZLl3s82nJC/0GENaXrBstB7n9iOtBeyUGKFQ5ZqrfpNakByEbZ55WKTOdDyAFd
         nWzw==
X-Forwarded-Encrypted: i=1; AJvYcCVkX2JDRQrK9L8QCILL9cpcQ4sMjVgo0+DKvpzAJQoBcSrohQgAUs8zR0zMAceKD5dJEnrEoces5CrxQvyzEF+nwsVKv6IqbePiWZ+14noVA52v
X-Gm-Message-State: AOJu0YwAYVKMYNHKIq9tIi1fjFE7qzIhRe8D6NPGSb5OKO9mF6Q7/LQT
	Bz7eg9rfpGu8tWgIj2SMd077Ou4ki+dHumIVphxeaeszoYmIdcOmek6n1MQ5xPs=
X-Google-Smtp-Source: AGHT+IFbaKQ0tPQEJ9I/RpZX+4qvxduHp5ktCxUofqd2WifblrkCYfYKIpU2lWpeintNmr/h6rZQlQ==
X-Received: by 2002:a05:600c:4e88:b0:419:87ab:f6da with SMTP id f8-20020a05600c4e8800b0041987abf6damr3268421wmq.3.1713653255313;
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b00417f65f148esm15283322wmo.31.2024.04.20.15.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Message-ID: <6b1627ff-5135-4685-be35-adf74a456469@linaro.org>
Date: Sat, 20 Apr 2024 23:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
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
 <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_154738_353430_FFBE6615 
X-CRM114-Status: GOOD (  16.13  )
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

On 19/04/2024 10:48, Ricardo Ribalda wrote:
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
> 
> Found with cocci:
> drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..f87e33a34610 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_outputparm *out = &a->parm.output;
>   	struct v4l2_fract *timeperframe = &out->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
> -	inst->fps = fps;
>   
>   	return 0;
>   }
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

