Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3BFC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2i2xeRFbnBFO53U+/GM3T5pKxWAL2Qa7fUFZfaYQcI=; b=clGgpSjmHoHfu0hYUPtFLQiti0
	Sz6bT4Y1IwQQpXDj7DPrSVJz2evkmBOtz5qjKNoq1OZ29dXATQAqrwBA3CM8+tQw0sjR77/LdoocQ
	zDK58rWjvB7kkdGmcYjQSy965ZcwebtIE8tvxH7F5pWkp9NQB2s8gAjNatqMQB6OQlNX3IDQlh5K7
	AAg5a9V35OpgJ7o/+do2SRIAimskIFXgYAL3ELSn6hfuZyAB0AYNpeTXFCX+Q3Cj17pZ0l/PAOGOd
	PXrWdlX0doNl4zPKklIxfmha2j503qGYSbSFyPqD8rUj5nmx5EJ/1UhIw/ZU1ZLe8jxA8qyFWIURV
	Nm3Kshpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDk7O-007nl6-Gy; Tue, 19 Jul 2022 10:06:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDk3u-007jyh-KB
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 10:02:44 +0000
Received: by mail-lf1-x130.google.com with SMTP id z25so23930736lfr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n2i2xeRFbnBFO53U+/GM3T5pKxWAL2Qa7fUFZfaYQcI=;
        b=zyVk1ZE/otqu/lHihEt3eSWYvni3MSTNDPZXfIlwzQYCPpn9cQG7jVtCmWJyHLK3st
         bHwQrky1OQm0/K+XiBmje/a98C3IWpiZn8Va4QPF23SU6nLpY3pGvGYg/F38RGntGwBA
         quoiawP4siohATEb2blPsM0jq9L/cyqWTTgjt76kPtQwqYO8wIXsZkruj3OShjKTT8Bm
         wFT0IRCwKx3VSlVTYr1g60Mc2HrbgwhQXy0ii7DQzLtuUPOJlz/oHdh1E36uLW3JSArq
         RbTQ1kZ911MUAIlErlyWapAtdrO1gDH2NraXULlRC6Evs0lESLQUqbBVe0z5gwE7YjpI
         /NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n2i2xeRFbnBFO53U+/GM3T5pKxWAL2Qa7fUFZfaYQcI=;
        b=1ZybJyMVXx5yzIa7wNEd37ckc4S5kxsu/kI2DphikIaJOBvk12ECS0SjhIOLeerbaW
         2EEPkLkrdMWUtnAwdSyL/y5Ycn2UaGMMr6fbX3URgzt0cFXOGbvP1DjbbWkP0wdKaAMd
         q1xFjzXwcBlQVi4qLe066bn11F8RIYfQupSTCnJ1Lx9PR+8Yh5MuSTKEJDH0DZb6GVbm
         hkJPOCNfXUwZJ6FwKcYUNatN0BIOUC/wIhowgWNdb7/M/BU56+76FqY2y5z//nrOdk1L
         w3JAH5FRXRhYjQUm4yUHu2pfWQegWCe2t2vFVwJ9lzt/yCvh9NbMpS9wwfD67SzeRurS
         /F0A==
X-Gm-Message-State: AJIora8yjLN86vEOdiTLiDUz4ilie8OGb/VxjGvbnnx8Asdi/O7o9bF9
	Iu3SSnTOOJNnBoeESmTco9i6Fg==
X-Google-Smtp-Source: AGRyM1tnhi/HrvY6MsqgKmCLE3ncdDsOSsiLBBaS5ImUtaBlTr4Ahxus85g4bE9MOF6nhRb2wRpP6Q==
X-Received: by 2002:a05:6512:1093:b0:489:e605:415d with SMTP id j19-20020a056512109300b00489e605415dmr17524450lfg.323.1658224961287;
        Tue, 19 Jul 2022 03:02:41 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512214d00b0048110fd06c4sm3121121lfr.53.2022.07.19.03.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 03:02:40 -0700 (PDT)
Message-ID: <74dadabb-f4d8-bec9-d6b4-fa6ff78e8560@linaro.org>
Date: Tue, 19 Jul 2022 12:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] dt-bindings: nvmem: mediatek: efuse: Add support for
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
 <20220715120114.4243-3-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715120114.4243-3-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_030242_735879_C47A1F29 
X-CRM114-Status: UNSURE (   8.63  )
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

On 15/07/2022 14:01, Johnson Wang wrote:
> Add compatible for MT8188 SoC.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
> This patch is based on "linux-next"[1].
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

