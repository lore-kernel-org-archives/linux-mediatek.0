Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645F4CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Wg3EaV0LyOJdSGTmlTY0VxnIGoAeFlp+VouKoS5lNQ=; b=qltk+7EJ51x0DrrPEBA+5RlOJE
	vzqgGTNwSKTXnvgM9BsJAeL2/3i4ucn8lZKK2ZMziJSisvdsjhEKKTp4hDxNb93UzBHcGnsm3jTF8
	pZlp0HGS9V5eVC0ZjZM2Gndz7pfiqxWKMC+3w175bjqWH8bT7hcwSAPmqAD7O8ken2m/+SMLan074
	lrsAkXsS81wtlGgK4X6n0lrK/K6k2fivpq4QCH9/pOB5eViAr4kOZrmcj9V24ES61/ScS1IntlSe4
	wuWuGYUGAjeYvIZSgbAtXIFo7PrZCHAOaJdJgN8kwS+sF4pXrwEC9wrrmXnErT+4vo51TcM6OiCkj
	0r7QC8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqxmO-001JcD-0n;
	Thu, 12 Oct 2023 15:39:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqxmK-001Jac-33
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 15:39:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32c9f2ce71aso923715f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697125149; x=1697729949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Wg3EaV0LyOJdSGTmlTY0VxnIGoAeFlp+VouKoS5lNQ=;
        b=H+BdlhWpuCI+db7vryIJXOsnW+CVCW0sZIkejIHOnvFDC79wg+D4+5cujQ9ms/Bvm7
         Von0btQ5O1Iy+uW8PlXv9d7vwcg53cSmaYWNgOnGDgoL4FIVwEHJ4piVtYkwlbIF6GSw
         EVzLuxnqGkDIikGfWF/E98NwAtap7BwLMbbC/u5xttPD7dnF1v5DJGKAwi/HEoypiXKn
         Xtm8lmQYfmmhFNg7bZdWCI/Tf3kN8U3eZJuc29hIB+Qkmv2tFEa04wQcZ5bkFTEEnBwF
         SN0SwHnES8kytzHDUJF2ChGFCApbuDLHIxwDGkYtHn8Cf915eXGGu/hiLQw3ezBrX12I
         +YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697125149; x=1697729949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Wg3EaV0LyOJdSGTmlTY0VxnIGoAeFlp+VouKoS5lNQ=;
        b=a3hD45KdRQSHEkM30Ud5H1gPSvPEPovhsgg7D3aEsrm1BzyxLYPMkIF3J0DssdF8lZ
         SMi1DQWN/v24EUF55Bll+0inNimtI7Qq/U7BIAU35AWxquZX2gquwttuT4fsol9HTCZU
         wZW8zzwvDLn4+v6bTPCOvrejiuCPan1p1Hl+bfVRgpp03C7hGCz5ktsL55xewAA4SZ8S
         AM7XFmz+DGy1rigEdA5NDY0a7WCAQXKilKfLBCg+Fe/pgPSoMzuM9bztO/JLjBCu4/tY
         aEIOXORpQ+C/zSEQZ0oQNJ5FM9bf65n2X/5G/UAdZk/xxX6zdjTJv58zMXDwWvwhTPoU
         hBTg==
X-Gm-Message-State: AOJu0YyS2FPibJhXwi+q99rYrZrOIJknjc7Tg+YB0v8PdyHgHk7zfgPg
	ApHi3eWR50YMwo5h5FEaZU2OFQ==
X-Google-Smtp-Source: AGHT+IHijqQwPNdUCGMZLUhukz1Vn3a+qjqDBNhrhGPBsyvXuCmqOgvZ6RIuMv02qW+CQW/fPpew8A==
X-Received: by 2002:a5d:5f04:0:b0:32d:8872:aacb with SMTP id cl4-20020a5d5f04000000b0032d8872aacbmr4751690wrb.53.1697125149337;
        Thu, 12 Oct 2023 08:39:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id f8-20020adfe908000000b0032d8ce46caasm2778956wrm.93.2023.10.12.08.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:39:08 -0700 (PDT)
Message-ID: <a3255da4-b2af-4403-af68-3067a5fd49bf@linaro.org>
Date: Thu, 12 Oct 2023 17:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Subject: thermal: Fix potential race condition in
 suspend/resume
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yugang.wang@mediatek.com, yongdong.zhang@mediatek.com,
 browse.zhang@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230916113327.85693-1-bo.ye@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230916113327.85693-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_083913_016530_978377D5 
X-CRM114-Status: GOOD (  21.25  )
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

On 16/09/2023 13:33, Bo Ye wrote:
> From: "yugang.wang" <yugang.wang@mediatek.com>
> 
> Body:
> This patch fixes a race condition during system resume. It occurs if
> the system is exiting a suspend state and a user is trying to
> register/unregister a thermal zone concurrently. The root cause is
> that both actions access the `thermal_tz_list`.

I'm not sure the tasks are already thawed during POST_RESTORE, so no 
user can unload a driver and then reaching the race window.

Is that an observed issue?


> In detail:
> 
> 1. At PM_POST_SUSPEND during the resume, the system reads all thermal
>     zones in `thermal_tz_list`, then resets and updates their
>     temperatures.
> 2. When registering/unregistering a thermal zone, the
>     `thermal_tz_list` gets manipulated.
> 
> These two actions might occur concurrently, causing a race condition.
> To solve this issue, we introduce a mutex lock to protect
> `thermal_tz_list` from being modified while it's being read and
> updated during the resume from suspend.
> 
> Kernel oops excerpt related to this fix:
> 
> [ 5201.869845] [T316822] pc: [0xffffffeb7d4876f0] mutex_lock+0x34/0x170
> [ 5201.869856] [T316822] lr: [0xffffffeb7ca98a84] thermal_pm_notify+0xd4/0x26c
> [... cut for brevity ...]
> [ 5201.871061] [T316822]  suspend_prepare+0x150/0x470
> [ 5201.871067] [T316822]  enter_state+0x84/0x6f4
> [ 5201.871076] [T316822]  state_store+0x15c/0x1e8
> 
> Change-Id: Ifdbdecba17093f91eab7e36ce04b46d311ca6568
> Signed-off-by: yugang.wang <yugang.wang@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> ---
>   drivers/thermal/thermal_core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 8717a3343512..a7a18ed57b6d 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1529,12 +1529,14 @@ static int thermal_pm_notify(struct notifier_block *nb,
>   	case PM_POST_HIBERNATION:
>   	case PM_POST_RESTORE:
>   	case PM_POST_SUSPEND:
> +		mutex_lock(&thermal_list_lock);
>   		atomic_set(&in_suspend, 0);
>   		list_for_each_entry(tz, &thermal_tz_list, node) {
>   			thermal_zone_device_init(tz);
>   			thermal_zone_device_update(tz,
>   						   THERMAL_EVENT_UNSPECIFIED);
>   		}
> +		mutex_unlock(&thermal_list_lock);
>   		break;
>   	default:
>   		break;

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


