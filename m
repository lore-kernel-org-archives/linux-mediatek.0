Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E74C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrHWBfM8Gz62vxt+DbqISSl1Mr1EVk+bFajDRx+3iAE=; b=pWd75o0b62pdwX2Y9kvlS3/lsY
	xq4g8FxrdcZQ+nhAzsDRmpo2MhwIvuxTWuON3li3zacSKsi5BvsXeEULEye2JKcggd73KB2q8oAR3
	rP3tff9gHLY1dZ2qvyg9xpxK7fI2oyqmyswkJYcJK79PWMdpq8hDZfZV1J0SiB8fBfFs874sRvg46
	1WL92D3SN5pK6+I29dBmSNJ3CDkFLtLXJcdQJOpOe0EIeIl+RkzugZQ+aePOZ3dVWl2Iv3LD9zfIG
	cYlhO1QOBOejQwBUSN1kWwPs15Wu+K8R2o2zxztz36qb25EED5aEsXmck/ZG3mQyPcfQonA6YxjBz
	a46Cyyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmJB-00000009vdm-3j6Y;
	Thu, 27 Jun 2024 10:24:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmIx-00000009var-2AcT
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:24:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso11662795e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719483875; x=1720088675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HrHWBfM8Gz62vxt+DbqISSl1Mr1EVk+bFajDRx+3iAE=;
        b=mPAlQe5RruZBUu8w4YAjYLrJTypMMAp2JcyiI4sxlQswNJdJt0Zn12Bfrxr09jLuzy
         NWp7ss45Cit7Lwiz2p+ciEZjbLizTwL6CQ5r+FbqAFvEYFbdZxa62teTSoUnh1ZwkXp6
         C48CSWg4mgGNSG6GAyTDqnyrnx5F7VTla/H0JJ1QI47jpC6EAw6utm8KAiH/eBPeXCPU
         rK7QtlihF3wtEy+ca4Pj5hATK7GEyHnS6jZ5W7nG2N9LHyep38/Kbj+V84nZBp7HAw1y
         5isRDD9ymvzxa45CR2jpq5cQiD03Zpx308vwIyKTU+dSisJFxr0H7+HQDKq4qiQ2IfpN
         eLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719483875; x=1720088675;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrHWBfM8Gz62vxt+DbqISSl1Mr1EVk+bFajDRx+3iAE=;
        b=lP9YbZwQWSczHlvlezPj9Ba79pw8FpadyxejpwPXJkfHBRjTfRH6xN9oVhy+TO7LLs
         A3MZVvE+PBkTRo//bsFUbYm6nEp5qlBCkaBj1kHXppaY4HVR4Q1m1I602aMat4l7B6pL
         YdqXEVRDbIp8kW8alNtv9h8X5jGSqJon+KXmC/jx/okk3t8R06XI8x7eTqaROA6q+zni
         1YZ4c3R79Uj0VvlEeISxxUQ4I6M8TvvDB6Ij/EyzxtebwEmDePO3chy40577v7Ky56Ka
         eTlPaW+mYrroYJspher0FugRUdqhCwfpfUEmY6dYoStWFIn9J5HY8lCQECwT2QoXQ4Mc
         U/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3rYtyC/MbvIVspYudC1lkzULhZdHtezvYggnBj/f/6q58xE1vkfLR4MMW7jKh3dMTzz6a3vH9oMaKIKHheMQui9XslRbfzPlG6Hec9/J3MBl
X-Gm-Message-State: AOJu0Yz5iC1NclfM1LudANGrYM9SVGoLFR88L9d+6CVURdAw8t4qi07b
	2r/cu5f05mn0T8VUHbI2HeZwTmMjeRKt5RIyq5h5ZkCgzm1sX3KuE4zwCgrjLso=
X-Google-Smtp-Source: AGHT+IF2cIA0cRyZgTPo7KIFW4Ep61Ur5pRkr06EGL2BkduhkLMb1vRc6DFigVeKlzcmeV43lu5xDg==
X-Received: by 2002:a05:600c:470d:b0:424:7dae:7d79 with SMTP id 5b1f17b1804b1-4248cc177b2mr80264235e9.7.1719483874921;
        Thu, 27 Jun 2024 03:24:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245e7csm59444105e9.3.2024.06.27.03.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 03:24:34 -0700 (PDT)
Message-ID: <58d1e88c-b2cd-49c7-b250-84104e82ed67@linaro.org>
Date: Thu, 27 Jun 2024 12:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] dt-bindings: mfd: syscon: Document more
 compatibles and require simpe-mfd description
To: Lee Jones <lee@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Rahul Tanwar <rahul.tanwar@linux.intel.com>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>,
 "Zhu, Yi Xin" <Yixin.zhu@intel.com>, Maxime Ripard <mripard@kernel.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
 <20240627081853.GF2532839@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240627081853.GF2532839@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_032440_331929_A0987420 
X-CRM114-Status: GOOD (  17.08  )
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

On 27/06/2024 10:18, Lee Jones wrote:
> On Wed, 26 Jun 2024, Krzysztof Kozlowski wrote:
> 
>> Hi,
>>
>> Dependency
>> ==========
>> Rebased on Lee's MFD tree, because dependency is there already:
>> https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
>>
>> Merging
>> =======
>> Preferrably everything via MFD tree (file/context dependencies).
>>
>> Changes in v3
>> =============
>> - Add tags
>> - intel,lgm-syscon: change maintainers (email bounce)
>> - syscon/Split: drop unneeded |, use const instead of enum in select:
>> - Link to v2: https://lore.kernel.org/r/20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org
>>
>> Changes in v2
>> =============
>> - Add acks
>> - lgm-syscon: add ranges to binding and example
>> - syscon.yaml: add big select with all compatibles for older dtschema
>> - Link to v1: https://lore.kernel.org/r/20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org
>>
>> Description/problem
>> ===================
>> Simple syscon nodes can be documented in common syscon.yaml, however
>> devices with simple-mfd compatible, thus some children, should have
>> their own schema listing these children.  Such listing makes the binding
>> specific, allows better validation (so the incorrect child would not
>> appear in the simple-mfd node) and actually enforces repeated rule for
>> simple-mfd devices:
>>
>>   "simple-mfd" is only for simple devices, where the children do not
>>   depend on the parent.
>>
>> Currently the syscon+simple-mfd binding is quite broad and allows
>> any child or property, thus above rule cannot be enforced.
>>
>> Solution
>> ========
>> 1. Split the syscon.yaml binding into common syscon properties, used
>>    potentially by many bindings, and only simple syscon devices (NO
>>    simple-mfd!).
>> 2. Move some known simple-mfd bindings from syscon.yaml to dedicated
>>    files.
>>
>> This patchset might introduce new dtbs_check warnings for devices having
>> simple-mfd and being part of syscon.yaml previously. I fixed some of
>> them, but probably not all.
>>
>> Best regards,
>> Krzysztof
>>
>> To: Lee Jones <lee@kernel.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Lars Povlsen <lars.povlsen@microchip.com>
>> To: Steen Hegelund <Steen.Hegelund@microchip.com>
>> To: Daniel Machon <daniel.machon@microchip.com>
>> To: UNGLinuxDriver@microchip.com
>> To: Nishanth Menon <nm@ti.com>
>> To: Matthias Brugger <matthias.bgg@gmail.com>
>> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-mediatek@lists.infradead.org
>>
>> ---
>> Krzysztof Kozlowski (7):
>>       dt-bindings: mfd: syscon: Drop hwlocks
>>       dt-bindings: soc: sprd: sc9863a-glbregs: Document SC9863A syscon
>>       dt-bindings: soc: intel: lgm-syscon: Move to dedicated schema
>>       dt-bindings: soc: microchip: sparx5-cpu-syscon: Move to dedicated schema
>>       dt-bindings: soc: ti: am654-serdes-ctrl: Move to dedicated schema
>>       dt-bindings: mfd: syscon: Split and enforce documenting MFD children
>>       dt-bindings: mfd: syscon: Add APM poweroff mailbox
>>
>>  .../devicetree/bindings/mfd/syscon-common.yaml     |  71 +++++
>>  Documentation/devicetree/bindings/mfd/syscon.yaml  | 306 ++++++++++++---------
>>  .../bindings/soc/intel/intel,lgm-syscon.yaml       |  57 ++++
>>  .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 ++++
>>  .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 ++++
>>  .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 +++
>>  6 files changed, 457 insertions(+), 123 deletions(-)
>> ---
>> base-commit: 8dc7c29f608649f3d9eca826e9d4fe4b8a32c472
>> change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d
> 
> Okay, I tried to apply these whilst fixing up all the conflicts, but
> lost the will to live.  Please rebase and [RESEND].

This was based on your for-next 8dc7c29f608649f3d9ec "mfd: lm3533: Move
to new GPIO descriptor-based APIs". I'll rebase.

> 

Best regards,
Krzysztof


