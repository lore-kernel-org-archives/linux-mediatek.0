Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4B7C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kis83jMD1oWs6024Wvt+G1gr/3Bk88oMA3d6rNJj5g4=; b=LzsFio2qeW1mr8UAUEe2Uy1HJp
	amVE7LLGWhhhfUwjhyo7Xw16utb9AooPLh4jeXR6L2Y6paQFWMNJM3apSIGUZUvmmnrzlvgofdsve
	2QKEtCQFlmzK8uRfmaDo5OBIIctUTSjkhERPUBv9Ovq9AM0wJ2dbwzPrXOu/rDKaZCwn+2DyHcZa0
	jBHj5ZWQs/g6DERheYO5zSthBX5oJpJhWPczyCSvkaDTkcVvLl7iuaGjuEPhSw5Ar9RrYrNbiP46r
	vOsUcl/Dd/WykQ/zOOW/a3UHTkgPHVw9APJn8QBisLyKEconIhiNb6BvjCD2TSX4xdF9xfaabpynC
	T6/K9hmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C7F-008iXH-1A;
	Thu, 08 Jun 2023 09:39:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C7B-008iVM-0c
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 09:39:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso1661225e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686217169; x=1688809169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kis83jMD1oWs6024Wvt+G1gr/3Bk88oMA3d6rNJj5g4=;
        b=dh2IGeZP1UXlw/rxc8tHwYftXW4vIKDKiSgUwwpYDTnQLnUUZ2eKQNpLe1ae+OOkaq
         ZUOfth6aGXN7TreMG667Tdd0b9nHJipOIZXaw1UP6PJgGrkbGVKv9GmuLrgVrxUYmEtL
         Jn5nUBOvSxF1p5Yll4gh3dz0l4pJpALQwXgKrtbWLz6N817Sd0MTH8Sbh8LY9iGf6iAv
         CA9Rl9Ase8AAeu4Y4vACb40mBoVt52+cKQzMjzXTUPPT7gr2SzKoi+ST2qflIt5sBVSX
         V4/djTioCzHuu7SKvoD/QBgRw4Sn1CPnceGIBVTQmGx0HHJWzWQOb8PCENz9gqNAuTcO
         o5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686217169; x=1688809169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kis83jMD1oWs6024Wvt+G1gr/3Bk88oMA3d6rNJj5g4=;
        b=Qg6Gt6XF7n3gseWhxAR89mLlFFs2t9QJszFjIaKeOjdVR2lAQre3nv/eJd5NFdMKLP
         A8kTTtEconcjCob1nK986h+oICmgrb0XBmY03Fu2ETBy26ffAtWAxfA49DuKqwnb9+Wk
         ONONZfARMM0NF1p7pwynzuWAaq6Eb4oyIMjDoeJRLquGWpYbnbwcDHY7rYjb4q2XlTHw
         0TNp3XSVYwYzv9U5H5wo2ASJ0i18KxjGIVmE5PNqkdYLhMDtJNPYVNWVNtQbFUiRf9L7
         jmc+mWv3mGnmIJNIStEm1zApYKc63cGCYLhkraJGS4gRMUhxk7UH86kgkK3mycV0U0qt
         kfZw==
X-Gm-Message-State: AC+VfDw4LfRJ8vkr2jti7TFVkWGPgt6ZwJ/gHTjXX/ZRVMpvS/qOlawy
	uZkINXK6ol/WYwad8PJkOL/3GA==
X-Google-Smtp-Source: ACHHUZ7Ms6WXtKfgT/Z+U3P+H7HunJuUiCLEYOMq2NRw8YGy939Doi5kEfI1/uibHdDRb84aF9r7Mg==
X-Received: by 2002:a05:6000:108a:b0:30e:56b3:60fe with SMTP id y10-20020a056000108a00b0030e56b360femr1337520wrw.4.1686217168916;
        Thu, 08 Jun 2023 02:39:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3a59:921c:4758:7db5? ([2a05:6e02:1041:c10:3a59:921c:4758:7db5])
        by smtp.googlemail.com with ESMTPSA id u13-20020adfeb4d000000b00301a351a8d6sm1046418wrn.84.2023.06.08.02.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:39:28 -0700 (PDT)
Message-ID: <59c7c90c-50f2-5a77-af12-b266c6e6e0b1@linaro.org>
Date: Thu, 8 Jun 2023 11:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <CAGXv+5EVfgEBDm=7MmQ=OsP322KmE23PwycJ-0LjU+3dEZygUQ@mail.gmail.com>
 <572f5a88-8c2e-4324-b477-836a5024ec67@notapiano>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <572f5a88-8c2e-4324-b477-836a5024ec67@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_023933_229874_23867D7D 
X-CRM114-Status: GOOD (  25.54  )
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

On 01/06/2023 19:09, Nícolas F. R. A. Prado wrote:
> On Wed, May 31, 2023 at 12:49:43PM +0800, Chen-Yu Tsai wrote:
>> On Wed, May 31, 2023 at 3:51 AM Bernhard Rosenkränzer <bero@baylibre.com> wrote:
>>>
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>
>>> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
>>> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
>>> and update the documentation that describes the Calibration Data Offsets.
>>>
>>> Changelog:
>>>      v4 :
>>>          - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
>>>            room for SVS support, pointed out by
>>>            AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>>      v3 :
>>>          - Rebased :
>>>              base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
>>>          - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
>>>            Use filtered mode to make sure threshold interrupts are triggered,
>>
>> I'm seeing sensor readout (either through sysfs/thermal/<x>/temp or hwmon)
>> fail frequently on MT8192. If I run `sensors` (lm-sensors), at least a couple
>> of the LVTS sensors would be N/A. Not sure if this is related to this change.
> 
> Yes, it is. Filtered mode has some delay associated with reading, meaning most
> of the time the value isn't ready, while immediate mode is, well, pretty much
> immediate and the read always succeeds.
> 
> For temperature monitoring, filtered mode should be used. It supports triggering
> interrupts when crossing the thresholds. Immediate mode is meant for one-off
> readings of the temperature. This is why I suggested using filtered mode.
> 
> As far as the thermal framework goes, it's ok that filtered mode doesn't always
> return a value, as it will keep the old one. But of course, having the
> temperature readout always work would be a desired improvement.
> 
> As for ways to achieve that, I think the intended way would be to enable the
> interrupts that signal data ready on filtered mode (bits 19, 20, 21, 28), read
> the temperature and cache it so it is always available when the get_temp()
> callback is called. The issue with this is that it would cause *a lot* of
> interrupts, which doesn't seem worth it.
> 
> Another option that comes to mind would be to enable immediate mode only during
> the get_temp() callback, to immediately read a value, and return to filtered
> mode at the end. That might work, but I haven't tried yet.

Why not understand why the filtered mode is unable to return temperature 
values most of the time?

I tried with the filtered mode and I can see 90% of the time it is not 
possible to read the temperature.

IIUC there are timings which can be setup, may be understand how to set 
them up in order to read the temperature correctly?

Caching values, switching the mode or whatever is hackish :/

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


