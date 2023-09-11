Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F25EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 06:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWcdRs7/4PDNa35mC9WiHzYrOk8ak/seb1it3OwsXbs=; b=bQgTyi1fgzR3u2UsRqqGFBe61w
	7r5fFkZxf22ONKzWQuFdhTs/GvSjkGyinsn2j1D/KwNJ/Ah0ZDpTQSo9j/6eo/Czu4mEmdqHbcaVs
	6tVDlt9rPl1qipT4W5UnPS8/HjeLiZ0TNHwsvMIYH1GtQmz4fAquoJrUhPOvEkzpf1f7GByNtUFRb
	vFIaKWmaye0Sbn76pyrJmMcp/cOPw9yCrwYHtuWxRASz1U5NWIbTe+zc+dyc22R0gORbDykAJamwU
	+0ZJ3H/Y3IXbPXDJTFFgiO9kBS2z+U1373eWVnlfeyjDh/gREUorSb9JJuZ6zdnb6uRcN6cTikBAE
	Vn/oHSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfa6m-00HJGB-19;
	Mon, 11 Sep 2023 06:09:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfa6k-00HJFX-0i
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 06:09:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401da71b7faso46976005e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Sep 2023 23:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694412553; x=1695017353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWcdRs7/4PDNa35mC9WiHzYrOk8ak/seb1it3OwsXbs=;
        b=FSucvhXCTgV+kGc0DVTTvupLkGvW/0k0uXQXH6GXshL6nOoYj8MpaQNIdH5M1FMNNE
         Y+1oJXCqHR+1O/iuLeGUd6c79ku1ayJElBhqaB/uiciz/drbOaJZ/KSY7USH1T5n3xJG
         TkswTDeVIBByMLk3L+jziCqzCj2e9iAxwSAOtE6+ieIBznM2fqVNDAJkUqmj5Zl0kH0m
         Sr9J5yQK3gTwmRelfNh4hxP3N0GcVM+GN1E1NpzGcCFofU8DDzVLWVTRzaClMi7fSn90
         4JSEyKYxY5YTTpN8aJsSJETGI0T3TF4pC4hcFVlZwn2wx2DNlQDWjLu4B0T4agqK7i36
         doAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694412553; x=1695017353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWcdRs7/4PDNa35mC9WiHzYrOk8ak/seb1it3OwsXbs=;
        b=cNX3JnFpaMFB5Zu6qYPEH1+nuLAHsxZgdt0fmbVFXyC7U6EiUrO/5eA/+EYqzQDi1s
         GxN/TozvPEdl3U0pIm1UE5J5hc/Kgc7yp+SOtPin5NsnKNUrBEW56HT0XhxX5U7OE67V
         3c6kWfNBQQnfcBAd8M5G8HteBk+/P/sR1Fv6Jmw8aGLxLUSSmm7RrdcsVuDXi4RGu6zJ
         Op95h+GTR2LayNL6mkts/KXTWAwTLDB6ewRwmNFpza1IPEdfiKdEqAdw58+zfbkAobLo
         Z01l+MhcPdn9vgPqlu3PuMMv7Zci5Ju5LyFazSSd/gOjUHeWGeBnX+fpwe+n8mivNYHV
         MnBg==
X-Gm-Message-State: AOJu0YxRHbhi/gkhVabOhDhIA9c3++XwGp4Dd1l2og8u/a3ru1ZQlvk0
	nLWxGUMzbqtIQif2A594P8S56w==
X-Google-Smtp-Source: AGHT+IG4W706F67nRSS4jrADVmi+lVT+lP0BNJIguoVA2dZItMhEsHe6WItR7qXF+U7xSCxn069nAw==
X-Received: by 2002:a5d:4c50:0:b0:31a:ed75:75d6 with SMTP id n16-20020a5d4c50000000b0031aed7575d6mr6938145wrt.15.1694412552884;
        Sun, 10 Sep 2023 23:09:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id d16-20020adff2d0000000b0031981c500aasm8950963wrp.25.2023.09.10.23.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 23:09:12 -0700 (PDT)
Message-ID: <ef81697f-473e-898e-ec13-4dd255e2e3d7@linaro.org>
Date: Mon, 11 Sep 2023 08:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230910062852.15415-1-macpaul.lin@mediatek.com>
 <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
 <12bdd17a-98f4-5551-4253-229dc36f0c77@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <12bdd17a-98f4-5551-4253-229dc36f0c77@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_230914_269897_8B2F01EF 
X-CRM114-Status: GOOD (  14.46  )
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

On 10/09/2023 14:07, Macpaul Lin wrote:
> 
> 
> On 9/10/23 17:09, Krzysztof Kozlowski wrote:
>>> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)
>>
>> That's a bit confusing. So all of the boards here will be Genio 350 EVK?
>> I don't get what is the point of this description.
>>
>>
>>> +        items:
>>>            - enum:
>>>                - mediatek,mt8365-evk
>>>            - const: mediatek,mt8365
> 
> Thes boards with compatible 'mediatek,mt8365-evk' is indeed used by

Boards?

> Genio 350-EVK, which Baylibre helped to do upstream tasks. The only 
> production version of hardware will be available on the market. The 
> derived version of customer's hardware is not available yet.
> 
> The separate patch for renaming mt8365-evk.dts file should be send next 
> week for aligning the naming rules.

So the description is not correct.

Anyway, this patch does not make much sense to me considering nothing
like this was merged. You just sent v5 doing the same!

Best regards,
Krzysztof


