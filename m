Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AC5CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 00:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqMmbDT+DUxZelBUqzkYFvCgJc6iT9B6fZUcTJM+gGk=; b=Sd96dneCJKcGLDdv9NNG3eh5QF
	LOphQTQOMZgpuWSpP2uXmxG5V2t/PSDSAbcCw4YKne8wdJMYBT3s1e6XYLU3DkloApee9Tsg3GMlM
	3cY/S8vA+SFX/bUR3gknx4vqZEhkEySySQdP9VKPe82yI4EL9prBd9jfZKkI3UlJFNW14ENV2qGHZ
	RHQqEUPtbwst+nnjGnDcmj0V4mLvugYbO6Jq1Ahc23I7O5Zvr7tCPcmBFbIbRrRrJGZ9DJ29WRKXR
	KJRRLzneUHQWgHZsk6JBKkx4Un0zuT/idnY1XSNtSKXTLu6cev7HF9KNAnphYeCHSls61mRIWHzTr
	1oCM/uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtH9t-00G0pu-24;
	Thu, 19 Oct 2023 00:45:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtH9n-00G0oJ-1W
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 00:45:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so68122995e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Oct 2023 17:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697676296; x=1698281096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqMmbDT+DUxZelBUqzkYFvCgJc6iT9B6fZUcTJM+gGk=;
        b=c0g1sw+K2PRMQXp3SFKyY8dGXiFhqg+21bIugu/WjXjAsphrCQZoH/CIxYunWFnNue
         MzCuftGsRwhdaz6SesRYd5y//uZAn5hfSfSmaIB0uT4xiZgOTjt/O8TQ19dTgmhMxKU2
         G2L+d9i16uXUUrWblF0SyBJEfed0JZ44ipSRQfJ4OHQKIatGSNqpGRFEo/bO50VNljGo
         j7yCtYnlAmgBEEXjaGf1ngQElPAw/JrCY+oV1Okf7y4NusniEhUla95zBpBVr43G6pHq
         1PLItFGeaSft5MmxqWqeRTIbrmzzF69pCjBFUbXofuEGgQAg2xlsdiHQh5TnaVSO1Xuk
         61ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697676296; x=1698281096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqMmbDT+DUxZelBUqzkYFvCgJc6iT9B6fZUcTJM+gGk=;
        b=NahX9VnjnGPMUJ3TlvRPQRE51c8i3AfvfUg/5b2r2/zOy6A4vZ6TTsoFTomxz5DXug
         mjCkyoqj/7gdFUUSc4d5zdCbqw5lKy/3+qaiLgNnKMPjAkOPPok4NpgKxEN93vKZXwp6
         V24f4nhJeIUa6YwCcQS20OrLBZDFLtMpOAToLBjJoIupglG0w5cpjBEvJGfao5WAnL89
         eDSrgzBUy9EExjh8CdTWDDuOhDtAD3g8RVe73sH4iHeQuw/xKFOi/wWscSuKXLdyP7+3
         QyivjnfxojQL/8/inU4CDnlIXWhNgLSTsJ6uNQmIMfUpknJEPy2cM6liy4/A2lp2H71e
         3nDA==
X-Gm-Message-State: AOJu0YzrRiN1LSB3XaCukH500Y2Z3aJpB4zK1fQJiFi4P16CdC3Yg8t4
	25ciQd025+zS5mjvuKxki1QS7Q==
X-Google-Smtp-Source: AGHT+IHUpjP1fIZk/icMCfXuumPUX2ZnGdbVENpHqgXkoRfa/UzehhHFAMC9Rqok2c4BqwR4/sPJMg==
X-Received: by 2002:a05:600c:35cc:b0:3fa:934c:8356 with SMTP id r12-20020a05600c35cc00b003fa934c8356mr595689wmq.10.1697676295769;
        Wed, 18 Oct 2023 17:44:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6dcf:7c4b:2bce:3cb2? ([2a05:6e02:1041:c10:6dcf:7c4b:2bce:3cb2])
        by smtp.googlemail.com with ESMTPSA id fm12-20020a05600c0c0c00b004030e8ff964sm2985879wmb.34.2023.10.18.17.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 17:44:55 -0700 (PDT)
Message-ID: <608614fa-20f8-472c-8e38-916ff7d80e4d@linaro.org>
Date: Thu, 19 Oct 2023 02:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add LVTS support for mt8192
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dunlap@infradead.org,
 e.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, ames.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20231017190545.157282-1-bero@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231017190545.157282-1-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_174459_507698_E81C7522 
X-CRM114-Status: UNSURE (   7.47  )
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

On 17/10/2023 21:05, Bernhard Rosenkränzer wrote:
> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
> and update the documentation that describes the Calibration Data Offsets.

Applied patches 1,2,3 and 5, letting the patch 4 to go through the 
Mediatek tree

Thanks

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


