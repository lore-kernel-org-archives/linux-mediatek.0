Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C89C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O11cNkDH5z7t2NN2bRH4l8Rl3tYZZQX8cjJddRFOqdc=; b=mChUaqg641u1ERD11Pve8NCxvt
	GI/TkUw3IT8N/aG3P5/n7yVpzpf3ySCV+o4C9JnU/BxDO4hmtiHo8cnc14dwTmOWvLNXxUfuVUX2g
	o05N9eBMLAyYrUqGBW/ZidgtkAP0wv1RnAvuj0gt6XezAVfNcSKFW5YsLlBmI3fSxLNnDIz65937N
	Of7WdXUjWQi1jOSmuJVYRiUh3smRidVyx8U6IwpSYgCTNNXf8jQkCaKx/s8tIEjxwzIrIxiP/nRoN
	XFlicj5cgIBBadH+JdXBRX+YyVXghWNVV+3bZRB2DPid0UNK4NWj8ZCgM9cQTU6oujgA05oDSew9i
	wALXeJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2OE-004R0l-1l;
	Wed, 19 Apr 2023 07:38:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2OB-004QzF-38
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 07:38:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f09f954d29so29919685e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681889880; x=1684481880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O11cNkDH5z7t2NN2bRH4l8Rl3tYZZQX8cjJddRFOqdc=;
        b=S5FZreJHJ75PqZhRN52OhzYajo1bwJjNaRzt6RKP2GjK8e3PyRmRbLL+O8V5k8C6FY
         bO7IiFQzVpBTRQqQitPaZ7oYEKPu47teqdrxG6cddRkb+R9yseDz/+ArMYZUPDeiFV2g
         DTdZZvyqipQMaP4RmNbV/dnvJSpCxrA7nFmCSs3qrz8kopwZCaTJZFHPMykxkCQtvHgd
         mjE/sHhNt8ZHaRxpnLxlFA4awtvknmn7Du7F0qpTjbAivWTqQ5Qogb9rWp0dUFElAob+
         n8Y6WLYueOoY+8xkil2OKpse81mFFf9T0/FIJGPc3ZXeyT8bpXioF3+rLozTISbV+J+Y
         Ohsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681889880; x=1684481880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O11cNkDH5z7t2NN2bRH4l8Rl3tYZZQX8cjJddRFOqdc=;
        b=c9y341uE03gy0bzD7ltl7GXuzwRJPI19xjz5luivoTwjdCFnkAk0dRWxFB8pD1yCyD
         5/KSLmz7zfJbPclSIfOqGoH02uFblTur01c/20j5ah/Hxx3lQupVIGpfx/3M1NPHmY/F
         v9DH057WFvs8EM2UWgd2M8omsisIo/GeLvFTqeK4HU6HblE1yP1zl7wl89jo88F8quk5
         wh0PsaF06o2HHqn0GYl2LnQYhp8GohCWjCA2L397dB9MrRk7k8EvsIVBSuX+vSkNZUKK
         LpJ13RniwiEvNLaZpijf6ekoFu7zvSCP9mRhe5puwF52KUf1iBSTT429P1nm98TaJaw0
         PHqQ==
X-Gm-Message-State: AAQBX9dOSK1zCfI9tpVTv9UmtHE4Bpa7nvUo/OY5W046Dz3FMPocI6qe
	ZfGPlcT1T9g+xvrrPrbJsDDdUQ==
X-Google-Smtp-Source: AKy350YlIA1rvTUogu6pH1nUVDJEW/Kq+1PWBQ+McpJKhPOKEfEArgivWBaYX8xXrx/EcYbULiI7kg==
X-Received: by 2002:adf:ea4f:0:b0:2da:2aa0:13e8 with SMTP id j15-20020adfea4f000000b002da2aa013e8mr3924662wrn.26.1681889879800;
        Wed, 19 Apr 2023 00:37:59 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g16-20020a5d5410000000b002d1e49cff35sm14974598wrv.40.2023.04.19.00.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 00:37:59 -0700 (PDT)
Message-ID: <edba7c7e-0b6a-64ac-a267-1e9bfef60d12@linaro.org>
Date: Wed, 19 Apr 2023 09:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/2] thermal: mediatek: use devm_of_iomap to avoid
 resource leak in mtk_thermal_probe
Content-Language: en-US
To: Kang Chen <void0red@hust.edu.cn>
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
 bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
 error27@gmail.com, henry.yen@mediatek.com,
 hust-os-kernel-patches@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
 rui.zhang@intel.com
References: <20230419020749.621257-1-void0red@hust.edu.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230419020749.621257-1-void0red@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_003804_006024_4E4EF2B6 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On 19/04/2023 04:07, Kang Chen wrote:
> Smatch reports:
> 1. mtk_thermal_probe() warn: 'apmixed_base' from of_iomap() not released.
> 2. mtk_thermal_probe() warn: 'auxadc_base' from of_iomap() not released.
> 
> The original code forgets to release iomap resource when handling errors,
> fix it by switch to devm_of_iomap.
> 
> Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
> Signed-off-by: Kang Chen <void0red@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Dropped v4 and applied v5

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


