Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC0C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzL6ez1/SIwguYGRYtO/alcSTumOxh8RWgANaccbcsk=; b=XTM3UjAQf85ROt3U1izyUeYMsb
	YAn6WoB4/tNMpolJWs+ZpvbdmLUsFBPogo3R9yXII6pifjEQcm7H1g3Sc9WAUzptsda7tD+vXjWcZ
	0jsVRFMvxWnGisQkBoHmBMfH2Q3/6HtQt76fUMdpGllzmt+5kPwLO8LHxEKnC1Rl8CrdP8YakJYoL
	Lp7ykl522R2SOGlucs6JWe0jQfN6S9LJ03d5aYTyUbSB6ayT2OI9zgTXKToriQGGg6LpYCR3pCAKf
	gbJ0Cm4TZ641HZZHmOmzpZsYCwFQ4GO4lXInuYI4X6QdJ0Xd+7flbGpMT188HW0JQ6YpGgbJbER9Y
	8WyaFgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFfH-00BlDf-B9; Wed, 02 Nov 2022 15:28:27 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFf5-00BlAP-EB
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 15:28:18 +0000
Received: by mail-qv1-xf30.google.com with SMTP id mi9so12675641qvb.8
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzL6ez1/SIwguYGRYtO/alcSTumOxh8RWgANaccbcsk=;
        b=zubtvv/vKLjmQAv8Rv8GeFaXOhHaj93acOKq5y5fOk9JqbcJCrWCpIRltRUZEn8xN8
         ic8p+DBspVmOhEATc3Ci6FDPdFZ8OosV3im6/BAAnwadhGHrZvq2G7BMdoZOZMNkE5e+
         uOUuamEIXuDphbwSxptG43MGMcRACWn3zE21ZpTdpmnzgwQIJxgiXbjOrK4/J3uCiaFJ
         j6IEnCgy8ru8OYc2LknnOylyKNW2rcaon+lgUTtM95emYvT62mu6fvTcaLKCQCERdHyT
         R8W/6mtyQM3nBgzFcRx/PdoGhN+V5qQaUkoQ7Jur4jkqJfojRtSzoDCpY5ZHjojGZpOX
         tpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzL6ez1/SIwguYGRYtO/alcSTumOxh8RWgANaccbcsk=;
        b=p6EyskkUp8eNxMiGa59ie8jbmGHOyk7OwieIilvvNzzHPM35ONM++5EG46Q+MX0bxN
         5Y2KMyx+wRJHWAbfBUjd0W6uOtkRG+q61eBHNrzv9QR4YNxkYwRDqhwAiH1zd2vtvgnK
         Z4OgWFkjr9uK38loHDchi3tROofVg4/iDy94BuTb6IFt8G8/BrE3SuuuWmrpbZibUPkP
         y/w0Ay4yCUszCJyHvMutQn56qF/gG8+1IGPdoqqkxJ8m99Xb47JENTFEMWo4R8/CBYfs
         rTGtbwgLpF9om1DxirnTVcLQvKXlm5h0JM+rzG37R5N6XNp3qxR8l16BMT3I3RbYLIsL
         gjRw==
X-Gm-Message-State: ACrzQf27sQUa7JkINO7a8bzcLP2uNZHTSPncBYfvm27W80UOXMzJAuwv
	QKaSFxpMA0+VpAEreXTeo/ZZiw==
X-Google-Smtp-Source: AMsMyM6wu2zQdBId6fKv5cJhAPDmidAieaqn3phFQgTH+JAKcZa9DCOt8DY56i36JdzSWtjFTn3beg==
X-Received: by 2002:a05:6214:d6e:b0:4b9:67fb:25a7 with SMTP id 14-20020a0562140d6e00b004b967fb25a7mr21308527qvs.115.1667402894042;
        Wed, 02 Nov 2022 08:28:14 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id t27-20020a37ea1b000000b006bb2cd2f6d1sm8560147qkj.127.2022.11.02.08.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 08:28:13 -0700 (PDT)
Message-ID: <2ea0f5b8-2fc0-a7f9-706a-ac51c224f331@linaro.org>
Date: Wed, 2 Nov 2022 11:28:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] dt-bingings: gce: add gce header file for mt8188
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Bo-Chen Chen <rex-bc.chen@mediatek.com>
References: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
 <20221029105017.20734-2-Elvis.Wang@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221029105017.20734-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_082815_481832_81B20203 
X-CRM114-Status: UNSURE (   9.73  )
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

On 29/10/2022 06:50, Elvis.Wang wrote:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> add gce header file to define the gce thread priority, gce subsys id,
>  event and constant for mt8188.
> v2 - use vendor in filename, use Dual license.

That's not formatting expected in Linux kernel. Use git log to find
examples...

> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Not true.

Best regards,
Krzysztof


