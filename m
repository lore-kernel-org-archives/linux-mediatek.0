Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0790CC636D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/86veRiNMAotlC8E0v66dTb033ZYUef8g783vJEeso=; b=ZYnC7MmNpgPtlcPh9Z26AoPLCS
	rDW5Kp9DYc9b6SaErSY0K9QtRLb7NTbWQFhly2PRor6u6P52egSpkV7kSNLXLjsWfK0LFyQzenB85
	49h27EUacm5H0GGVL2ljvAL9dnrrBF+pE9+3vNdjuURgmZ1fAHXZ8M0CeU6h2tTHR2jtvhX7NMdJV
	XJ1KrCURaM4ZEK58pOHA/f8AJIiYlHmD5dQOyx5zRjV+yFDgkzB/80IWPSWV9Hejsgl9u5P0xfFxA
	jVX46lq+hbk9oip5MDDAssrASR58s00k4+UkIYy6zTGGmrGD6Em7m22WmjHPoOriU4jyjShk3kf6/
	tFqLnSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWKk-00FHa0-3a; Thu, 02 Feb 2023 09:56:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWKh-00FHYF-F3
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 09:56:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3276030wmb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 01:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/86veRiNMAotlC8E0v66dTb033ZYUef8g783vJEeso=;
        b=YFCI8EFeCKYROGksvronNRcrP2dUv7lv5d83xpOGukCR2zmdfK9Y5acLGr5BQiJ/yf
         mIb7Ap6/BSnvDzEYjcmwtifoC/UNLk3KnZoWCk9SKvoXOYNJbfcRqky9V6NAXMlicM72
         GYiHow9zyNP0Ts0TQyh4Yc5lE42Szfa74niaAM9zBU686dRPY9FtOoBvJDYR1CzS9YdH
         yow9KWz1NYlsZ5gcm4PdaEs64mX/zJj39IdVooIhTiFxOrExzTqc4S5/KM0Px0LFuxPn
         fzjvf87fYmmAIX3p/6keLN0dSypDEz9Y/ae4dHk5FGhF9FsPy0puR8pmiDSs8Rv/pZnl
         NOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/86veRiNMAotlC8E0v66dTb033ZYUef8g783vJEeso=;
        b=2LXaBxrSfrXSgvl7/PBURoAzFXomVr2iXRttMHXdXtpNnigH1LD+ZeTbpcAmKZJor6
         XBSm6EtU90mgTUzt/U/C/LJ7Saaf64x3or/PvBEAF5tX/RiEXxf+uBwiiCjg2XcmGvOq
         mvLjdqRGYrscLRBgyf525aMpUjGh2qX1bIba6yevkHcvCAIAwpPVqvpLNFUNjY7ErEen
         ntxCbm6ooElC6+sZYlxsbVKztsGWCPcPKQgFov5+IU5Uml2d1B37/bRhzIc8jrJ9WbU4
         Ex+DHJOBeylOYcKo0pJvxi4kdr1+vCKod2fSbnL7naJblv/k3mSW3iaNMum2/j9GyICr
         UK0A==
X-Gm-Message-State: AO0yUKWu01uW2GVyWMVR5w7oqM/bKATbTWkMi6HFUkCIcfTSUrTTkM75
	Djls2Je/eaWSEP/EuhDz2Jw=
X-Google-Smtp-Source: AK7set/jUCFaL62fEij5mmBXq0rmi9tGj3yGhlRhFiz5oyT6fMYAFUcO6qIEIwd7Uu9v6LHsmXmdgg==
X-Received: by 2002:a05:600c:4f07:b0:3dc:50c1:5fd4 with SMTP id l7-20020a05600c4f0700b003dc50c15fd4mr5713832wmq.15.1675331800896;
        Thu, 02 Feb 2023 01:56:40 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c17d500b003dc5b59ed7asm3895142wmo.11.2023.02.02.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:56:40 -0800 (PST)
Message-ID: <1287614a-754f-a5b9-d940-3f4fdc8f3bce@gmail.com>
Date: Thu, 2 Feb 2023 10:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if
 bridge is attached
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>
References: <20230202045734.2773503-1-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230202045734.2773503-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_015643_536804_7F0C5329 
X-CRM114-Status: GOOD (  19.04  )
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



On 02/02/2023 05:57, Chen-Yu Tsai wrote:
> The MediaTek DisplayPort interface bridge driver starts its interrupts
> as soon as its probed. However when the interrupts trigger the bridge
> might not have been attached to a DRM device. As drm_helper_hpd_irq_event()
> does not check whether the passed in drm_device is valid or not, a NULL
> pointer passed in results in a kernel NULL pointer dereference in it.
> 
> Check whether the bridge is attached and only trigger an HPD event if
> it is.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes since v1
> - Dropped prerequisite-patch-ids
> - Added Guillaume's Reviewed-by
> 
> This applies on top of mediatek-drm-next.
> 
>   drivers/gpu/drm/mediatek/mtk_dp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 1f94fcc144d3..a82f53e1a146 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1823,7 +1823,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
>   
>   	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
> -		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +		if (mtk_dp->bridge.dev)
> +			drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
>   
>   		if (!mtk_dp->train_info.cable_plugged_in) {
>   			mtk_dp_disable_sdp_aui(mtk_dp);

