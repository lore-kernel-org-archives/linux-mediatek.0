Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED33C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8IXJlkZ3kK1kqfbuKquJypXYaObUNlyVWB7REuf0M4=; b=IkHazo4nzS4UEO
	sRhe3zAIKkYS6gQuKV4ULFXNI2SLwXq7rsv+s1Yzy0zc6bRZ5hxeOdnSeKockTLF7udN23IeRpgen
	g7iIy25p1nNgG4JpRx7CU3GLgkjGPe/O2t8/SwJONkh7m+mOCwu7oyKqL+pwB8qz/A3J4z8JIwfPI
	ITeJeb6wXzipfbZsanpk/I9+GGk6EQfYZRb7ERxedKTtSBoNlLTrWfyF9Nc/ejGZzw1g5P17TsH3E
	3CbPSURNVyMhuxvjm2SAB5MuNSsAPsDTRCuOiSNirKp3Q77GH5CJk/fBytDHqw5dtLH7Tpbd9voMl
	PVH8JIodt0oGoTHT+qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRGw-007X19-JY; Tue, 24 May 2022 09:56:14 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRGu-007Wy0-72
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 09:56:13 +0000
Received: by mail-lj1-x22f.google.com with SMTP id r3so13375757ljd.7
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TNrztLGI7YmluKNlO8mQvCDSwLHT2q37DR0pu3wOwMc=;
 b=bqvCUGJAQAzLwY3sfu1hbgOSI+pcfdQAwtt01ZRg7d6FXrdv14i3c6V7VthX2NnZVo
 onXYiwgJZj1ydS1utpVk1BTcqiUNMjiYwvA8Cx2NiqpgQelMQPvIWQnSfR32Q2hexpRY
 Hf0pgJ+TdTcfVH9uyqE4FQCz6Q1AVtEiFyIH7dnG3sjGVnw/UA1vU4od1jqPrKSQx9H5
 24cMcqUL63dp3SLHwRkMAjo4mkg8zm1+B9lC+/x4WkeuecgZReWPwYV8wDEgdoK3YrN6
 wo4ACh6sSfdaBjU+dZWa+ReWcC24f3W5rVIq5PBwAwA5a0xFEGs6DDycoEMP8kjOmxie
 ZlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TNrztLGI7YmluKNlO8mQvCDSwLHT2q37DR0pu3wOwMc=;
 b=d3oF8JjgbkhDxjlePs+PDXgVzxus93Tsup4welBn0Z5qQbVG0VTcOrsd9iovkrMhjL
 xYpzFS6tiGCWLfvcoZyQ6BSv/0S22uYneMcxz1iVm4/gzMM+k4o92X3eEX39NYtNoTgz
 uQTZ6wD3md4VBVTErvnR7XRLp6SFK/CEkfwY6jtDE+EPrmK2PsksCH227Cl45CxSSP/X
 /2nUdCYDvZOFVpkqgf95rS2eHDSisWX0yQFF8cOHKFuEdQDj56ZBn87FtpPAVt74BYDR
 8dsxT34A427Tx4wwdk7sWXU7qIw74ICIcRNV2IVXhlCdtTNCbBihZurO0ERQDH45LUtL
 ZuXw==
X-Gm-Message-State: AOAM531BnF8hTYDityV/7rNLVRqr1dcnOIoxBfgr8KL7MoT17hG0QBVy
 CHQqp7lhNb61yWrIhhahkf8sdA==
X-Google-Smtp-Source: ABdhPJxlLaugH14+WpTAZ8MmbT2RoFjMZQ35niE7QMkyFmwOWotHwAsSlzZKvQdJTQZo0h/iFrNSrA==
X-Received: by 2002:a05:651c:ba4:b0:253:dfde:d7e with SMTP id
 bg36-20020a05651c0ba400b00253dfde0d7emr10774791ljb.436.1653386170432; 
 Tue, 24 May 2022 02:56:10 -0700 (PDT)
Received: from [172.20.68.48] ([91.221.145.6])
 by smtp.gmail.com with ESMTPSA id
 y24-20020ac24218000000b0047255d21184sm2449009lfh.179.2022.05.24.02.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:56:09 -0700 (PDT)
Message-ID: <e7014cdd-5865-90b6-54f6-b0594839603a@linaro.org>
Date: Tue, 24 May 2022 11:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/4] dt-bindings: regulator: Add bindings for MT6331
 regulator
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220523154709.118663-1-angelogioacchino.delregno@collabora.com>
 <20220523154709.118663-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220523154709.118663-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_025612_304212_22D3F59E 
X-CRM114-Status: UNSURE (   7.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23/05/2022 17:47, AngeloGioacchino Del Regno wrote:
> Add the bindings for the regulators found in the MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
