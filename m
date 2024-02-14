Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E413BC4829A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 06:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvuFwE9JH8AL4WuwyCUWF595QEwuv9nlPeFYbel5Slw=; b=VF8ijHm/XxE61d7uhfrY7qi5vf
	BTqq6tdXsesjtXCAXZl6TnT6hIOBv4p5HdASx9omP3p7KMPxjv4vvGz0GZn6Kz5PceMJxDOFRsaIf
	K2j2AJvO5sni2SH6vgidHN+bWy+AoWFL/1vCjI4QsnPdAWzd/Fb+wZRmAzsUUU3tm9veUwzihc7KS
	EqCnx2qfswFtar2e5/nuse3YouwobbjTlwai/Iz2f0/SpJ7HMV0MTxSN8+sI89BjCwxHh1S7JrtTt
	AmxxbdmCqje9gXudxlyZLdQgwsyvTfi/s4eDCOeQqFpY4PCasL/TXd9tcNzQ0e4XPV354LBl3rLlB
	ndBMpOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8r4-0000000By7a-20P1;
	Wed, 14 Feb 2024 06:34:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8r0-0000000By5u-2Grh;
	Wed, 14 Feb 2024 06:34:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5600d950442so5894356a12.1;
        Tue, 13 Feb 2024 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707892485; x=1708497285; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvuFwE9JH8AL4WuwyCUWF595QEwuv9nlPeFYbel5Slw=;
        b=DyMPM8j5iIE8wa6Ejsh6MXSMa7LbBzYl7L+ZlqR0cKvTuVTpl7xGbLKRpxmUyqeVqL
         Y2qUVsuYKo38jA+mnlUKImKl/gVvq+w3qjuRmvRDS3SBQuqysgK6AN6WIYN189kG+imd
         oFaGtAJZFqx3YNzaiqSCnva+5uJx8hS1Xp/c9OtmYftrN6VXpmAfUrAqQg27qbwZsY7h
         XZ5Pfu5DE7/J1jxlNth9qowlb9ybhCSNTUK1SX0nriPPC117ucErAZsIbBOqttveTErv
         UsTxdHPDs/lkuVPLKMtb6UmaiD+ZIGcAsWgFsaLFgRUDtRcFwY/Pq0Nq1GiEG2GTjixc
         /i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707892485; x=1708497285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvuFwE9JH8AL4WuwyCUWF595QEwuv9nlPeFYbel5Slw=;
        b=l3xTLMhD7Zv8TBh76jajcjVdmkjPOOhMuu3S2hQOGjWorqy69mt9LcRNIb3l7kqdMl
         Wuzh0NwC/iprmczDZVPCfP1bcPmGT55kwI4SM8Skcc1Mu6E7PvqH2Vlm6XO8S312zpsz
         rX90//IvqY7VLw3PWuwTM0/MPN4h+/wipjlDNftV5uOp4yUeFflBv8Xqt5GfePH4jzAo
         U96aG2kUAkyZgN834KVLmlrUMhEbqk2UqKyda0lEoXuxfKkSuQ5R03BvNR+PoqhIjJNi
         Qavc75UBxYJ6gkzWYSibn2l5vbQigVd1WyGd9ignNSJ+veQ+97yESudlZmdKO6hNDK36
         w+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX6erFk890BfJHtYzFKEq6muzS4lZfqyFDgt/X2DCeAmoeuOt79FZITmTfRpKzB5nw+S7zzePvjNztlI7fgZOVS1tFBe6tLr5X5tnLQkLqdPR57t5GFw/Y3cnqIKG8J1njDqTGHCnT4ZS/sWQ2P1Vvmb/pRA6Bdt7s=
X-Gm-Message-State: AOJu0YyLBwKwdX3ncVBMweFMTojc/Go+gJ3wmch5+IT7rfsNhLvtwKlF
	NaJDgDVF+Jz/hJXrctEtLkq+XFneBUk52JyRmY450wIEL2gnezd0
X-Google-Smtp-Source: AGHT+IHv+h8nilZZuuQrNuz2sPa7nTzeb5gGsJU/RCpp62Djtg8Tx7IBmD08B8kU0Zzb0q6Sou+1qg==
X-Received: by 2002:aa7:c54b:0:b0:560:c6a8:e7c8 with SMTP id s11-20020aa7c54b000000b00560c6a8e7c8mr1318865edr.10.1707892482532;
        Tue, 13 Feb 2024 22:34:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYZNO4JHkvDYTwsSttpiPIZ3L8seVIgzLVDNEi6Zky1po9/QSq3tFucI4ZDAcKsdb2s08oFBX9nr9gVXyygAgkdFhXGmu+bpBNO9iIOT/jceybNOvG36LbmiAgu7DPUb29/gh+3aunjo99O/DIxNvImO+H+qTtXRmkz0JxT9JCXP7827qqsbgr2pqEb7MZSBu6rFAe6ue+Lf9IpMNosN6WPbJWTQ4OrJUOlrr63vUVE0WsVsfDrrOhcqfv8KBoml2jGwJ0NS5rmjPi44u2ngb7Bqs+ixptzf6Jbbap3azFppHRMq/J63gCNyt+v4yscVk2z4HysH7KxyfFQLCKBDERK4iXKUE63sSnjiiAGgAw76THJ+xPDWGkN4ZY3k8BR/ysKil0eqM+8D0WT7N1nakLiiT28kSjIe0AR1aRUJa/Y7RRmmkxX2g3lAvlnLU8bSIZRgXWICT8CBCxTZubUCM+uGl5Etj7+1oYLkmBk38=
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id dh12-20020a0564021d2c00b00561970655bbsm3290214edb.4.2024.02.13.22.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 22:34:41 -0800 (PST)
Message-ID: <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
Date: Wed, 14 Feb 2024 07:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible for
 MT7988
To: Conor Dooley <conor@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213-resource-evaluator-0754cfd5882d@spud>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240213-resource-evaluator-0754cfd5882d@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_223446_622420_0742CBD7 
X-CRM114-Status: GOOD (  15.65  )
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

On 13.02.2024 19:18, Conor Dooley wrote:
> On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> MT7988 has on-SoC controller that can control up to 8 PWMs.
> 
> I see a binding and a dts patch, but no driver patch, how come?

I believe that to avoid cross-trees patchsets (which are sometimes
tricky for maintainers) there are two ways of submiting such changes:
1. dt-binding + driver; then (separately) DTS
2. dt-binding + DTS; then (separately) driver

I chose later in this case as my personal priority right now is to deal
with all MediaTek DTS files.

Is that wrong or unacceptable?


> Also, what makes this incompatibly different with the other devices in
> the binding, like the 8183?

It can control 8 PWMs unlike any other SoC block except for MT2712.
It uses different registers than MT2712 thought.


> Cheers,
> Conor.
> 
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
>> index 0fbe8a6469eb..a5c308801619 100644
>> --- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
>> @@ -24,6 +24,7 @@ properties:
>>             - mediatek,mt7629-pwm
>>             - mediatek,mt7981-pwm
>>             - mediatek,mt7986-pwm
>> +          - mediatek,mt7988-pwm
>>             - mediatek,mt8183-pwm
>>             - mediatek,mt8365-pwm
>>             - mediatek,mt8516-pwm
>> -- 
>> 2.35.3
>>


