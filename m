Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE8BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnfQ6ISxK8RloWdHimWZZCwZlxQOVw743/patpAY6b0=; b=1b9yWw73o6MzAf0saEri6Ymg9y
	BcmqKRsebHP2bqqkGa0xMZLHCYF0qP9HvSrtbB0zt5HJ6n/1Lv8DTZ05Etk/ToivezPFE20+UFABY
	uroiXtVyCTk+FvpAGBpGNTkuKH67b0vnrrto2NS5Lpifec2M+KBqaGJYY8hH2zINKMsYO6+sRWwd2
	x1FwGjGHv5iMZkTE6/excYkNXw7LgyNbHf7RulM2RSFTAb5kVk9F5eoVap0jbCk3cqDlWnpYeJluj
	6bku+FtWvoPBNlCcDyQD3axI+cqQ7+zYNlagqdDVkw74rus1RmYcgttpcXLQxZe1gUuM9aaCjkd0x
	VO1SCPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5xI-00DX6g-EJ; Mon, 21 Nov 2022 12:31:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5xD-00DX1u-4n; Mon, 21 Nov 2022 12:31:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r129-20020a1c4487000000b003d0283bf132so188874wma.4;
        Mon, 21 Nov 2022 04:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnfQ6ISxK8RloWdHimWZZCwZlxQOVw743/patpAY6b0=;
        b=hq7TGJPwl+9Z6/uN8eGb1DczClEE77ILU6BLdVbxSUGfGLMvPqyIzOi+uzMXt5HaU/
         K/FJc62OucBxht+eGBQ7c9lyinkAztGtbe8SbP8/KPRNWeRbnACK1tWWPNWHzQhfUZDj
         sdHNGSCLjPJqOspnE3U0gGIMNpmxm+Fxfx8L8mjE03yH8b2ae+el1V1XPutYM4CHT4N8
         kl4TWtB8HSIJJwV82pGtQQ5UQ1M0YQXwZ5wKRUQVD9HMpCqT+NXnn1ev12nJYXYSFYJF
         jhcAAzqZy6LRgw0uGNZh7kiylC1TZ18mWqviPMIRURcrvgfk2ZMnhvL1TwFs/fwIizkJ
         WytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnfQ6ISxK8RloWdHimWZZCwZlxQOVw743/patpAY6b0=;
        b=eqRNTDzqOMuM32Bp8Luxvq14G1yEteNvAtlRVPc4x+NzWgLXh2i9YiQSB8XP39AETm
         66KUgVNBSmlHyB5XZ0W9eybf6irXIg525WfgEtyBmN5knkBNmbgZo9+/v30QD1Ul6FaJ
         IGY41V+OkBqtdmME/T1AuyES15PWPd1zkC1GiqKApXlAWn1wDj7mEFiHHUREqg2Ii+S1
         ma/ysKUE2HexcokSpTsJX5fkxijB7Pk08VmCyp9OCvlco362ljOPW4Si8jeMHBzwnMDE
         YGSj9ErKKjOOgFLnTldELskynVVdYC8/9+5jAaFa1AYjBJnVLoCToRRek9AQFTfJGY1Q
         V0Og==
X-Gm-Message-State: ANoB5pntZ45e49xsbdPOgSforh+zfZjNtFEZtOfsRppYxK92VcL7aD/z
	sejjZES/K0Vx8jo0ZPf7DZ4=
X-Google-Smtp-Source: AA0mqf4Dqhm4B9v8P3G/NSei3zr8tKNE8Wh1t9jOakbPmLkjt0G32fm5C50hQ8TJ3iG4wN8jqQzyxw==
X-Received: by 2002:a05:600c:4a99:b0:3cf:91e5:3d69 with SMTP id b25-20020a05600c4a9900b003cf91e53d69mr16244393wmp.160.1669033871448;
        Mon, 21 Nov 2022 04:31:11 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b003cffd3c3d6csm14664856wmq.12.2022.11.21.04.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:31:10 -0800 (PST)
Message-ID: <2cc7a3c5-563d-cdf6-f49b-5e0a9852fb54@gmail.com>
Date: Mon, 21 Nov 2022 13:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/9] Remove the pins-are-numbered DT property
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 khilman@baylibre.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20221121015451.2471196-1-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043115_254256_61C8F74A 
X-CRM114-Status: GOOD (  16.65  )
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

Hi Bernhard,

On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> During the review of my MT8365 support patchset
> (https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
> the issue of the "pins-are-numbered" DeviceTree property has come up.
> 
> This property is unique to Mediatek MT65xx and STM32 pinctrls, and
> doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
> simply refuse to deal with a device unless pins-are-numbered is set to
> true).
> 
> There is no other use of this property in the kernel or in other projects
> using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
> flag is present in Mediatek and STM devicetrees, but not used anywhere).
> 
> There is also no known use in userspace (in fact, a userland application
> relying on the property would be broken because it would get true on
> any Mediatek or STM chipset and false on all others, even though other
> chipsets use numbered pins).
> 
> This patchset removes all uses of pins-are-numbered.
> 
> 

My personal preference is to add a summary of the files touched by the series in 
the cover letter (the tools will do that for you). This allows maintainers to 
easier understand if they have to look deeper into the series or can ignore it.

No need to send again, just saying for the future.

Regards,
Matthias

