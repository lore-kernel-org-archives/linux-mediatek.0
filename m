Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CF6C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SezBchpXZBlXaSPS/aNhY28grCfl6Df2Jf2qfgtUJcA=; b=hHj6HsHXottytl
	CSqBaH/Ta9JzxODbsWdOF4YtnQCSAiNUAnNyasD1mxN+FuAvXfWddCy5RYvSYedQ1MDBH4iIz5Bi0
	CpIhPf5+3LXwoX8COxVjCYwtE2M84FKLTQ+11YuXNIby6V6IYKBqXtfgjM25X102A5sIq01B4Jc+y
	sAOtLf6izKgSsS6G6zY3yH9wD22CYVTVczuLbNgCBGzqoCLLHJfs8DGbPBgK2WSo6VZyCb7zpJ7pW
	tWMeoVt7+WFUOEnTa1s9SR8VFR3emJSW8l29Btnc2U8mgpemzEKa9xA1t0I+LsaSpxz2//aMIMgQu
	iPc27pXLwZUGQkOsOaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXgM-00CecW-Hs; Fri, 29 Apr 2022 20:57:42 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXcp-00CdCz-Fy
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 20:54:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id i27so17566606ejd.9
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8ijMUHM6BZmaa7c0hm3mqC8JYHeyH09dTjrvSxZy1BY=;
 b=jDZcRUA3YzPLHYV5bc8rvjIuyIhPN6BMCalJK0LvbKoFfLp8PIrNIwur1Crf2WZqx/
 lEcirE4D5zqId9wjGmYP+xL+MSyb/DO7h3ILtI0cO2wiFNhb5Uv0jNIXYpKoP6VpyyJI
 Hf7qNN32GMy6FdJvONI4uSRYmi4G50C/xuQS4uo1uiZsBpMYNqk2RPbzIG+oUfV0iOke
 GfF0i7cGnflrgrn++seNwA+YI2Hn/RkkZS57sn/7q1e3AgpxcrMSnt/oSSY8GiVjo1c4
 Bs0up1vL/19NSFtazp9B2WY0//RTnNc8V9LYU24i8mPVrFBqGg2lOG/3tclkKOYyg96S
 VDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ijMUHM6BZmaa7c0hm3mqC8JYHeyH09dTjrvSxZy1BY=;
 b=nVBrBSB0crMrt7NkFSCBhiGYBuBQdtCzCRvElrhI1GB1Boc4l5KQi6lsjWMYCWB3/m
 FPAtU3+GNsjtjefxFxpFkv6x9vfh9Ta4GuMYqqPSLMYmt6OCyGiSMa9N9LFcV3l3odqv
 WoukylLzt4M48eZn1wNUkjGW/jtl7rdXjxeZGp2JoqFB5nI8UaPZ8kk3vT/fPxwybTiP
 1WqcaZ4MUaAZ0KnZU2cZcQyNF/oJSRcgwN6hTHhbM9A6uiXf59dtJpq9owGcPGwiPjEA
 qYCYrDDbC+KQpK/ij56ApKT1UgqoEjWjjUrUnSXoybCPCS1fWR5+y8mTBs2brdC3BHHi
 u0Cg==
X-Gm-Message-State: AOAM532aiOaTh/WYCwEAUsUuLlq8b+eAHbya9W1N7Hjxt4AKGkE2NQeU
 ExsVTsOhgSYkcqhN5ApDHqLkVQ==
X-Google-Smtp-Source: ABdhPJyEiU/AYnt4FO/n9XbiqqNZdHoU6dwECTZ1TVLYSRRs21KAKVHRfb4kQfHEM4Oa1Qws3c12bw==
X-Received: by 2002:a17:907:eab:b0:6da:8ec5:d386 with SMTP id
 ho43-20020a1709070eab00b006da8ec5d386mr1070959ejc.668.1651265641594; 
 Fri, 29 Apr 2022 13:54:01 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gv19-20020a1709072bd300b006f3ef214df4sm991090ejc.90.2022.04.29.13.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:54:01 -0700 (PDT)
Message-ID: <069b274d-1460-cd70-89f9-6abda4e3b4fa@linaro.org>
Date: Fri, 29 Apr 2022 22:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: rtc: mediatek: add mt6358 and mt6366
 compatible
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yuchen Huang <yuchen.huang@mediatek.com>
References: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
 <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_135403_604283_AD31B4CB 
X-CRM114-Status: UNSURE (   8.87  )
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

On 28/04/2022 11:27, Allen-KH Cheng wrote:
> Add mt6358 and mt6366 compatible in devicetree-binding document for
> MediaTek PMIC based RTC. mt6358 and mt6366 use same compatible data
> to store RTC_WRTGR address offset.
> 
> mt6358-rts should be used as fallback for mt6366-rtc.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
