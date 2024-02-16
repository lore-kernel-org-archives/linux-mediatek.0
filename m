Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D950C48BEB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HamjRFBjQ2qVdicv3DULvaDT9cBo0qS+9hQ3Sknz2SQ=; b=Vb1zP9mKIaygWqv2XZeGzrQtAm
	fnjVH8f0uhdA796g6RzZdOFB0KeMeRXUbGzPDzbK1SkZsN5Bb5BAhRvBeG0aBPMYbBEoNRXXvU8w6
	/uh3JWyBvbWmWeNDDQEkukxLhFjLF6HBcNzeMhVPjjI72RbFLDqPj82HLgol38fwMQQUqUfFe4YQJ
	enDlVIlc43Grcp6PmpJB5JWjkfvAbU3Yqy/Cx5ACzPMrQzxS3JrHUmiN7goXWYXbDYVr+seUaVupb
	BHLC1NehBeTlQ8h+wtpMZmhB6qwOfo2ILFBIF4eBAhkApum86o5vYxTUCq9X/T/uA5/NNKODiNhQZ
	6jWYGXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rauBq-00000001fuf-3UZ4;
	Fri, 16 Feb 2024 09:07:26 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rauBn-00000001ftE-1hH6
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 09:07:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-563d696ce87so1207973a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 01:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708074435; x=1708679235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HamjRFBjQ2qVdicv3DULvaDT9cBo0qS+9hQ3Sknz2SQ=;
        b=qeDb/LVuAlhksNrYQm4Pa153oSaDqLIvWQF9WJqeGEOq3E9nWFaDrQ6Ml6Ldzg5nme
         sf/2f6k70akh+OEKGBlWpaprVZ/aDheJXwHlol64LUzSs2eCSS2nx2hTVUk+vwD3RDpg
         EOvRLdKuB3fcuSf06FmIkvO4jMdOvS5Dr4Injx0i9VYfrTEN43cGUebbdTrihNUVDBMb
         feEmlS6l+uE4ITIC7jr/k6cm7N2C7j4DBOxANnnml/nDndlB9HAEwQ93V7+mLatc2uK4
         KZ9qfK+mTj20gYmRsHhCmdC2g6wnWWM0zyYd9zWKE/afMYGNsN3HicUKXz0n+2Ye+/iH
         gApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708074435; x=1708679235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HamjRFBjQ2qVdicv3DULvaDT9cBo0qS+9hQ3Sknz2SQ=;
        b=mAwwNvhDjoYMscBaT2nUG4CR6jwy3hZW/cC7vcBibiEKU9szJod26heq8Xzc9g5o/p
         U3S8gCxSxTTpOpkEvhaNAdm77wEa/Liuljsj0s3nDGelFr6dEa1RrDtiu06HY2sU48kd
         42xb9+5XV9C3OxSGxMjogJo+D3F9MH3kAKIPCvZ/EC0MocvAd+VROe9vN8jqlrUpUzf+
         d8OTChqWDER7nVo2h7M2JmuWIYKjjUjAwMasalgRv0kZNQLpklkTGzCJ3YXu1GtITVm4
         hWLXnGQSm7jGl05XpIhIZHF5/bfZ9tBgi3p1+5a+hrzVqKkm92mBGiGYMXKHAxXTYDu0
         BsiA==
X-Forwarded-Encrypted: i=1; AJvYcCXT0coz0nKS3GVPsSp6/UEqClqOBMChxt6cpxQRjUjb4FNVHw33XKE5g1yVyr0O7s8jJxGYa4DpPMdQw2nOjnUXizs5xrd6rZjRnnMUHCKCTpPs
X-Gm-Message-State: AOJu0YySq75zUYAkGibQrHcVzZwpH8YGh3o0V8UFvc2rpfl24jlVug9t
	ubl6k4XRekJ0Apxv2/5CanzHM68lBpHti82wA+0dfqT9rOwTyYJYUYe0pnWr+rs=
X-Google-Smtp-Source: AGHT+IEUgSOOKDAi97LxXDelVgKRQxrSmqm2fmNwo6lm8ky2V+YruTn065g/aFweYnsmmRMFjV6nIg==
X-Received: by 2002:a05:6402:4582:b0:55f:ce14:337a with SMTP id ig2-20020a056402458200b0055fce14337amr5964730edb.11.1708074434995;
        Fri, 16 Feb 2024 01:07:14 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id co26-20020a0564020c1a00b00563d213b017sm774881edb.44.2024.02.16.01.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 01:07:14 -0800 (PST)
Message-ID: <23c7fee5-ed66-436b-bb1e-ca4cdc8d0a66@linaro.org>
Date: Fri, 16 Feb 2024 10:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible for
 MT7988
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Conor Dooley <conor@kernel.org>
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
 <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_010723_478938_33524DAA 
X-CRM114-Status: GOOD (  13.08  )
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

On 14/02/2024 07:34, Rafał Miłecki wrote:
> On 13.02.2024 19:18, Conor Dooley wrote:
>> On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> MT7988 has on-SoC controller that can control up to 8 PWMs.
>>
>> I see a binding and a dts patch, but no driver patch, how come?
> 
> I believe that to avoid cross-trees patchsets (which are sometimes
> tricky for maintainers) there are two ways of submiting such changes:
> 1. dt-binding + driver; then (separately) DTS
> 2. dt-binding + DTS; then (separately) driver
> 
> I chose later in this case as my personal priority right now is to deal
> with all MediaTek DTS files.
> 
> Is that wrong or unacceptable?

That was explained many, many times. For cases like driver+bindings+DTS,
bindings go via driver subsystem, so they should be posted with driver
patches.

Feel free to include DTS at the end of series, unless you send to Greg
or netdev.
Better, also required for Greg and netdev, is to send DTS separately
with lore links to the bindings.

Best regards,
Krzysztof


