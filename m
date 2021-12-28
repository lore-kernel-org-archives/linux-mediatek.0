Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D58C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jb0N+O+o6HvxbZF9y7ymuDNKShrkMC7Lpqulz5ktGaM=; b=e+pvK0z5MJ7UHm
	3umNyv0PmfprCk5NXbHqICgvWgwn5jDPeCp+85jRqo0sDJXj1QXlE7Q1ZbYiev5tHbkzpKWZXLBr7
	J4arCHs1d08BvTFwk69W+cg/jROn2FbIawnPWH9GjUCC6lQxcjaM95ArHJq59LFoGNPIDC73TXJsY
	mSOz96yvTIoV7/TvWuD6saW0Fmc0k6pFU9PeLsgYIuWzcwia4sAUU2Q1fNcUmI+xjTlZg2eI2+Eyk
	gAVZRZE9rbdoZ+csMQsLfwLPNw1UJHX/4xt4HqNB+6yT/l/57jn0zt3xj45Z1nGpWgHtBgbxcYEwW
	fl55D5Z2LKwFVRw6HDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Epn-001Srm-93; Tue, 28 Dec 2021 15:56:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Epi-001Sqi-RS; Tue, 28 Dec 2021 15:56:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so12991479wmj.5; 
 Tue, 28 Dec 2021 07:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=t1MDQ1CuJ+CtxV/k/TCo6Po1qrBja12Cye53X+2hxAw=;
 b=o00dZLBKTdEgFVqOhz+3M4aTH+3GOsY6yRQov1N60Io3DQ0tYv672K+Ia/kb0s2Uma
 FG5vmY1zQ0BgRwgTdNKyniFugn2+4+UFg4IPcRT/XBqTgWyRME2SkYuaXbpCRn8S8Ytp
 SyREk40Ngrepjvm9sywWazRQcUAUc/FzIQB1SkSrJtHjBo0L/aX9UKBqB4Zvyp92HIJt
 itgYdg4PZW6Z+7mihWiszGF809uT++Jmw0qi+4f/22DxTIvNevnRK9qUstmAB1sADf/9
 BkceYfdugySDWoWxBVo5fSg0s8bdkd7VcXr6lOvdgDQKB2WvLAOiZFtzeF7JH88Uf5q2
 QEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=t1MDQ1CuJ+CtxV/k/TCo6Po1qrBja12Cye53X+2hxAw=;
 b=J3SE7HK+gi0rqKg+zzVvuqbI0QP0qrEioNWbmJvlGE0J0TCKzXr9wDAffoXir/It5a
 xw6Wq780tjedTbQH4e/LGyv0WP6iDo9JASPNCmr/2hMF8drTukxCs8oIkKYpN5VhMypH
 HB+idQ9B+icd+9TWZptEitTAhUit+Dt+cr0EKjVx2+2XsD47XPGj/Brw5hzYmTOa06LJ
 xJV5E8i780T0n0rVCLjp4w3wEogaKavh6rRQxIyEV6GJS6q1Ih3omkQZt+mPu+VgtRq8
 4ScWekq0Fl13kukltzwGSUMJFc3b4fgwUreylNdwbYUJeIUUttEbYt/yyPEtxhH49a7r
 m4fw==
X-Gm-Message-State: AOAM530Tib5ZSLvZjunpt4kB45defoCZqSaZ9IriH7MH0ySD5PxJsliE
 5EwYrCistxK2oEEcCsy/Hl0UomGmr3dN8w==
X-Google-Smtp-Source: ABdhPJwTVaMHMH2jZEptpNnvfazLDgeUnQ/pvqXSObPuy3N5yE62W28JeUWULMTu8bgsKg/0uhBGbQ==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr18135068wmj.76.1640706973311; 
 Tue, 28 Dec 2021 07:56:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id a204sm21834509wmd.39.2021.12.28.07.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 07:56:12 -0800 (PST)
Message-ID: <331e5b78-2ac7-bca6-061d-85cf25a6bd95@gmail.com>
Date: Tue, 28 Dec 2021 16:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Maxim Kutnij <gtk3@inbox.ru>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211219183134.3849-1-gtk3@inbox.ru>
 <20211219183134.3849-3-gtk3@inbox.ru> <YcNhMdN6rzh9yRG1@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/3] This adds a DT binding documentation for the MT6582
 SoC
In-Reply-To: <YcNhMdN6rzh9yRG1@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_075614_933490_45B4F50B 
X-CRM114-Status: GOOD (  18.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/12/2021 18:32, Rob Herring wrote:
> On Sun, Dec 19, 2021 at 11:31:34PM +0500, Maxim Kutnij wrote:
>> This adds a DT binding documentation for the MT6582 SoC.
> 
> Please follow the convention used for other commits of these files in
> the subject:
> 
> dt-bindings: mediatek: ...
> 
> (That's true for all commits in the kernel)
> 

I fixed that for you. I also fixed the order of the timer and SoC compatible.

All three patches are now pushed to v5.17-tmp/dts32 [1]
This branch will be renamed to v5.17-next/dts32 after v5.17-rc1 is released.

Hope to see more patches from you to enable other drivers of the SoC.

Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/

>>
>> Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
>> ---
>>   Documentation/devicetree/bindings/arm/mediatek.yaml           | 4 ++++
>>   .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 1 +
>>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt        | 1 +
>>   3 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index 0fa55497b96..fedce0d0f3f 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -26,6 +26,10 @@ properties:
>>             - enum:
>>                 - mediatek,mt2712-evb
>>             - const: mediatek,mt2712
>> +      - items:
>> +          - enum:
>> +              - prestigio,pmt5008-3g
>> +          - const: mediatek,mt6582
>>         - items:
>>             - enum:
>>                 - mediatek,mt6580-evbp1
>> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> index e5c57d6e018..62acdb11aff 100644
>> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> @@ -11,6 +11,7 @@ Required properties:
>>   - compatible should contain:
>>   	For those SoCs that use GPT
>>   	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
>> +	* "mediatek,mt6582-timer" for MT6582 compatible timers (GPT)
>>   	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
>>   	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
>>   	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
>> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> index 0114871f887..a97418c74f6 100644
>> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> @@ -8,6 +8,7 @@ Required properties:
>>   - compatible should contain:
>>   	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
>>   	"mediatek,mt2712-wdt": for MT2712
>> +	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
>>   	"mediatek,mt6589-wdt": for MT6589
>>   	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>>   	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>> -- 
>> 2.34.1
>>
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
