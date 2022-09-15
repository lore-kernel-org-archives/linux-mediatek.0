Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02CBECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtZaXYBrw/AG5wK2lscAo5IyphXo0G6cr0DhN47TYmY=; b=tMFU1kiSe1nyGfByi+/okuRrJi
	dvm5BpShO7biAta1t5mOqvdZc/d3Bocpx2c9eF/IcB9Y8s4D+PM0HuR0ZhQ1o44dGcLmusMWsBgw1
	LXSEzcF8+Pzl1gM59BXCwCxJygFB5umPtudBrNp4C9EshzE6/hTegvnOu5Fgr0MoKLUPKhEQiQIPx
	EipKEBNvS9+BD4OytOFc8CFl4M9Mi/CR+fL4/yE7IXa+/2VqK4Ctc9qbN4O+mGm263kqQegcmWWHW
	PDowXR1BdYg1CfX9QfsFDEBt1EsL87X7fxWiwB2RIDI9MhCmJqvND9rUgSMdl4ASkDh+0v4ozEpl5
	nHzR1FPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrHq-00CmSX-A4; Thu, 15 Sep 2022 16:00:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrHn-00CmJD-PH; Thu, 15 Sep 2022 16:00:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id t14so31578339wrx.8;
        Thu, 15 Sep 2022 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NtZaXYBrw/AG5wK2lscAo5IyphXo0G6cr0DhN47TYmY=;
        b=C8YIcEmdhu28gVUvnH9/7QZ1fFt9ne2TkutofZr7UtX09EouEEFHqGLZpin0xm5b30
         UwDiR7c+2NvxU4w5mt/fmWN6V8pklnwQx6b/skixsAAz5e1HZm+2TsQIwmsoObcbec+d
         iEhOwBTEhyRUnnpFnmwZ2Dj9gJf19d7wzVFfVgCcysmS2/qRAiQTTtbUis2VqjD7KzTU
         N40F/6pAb+tsxoDDrm6pGhAc5/gH8poH2LVE4mlkZZCItAdLO2WB5yuR2bTXdWb/+Aj7
         Gh2N6wDQ3LZnexSGKqt6yI5LYVBZVWgEXOk+/hBYeGPqrLkVq1+BYq+/HyVNEcLM2eFQ
         2NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NtZaXYBrw/AG5wK2lscAo5IyphXo0G6cr0DhN47TYmY=;
        b=caTAYyaFph8g+LFwj1hsb4CRGizVSf6IAP2Ydu6NveeZ6iP9KLhJJ1XTyOK/Y/5XRf
         oW8fTgo8SK3y5zKmx4gV2PFq/UUaScuYHBEx8D+k2ZAI9HuYr5AN+FWJQTbJN35hqOep
         vCMnJ3lOuXTSYcEmJNZQSz/GPfCA+nUDhux7RoeBxRk/7qsLpNEorVzLOoLf+bl4hZ6K
         VyVerMTeujkxKT4S6hrsmtY+GSimZftzP5Y1WiIyzk3epDwaJ8GWin1Yr8nqodEspbWS
         p/nmYJ+XDUMNkI1d7gt1ZVcLP4P2CRhQjNTCxQ2jdeul0RdulbkirfKXFaNiiGRvOIqN
         FCkg==
X-Gm-Message-State: ACrzQf0Nno92EIOpdEjjLir+YnYbFbu20CbxW+gpTtqNmVWMQSIlV+gt
	IJD6erE9Ciwi7QrNA5G+uD8=
X-Google-Smtp-Source: AMsMyM6OQEeLXkxWzioaolT5lZWFXDRwM7L61hQ16+IEMxL+6+zAMajEyf1Uk2/9wt56xCnf8m1PNA==
X-Received: by 2002:adf:d1e8:0:b0:22a:c131:4c49 with SMTP id g8-20020adfd1e8000000b0022ac1314c49mr211925wrd.647.1663257615219;
        Thu, 15 Sep 2022 09:00:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s2-20020adfdb02000000b002253fd19a6asm3647717wri.18.2022.09.15.09.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:00:14 -0700 (PDT)
Message-ID: <fbf403c5-55c3-d73f-f46c-5d4bf9283984@gmail.com>
Date: Thu, 15 Sep 2022 18:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
Cc: granquet@baylibre.com, daniel@ffwll.ch, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 liangxu.xu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-4-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220915075028.644-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_090019_846135_A269A27A 
X-CRM114-Status: GOOD (  16.23  )
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



On 15/09/2022 09:50, Bo-Chen Chen wrote:
> Warning:
> ../drivers/gpu/drm/mediatek/mtk_dp.c: In function ‘mtk_dp_video_mute’:
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:23: warning: format ‘%x’
> expects argument of type ‘unsigned int’, but argument 4 has type ‘long
> unsigned int’ [-Wformat=]
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/dev_printk.h:129:27: note: in definition of macro ‘dev_printk’
>    129 |   _dev_printk(level, dev, fmt, ##__VA_ARGS__);  \
>        |                           ^~~
> ../include/linux/dev_printk.h:163:31: note: in expansion of macro ‘dev_fmt’
>    163 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>        |                               ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:2: note: in expansion of
> macro ‘dev_dbg’
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |  ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:36: note: format string is defined here
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |                                   ~^
>        |                                    |
>        |                                    unsigned int
>        |                                   %lx
> 
> To fix this issue, we use %s to replace 0x%x.
> 
> Reported-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index c72c646e25e9..d58e98b2f83a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1222,8 +1222,8 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
>   		      mtk_dp->data->smc_cmd, enable,
>   		      0, 0, 0, 0, 0, &res);
>   
> -	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
> -		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
> +	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: %s, ret: 0x%lx-0x%lx\n",
> +		mtk_dp->data->smc_cmd, enable ? "enable" : "disable", res.a0, res.a1);
>   }
>   
>   static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)

