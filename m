Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE1C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHq+EupaWK5MJtpxLFtvDP9vBRUE48Hn964Cl/uitPU=; b=FydxwCxVIde5aCGHr6hrrVBJ4X
	WfQlomCTPLQA4V4fB9EkpQ9dJYUiUl0nKa86lw8gJkdFf5pwpdF2SfgxVpzm6JIHGZ0LuDOJmJbQH
	94d40YKsQXMHWTcgC3gdhI3RXMLVUSDZ/+EIbau+wGxo3qFs0rb4Z06KFTytJU7gNT2GZpOKzyQNs
	LqhGMCfeoqWIVw2TyzGJQu9xLZXXNBFdrJbIVQDsXba7OvDGjbFZolM/6rjxqoGg1QLh5Y+/l1CUo
	S58MMFA0Ps358uHM4cQifpJ93+nE6DpcoKWjK99OsbqKM+9+NHphtWfrff2q9ByeuvbraNxxS+K+a
	cx7FMloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF0x-008kdz-1Q;
	Fri, 14 Apr 2023 08:42:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF0t-008kcr-2q
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:42:37 +0000
Received: by mail-ej1-x633.google.com with SMTP id j17so34164035ejs.5
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461754; x=1684053754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHq+EupaWK5MJtpxLFtvDP9vBRUE48Hn964Cl/uitPU=;
        b=Ep7aohUyYcWRl/kaTHamdzHff2u5f5xcZ4Iw5ooCnS7pkFckU+HODvocte84UBAcEj
         B1qq0r+9M6SeYwxDKaYx3kTNnUiqZkTtdf6EKjZLQ+BGWxs+5+723Emh57fV0rGZplgn
         4GFWscqRr2bPu4rdn+ro8jCf2djKEocC3bsBn5c0OvTSpj6m6fRuFtShyHyofArr4rn7
         GFodPaUxzuP4ddXKJeyzjJf05HpbEvZQADKGP+QROzeHGCg9nKHKcVKjss9jeuXdX/EB
         lUoQPyX61cB8TvYJD+YQlGsANyOJfOQ9urNlf2lJa9kLbGatI6BJw/9rezk8eUTv5NRC
         3H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461754; x=1684053754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHq+EupaWK5MJtpxLFtvDP9vBRUE48Hn964Cl/uitPU=;
        b=XyVLz3lXPSGiRZqC7XsOZUcu8/LgmUNrXnmjVfDUldngIvlVH57ewNksWryKeMCdGB
         Zg4evIJw6ghZn7qLz/kt9IxAW4qApDr17fhdEhuM2ycBgTAjbEPXjaFaJYpfRY1299jI
         nzN3OVE8nzezt1Df/XKFqJQXbpwo+Lw49fzkJIEpPkRGkVIAidzm7dIF3yZl5Kq5VVUF
         XmdiHC+WNgDYoPjZczgvSLj5zYhY1AZ3KV7OZqa8ndHQO8lLmSJ7SVSOW3JAlfZB16A0
         bZpb7qfab6BwRy1FrtslOsOtq3ALYjH/LBkpbSU26XatSZy0AYmHWm+nSfUbJQgPI0fV
         qFuA==
X-Gm-Message-State: AAQBX9dpbmVNVi4CfYypdPLVrQdwVky2UwsI96Yd80rqD26DwpXftDWR
	EGh53RFbV9QQRg+hSZFA5rw1KQ==
X-Google-Smtp-Source: AKy350ZPDeveGvHXCmasWX26jHul6oEoRldmgbv23zwBWv8n/OHBKJ910AjH/aWaKTzDvBSS1nAuXQ==
X-Received: by 2002:a17:906:da8c:b0:94e:aa09:1b4d with SMTP id xh12-20020a170906da8c00b0094eaa091b4dmr4495805ejb.36.1681461754336;
        Fri, 14 Apr 2023 01:42:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7dbcf000000b00501d51c23fbsm1878762edt.6.2023.04.14.01.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:42:33 -0700 (PDT)
Message-ID: <759c3b60-07f8-99c8-6ac2-73256538370e@linaro.org>
Date: Fri, 14 Apr 2023 10:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 2/6] dt-bindings: hypervisor: Add binding for MediaTek
 GenieZone hypervisor
Content-Language: en-US
To: =?UTF-8?B?WWktRGUgV3UgKOWQs+S4gOW+tyk=?= <Yi-De.Wu@mediatek.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?WWluZ3NoaXVhbiBQYW4gKOa9mOepjui7kik=?=
 <Yingshiuan.Pan@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TVkgQ2h1YW5nICjojormmI7ouo0p?= <MY.Chuang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGVpTHVuIFN1ZWkgKOmai+WfueWAqyk=?= <PeiLun.Suei@mediatek.com>,
 =?UTF-8?B?TGlqdS1jbHIgQ2hlbiAo6Zmz6bqX5aaCKQ==?=
 <Liju-clr.Chen@mediatek.com>, =?UTF-8?B?SmFkZXMgU2hpaCAo5pa95ZCR546oKQ==?=
 <jades.shih@mediatek.com>, "dbrazdil@google.com" <dbrazdil@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U2hhd24gSHNpYW8gKOiVreW/l+elpSk=?= <shawn.hsiao@mediatek.com>,
 =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= <Miles.Chen@mediatek.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 =?UTF-8?B?SXZhbiBUc2VuZyAo5pu+5b+X6LuSKQ==?= <ivan.tseng@mediatek.com>,
 =?UTF-8?B?WmUteXUgV2FuZyAo546L5r6k5a6HKQ==?= <Ze-yu.Wang@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
 <20230413090735.4182-3-yi-de.wu@mediatek.com>
 <8ace9b0f-742a-7ebc-555f-1f8be04a5955@linaro.org>
 <7b4492efa4a1becbdfb79d23a0a0c0fe11dba5f4.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7b4492efa4a1becbdfb79d23a0a0c0fe11dba5f4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_014235_925952_E3B42E25 
X-CRM114-Status: UNSURE (   9.25  )
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

On 14/04/2023 10:35, Yi-De Wu (吳一德) wrote:
>> I don't know if we actually want to support proprietary hypervisors.
>> There can be hundreds of them, one per each SoC manufacturer, and
>> they
>> can come with many ridiculous ideas.
>>
> MediaTek, as a partner of Android, our GenieZone hypervisor has been
> one of the backend options under Android Virtualization Framework(AVF)
> now.
> Thus, we'd like to donate these patches for better supporting the
> Linux/Android ecosystem.

If it is proprietary, I don't have much interests in it. Make it
open-source. :)

Best regards,
Krzysztof


