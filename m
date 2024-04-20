Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB697C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=; b=JCBDoho540viv9YQcNi0ncFB6k
	nmY5cHDtezBcx/ZlAYtu8XYKuhjKcOEZBv41K7SFT7vi0S0D2SEiuNMl6wF9rVvIDDO8wZ8dat5I8
	S9i6y2MYIABltg2JZQhcrgnfv6cpGKlCCleRQtPu5GcMm+J8+uDUzk2FUxTmzn7kmFkUwfx4aV8+Q
	uU1HXxsCkLhKfJDV4d989o9FSOcRnqvPKPDheYKbQO04koii6VE8e1yD943+IiLKrCrjU8cOsvWIa
	jDf/7lb1Apm28sMkPz+0Iee9bPj7kXmJ5ZBn2GKRwZfzfRplCgV7nQN8Y0wUsrtalT94S5VDTr1Bn
	4gjRx8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJUL-00000009JBp-3Om1;
	Sat, 20 Apr 2024 22:47:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJUI-00000009JAP-36iQ
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 22:47:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-343f62d8124so2497740f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713653226; x=1714258026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=;
        b=Az6s3fKvRJTOAN8sOIRG/bPt9U0pQMy2ZPqqLxVFoA5cphQrGyak1FhKxW1N9p9jub
         x00QgGXPtVM+F7Y0rt2p/UfFXPT+/2IQwAnQzuIuHO7N3r1zXJpFQ5ODQOa3l1ESmG6c
         MqJy2VIl0M/5wwUmmXzDjaJsmBzwFoG8C5W6AfqsyiTHWaSXAP8iN2H39jHpV82pzQ7a
         oUCdiY2GREssUtpzseslKScGgTi4gOfPkEwSrXBWZJH+9Ag9iHWMsEj2aJw91Vzl2RN7
         RQfkP/ONqYDUKtwchTakZlsUxXKRfbcZozv7hgWe3hkzuArK0w2h0ChVOCt9FQ1T/ary
         OsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653226; x=1714258026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=;
        b=NVoS5E8axizne//DU/9TRb8IeqedSYiVrSkcwS8wdWDxBY8AEDdpmxiFwXvlkAsnuH
         eCUwT3Rqhn/VWAYat7MhvP74iXg/NpD74c6veRCwxADxFigbdv+Y1SUaFn4ELzRktqNx
         u6u5ufAa1YX4Ni5ugs7mMHFJokmskQUDlnuf0Y9dq93v58jg918DlXgeXyh1qcfy9hcZ
         Qt0EzObImjpRJJRc4/Tl32o5AsFA3WaCloLoxrn3iaPj9rYbNZuF+c0lcyeKR1uk6Zui
         lACOUt8ZxXd4xAXuDTAxTNIw3MfEOdUeacqgc3c/MwDxylUBovQD5iXLgNaDyEPhcAIZ
         1nqA==
X-Forwarded-Encrypted: i=1; AJvYcCUYfq2/3MFnUCDhcmtzkHJ8MZdTWjspaFbEbZjbpvf4iEsEm+3MpcBuBKzXXYMzGv5kW++TCAPJnLjEennxXAty2wm4neLaO5qu72kkTnDaMIJU
X-Gm-Message-State: AOJu0Yws2xM4c2LLX3vj7CwdloT8+PYtzlBI8HXj66+lwfkbbfA5zCrg
	dzzWm1W4eiSdhWda5Bx0rcbJSWPlkMrcKoSPl+p8BMeUZXt5UB3UAqI4Ee1xvp4=
X-Google-Smtp-Source: AGHT+IGtPzW/+9lmMVQCxqN2UztagHO9wsOjvQj41cl+HJwvySkknf0HE8sKI3A2uzyMihcZkv08Sw==
X-Received: by 2002:a05:6000:2c2:b0:346:758e:5f29 with SMTP id o2-20020a05600002c200b00346758e5f29mr4624994wry.60.1713653226127;
        Sat, 20 Apr 2024 15:47:06 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b004161af729f4sm11399884wmb.31.2024.04.20.15.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:47:05 -0700 (PDT)
Message-ID: <0b5c6091-e47c-4d24-a13a-2b5ad1b9cfb8@linaro.org>
Date: Sat, 20 Apr 2024 23:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] media: venus: vdec: Make explicit the range of
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
 <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_154714_825643_536FA6EB 
X-CRM114-Status: GOOD (  15.99  )
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
> Found by cocci:
> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9441e7..2b2874aedb2d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_captureparm *cap = &a->parm.capture;
>   	struct v4l2_fract *timeperframe = &cap->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> -	inst->fps = fps;
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
>   
>   	return 0;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

