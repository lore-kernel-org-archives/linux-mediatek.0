Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309D9C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nmjFBEeD9ZP/eQLwAKtGJ8tL9wL4OpdvH58XZgElX0=; b=xl8Y748bI0tFzwPoH8iHyVrdQI
	Ig/jvNTq80Wf9YKIG+l8SsLMVJVP39ZO4kAmV1VNHaM2AXVFdqM6EPoi/2cYsU6C7mXreA+RPKUU7
	N6ePrAK1VbIQhYDAsb0jKPCemfQbdk/wI5nG7RncFihXcHCh6NlKiR1G0GekuaYP49JWxkOnF25Zr
	MlP517g+O81jB7VbG16JHUeQOVeu+KteWT7LOV+B9/GCHlWqxOB/AX0UD6Mkuw7pHppa8OqjJabXZ
	SiC1YgxfrJV6CPn4YGyL0HBf4F33KTvLWmBJ7rDuZfKYGJWCfS6LPIyjUbBspmFWZlMvKD4tNWAPY
	qNdtdM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYGL-000Fmb-8M; Thu, 20 Oct 2022 16:19:17 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYGI-000Fju-MJ
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:19:15 +0000
Received: by mail-qt1-x835.google.com with SMTP id z8so14012047qtv.5
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nmjFBEeD9ZP/eQLwAKtGJ8tL9wL4OpdvH58XZgElX0=;
        b=Ew3XbGq/ADOFDDQULys1w5f0CUfRk2TBhCZqASgyGf36zV7VrScYztVOw8PmvpPlIB
         HYGwtPKOluSR6DSzzIvr24JeJ0YYWoedtS8MzVoC5I74C3fbl78BwL4tOR0KcydB2KSb
         /V2CzhHyrKES9ZLC827HHJDu0gp7CJm6ybgYZrtdqvPzZMmoCUXj/HWvUXMmWbIG1pmn
         T1bsNTHO9qQzwZZnkI0HRDhTTPZ9azKvLazcaXqn1eFLd1J/GxU3DtrwmOLyVeSlsYvg
         bG461MfFxyncmwL3rNmwLUZIHwqKECSrwdyKE4M5VeHTEJ9bCVZBJz3/LEdk03MCSnR0
         Cw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nmjFBEeD9ZP/eQLwAKtGJ8tL9wL4OpdvH58XZgElX0=;
        b=eZHblLaG0Uez3B8j9sDjzcewfCZR9EEr5M8vIMjzfsmO1Siim7Bp3MyrOcYv6JJUwy
         8ytj5fP5JfiOg8WAYJX147WMeMG+fUxl12M2TMxI51Z5kiAAo96kLej8YLsmWwLU1KuR
         Ov+IYHiKIFDJfV7sxdyA4PoE/XsLDFyrkWHZDk97CA7Cyrjzw3IEXjwkzOKOhUS7/VQ+
         xW2pctSu97TOVPYASFSoiLzuoKShVPIasO1UlIAPKCctJHtljjY1VCIH8p4+iLKuaEK+
         ql64+W0n5EheYQi9463IaE2xCnOnczZqBVPHh+cAgulKlnTpkwPkKImofTjwbazzBRQF
         d0Xg==
X-Gm-Message-State: ACrzQf2xqj47zmfWqHTEVbtmS2MA5soXQ8quga2AQiPqtrwPrIkJHV58
	Sh6oqfo45QbehHZkFY5mATQhVg==
X-Google-Smtp-Source: AMsMyM7XjZb4dPpbk62kCztyoDByKSy+hibNQg8o9nkkhr20RuX1MAdCla2yOjzYa0GvSTYvZIsm+g==
X-Received: by 2002:ac8:7c44:0:b0:39c:cbe1:2787 with SMTP id o4-20020ac87c44000000b0039ccbe12787mr11764085qtv.214.1666282750048;
        Thu, 20 Oct 2022 09:19:10 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id r17-20020ac87951000000b0039cb9ef50b5sm6277185qtt.26.2022.10.20.09.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 09:19:09 -0700 (PDT)
Message-ID: <aaf7d4a9-c767-6a63-691d-e3ae00b206fc@linaro.org>
Date: Thu, 20 Oct 2022 12:19:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC
 bindings
Content-Language: en-US
To: fchiby@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221020130957.25197-1-fchiby@baylibre.com>
 <20221020130957.25197-2-fchiby@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221020130957.25197-2-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_091914_786196_20924C58 
X-CRM114-Status: UNSURE (   8.56  )
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

On 20/10/2022 09:09, fchiby@baylibre.com wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add pwrap binding documentation for
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

This is not exactly v1 then. Please use patch versioning and add
changelog (to cover letter or to individual patches).

Best regards,
Krzysztof


