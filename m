Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079D9ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMQu+Y5MmIbydykdiifw+beEBbT3HPvfrEgmPiWWPA4=; b=MY5Tfvi8/oqveyh4ykZkZGNoMQ
	24jQE0YYly1Ax/v6W3b+ibDP7zgb8OhsxMaBMmmutQDhhrb4ITFLt8scZHof1kD+qS4nYNjEAaZdK
	h944hxXaXaXdfuAQ8gkbsFU4ZRXySgvlVLqmjQBLNxFeHSCcf9/oUGJ6ENK8P2dXnTy/AYSGh0pd2
	qeaCGRrmHhQjoYj7jgWzg8Ua3994MEIbdX39s4xxdoVps4L2kZxkT2uF8Pz+ahQjJ7m9S6qNyeRFI
	bYFotGKvquIVeiz33uWoNrjQYiBANgAErkG+9dtTjocdhUQ8Y+2mL5UOk7GCRFHO01YHw1FVR39KI
	MheU7olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsXV-00E8C5-AC; Thu, 15 Sep 2022 17:20:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsXS-00E871-1W
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 17:20:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso13418106wma.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GMQu+Y5MmIbydykdiifw+beEBbT3HPvfrEgmPiWWPA4=;
        b=C9sQs9sk1ckiPcvzOIsgVxkZl7PhKg8R3xxYZG8w1Re81id1DuBl24tWMV6fJIMuAh
         7Jh1BUO+vpE+d7M09+aeNubo5Qou7BItDPmnhLpbMYIOULmwHvCgwHNqOVJBWXsGFD4R
         8xQIVU9cqnq4pqvoBwKJip18cRkUIwqHffNJ27LOtjuw8Dd0JCVr3YV0QpfhaGXK2uHd
         Vsgsi0YLbgVVOgP3oIglxUNHlBE06zfkDFvattpKst0rAlk8aez4WGJmLXHnIpG/7cyv
         2Ri4Q3fekfYMye/xvD4nmOShZfj6zfpqOCiYP9wHQ19lrOmnjAg5o8CJmY5pvU91xjdo
         osUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GMQu+Y5MmIbydykdiifw+beEBbT3HPvfrEgmPiWWPA4=;
        b=DtFgkgMoQjeKYETelsFSTPLqyyISzYnKDLSNEyzrneXo1rr0CA2Bl/HtwIsP3QpKH6
         rVaE66bTPjsm4sHskPvVXIAaEmbPI72zpRyJlr6oMkfgJJqGzGcPf0NIVV1uf1Dak5vV
         FiNKdsagQG9eQj4ROkXI5s2scxk0ZtY5vK0t7h/BXjDtZJWFYUeqGhinbB9NTQLHHTvl
         HB+vb/oIus+VFWAetzKOu03zYmwcS6cNfp+43mHaAzdBeXiaR0Mexz0kzX10TNQa7YYd
         d3Bnd1UwojORylgfY6KsbnsbWfiU3ba8ETXhpp6PQSqS3M35rMrOX7DcfOOyBpZHgJD6
         bciQ==
X-Gm-Message-State: ACrzQf3JUmTr9ll6jluhWWKtpCdZ0jX3EkJYdfKV03UsS+98PWGiarib
	csf27gHx1ZpiTNcTPFwFO5aDqA==
X-Google-Smtp-Source: AMsMyM6G4CD/tMHlq2tzVSbpToSXOyOrtSoAAC5uClinvbXwxCGIVWwya+GRyFBf6LQxfXbbcQ914Q==
X-Received: by 2002:a05:600c:5122:b0:3b4:768d:f491 with SMTP id o34-20020a05600c512200b003b4768df491mr680108wms.68.1663262432570;
        Thu, 15 Sep 2022 10:20:32 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id o11-20020a05600c510b00b003a845621c5bsm3408304wms.34.2022.09.15.10.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 10:20:32 -0700 (PDT)
Message-ID: <789f2638-b4da-146d-64ce-3e156428bcd7@linaro.org>
Date: Thu, 15 Sep 2022 19:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/4] thermal: mediatek: Add support for MT8365 SoC
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, matthias.bgg@gmail.com
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 robh+dt@kernel.org, rui.zhang@intel.com
References: <20220909073609.32337-1-aouledameur@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220909073609.32337-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_102034_110831_8F9D58A0 
X-CRM114-Status: GOOD (  13.31  )
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

On 09/09/2022 09:36, Amjad Ouled-Ameur wrote:
> This patchset adds thermal support for MT8365 SoC which contains three
> thermal sensors.
> 
> Changes in V4:
> - rebased on thermal/linux-next
> - Use callback for raw_to_mcelsius()
> - Use struct 'struct thermal_zone_device_ops' instead of
> no longer existent 'struct thermal_zone_of_device_ops'
> 
> Amjad Ouled-Ameur (1):
>    thermal: mediatek: add another get_temp ops for thermal sensors
> 
> Fabien Parent (2):
>    dt-bindings: thermal: mediatek: add binding documentation for MT8365
>      SoC
>    thermal: mediatek: add support for MT8365 SoC
> 
> Markus Schneider-Pargmann (1):
>    thermal: mediatek: control buffer enablement tweaks
> 
>   .../bindings/thermal/mediatek-thermal.txt     |   1 +
>   drivers/thermal/mtk_thermal.c                 | 197 +++++++++++++++---
>   2 files changed, 166 insertions(+), 32 deletions(-)

The series does not apply on the thermal tree.

Please refresh the series against:

https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/linux-next

Thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

