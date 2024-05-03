Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B0CC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3CD5UXCVdUAuu9Git8MNtIns8eazGXSqXwABAZaYsE=; b=cNerJsTozLE2ZmvmAsfxcHWVjK
	cHfJzrwXrGji+Kfgl0jk01DxtSqjRgdiEwKKDxdDNKqZ3E2me0NSa8Efffx0RZ0t0zmo0wX7X9WS4
	Ag2E3+kieIY58W31Rt4DcoN/vONu57r6Yvh7P7kjAIWMVOCd89vlO7ejjD7ONIjtYHG7x4K6Z9cBV
	8mCCUhH+jXK9dTwK8+F9AnJGike5uwLZ2Z1yNaevKDpk0ZIiyBnBFcecmpdPq0rXzmmDGk0N+DqST
	3NAGfn/T6MaWts2d31EHyMPsHnGkAmm2jvhWlpikEUFcXUNLSCEs6TCk/tJE/3QtxMUvtceqUj0XF
	BnpH6inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wcy-0000000HNkV-1u4S;
	Fri, 03 May 2024 17:23:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wcv-0000000HNif-0pbC
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 17:23:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso51098015e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714756995; x=1715361795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3CD5UXCVdUAuu9Git8MNtIns8eazGXSqXwABAZaYsE=;
        b=nqr3SJ6yF8kUhb12lpKk5r/FvmhZwhA8whfpUeIbgq099b1rVxYDewgA6U7GtkWpNO
         LLcSixMWTMrGsIGrFsDxqPeEK5v90HTMjglDfoXG4fKeSTc1dbhiJTOj/KpuUEoOb90P
         3VvvKKgm1y1WtuKlRPeW3osqau5hoxDREaR/xrt3cgh2hEM6zXDPjyXKwJMWMDWkQdkj
         wX7NyILyK8SHesaiabzmsNKNrkCsQmYkjp2698Nj5rsDvM/XQZE+kEzSUsWqwt90NK38
         pj5Z75fWIc349tsZq3i91nKNGUbqwbZh6isrumUEO2ayhsCu0K1khp2IjtXwrHd7KOD9
         3LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714756995; x=1715361795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3CD5UXCVdUAuu9Git8MNtIns8eazGXSqXwABAZaYsE=;
        b=MoM35U1fbfiJEDTary6ZCa0WAkyxH17WsIJ5i5vNT5Wv56gjZSHbEnn8Jg1SMOjPIO
         oVWbJsgNeIaVPhGJ3j0gFNxP53hWgzSULWImBSBJT6SCTfWz5fvl7JQtpC/oVOOx26LU
         AYs/4Z8tEGzaN8vipa7ddN39WPvDKntxZm94ef22lHIjfUyEGEuzG4Zg0Xj84lq3J8OI
         KNGF9Jc+NeZqK02e8ZtBEUmUqxITQTnOOnBFTmBWHdqABQJ1qoDLBfJjqZYVysvuVeC2
         dlr+ry8YNcsaJdn1BSLJr5y9oKvxx4/Qqh/s8abuFEsEU6rAMVESSxoaU+45AGPtMVkN
         460A==
X-Forwarded-Encrypted: i=1; AJvYcCWTIs///6KT/qNdWpD2+jW+efKWROukb5jx7MWRN0K8GdcaENOkZf8pc0U/SuXZOqe6OhaKNe9WBAgE88pryt0arYvzKesaFcjlzihinDESaVU8
X-Gm-Message-State: AOJu0YzBNQ+RkoT8oSwH3lvx4UbWBvsbBqkFXGktAzReZ5+4CHJicrm4
	ewSkgXkIltVtvRTuwHTAsSggf7miopXYgaAGgzR8GEur9P3znJfb5Cg8+vX5NiI=
X-Google-Smtp-Source: AGHT+IFEowCuCwylixROUmg388nE+53RnlyVy2ckn+NBiq4MgMTwgGq1VkW2j1XllliZ4Dtr1Mh5dA==
X-Received: by 2002:adf:e586:0:b0:34d:2343:b881 with SMTP id l6-20020adfe586000000b0034d2343b881mr2771056wrm.43.1714756994641;
        Fri, 03 May 2024 10:23:14 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id p13-20020a5d638d000000b0034de69bb4bcsm4181590wru.85.2024.05.03.10.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 10:23:14 -0700 (PDT)
Message-ID: <6f9dc240-277a-4222-a175-18c959269353@linaro.org>
Date: Fri, 3 May 2024 19:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Mediatek lvts_thermal driver: Fix wrong lvts_ctrl
 index
Content-Language: en-US
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_102317_292452_403811D8 
X-CRM114-Status: UNSURE (   7.28  )
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

On 03/05/2024 17:35, Julien Panis wrote:
> PATCH 1/2 is a minor change: it just removes 2 unused members from
> 'struct lvts_ctrl_data'.
> 
> PATCH 2/2 is a major bug fix: it fixes a situation where a wrong
> array index is used as 'struct lvts_ctrl_data' type item.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


