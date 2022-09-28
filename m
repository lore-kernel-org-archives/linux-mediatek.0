Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75870C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoeLFJb5asYxvFvY9caZ5v4jyel1bUpDAdRO5lTcXc8=; b=hdGZiGnCg+Wob4wUtfv+p0pIuJ
	+vLq63m6dlpyJjT06bl42sFqpdAySFmufNiGSZ2x7oJGjKqBMgRkGhSI7mE/09Khl0lV20Ks/bWxy
	yOQGFHYVrVzeXFRRuNPTSMvdqVy7PWN7HWZdlxmIUIWOvbAisojNC4jI9JsPmaQWa4rkKFLgtbxgt
	40ZLtlahtFlCPFmWH/7dl4rSIlRS87yb/AmJFTn2jrjwOyBceqJS/2zLv6BnkYlix22qr/O0hQjY4
	Qfr/hClVtNlgE42rT+MWt8clyy0LYwm3iSY4LZ/mDFYRxLMX/gJ3q3Ybfj7NdZP0yZHSjpPvt85lq
	tE3uVn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSgt-00EyWe-I1; Wed, 28 Sep 2022 08:45:15 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSgf-00EyNq-O2
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 08:45:03 +0000
Received: by mail-lj1-x22a.google.com with SMTP id b24so13546685ljk.6
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eoeLFJb5asYxvFvY9caZ5v4jyel1bUpDAdRO5lTcXc8=;
        b=Ghfd2GliLGSjg3434mEt7glLAb4F1oQLctuj0fyt7cnVD7dKZTuG0PB+NXxXmfiCBe
         nfly4vYhvKmfZsQCKVUS0RjKGoaQ1kJ0kz5HYB603f/6KoxlRYTUwiaUaCGLQvGyPru5
         JO14SvwfLkNemgJqxTOiwY7SeYm8mVs9wzGB0LgT7EqUL3rXJqSdTn9dO3wJvQKpOgD6
         78i4u4bV4DyfoZgTf6KFuEK6JMzAXN5Y8wBWiqOSGcb2oQeI7G77gzjlLIOIySgB2l9R
         9SLtx+sG2gcjpPOFHSbHa7cxFPYA93sVPjlCGpQ/E9rXN0MDt8olDOZFRuPnHvnjPlbu
         u5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eoeLFJb5asYxvFvY9caZ5v4jyel1bUpDAdRO5lTcXc8=;
        b=Sg8/X0aedMmQMNvDeuOsr0rrfUkkLwYdIDmh0pRynREM95MhVrWJZ26DezjXWXBbM/
         yZaBeLLmjCKHWIruVNcNE4uGQDr903ZMwfPbaL2gV1kA+Qf+E3wmD/zSz25h8nY4R4qH
         7w4S//Ag+ID/IUb+/Z8Vr1MDhljwz0YN3WlnGfDZxtIEg2CPOptfWR52qKgtchnaBNEz
         jf6xbgsuI1LpH98LjjFLsRHmSR2TGiZpOI1itul6WVuO6bncj6NseeWddW600ycuFFqA
         XJsIde+y9DgDyrfj5e3QZxNRMF4/RqSvK0U7tAibrZr5tEIs+fZ8ckl6Hj9nqIOoOnpS
         NI1Q==
X-Gm-Message-State: ACrzQf1VPZd1E1Dw2FuD7yNhmnoKcgbIxbyosYZ/QFAKU7+WZQ8ER1nw
	Vd2+yg/UgSRk+HFmwmMp4SjhoQ==
X-Google-Smtp-Source: AMsMyM7o2APuV/glS+yr16yBtxdmGojUCsjYP66kxFSp6E72eHSIejpreHPBLTKcFoB0C5m5jg2BrQ==
X-Received: by 2002:a05:651c:1a26:b0:26c:4c0d:b10a with SMTP id by38-20020a05651c1a2600b0026c4c0db10amr10738404ljb.415.1664354698124;
        Wed, 28 Sep 2022 01:44:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be43-20020a056512252b00b004994117b0fdsm410403lfb.281.2022.09.28.01.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:44:57 -0700 (PDT)
Message-ID: <3551ca67-006c-b651-fc90-2e3f0beb971c@linaro.org>
Date: Wed, 28 Sep 2022 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add MT8188 power domains
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220928084315.29187-1-Garmin.Chang@mediatek.com>
 <20220928084315.29187-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928084315.29187-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_014501_831695_92A658D2 
X-CRM114-Status: UNSURE (   7.80  )
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

On 28/09/2022 10:43, Garmin.Chang wrote:
> Add power domains dt-bindings for MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


