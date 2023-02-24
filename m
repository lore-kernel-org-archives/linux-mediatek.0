Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADDC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsMUJOfucntI69uWmt/ynOZ6YJQy6cS1tproFnr6S1Y=; b=323W48vhmKjseKCPp4kyTLqbWY
	JKXR2K0Rk1KrmOrJD4CrA+ffX8XisiUq6pR2tSXJIhzEM2uOAnYlMbcSEO80qZ3EicGWax0AUxrXX
	ICHMrWoobvNcVNzCGnL0HX0fAu65CClauHfXi+jsqmYT3ETFkdhSsedD7bvA4cOxjZLNbDy+a1Gwd
	42JHU1i3ASLwESAIoiJJALW2lhhlzM9AON0wP/0oNfBWTWDhuGZamQkHbuGmSad/iQscFlq7hH9Vo
	Sl8xMXEB0l6F3IubBhjF8+sYzH9JgX7jDN94OTAKntHtOVMCYIyR+wzzSm4Kqy0sKvMTv5hjt0o6y
	UVLE6Lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfnh-0041OL-UH; Fri, 24 Feb 2023 21:40:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfnX-0041LR-MS
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 21:40:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id p16so547858wmq.5
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 13:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsMUJOfucntI69uWmt/ynOZ6YJQy6cS1tproFnr6S1Y=;
        b=fd6VqkkOmMlYhO9+PLnPa3CiH1DDR2efQfzQWcVpEJ2/RwIEaTzXyfpfmzRhmHWuVr
         e5NbQ8z2jHeBJyZiWPDnDzgG7bDXD873avPJKVvnWC/dSDBoUOs1KgVjfA+SlE6nwXEL
         CiuLKBTWKSTyEf/eI+SQxoQVRsuzPvXZv5aXEyS7/5cMdLlMgLHlYw78aCONJEXz9Cgu
         0hh5QSqLMhyCREqwu5P0ZbcP6g0n9OT8dQCXLoRSmurOD/PRJpUXtJ9SeVEx0NWGio2y
         rk3dYn1bZcd3xDKAvUgzYuLGlqFRR4+75nxlf03HnDJ+uArZequCPBZf78dDLabOl7J0
         4PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsMUJOfucntI69uWmt/ynOZ6YJQy6cS1tproFnr6S1Y=;
        b=q+7xRm0py4AztmROnoyGiWN8PbzKoORJt9R3hZzwEPcmxwczpemnBA6pLwpMp69UIX
         57Qxxy8zNxgAy70EcyuMHqnEyBXx7MwKo96VxFZP7FvpnpZQXM11+ZWOeqCOf69T/icz
         hUOoMPllH4OL1dNgnXJ3UN0ADbl3Rpds9z+C0rTvGI9q3bR/REaUe4m4u558XSX+Lptm
         K/2UJQpIfVrTIUXEFrPsHm4DUYg7/WNpX9y60PTPj9Xe/lriaxijUU1k1fg+/e/rynmR
         ZPm/OCcPjXz9xGa8O1uNUTfpwhO/w6Y05oYhnU2ikE+IdrXVg4T2fBDXVBK4491h+30/
         iNvw==
X-Gm-Message-State: AO0yUKUWo8UAJz8Qs5IVbLCJUJ5C6XJmYdDUwIEcEBvSrS6Eu7r1s0vK
	TFqYo7wxi1vP5hTSiy79Jo7kYQ==
X-Google-Smtp-Source: AK7set/gZMti4//bQauS+LaOAAx7jpdsQqbc8JJz9RAHbdvzPeTY+j6CI1BSmgL810x11la1Tz6eKw==
X-Received: by 2002:a05:600c:170a:b0:3dc:43a0:83bb with SMTP id c10-20020a05600c170a00b003dc43a083bbmr12398985wmn.3.1677274807871;
        Fri, 24 Feb 2023 13:40:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id hn6-20020a05600ca38600b003e21f01c426sm486400wmb.9.2023.02.24.13.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 13:40:07 -0800 (PST)
Message-ID: <37b157b6-2383-3108-819a-44f59747bd05@linaro.org>
Date: Fri, 24 Feb 2023 22:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/4] dt-bindings: clock: rename mt7986-clk.h to
 mediatek,mt7986-clk.h
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1677089171.git.daniel@makrotopia.org>
 <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
 <ace28a97-b43e-4b24-52d0-93bc21263aff@linaro.org>
 <Y/kmj36e4jSfLdVN@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y/kmj36e4jSfLdVN@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_134011_742278_F0DDFDF0 
X-CRM114-Status: GOOD (  16.63  )
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

On 24/02/2023 22:06, Daniel Golle wrote:
> On Thu, Feb 23, 2023 at 11:18:37AM +0100, Krzysztof Kozlowski wrote:
>> On 22/02/2023 19:09, Daniel Golle wrote:
>>> Rename dt-bindings header file mt7986-clk.h to mediatek,mt7986-clk.h,
>>> propagate this change also to mt7986a.dtsi which is the only user.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi                       | 2 +-
>>>  drivers/clk/mediatek/clk-mt7986-infracfg.c                      | 2 +-
>>>  drivers/clk/mediatek/clk-mt7986-topckgen.c                      | 2 +-
>>>  .../dt-bindings/clock/{mt7986-clk.h => mediatek,mt7986-clk.h}   | 0
>>
>> You cannot have bindings and DTS and drivers mixed together. Which
>> points to fact - you cannot make such change... Also your commit msg
>> does not justify "why" you are doing it.
> 
> The reason is simply consistency with most other SoCs.
> 
> So to make such a change possible, I should do it in three steps, right?
> Step 1: dt-bindings: copy mt7986-clk.h to mediatek,mt7986-clk.h
> Step 2: changes in drivers
> Step 3: dt-bindings: remove mt7986-clk.h
> 
> Would this change be acceptable if carried out in 3 commits?

For new code - it would have to be in three commits. For existing code,
how you are going to achieve it with keeping full bisectability?
Remember that each commits goes to different branch and/or tree! It's
probably doable within two Linux releases with some header wrappers...
but is it worth the effort just for "consistency"?

> And using the same strategy also the other changes suggested in the
> series?

All of them have the same bisectability problems...

Best regards,
Krzysztof


