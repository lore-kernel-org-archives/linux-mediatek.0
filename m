Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B40C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoLOhMfUIiPj96gmfLJQxWR6opE2jRYSksRV3iTYsaI=; b=2wm3OdD+N4gxKACWisPnR0H8o8
	ZDQ05Qh99/mz6kHUaTonYsv/ukvwldwzlFXKg9qxFMHTPiKXviwC+HA6alYZIGukRbJmPnkVl+3ZC
	W8ObO3whS3uUimEGEJsKyRqGoSz5KqVgkqaF6m4eWZeG9HFN2cfKNtNz9/+mpJMFjA4Xzf8aXWKtw
	dbGKk4wNmCntCMVpiv9FZa1a4QKz3c3egvVjuvrq4p8lACRk/+XIuYCSZ/3oj8225JCtAp4V8qaOd
	Wa4kMetZIUrNZJyCzP3Ye1yEjcMVDShGch0ouvbrdK7gwh5qp4lYbzJzKFVMqqJWUvk0oqopio8bn
	ICVV4l0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV5eD-000000020YN-0ZCL;
	Wed, 31 Jan 2024 08:08:41 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV5e9-000000020WC-3bIA
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 08:08:39 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33ae3154cf8so2523480f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688515; x=1707293315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoLOhMfUIiPj96gmfLJQxWR6opE2jRYSksRV3iTYsaI=;
        b=sxhl8zMk/vhX6Q7+6URGqHe1uyhyH+gb3/sk+/ZJyb5rC7szFx8kEWtp1A7pscO3je
         Jh89B5xT8OY3A5n2vzkiQBPJ2ZPnbDJ/NXVK3yJn0UfUJ5/wVxyigIMLX/pKbCOraidz
         UwPO++fspBCMrRROP67s+/mKwZgZkQ8FP+LCjuG19LJka67WGJ4IhB5TDK4kOboytBB/
         Fxym4OQL2hGlljisw+9Q6PBTA0WxPL+H9xQ061mZNxI18w+kVz4Z1XmuB8LmrmOwimWV
         m2rgITkDhNOdSJS24pFfH3LUz8x6SfOnAlceXgztH6jc+x+yZbJg+aDhte1cZer93XRG
         8MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688515; x=1707293315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoLOhMfUIiPj96gmfLJQxWR6opE2jRYSksRV3iTYsaI=;
        b=qsIu6oT7T379Rx+f0lZbWHRhtJcwWGz2aSc2F95GXjBDWmNKdIYWIyNMr2gW2ekawm
         INp+wsAWLsexsY00A2hyKtAtxqtqxBmIFHcI/y+NttbCNN4PNTXcwQjBd1CPiFzItL2A
         4u2k9udE2znws3oe7RlmMa8wXWPEVGT6wMnuE2iDMV3xNVn1CKHPbuCnLB5AuxIxCzds
         tu9pu50ER0nnTnLu0HTVDtqCRgYQ5cHvqrUGjHH6jEEcpWj51o06DM5nZsfE1ETSTPyk
         1+b5Fw2bOfw1BWR2vFRIIctRZ8GsibLllWmPn1PH9ledQkRIvF0G/6q8QxmriPo/xDyC
         h1jg==
X-Gm-Message-State: AOJu0YxDPBlhYWIcIBE0DxFuYroK0qQ+8S38Kyv0CmTcvxUxdw7IREEH
	aEumTe/wSRKMkY+FY2e/Se5ViU+Y7iWqTGqZ4y0482EuBKkIx82kUBzroSZdj4E=
X-Google-Smtp-Source: AGHT+IEQSijfWrnfE1x/IhmGOIujlR21eS/1lucETA1cYhPCNsT1emGpr4CSNSjix7aPPjNS9CpWsA==
X-Received: by 2002:a05:6000:1143:b0:33a:fe54:4367 with SMTP id d3-20020a056000114300b0033afe544367mr541995wrx.33.1706688515023;
        Wed, 31 Jan 2024 00:08:35 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bv11-20020a0560001f0b00b0033b0558c5f0sm660263wrb.95.2024.01.31.00.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:08:34 -0800 (PST)
Message-ID: <73bb55f6-4753-4bfb-99f4-75d06d1f772c@linaro.org>
Date: Wed, 31 Jan 2024 09:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek: Fix control buffer enablement
 on MT7896
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230907112018.52811-1-linux@fw-web.de>
 <20230913083529.3bgjl6rvfmixgjnd@blmsp> <ZbnX2vfcalNL3yRV@makrotopia.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ZbnX2vfcalNL3yRV@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_000837_917432_3A36E811 
X-CRM114-Status: GOOD (  10.53  )
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

On 31/01/2024 06:17, Daniel Golle wrote:
> Hi everyone!
> 
> On Wed, Sep 13, 2023 at 10:35:29AM +0200, Markus Schneider-Pargmann wrote:
>> On Thu, Sep 07, 2023 at 01:20:18PM +0200, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Reading thermal sensor on mt7986 devices returns invalid temperature:
>>>
>>> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
>>>   -274000
>>>
>>> Fix this by adding missing members in mtk_thermal_data struct which were
>>> used in mtk_thermal_turn_on_buffer after commit 33140e668b10.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> 
> Kind ping to thermal and mediatek maintainers, please merge this patch.

Applied with master pong

Thanks!

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


