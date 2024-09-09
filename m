Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCBCECE57E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu8AiuVNDMFZsHKbDBADYE3SgSVd3DKO/R+5KxRr+yo=; b=x09Ymzfj8AsA+hCXf9u//Pxsn+
	i8BwvEHdFvSezevH3CGuUgVu+ct1z9XbKqDCrvWjgYVqLQCYY0UttpFeHWc4c44wyUhNwrKlLtPLL
	NZ3tGAjelogPls0qrvexR+JQ9cZ+1fz4jkaM0CYt0Ku+4pDjCZ9GB45zp+FRzci4XJpHFma/fu2gx
	cNXVMd0OaxZQqfBuYwu5YRUTWU2BpwlctE9FkYjv5YOtyIjLEWPg7IkkEG60dMq6ioN3kZ488yCZs
	8FmMpImgnI9L17eyQM/v8kBZtLMHgiM2s0/MKGDEdLA8tYEcT32ajZETQ1NQjKRZADkry3Z/HWYtB
	NGIqzuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndwQ-00000001xRS-0wjl;
	Mon, 09 Sep 2024 12:56:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndqq-00000001vsQ-0Tx6
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 12:50:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-374b25263a3so2473672f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886238; x=1726491038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qu8AiuVNDMFZsHKbDBADYE3SgSVd3DKO/R+5KxRr+yo=;
        b=KNYBqlGRuUbJwFb2b3yRyoBbdvXT36OecItidz3KZGHcTqjH9fbmIjMwMmMqfF7zs8
         l72X/HfAdn5pvAuwF3++fq7IVoGudbmHwjC9wU/j/9m0EmjT7eUH5+DNfObO4Ay1Q3x8
         x4fwhFF2GhZXo9C5wVne9Vp+oSufrlu6fSZH47DnYgiYBQZWNJnAf3bC4A/XAQt1zrFh
         QYYAVlyBgeKK6z77cDBIJgnc3dH7ty13CNObDnzn9ruxMeq7RwaJRQsWx/Ynz7q3/0DK
         93S1NTCaM6hey/y/q2BfrYuHAf7KjjAHUTxQDxJa0LW3DflikRzw0fL5LHszNjQ4eqeh
         NoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886238; x=1726491038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu8AiuVNDMFZsHKbDBADYE3SgSVd3DKO/R+5KxRr+yo=;
        b=SLvgAcYO5S+KXzxsLt6JTtyus8xI5LUtslxby3wFNwEai9Ab7x7jDejbiZgDJYgKNi
         yTcmogPDILSvm83zZH2UeUXL9Ron8LLsH6SBvfv36gXxhzZF0l75JcDe8G8WiT4Vupns
         I4TCLQ21ATHht1q2mSShoEkES3WHQAYqmNePeu65+9gK1A+38XfHj4hN9sYlJLTtr3KI
         44xJ0UAUw64IMth7FXAFbtcDgEXil1eh9j/wwwdgjmIHYZt4Kuc5+DNvCsNuSeIXXYKv
         oS21xxhww1o5ZeUFGgfjo0kkB66rgzisZDY0ocxWLJYf/Qq80zUu7TuSjj0tQRqcETeT
         yQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXhllKe2d8CIGZc6HUjIUTvEo9wehnnk2JYNXpwmZj/Bq+g58oFgusr9TOp2fhprYU8CIo2/Z1X9vsSDpb0Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMSNwYDvoJg0xiouBP0Mq0zmwF3qTWGIFoVIWKB1rB74nkzCu3
	2+sTr3xohDuA5A5QbhxypEsrvmWcHUoIX23AV0BTk9wzN+7xLFPwKSY8hvBTkMU=
X-Google-Smtp-Source: AGHT+IGw51hUzdlE3S3wJzKx6lcv6PmKcfrveOD7e0k3WsT4cO9ATJhlJsGkwOYchIgV3PaN0zdPpg==
X-Received: by 2002:a5d:47ab:0:b0:374:c122:e8b8 with SMTP id ffacd0b85a97d-378949ef675mr5281675f8f.11.1725886238075;
        Mon, 09 Sep 2024 05:50:38 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm5946522f8f.18.2024.09.09.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:50:37 -0700 (PDT)
Message-ID: <28afca15-561e-4712-858d-e3aaf130c72c@baylibre.com>
Date: Mon, 9 Sep 2024 14:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: mt8365: Open code BIT() to avoid spurious
 warnings
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-1-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-1-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055040_191741_79B0C1A0 
X-CRM114-Status: UNSURE (   8.85  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The mt8365 driver uses bits.h to define bitfields but BIT() uses unsigned
> long constants so does not play well with being bitwise negated and
> converted to an unsigned int, the compiler complains about width reduction
> on a number of architectures. Just open code the shifting to avoid the
> issue.
> 
> Generated with s/BIT(/(1U << /

-- 
Regards,
Alexandre

