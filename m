Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E98C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RkpDfJmyBWfRHg2fVFR+/EdZ4rlvuqSFEKHbwoMbsM=; b=bkPXPW0WO9+JaacQF+nyfWY8QF
	pHXQC6GC057n/3sIgQ7aE3oUVn8MDHw7vbypch9ZsdL2mKqDBmlCyHuwkRgb+dUvcKGps0VoqUPp3
	bHDZEhX5UOaYTogzCKazEfBKQ1tePIFXZxhfSs3NGNw4PMcRsUFYtocUCEsDB+BzSyIBhFlktcDWD
	Vtaoh62nBiEHW5grICOFuqKh6ZrtikcShSla97uMj0gPVkp3gYQtTXDcT1Jx3zhiAvEHYlwBm/x+P
	1nh8BUNsAqBXKr+Kxp1lNYFxEt2BSxUOa1t4FvpdZJ7lVU98i0lKppR4ymVtQg/Nt7o62Fpucun3J
	EAlruxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDHI-008WM4-My; Wed, 20 Jul 2022 17:14:28 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDH7-008WFc-Hy
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:14:18 +0000
Received: by mail-lj1-x229.google.com with SMTP id p6so21871207ljc.8
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5RkpDfJmyBWfRHg2fVFR+/EdZ4rlvuqSFEKHbwoMbsM=;
        b=H+7FhV05lIhk0PGB4Z6gEALJjTiEw084oSQ2Ud8MgD/y8JOhBTo9CTroBwwYaV4KRf
         wo+T2+13vBg07aE5ZDkkmJIQREcaPEvxHTDK2GeS9txCcnfFeII3xhclMU7qdpgTtKpq
         Qv6x+YINWQAxvFegcEHp6NxYwoRPU6CirCLgAxMLhcSDQ2VkFe0yR+YwsEa4iv3KZpDf
         4S8Mu6emImwTEBRYFM5m/GSpYwNK9vR4HZsbk/6xWL0+7eMGpVBpFy+QpHoXc9ERr5CT
         +PZtNyIhcUhtAVC3NpzD3jCYEfxQ3IWW0HE8xTYTeZoSA1ssGYiIlzIpiARAdMOO2xNu
         wMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5RkpDfJmyBWfRHg2fVFR+/EdZ4rlvuqSFEKHbwoMbsM=;
        b=K8PUOd2Jjrex215xeUBbfq2HdvAcGBuM1pw5z9ec5mUqAaJ0pF45obiv11LEXQdLCB
         x0FJKMcKRrzJ5JdKXYUl+EKo8NbRZh1mFCJoK1Z0gjUpcJWPzbLyLfUrAy1r8N52R2eu
         4TLv07INvNwTOW4qIsiVOXajadwUEsRcsM9Pq2A3WTHIIcpfBGwyeQhMhhU2ZN0TjFiK
         oIB+FkcIkS56znE1gw9LTfcDyZvtGAHnLA27It9XeT54/DHmhlP7m9OyY4wvkFDLbzHn
         CP9OC7ixh0jbjOSdsBmU3xFRFFYvEK/MZt1muurUhrgsum1FwLSVbpXRsc/mirQVMa2n
         w9qQ==
X-Gm-Message-State: AJIora9kEbLegkzZKQCFvWPnGupF6tkymR+Xhqy+ysW/wno9XdTDZG83
	MKEyW25dORDDx0/430FOdYmPNg==
X-Google-Smtp-Source: AGRyM1slZ6hO/HAIyCG+31XwLnAM/4pQ8U2rWmJCFJJE6uLFgNQ5+vsUtnCPoRcx6jCpEMRuF7B7KQ==
X-Received: by 2002:a2e:9ed6:0:b0:25d:5cef:72c3 with SMTP id h22-20020a2e9ed6000000b0025d5cef72c3mr16423219ljk.381.1658337255308;
        Wed, 20 Jul 2022 10:14:15 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id d25-20020a19e619000000b00489c7fb668dsm3901824lfh.182.2022.07.20.10.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:14:14 -0700 (PDT)
Message-ID: <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
Date: Wed, 20 Jul 2022 19:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/6] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_101417_600362_B3D0648E 
X-CRM114-Status: UNSURE (   7.83  )
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

On 20/07/2022 16:48, Mattijs Korpershoek wrote:
> writing-bindings.rst states:
>> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>>   "unevaluatedProperties:false". In other cases, usually use
>>   "additionalProperties:false".
> 
> mt6779-keypad includes matrix-keymap.yaml so replace additionalProperties:false
> by unevaluatedProperties:false.

This is not sufficient explanation. You now allow all properties from
matrix-keymap.yaml, which might be desired or might be not (e.g. they
are not valid for this device). Please investigate it and mention the
outcome.

Best regards,
Krzysztof

