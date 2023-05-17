Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD19DC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0UJprFe8SfcD9ht4MYliq9M7kxDvSUlI5EYK4zEHg8=; b=Y+t+K/fhrGmYlg3qRBO+5F1B33
	Oj2qLkJ86/D66gQdtVPsqb6X8eMVkhhDpOJuh8P0eJ3U+oIjmCUI1X0cqt+J361L74MSDlCJFSUy6
	yPOIkmWgTldmfTs0buhCm3Q+lkkHJL59/VXSRymjzOgWK4pcjQ7L8lI0fab4x4WpHN7QE2ZSZEc+O
	1d+SQBZDP9uzUZDynkpxX2ToSX67oBn9IjguQKP/eekoV93U1yO5wH0jv0tomBnrjFOboJL/bQY8l
	KncOsfOfB78JWORZriSwlh4nv2zTd5HI9MqcX6cv8p1CE9d75f5nwN9V1qWRlYBT4824SoacRiGe/
	RWQn/ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEtV-009WCC-1B;
	Wed, 17 May 2023 11:00:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDt7-009BKA-0g
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 09:56:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9659c5b14d8so76778566b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684317359; x=1686909359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0UJprFe8SfcD9ht4MYliq9M7kxDvSUlI5EYK4zEHg8=;
        b=rLUYiIn9+nCG6E01rvMUfmUdR+Vn1c8lfcxt7iFAbr4py7VH64jAl9KkEHn6CSUeW+
         EVgCo/cM0zj5w2+rg5pcRVBfD1A65r/iI6YivabhDXDr61YB28+mg0NglgHqWbP2paNq
         wCy8KJHjLwb0T9XIFRrHRQGRGajCbOkS6rLJyDIqqkFgU4tQQ7StA7Bi0w/k3a6/Isu1
         DmJbFFCn05q/SLFvuzht0nldNEBCGS8swDg9fW65J3UBJYaeLViEZnXp5snkP0+UYccA
         M4Eiu1ZDL4+k8su1RdR8UNVMceTmiA4mdG7NFdAIqg99K61lu4NRT2xgBwSiqCo4BfhV
         TuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684317359; x=1686909359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0UJprFe8SfcD9ht4MYliq9M7kxDvSUlI5EYK4zEHg8=;
        b=Tru4RohhPvNH5jORLTjvjIFGcDsWpYxpGoNxhpGRaF52H6rxfPMohyawZ52nS8FrNF
         7Kt9C9bizM8AWtDZNIq/LytXKtj99TsoEO3KMVCHYIbsrTKbuZa+7xG3QutAQ9OG1TjQ
         CYh679qoZz9YgDRgsx+u4vAqdEu+ZvXBYxoZjoekFR+M3mhSB267juOP5djoXjcIkO7S
         LS9JAeWvRYZtDW4QCkbBJPlsdnpIL7W1eqo+qAIeVXmrVPnTAIMwg42d8KRGUhDw6mCY
         1QI3JYybENhidNw21di77UZ+3fGI/HpseCU0lXldWOTRY8yqqYntf4VkDZad4uGgbzEU
         NggA==
X-Gm-Message-State: AC+VfDz6ngOSp2DTclcOTYLcZeIpzpeqZyPFmWM9lzFgB3Fe5oRZIaZZ
	p6j+UhHKabaeLDXeVAIgp8FBfA==
X-Google-Smtp-Source: ACHHUZ70rZeXSoFG1abrTOHAq6446HdZswHzwiRauRzt/gQKgjuxNZiurz7JSmnX9087WBAzToo2bg==
X-Received: by 2002:a17:907:97c8:b0:966:17b2:5b0b with SMTP id js8-20020a17090797c800b0096617b25b0bmr38530077ejc.49.1684317359586;
        Wed, 17 May 2023 02:55:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id z11-20020a1709067e4b00b00965f6ad266bsm11942656ejr.119.2023.05.17.02.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 02:55:59 -0700 (PDT)
Message-ID: <14694246-f09f-cebb-fadf-2d97719cc81b@linaro.org>
Date: Wed, 17 May 2023 11:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: mediatek: mt8365: fix the clock indexes
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
 <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
 <9c7ff0f1-3d2c-b83a-a47d-544c76f29663@linaro.org>
 <62c51f2c-a620-a879-5659-faf3c4b77268@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62c51f2c-a620-a879-5659-faf3c4b77268@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_025605_278880_44A82909 
X-CRM114-Status: GOOD (  18.52  )
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

On 17/05/2023 11:34, Alexandre Mergnat wrote:
> On 17/05/2023 10:40, Krzysztof Kozlowski wrote:
>> On 17/05/2023 10:28, Alexandre Mergnat wrote:
>>> Before the patch [1], the clock probe was done directly in the
>>> clk-mt8365 driver. In this probe function, the array which stores the
>>> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
>>> the clock lists [2]. Currently, with the patch [1], the specific
>>> clk-mt8365 probe function is replaced by the mtk generic one [3], which
>>> size the clock data array by adding all the clock descriptor array size
>>> provided by the clk-mt8365 driver.
>>>
>>> Actually, all clock indexes come from the header file [2], that mean, if
>>> there are more clock (then more index) in the header file [2] than the
>>> number of clock declared in the clock descriptor arrays (which is the
>>> case currently), the clock data array will be undersized and then the
>>> generic probe function will overflow when it will try to write in
>>> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
>>> function returns an error in the log which looks like:
>>> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
>>> enabled.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching.
> 
> I will.
> 
>>
>> This is huge ABI break and I don't understand why it is needed. Entire
>> description above did not explain me that.
> 
> Briefly, clocks with the higher index than the data clock array can't be 
> used. I've this issue:
> [    0.427054] of_clk_hw_onecell_get: invalid index 135
> [    0.429525] of_clk_hw_onecell_get: invalid index 69
> [    0.442998] of_clk_hw_onecell_get: invalid index 70
> 
> That means CLK_TOP_SSUSB_PHY_CK_EN, CLK_IFR_SSUSB_REF and 
> CLK_IFR_SSUSB_XHCI aren't working when I need them. So my USB doesn't work.

That sounds like a driver, not bindings problem.

Best regards,
Krzysztof


