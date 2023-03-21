Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F90C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=; b=xOrs76jTdR07QWad+/MlEoBgFw
	n7AtnQoDLqvwXG/vXZsJCoYPEId3OY6t+rWzF4a402XA86Ru+E3kuqVM5NUPWHnSH5rfoID2PH1U8
	sMV6ImQa0wA6DaYcT2vFGpfhZD9zu+PgvIfdpmImAwsf7ML3tgQPbt0WyVujK93IzG6fFYYu+3qCU
	bUbqnuwtxFtFkbKPXEdg8Bvw2qUPwPKUyphgzDLH4vCU6nQByRLzoS/bHPtrIc9W6BMxkJylSLLf1
	r8X1GupM8RIYeX5maNmqZ1fambM9immbGhpFWwXTm9W+WiBcZw40K52aeDknko6KEgmkOnHUe/6EI
	+2OSbJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWIh-00BVt0-1j;
	Tue, 21 Mar 2023 07:20:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWIe-00BVro-1g
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 07:20:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id w9so55989200edc.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=G6ekUazE6TcVZTpMdj9FhFeFggQPVT2VFUWaVtSaXIXTASqF++fMNxdF9KK8E6jaSL
         ZxuQCYzENQ9eYwWdylaKVB8cU5qUsu4R5sIwD0IIrNZX+Oo0AX814EHrHOZ4nB7WYMax
         YUWo1MqBTLRXOMVVr9tYCNrgu923Xrw6URPxwNxkAEkDp7epE2F8hgxV4cZiji7lOREJ
         niygwQoFXhUPEUDsSetV6Edn47C9sgSWqXDTI3Dz/fCXVRaHBilN6IPoShYT9gKzSq2h
         v+dykiWM/hzx+RdJMIfdogOBRMX12snNrk7GfqZ43S8HyiNmdwkPfVFwvscVb/2iLiXG
         aCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=fhFRAyGapU1j8JUOJht+5zhaHzxMAZAKzU4jMEvz3ZUbYItv0dPXWgNb4YUqCCCTBx
         xIzqEL6hjIYSav+kOVNl0OCKPeXBjxbUaIHiw5veyj7Xxvn43186K840U3Gp4NxF7CGp
         qZy+HBNEGvpjxYMBvePQhpCOFcvzoUMx4mouCUys1oP5bIMmONrrHHExWhhoItDmEovg
         u14bUY0oC4c/v+3Lvxcoxe8ppuOWIQUqp9kh35dOfGLDtPRpYGwA2LJq8tRiU/3+VXl2
         PAdKtcElHv81UyXWxZ97A97cZwrSQMhobgF3rnkcq5G770XOyfWkghTKOt/BXHlrGsxw
         i77Q==
X-Gm-Message-State: AO0yUKVNJI1lQkDQ10dbYPIzOyY4FUdCrv58IGUMOe86dMjSEaM/qANF
	r/FDYYtmV319+n+hw2kCjbwkXg==
X-Google-Smtp-Source: AK7set9ajV2h8MoJNZmNzFZ4RL5J57SDG8cMw8WnAC78cNBMYl3mTmrve+NyaqmHOj1gJroxcZnYrQ==
X-Received: by 2002:a17:906:607:b0:932:be78:a728 with SMTP id s7-20020a170906060700b00932be78a728mr1688168ejb.68.1679383251026;
        Tue, 21 Mar 2023 00:20:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b0093048a8bd31sm5385926ejb.68.2023.03.21.00.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:20:50 -0700 (PDT)
Message-ID: <cc45efa0-e2c6-525a-e3f3-7f87e8762e2e@linaro.org>
Date: Tue, 21 Mar 2023 08:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: usb: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Justin Chen <justinpopo6@gmail.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20230320233904.2920197-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233904.2920197-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_002052_562465_26D8FA12 
X-CRM114-Status: UNSURE (   8.37  )
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

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


