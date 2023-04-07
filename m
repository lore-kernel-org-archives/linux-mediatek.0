Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C1FC76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kl+r+1eAwUmcO3yIvLHoGLAdyBZhiAmwImrb6DiZvqw=; b=nOseZSzLuURKF99JFJ0bRe69tE
	wRmz+0zHqzKyg53uw2NQ7WuYRXzXtOm+AzydKDbf1hbS2MjHc2r5YsGj9yxTIB106hMnGJb/vId2F
	IpcRPoagGoqNlHR4DrBz9ItmOl0aNvvzuRDjt5pQwmk//jazkFawLhFoL65M8ogYR76/x+IaJlyag
	XTkjDXnEnK2aYJvp3AfCCVdrQQ3M3858Kuq7AUT0EjpHUR5Aoa23CFcdCpOugltMqxcA6CvNwdIDI
	q7wylgxrCIYnJdeiY7aUu299nW+rnvBi0paEb3ehGLJM8wcuZzNEykPPisHDJkW+ZC9+dkubpqivQ
	PpsfA78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiIj-009e8N-2I;
	Fri, 07 Apr 2023 09:22:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiIh-009e6z-0P
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:22:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g5so1885246wrb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680859347; x=1683451347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kl+r+1eAwUmcO3yIvLHoGLAdyBZhiAmwImrb6DiZvqw=;
        b=f4fj7uc/i6H265MoHUlDrKBrHhdyisQvssObqt0dhKmwQGrmtrAajdMaWJXQ5ZsaxW
         bE06FHKnR1SgnIuLPld2A7hlrhdsX6glSBvpUm9DTOZktf3PXpi+XxOcB9UqQ6u1ZBJ8
         anaK6QIs11IkblOhbgJRgRkNo6ZQAUgIYtd6TiOdlOtSkiSB0CB7Bcxf3PFIyLJo6XBX
         BGXokeZKPOn8WixKjcL5lBG5wA7j+VL0Q5K0q3ncUtJyYaVEEGGe4PQTtzdRPqtTBPEv
         HeR/jV2tvvIWg+nC1APJdGdT6fSwEou+63CG51cNKpo0ja9cdrH8gsya5SKwv/DiR1xT
         ahbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680859347; x=1683451347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl+r+1eAwUmcO3yIvLHoGLAdyBZhiAmwImrb6DiZvqw=;
        b=yy7oUXPtjklzAqayqxhP8O8Lp+J/1tnUOjv91yw++jwhnvwj15SVINypKV3ikUSJ5v
         aHHEEuTsN9uioB/dl7/Cu2k9OfbFPjCmbzv1Vo5nCYktIib0vGrZr61eTHy+J4nSOBTk
         v834p9tGeNkhBKnDRMLfGgr+HiMpUy0DekU8oNx9crsQg74nbLFFveGmTh6+8PvurWvy
         xvdqDIGsxDAfR6+Rm4u5be0w5FwWazXSQcCIDkkXv/ncrmZ9KxiugzEK7Xf4xQM8kIaE
         KzsYDwS6Qr27mVNMbn3e6cAToTjQGc/2AGa/yZcBubnJ/7NGQX22oaHmzrNfyursVySw
         8xdg==
X-Gm-Message-State: AAQBX9cTMi04rwHsEbVXNdnK7UBSv7lmxRMJUKt0Y3ADwkMM6/XGXoZa
	XbmiEFm6Nx03tJ5hjX3EgEtIPQFwpu/GuN1glXE=
X-Google-Smtp-Source: AKy350bBjbWNKXKt3qNiC277f7nt1WJaKLR8W6DDuzOEBUJz2ryNsKn3aPZFHGIZe/tdUpnx0OOoTQ==
X-Received: by 2002:adf:e643:0:b0:2ef:b32d:f54a with SMTP id b3-20020adfe643000000b002efb32df54amr537373wrn.33.1680859347328;
        Fri, 07 Apr 2023 02:22:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:dc55:c7a2:94a8:f03b? ([2a05:6e02:1041:c10:dc55:c7a2:94a8:f03b])
        by smtp.googlemail.com with ESMTPSA id c4-20020a5d5284000000b002d1801018e2sm4046798wrv.63.2023.04.07.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 02:22:26 -0700 (PDT)
Message-ID: <626fa1d8-dadd-9ecf-3eb0-fec651b331e6@linaro.org>
Date: Fri, 7 Apr 2023 11:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: only update
 registered thermal zones
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230328031037.1361048-1-wenst@chromium.org>
 <9ab8d176-378c-9720-3794-c710e2bd6272@linaro.org>
 <CAGXv+5H7QdNJ0Pj4xS_Ce=N63Csd1rCc+BoFJALyETLsA521NQ@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGXv+5H7QdNJ0Pj4xS_Ce=N63Csd1rCc+BoFJALyETLsA521NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_022231_175796_AF484A21 
X-CRM114-Status: GOOD (  15.36  )
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

On 07/04/2023 10:45, Chen-Yu Tsai wrote:
> On Sun, Apr 2, 2023 at 4:34 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> On 28/03/2023 05:10, Chen-Yu Tsai wrote:
>>> It's possible for some sensors or thermal zones to not be registered,
>>> either because they are unused or not fully declared in the device tree.
>>> Nevertheless the driver enables interrupts for all sensors. If an
>>> interrupt happens for an not-registered sensor, the driver would end up
>>> updating a non-existent thermal zone, which leads to a NULL pointer
>>> dereference.
>>>
>>> Change it so that only registered thermal zones get updated.
>>
>> Why not change the interrupt initialization ?
> 
> I'll send another patch for that.
> 
> However I think the part in this patch should still be fixed?

If you are receiving an unexpected interrupt, there is something wrong 
with the initialization. If only the monitored thermal zones have their 
interrupt enabled, then you should never enter in the interrupt handler 
for a thermal zone which is not monitored, or did I miss something ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


