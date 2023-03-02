Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B90C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRjMQJRtE2Bj9BjD+ekrQkZUrzfyzg03TWtGip3bI4w=; b=g0v2pah/C+0Zru
	UqIVcNMzXJc/vuy4gRGXeF0JkkDec0EKT8bWcLBmlozlEIMpJAm2rnN6LNnfwcQi2rhdM+FKC5evu
	gLI+tKhoW5u3kX3A1apBLlKCJInGpkqz7l30GlgwpPraJ6sJqcbvTJ3JQqgidxyULhitp1i+JhaFL
	+hpE3ySJLN/UhoC4llC9pzWCTeYXOddJ+153i2gYhvdI7GNA4iYDY9bw/YI1v32JOeGBKTfx9RjH+
	STFpF2u4QihTIUaW08gnOEXOuN7l3a2gWs+mezmILVlbCVnYjkNkT/FSgtXipcnHua24HooBJt4Gk
	i3QskYkWSOC/76ZOELYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgBd-001g9M-0s; Thu, 02 Mar 2023 10:29:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgBa-001g7f-36
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 10:29:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id u9so16123649edd.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677752953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRjMQJRtE2Bj9BjD+ekrQkZUrzfyzg03TWtGip3bI4w=;
        b=fGGD97qyolMbVM2MF8TJC9kNf5yy1V/Nxss8muasMPP04By5S2huAuT6M4F9BEhjw+
         LZ7ShcpNaOZz49Xm730maLefpmezUuUODHNmDCCkG4h+o7758mUtk++09bXmSvBMVue5
         jN/Ud8OJeKiMp8BzM0HsmCzTWbuupJyuWWiiy24SACAbx4XfhYA0tAow6F0M2jWto9rA
         WP5zO7vwBEh942WiyRXNnUgE+PU9UKznVZuuTpSX7nQCE8iiRHZBaQTnkfo0cSeNfDEM
         hdihAt1v9K1aCoRPflebQKC+KL5W2xSZkJlsDh3UZoSy0y4Ge/FmkPtuPY4ajPM3u3Dq
         d4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677752953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRjMQJRtE2Bj9BjD+ekrQkZUrzfyzg03TWtGip3bI4w=;
        b=uCtdl1qsY+iPAGTUGOBXOgqV9ad6J2z/RqPnUCUls5jPFT24PBAy6uK6UqkUvnLov+
         PIu1Q5agXxNr+FbHNY7MPH36E/lC9l3bUHGE9vWLW36vAgxT3dkdCPtalAuO6w5pMq5N
         fpamzur59HPlCz4D1sVwn/qP6lnur/9FP1scE6iRIrOiZFSb2deD4JwHx9jvtdiOLJD/
         8mhuKfer9/hWJkgvJ1HUn497Eq/U3bc5k+66tUGtAw20k3dvzLBEdXNRXMT1OJYtvaAV
         29tX4KbWfqcfCb65ksKfJWHZMdHyzd4f1jTY7ZdwaVwqHe7kbWBYkqUmAbfp9rPvEi+H
         4CTw==
X-Gm-Message-State: AO0yUKWeXONYcgUq6pWgx3tmodUf4Y5uC0GHpuyUl5cRNZJW7r1Ikf1y
	ul+S5kUBrOWfc66KvTsLnWxBPw==
X-Google-Smtp-Source: AK7set8MX5Ca2LfKKYqYHZj9wih46oAtJRMNpT+QV58afPq6J8YNFqnWqw3SqRcubazacAt+XkczUQ==
X-Received: by 2002:a05:6402:1acd:b0:499:b672:ee30 with SMTP id ba13-20020a0564021acd00b00499b672ee30mr10272126edb.11.1677752953229;
        Thu, 02 Mar 2023 02:29:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u6-20020a50c046000000b0049ef70a2894sm1756994edd.38.2023.03.02.02.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:29:12 -0800 (PST)
Message-ID: <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
Date: Thu, 2 Mar 2023 11:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
 <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
 <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_022918_194216_AFCC2816 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>
>>> ## Incorrect naming
>>>
>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>> introduce new ralink->mediatek compatible strings to address it.
>>
>> So this part was addressed by Rob - we don't do it, because it does not
>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>> with different vendor used.
> 
> I think Rob was rather addressing that updating compatible strings based 
> on acquisition or marketing whims is not permitted. This condition does 
> not apply here as these SoCs were never Ralink.
> 
> I understand your point that Ralink is now MediaTek but still, calling 
> these SoCs Ralink would be a bit misleading, don't you think?

Misleading yes, but also does not matter. At least matter not enough to
justify ABI break, so you would need to deprecate old ones and keep
everything backwards compatible. You still would affect 3rd party users
of DTS, though...

Best regards,
Krzysztof


