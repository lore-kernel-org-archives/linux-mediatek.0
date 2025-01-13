Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D567E7719F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XbjvOHgX6cEaqQor2rPngcF665AthpQbidXcULPyXE=; b=jZb1wMYConSM+mJbco/R3HNkLo
	LnqvrfRJKKTcGVHRtAZZMhUQ0jd2Xs7r/AMDr8vPfN49KZFt+kQvKo8N6UTj+l9VK/6t8H7YWJ+p2
	Jq1bv9KkHsSZwtzvH4udU3FnMQH15CHxeYqC1NwTeO8shq5qLltH7w0C4gP4qnd4Quf9wpyrtZmmD
	t6v2FtYCYtmA/RShQxu7C+KlnZdHzR6741NO/heDaRuO7nF5sKnc3o3Yx8W9z3AgWeoomnGg+cZaL
	dypJTyM/txpaQceGFAZnoPeg1M5ftb3IlmnKGZhZ/Ubq9YL+k9GoXE0dHTP5JHGsBT/wr2QvEfhrT
	Y2M1Tjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKB8-00000005BkK-14iG;
	Mon, 13 Jan 2025 13:08:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXK9s-00000005BPq-1uGw
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jan 2025 13:07:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43658c452f5so3898175e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736773627; x=1737378427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XbjvOHgX6cEaqQor2rPngcF665AthpQbidXcULPyXE=;
        b=cqJzAZRSgXoo0B29Uii9QviraF+jj2nzFeE6lxS+sf+Uq7of5AtmzyCKWSeO3y09K2
         pMs2OwbK4xJSCr1x6gJ4qSDIDX687Y4qhEnmJrxgvQ/ysnlaER5CKYqWVH94zok0o8ea
         J672LEi1fC/4k6suXYhR2RqxlhLxaap9zGU6Ahm4rePyjM3C/FRUXv1/l8/Sz9RnkSe6
         pCq8FM/2AFnO9npzKifdQFvtkRLM2vjgADaRwSsF5shFv92girw0sf7+t9oBcXPaHpfu
         cNo3/gpbQDQPRqx0p/H7cPorqe2zupa6hcBqZKMUMEyBPtEWCxb/0kWPBnnwDw2TrfOU
         sw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736773627; x=1737378427;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XbjvOHgX6cEaqQor2rPngcF665AthpQbidXcULPyXE=;
        b=kblSqVc7V4XiybRY7EHD3u0kP47wsDypzk8eEDh68uiIle5ur1Rtv82xytbCYQtSnn
         NDMSgtkwTqVNhHAifv+Tyd+0V0zIVAj9ynkyVT1QyKKTw+wQdXpCUYBWipIXnlY4yW2D
         p5V2ThMUzlbOY2cuhZD2uPgBs3vtbbOv2gYgfwzy9ztml4eMWMStcFugBTpR2eTrMUYP
         xBSmjhlZHxddSKM7iBEOxmL+21M9smW1zRw15ClsvR4TeajDejQyuxOKr9WNaKjRpwRd
         2Ni1n3AL6Z9h9JhnpLNis8AJXmkG9d/nFfH/cFIE/VBYQmPwie3iu10SlQzCam6RFOFC
         c9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDv0FhkOMqQ9eM45iFJKUgPM9aqhzQmSkPyGx+BmrNUZpzTzYBH3NRm1UhdTsg1ZXV+B7cEqyupBD1TbrstQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5kmiRai9c1hSlAikbqJqkzN1nVpMteSjAcdGhDDsXPLSv/hwA
	EGg6a5jYM59qIB/J4mh3bJYe7ITWmyogSngS1kgnLmR1tSiw/8k78OyZUUqmztk=
X-Gm-Gg: ASbGncs0s6aEqrdWD3zE3d07DE7BIBBrqjuQ4lI4Uaw3sR5rOjTi5tsel/GoAVzEwno
	oupycvOgyLrOGJRR6G1guV85c+/lJcGC3pL2H1+6+0f88SUcbaWQUT0DvvkL12U12C5DS3cY7ug
	h4lfuy+W+3lBUEmrIPkVjzwKBMlVXDZLz3jg3GEzO0+LpNYujz5Q+8csxhG9mUBpALD0NWQhRWU
	ocXlb7jVBZqSgnbi4fFiGcN/Vz2ACBn3SEf+ARvWSd5J+oAh9LFz4nZWO2yaKyshBsTdBjfA06V
X-Google-Smtp-Source: AGHT+IFiS18jgHH9bOldeMosMuJrC0O44MTlecZH01J7dg1Y0bV9+S1yOTILTG51FUOyHKtLpcBIJg==
X-Received: by 2002:a05:600c:3c97:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-436e2713e51mr80617645e9.6.1736773626697;
        Mon, 13 Jan 2025 05:07:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm141839725e9.10.2025.01.13.05.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 05:07:06 -0800 (PST)
Message-ID: <59f8a02e-a716-40a8-bf73-111ad2a7af79@linaro.org>
Date: Mon, 13 Jan 2025 14:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
 <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_050708_497650_7EC16165 
X-CRM114-Status: UNSURE (   6.95  )
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

On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>> Use dev_err_probe() to make error code and deferred probe handling
>> simpler.
>>
> 
> That's already done in [1] so you can drop this commit.
> 
> [1]: 
> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
> 
Eh, this was first in v3 in the middle of Dec, so why you cannot get it
merged first? Creating such 34-behemoths causes simple cleanups to
unnecessarily wait.

Best regards,
Krzysztof

