Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D362C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyfZaplS0CdOEyobkvBYVRoP/ZBGSD0HLa8+e8oH5HE=; b=wM4U4CyJOzWs4IiP9drsjzFHd/
	ClZELW5kAOe8H1jxrdA8hqMeyBDyl0xhUk2U62asvcCLsbiBA1We95v6sJPdOJ600y2lvVQN+7FLC
	7vhEXaxu8jVZFhicvlUC8sQCkSgpBXx4tMzT148kN6rXZLq8/2DjS3zzio1UKvuV4RUff8G/Nknwf
	QBJlVOl8CSVyUDQKGuUQrOWtsVhsYNYeu2h81zX7EfYihZYfVrKvsXNEGt/aLXv0rU2fCk5+T0PJp
	u24ANjMYiBrzcOL5eKhMrg9mj5+lbHwkfyv9dJF6cLoXcf1+9RxDHXBpF4na+v2cysKLFOCMU8Vbg
	XDdASNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYLe0-0000000GNn5-0uRz;
	Fri, 09 Feb 2024 07:49:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYLdx-0000000GNlw-0WqJ
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Feb 2024 07:49:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-410585542b3so5111305e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Feb 2024 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707464990; x=1708069790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyfZaplS0CdOEyobkvBYVRoP/ZBGSD0HLa8+e8oH5HE=;
        b=eTjVxkJtQfVrnGimsBlFJ7OD0+GcG48ThYwzFsIacqne44ftKgy3iwcDj7OhqAqWxZ
         2GCWM0HxfbXu568HtP9Rdx+b/VkqfQxPAz5OweDhy7rFUlZ04DdvfmX4H4kwlNCiZWjy
         zrGeYs9O89Iosm/oqLTX2R/dx50sH3/nj30OKZtAKJB5r5sGz+h/rvoS2nDBCcK3k0Vn
         /mmERPPV3vB0PStrkKcppar67yzAYaZ7iBMI1lQKPpTP14/B+hIoyXZ542PaP+066R5C
         a2bqwefgj+iO+xJrOqQRj69rP9OxHd4I4fF7S1BFvzhOs+Fkr/glYqSAOXhfbkZUcXA5
         MZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707464990; x=1708069790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyfZaplS0CdOEyobkvBYVRoP/ZBGSD0HLa8+e8oH5HE=;
        b=Ldvx9QNvm6PLjuvuxaQsMbhonuZDYjFmiVNth7ISf3gni4oujaH6vgmggEsS53Q43h
         o3/hI0vuvCS99Yu+e4eWW1MhlsuZMJw/JN9LX3lnag2dj9jVBUUP0hMrOHcZSUBlUVeh
         GYzU/LuUqeuu0jvnu15vs9MJQ4WBAfgbqDTSqvW4FBZXgn6YsYV/6VdZwXDojuCrASaF
         LT+h2oC8A6tLdeq361asbP+zIv5Z7J636VbufvbF3Ma3pme9rACUktYxXFdxdTuiOrxB
         GEzlAXH7dSo4sQlwC9BenJc0KhusHVPJXWCl/eX4TXIh3bhD7zrgMqUZYr98uKBpSKAf
         pr6Q==
X-Gm-Message-State: AOJu0Yz2EFD5NqoFTH6NCvWEcNtQQzcT1EmAhZPy7wJuSrCuDlgar649
	n9WNWLrNPfyaCUJhKo6/SOKCxSOyKbAwq9XcRaLNuQSMFa6mPu6in6HMrT3tFyo=
X-Google-Smtp-Source: AGHT+IGsyf1YALZ5O3J2fnTeN/5YSH2v14+rxSX1FZuqmIPS+TfvysFQyLSJTphiSxM5NdgJTkU56g==
X-Received: by 2002:a05:600c:4510:b0:40f:dd91:2d06 with SMTP id t16-20020a05600c451000b0040fdd912d06mr535847wmo.32.1707464990670;
        Thu, 08 Feb 2024 23:49:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrgfUvvyDK1Xy52Un7DfaMmY/R8LwtFsG4oTxZ+0LZNx80Ybj8xJNsgtrQzgR0zPrFrsQlbHu+avYyrc4RuabYhkAn8tEo7LdSHgofs4z7COyXW/sGsE5bfSEC2YbQN5YPvIpYuQZ5hZxepUTSAgsNpNhJKDU+F1L0L93qgf1HC4S2Giwe2ypAyOjGRZB+Vt2BpbFdXAxSohIuB/eiakXoZztqFGCWfu5kYXdtf0WGlN3+FwQDtbHrrnQZBK1K8/rqeWl2HScjp4u7KE8orByXGH3Eic3GFLPSE0bi3EHei7zpTtAMphmiAV7T8MELPxN8n6q7xQd2cpkMxaUmwfsoxsAG6WySAqVxHY7bTgZ9JM5DT7Z7jqQv1p12ph8yeVf9ABhmIcp/ahi9e5XfuuxdiWDo6LYLHK5u/w+TUuC7rUgtGqyVduRdw/LzMBrZzO6wHldIVVM3yzHPzK10BIPMYA8Hh9QnFtpqo+GO3jNk+M3v13JhF8Spwh5xkvPyddEXRP/t1iPtR4hVcJ3syHV53IOPAVK2hW267A==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ay2-20020a05600c1e0200b0040fdc7f4fcdsm1791764wmb.4.2024.02.08.23.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:49:50 -0800 (PST)
Message-ID: <40d5bb84-a65a-4ac3-a17c-062ad4b8ea4a@linaro.org>
Date: Fri, 9 Feb 2024 08:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the
 json-schema clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240208215926.10085-1-zajec5@gmail.com>
 <20240208215926.10085-3-zajec5@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240208215926.10085-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_234953_194314_A83F5735 
X-CRM114-Status: UNSURE (   6.91  )
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

On 08/02/2024 22:59, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Dropped "syscon" as it was incorrectly used
> 3. Adjusted nodename, "compatible" and "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


