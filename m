Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C8CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHcfoRSqhikD1hOYg44uSOWlY3aFvjAHe7q8Qax5QmY=; b=2991DUVjTvuVYjFlPg0ruAvUab
	Z52dO2SpVQsh5mzhFCd1TGk8LcW4qeoRfojiV7Xg4iIHaZZgf298Wr5ivrYSfcwFD7dl4ML2IGqw5
	411KvSnsojj2Md5VgmffwWWwBRy4c6Y4xX8LowUWRXeuc3tpjvgiyP3Mq6aEKipqSYi3dXGOPv1K2
	lB1dt9DTqyhclR4BbwggpjhB99msBsb5jVxljDj/6sQZ5ihx5LOV/3y+1y5X7hJ21wyfjexNfCrHa
	dnSvj2Dqw+MxnEF195S+Ch/vHNDnOHUktwGZ7xzgNRi+UaU4h8yqzCNRzPit7OYFzyawO2TYaqeV7
	7SJMOGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqkb-00CKis-8T; Thu, 15 Sep 2022 15:26:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqkP-00CKfs-OE
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 15:25:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id e16so31416789wrx.7
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BHcfoRSqhikD1hOYg44uSOWlY3aFvjAHe7q8Qax5QmY=;
        b=QtgpMJ5u5NKyPnVF5sV8RMe62k5Pq1GkPk+H7kZxWT2atc1Zns1MUPWnp8WWEEAUXN
         2f+2bevcxW+hU2Zs1ZJ2Pn6G6DkC6HfXsJmkFIYeEQsiMfPaPMTfM1WBCzkT5Ebcrv6O
         G7pSJhoK0ymrDBryJIIvmR0SS9k8XgHB6vYFxlNmRzZoyKUvclDPnlfs4V0OWcaf8Zgz
         L1PMFH2hnOVB1E/DrkSu8jlhVDAYSXtZXk1fYbFe1yx0+BQfv7epwdHQO53c/gku3R96
         4dJgBHea6ALP8/wLjGgQPEvmbXEpcMM81Bh4nVWjyIk9tMm+Vp6pOl8U74N2skEreA85
         nkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BHcfoRSqhikD1hOYg44uSOWlY3aFvjAHe7q8Qax5QmY=;
        b=SAOeBLCDoZWY7l7hUdN7Daak/lTfKJkRsB4Bq1DDRigVp2/Di6Z0nCn5C5Dk0d4YAd
         4anF1lY76Mr0fk97jWBemIgWgtxtRt7Deey+ZdaTL257MrOsRBOkPaa2AFQhB9akB5cD
         NyPxkc5RimzTL0A1Hv+g9hyhWPEbW4ljbC70Yhx6bGG5j93FS6M1bwHIn8F8PwaOe6d8
         K2vw6hlgDRA4bgVUp/Baoj1tQGRFUVMxOptXFagEaHydtmyBA6uCY3rTeO041YGolwsO
         LbDVEw1wse6HU17Ne3nNVj9BggBHIcpBXySaaRTSobgQX8z4k/XbrykHzgMKSquWTWR4
         EX/A==
X-Gm-Message-State: ACrzQf3UKPyvSNk0PIHNlY8yYz67DjCMUgIqo36Uf1eKhXVki3eDXqHd
	LZJFDDix0mlnH/9FWbefLRUzLg==
X-Google-Smtp-Source: AMsMyM6jbHiu69sUiE2afsrEB9VDk+2EF3IxK7ozsl+xHorAt3Mj1j34+HcOi0Wy/USm0LikBipx9g==
X-Received: by 2002:a05:6000:178c:b0:222:f8ec:9977 with SMTP id e12-20020a056000178c00b00222f8ec9977mr111630wrg.509.1663255547251;
        Thu, 15 Sep 2022 08:25:47 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.72])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm3834952wmq.23.2022.09.15.08.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 08:25:46 -0700 (PDT)
Message-ID: <bb932677-d7b5-a39f-ebb9-4a64812591a1@linaro.org>
Date: Thu, 15 Sep 2022 16:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the indentation in the
 example
Content-Language: en-US
To: ChiYuan Huang <u0084500@gmail.com>, Rob Herring <robh@kernel.org>
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, alice_chen@richtek.com,
 robh+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 chiaen_wu@richtek.com
References: <1663157936-5010-1-git-send-email-u0084500@gmail.com>
 <20220915134353.GA1168381-robh@kernel.org>
 <CADiBU3_6dXf1TUv9f7HbFfrqsfMUmT1Ejve6+O6OGnmTtxzpEQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADiBU3_6dXf1TUv9f7HbFfrqsfMUmT1Ejve6+O6OGnmTtxzpEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_082549_856871_669F074A 
X-CRM114-Status: GOOD (  13.38  )
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

On 15/09/2022 14:56, ChiYuan Huang wrote:
>>
>> Please add Acked-by/Reviewed-by tags when posting new versions. However,
>> there's no need to repost patches *only* to add the tags. The upstream
>> maintainer will do that for acks received on the version they apply.
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
> I'm not sure about the rule.
> AngeloGioacchino said I need to add the 'Fixes' tag.
> I think it might be important.
> And I immediately submit the v2 patch and add the 'fixes' tag.
> So patch v3 and add 'Acked-by' tag?

https://lore.kernel.org/all/20220914150620.GA2221443-robh@kernel.org/

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540


Best regards,
Krzysztof

