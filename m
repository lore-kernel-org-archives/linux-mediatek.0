Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9FAC001DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycpGNLsgt/ES0G1zwIWkJIdAtFjomLDl2xkjlXWSTo4=; b=JsEM/7TIXsM+SvCM5yyrS/kXUq
	kVqviV1aMHcz46/4+J+yywAYLTiECrfDiQOePF6n1z//lDfzTGtz7Ify4zdx+tdDwjvGGR2TntiVF
	ki1s7dSLQnGqTocsbk8kqD4W64PgyUEUZ62CQkwX6zax3LvMWKHn9U7loE3SJsreJMCPoSK9nvGQh
	VZLE5Mqojre9dOKTmWfPR4itQsFbeSxkV5sXhSDVBU7CW4aOImmr1P3v6wCRwiUjY677u6K7/qC21
	/faBhA3LY/6JGFKkV/Fm3K20QgsCwwyY26I8p76HMg9ZG1pQ06XfdWwWGl2rvBpXs9wJxbbThqM8u
	pMLnC4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmBr-004qay-1d;
	Fri, 07 Jul 2023 14:12:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmBn-004qZF-2M
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 14:12:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso21151925e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688739120; x=1691331120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycpGNLsgt/ES0G1zwIWkJIdAtFjomLDl2xkjlXWSTo4=;
        b=DVbjMVlxHE9pu3YlBytLFnpsxwPBMrs4rpCRfT0334ztrG4dfj5UIdU8xKhSyHlI9y
         dGLp86nBHpb1Wu+ID9UCtE6PciybqIGVT99TKQf3pGyXZk5VATe4xCQLgdm8jDwy0J4t
         aw4jAa8+T0nz9r55f4c6Evev2l5Gqc6l5K0eSgnO3ZeyyNdDyYHbDCh7SnwkUciF2r0L
         eXqCFb4R0FaCMGVkNY6mryVPdOytgJr4TglhKevcsFBxYZJJLojSXS2c8UtF6mjIpuh9
         p22MJ0bzcWpPT1A5c6tcjU7D7C5B63Z/0/R/xV6iet0dSYSSVVFX1IOId8dTN6lYtbb3
         thUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688739120; x=1691331120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycpGNLsgt/ES0G1zwIWkJIdAtFjomLDl2xkjlXWSTo4=;
        b=IC4IG0EO86P+2ng8ywrFktyzRxKu+xVx6ScunQ2IsV/O02HveZ5j6hWAO2rK9ha+v8
         l0KX6roZMst3df6Yp73/KdcrSM19yKndSbXBsYYgfHM3hJNMXCxvx/qr9ng9ozNPc/PQ
         gKmpAeEjV4p271pT136Fk8rD+zEID9MmuU4juu91zk+UQKafTRTWJFmti0RUTJAn8NMu
         Knt7cmWZr0dP5lSbypR8p3zo8W71d47+268milhC46e1AX7csrYxOqLgiGH3Ou7f9yhn
         a8Qmo9BQZoLHOCdKkFJ/3xFiWHJah/JMY7iJP4HkAO+0XzcT9bxd4o0SfnlZw+ESRFEl
         WgZw==
X-Gm-Message-State: ABy/qLYqBGZNwoDJvqttkU3cptH5T5ajv7GpRabUTL2vWDXyFLLLJbJj
	PIwY0E6KdM6ZpdRadGaFeP5l2Q==
X-Google-Smtp-Source: APBJJlFfVX3E+RmKYUQNq3SgciMbgNUkXY9Sjj/5oyQe0BzJbpLNP6WT1j91P4EKn7/5h62zHXUB0g==
X-Received: by 2002:a1c:4b0a:0:b0:3fb:d1db:545b with SMTP id y10-20020a1c4b0a000000b003fbd1db545bmr4005976wma.20.1688739120033;
        Fri, 07 Jul 2023 07:12:00 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l22-20020a7bc456000000b003fbb5142c4bsm2579548wmi.18.2023.07.07.07.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 07:11:59 -0700 (PDT)
Message-ID: <6fb74321-2f85-1a08-e16e-97346bd7e82a@baylibre.com>
Date: Fri, 7 Jul 2023 16:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 6/6] thermal/drivers/mediatek/lvts_thermal: Manage
 threshold between sensors
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
 <20230706153823.201943-7-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706153823.201943-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_071203_773912_2CCF4FA1 
X-CRM114-Status: GOOD (  11.22  )
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



On 06/07/2023 17:37, Nícolas F. R. A. Prado wrote:
> Each LVTS thermal controller can have up to four sensors, each capable
> of triggering its own interrupt when its measured temperature crosses
> the configured threshold. The threshold for each sensor is handled
> separately by the thermal framework, since each one is registered with
> its own thermal zone and trips. However, the temperature thresholds are
> configured on the controller, and therefore are shared between all
> sensors on that controller.
> 
> When the temperature measured by the sensors is different enough to
> cause the thermal framework to configure different thresholds for each
> one, interrupts start triggering on sensors outside the last threshold
> configured.
> 
> To address the issue, track the thresholds required by each sensor and
> only actually set the highest one in the hardware, and disable
> interrupts for all sensors outside the current configured range.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

