Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EABCC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw5WZV22kIf8LV4BYYD5zMZGL9QT6puKpKuaXbM0YSg=; b=12f4CF1nR4ihlV/uKRgv0Bci76
	CotYyVljkM1WsGu0Hmrehi1JhXAvre85qkeYwQM/KLEvat7nrsJaiS3zEaivyNulWhlKakivit3cI
	NKIOp62kEoptPEPO4nV5wDBp6iDTZzltC/Ghz6zIluFcxVHzN5g6UV6WwdEx7Pz3LJqFdUW15QrVe
	agXoLLP+PF9aYqE3LXXhnNumyMnx0eTr9amyge8d3P7XasHHtw0VMnj1REeaAvbjKlBwO5POokUgn
	gJGl/ZuN82afnf5E9ObIRkgy0hYuO/qLt+HIaC0TRe3Zsm3I/Nv/Wc3LYV2RjgcHMwFN1w53DNfyy
	X/zJXkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLX7w-00GhWE-5i; Fri, 27 Jan 2023 22:23:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLX7m-00GhSk-UF
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 22:23:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso4487171wmq.5
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 14:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hw5WZV22kIf8LV4BYYD5zMZGL9QT6puKpKuaXbM0YSg=;
        b=07HB0DkOvEmzPwgdHTYPWBEwazvDvzxyXCvfZeEWHr7ZQVYrN23FroZHnqI9o3YYHb
         nOWJYm863srNOIMCCwZ2mMY/KM8WhFtuv6NHRyWz2MbzQsVDPELd6js2CKsC4nrYRvI4
         g8Y6/f2s6qoCR3kIyWQ3MO01DIQ7riQpvmCfRabBEjF2zCvpJv7i7FCTrehYbECTWJO3
         qUHmBwjPcl7oPemz/n+ztbqiG6jcanAHYa5sIB4chD0sQ95oaUIX9Hx0AVlal7PEvguQ
         VRlBBwN62OsA0Smn4ziJiYerSpQy3W3RdvWKeyMAlihnyK8qfl5qMQ3Kq+LPoM9VtcQt
         Klow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw5WZV22kIf8LV4BYYD5zMZGL9QT6puKpKuaXbM0YSg=;
        b=iPkUg1tLC7kHb4bhkUkINS1Bh+yqYzgp2jfM9f6QLI/LQGQeeIzfQNK9AuCQqyIHTb
         94t83NpZ0EawW0FA+Tq8X3UTPT7e3Q3OZFLtoAmGUs5YaBBPYQb7Ejga8Gcz/9RerkuO
         6/9g82HsYAOfoS/d4jwFDfMbPSBSSNfV/eIIj0WJnylz4hn0enqCirpBoPruBcfKyLk9
         SlBZKn3rZ0fcAgGd0KOh5zXO6JOpZHZs7ncj0Xs4RwEpeQ/Gz1yFW1NfPPw1elpU0OGL
         Ym5jth0rlTRhCpTuDRIl+ct+perlOB2rsu1GRrnBcATXJgJieH/xHGUGdKP/0wJ2JlKr
         jtUw==
X-Gm-Message-State: AFqh2kqMQDUHYuExFSyEvPNdIQ5iDcoppgE331s71Y92/pU6RJFC5Vst
	z16HY3gGmnp4XK90iTcy1IBC+Q==
X-Google-Smtp-Source: AMrXdXsAOA3YpQ4mwC7XEGlfoY6kbh9XeRRAB2vBaRPH37DPkopUrTvg7H0JBMp+rt9MvYA3N+zi/g==
X-Received: by 2002:a05:600c:4d93:b0:3d9:efd1:214d with SMTP id v19-20020a05600c4d9300b003d9efd1214dmr41147873wmp.25.1674858186392;
        Fri, 27 Jan 2023 14:23:06 -0800 (PST)
Received: from [192.168.0.20] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.gmail.com with ESMTPSA id j38-20020a05600c1c2600b003daff80f16esm12461874wms.27.2023.01.27.14.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:23:05 -0800 (PST)
Message-ID: <81989ddf-4439-c176-e003-891f80a4e291@baylibre.com>
Date: Fri, 27 Jan 2023 23:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v9 0/5] thermal: mediatek: Add support for MT8365 SoC
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
 <afa4aacd-bacf-a545-3973-474286fd4b9c@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <afa4aacd-bacf-a545-3973-474286fd4b9c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_142310_980441_33D7F940 
X-CRM114-Status: GOOD (  14.49  )
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


On 1/27/23 22:59, Daniel Lezcano wrote:
> On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
>> This patchset adds thermal support for MT8365 SoC.
>>
>> MT8365 has 4 thermal sensors, one for CPUs and the rest for debug/dev
>> purposes. The CPU thermal zone uses passive cooling device with
>> CPU{0..3}.
>>
>> Changes in v9:
>> - Use delay between bank init and the thermal zone device register.
>> - Link to v8: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>> Amjad Ouled-Ameur (2):
>>        thermal: mediatek: add callback for raw to mcelsius conversion
>>        thermal: mediatek: add delay after thermal banks initialization
>>
>> Fabien Parent (2):
>>        dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
>>        thermal: mediatek: add support for MT8365 SoC
>>
>> Markus Schneider-Pargmann (1):
>>        thermal: mediatek: control buffer enablement tweaks
>>
>>   .../bindings/thermal/mediatek-thermal.txt          |   1 +
>>   drivers/thermal/mtk_thermal.c                      | 117 +++++++++++++++++----
>>   2 files changed, 96 insertions(+), 22 deletions(-)
>> ---
>
> Applied, with some changes and the subject fixed:
>
> Subject format for thermal is: thermal/drivers/<thedriver>: [A-Z]*.
>
> Thanks

Thank you Daniel for applying the patchset.

Kindly,

Amjad

>
>   -- Daniel
>

