Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB3CC7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 06:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI9Z3j+r3a0Ltufs6TrTDwqvLTunzcx+0NZ8vIKvHWg=; b=Aj6tb9DD+cXTBCgdm/4bpSPLYM
	jFT4GXPAlf085Y8aC4QFMfd0Bt6N71vOrazmjFlEL6ysll+gz/bR5lzez1T051POASM/JWzRr29F/
	7NAU6XZ8FZeKE+HZK6SOaEyvC0M2ugWxUWePIARNSTjML6Pz/ZT8Xe63HlW2dUIP9ugU9Fe/RUGTS
	FBc1PgDyqM+rQMJ0kfbszdNYyiLr7hMfcNbrdxmhLVpBJw0UjW9Y0pKv7+h1bW0GlU0HgZiBL8cQi
	sGL4Y80GAUwqVve/6OA618NtYmQH88KmormGYe4McbCePmzFdi2kJGJzIFT+SouTDOSRhN+UoQ9UL
	bkNB4PkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6n47-004dJG-23;
	Wed, 07 Jun 2023 06:54:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6n44-004dIG-2O;
	Wed, 07 Jun 2023 06:54:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f623adec61so71015725e9.0;
        Tue, 06 Jun 2023 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686120875; x=1688712875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UI9Z3j+r3a0Ltufs6TrTDwqvLTunzcx+0NZ8vIKvHWg=;
        b=CRReD5bCpanlduyt4/F+AGjKmFIRxliDjyfEuvzACcRLo+Hsuk6PnlGwID7Wm3/YaZ
         WT5BD3DzJxXZRNEedYt5X0jE2Udfz9z61LK7JVL/xRx1IzwPO1dIgiMuhUk2LZ489Ovz
         26ThTAFqkvbSTIIUtfxBEgTBCOJyFzKw8T+fettpBSVXerEmsIYOOrhLnVdNLmCyHjC3
         B9nDeLpo1JS/j3LkUSYkUcklDprMO3vyIhU5kxtLyXEKjYrG8SOagNTemb48VDOjOVpR
         YApgcCaLNp8/aHU/lFw1iuqAKntn7SyXk4tJ8WEWTE4U/Dfk8wPBfUvPwZL9ky5dnhYM
         uSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686120875; x=1688712875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UI9Z3j+r3a0Ltufs6TrTDwqvLTunzcx+0NZ8vIKvHWg=;
        b=PKC9cOFs0M7zvyN6xVLgTjjVSdPYH20y4O2Z61D3frpq5NkmZLHtwhTrDBOuIDT5mU
         iWwOnLkub7ZWDx6TjCWHlVQBtYrwls5UbwQR3dUBdtOCRTQ9Sv3ADskKr9XuC9xkxIE6
         6jkerjN7ijhpgg9eeGdsvYvukxVBcp+Z+DcxkCoHaVi1TnlqZcwCGbBGZjteIgg8CWw6
         /0tTqbt6E3pT6JaTJunxAsmYGH9B9veLqxzc/IlzgKQUDZp9OoD5IL5RuRl2qShj+D/Y
         mKUmhWOhw/DNcwTm7OKIhAq9CeHLIOEQAsHtFXMryeb8KbzpYwPOWI1MX8/YlI7QY3OY
         SA5w==
X-Gm-Message-State: AC+VfDxX61aJOpiqR+1owwpIr0u3w73i+ZcLljs/ox+ooCYdn9mvJ3KE
	jQE8E2lGrC1rei9pzbYsSdI=
X-Google-Smtp-Source: ACHHUZ6w1ibYJsDpRq3SReWTvaZuSYU3syNjGO5Cx6RZ0KZNHhZ5jYhYnttjdfluCskxahiLDJ+hJg==
X-Received: by 2002:a05:600c:c1:b0:3f6:a65:6ff3 with SMTP id u1-20020a05600c00c100b003f60a656ff3mr3494314wmm.32.1686120875356;
        Tue, 06 Jun 2023 23:54:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h4-20020adff4c4000000b0030647d1f34bsm14633830wrp.1.2023.06.06.23.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 23:54:34 -0700 (PDT)
Message-ID: <9ec115dd-e419-ec4e-45f1-0865d703fd6a@gmail.com>
Date: Wed, 7 Jun 2023 08:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230602183515.3778780-1-nfraprado@collabora.com>
 <01c88a42-274c-f8cf-73a6-29741579d9db@collabora.com>
 <4b2fdd36-0871-ecc7-5d64-e088d7f51987@gmail.com>
 <0e9667dc-8f91-49a0-903e-6725204e11ad@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <0e9667dc-8f91-49a0-903e-6725204e11ad@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_235440_778803_326E67B2 
X-CRM114-Status: GOOD (  14.96  )
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



On 06/06/2023 15:00, Nícolas F. R. A. Prado wrote:
> On Tue, Jun 06, 2023 at 08:38:42AM +0200, Matthias Brugger wrote:
>>
>>
>> On 05/06/2023 10:21, AngeloGioacchino Del Regno wrote:
>>> Il 02/06/23 20:35, Nícolas F. R. A. Prado ha scritto:
>>>> The capacity-dmips-mhz parameter was miscalculated: this SoC runs
>>>> the first (Cortex-A55) cluster at a maximum of 2000MHz and the
>>>> second (Cortex-A76) cluster at a maximum of 2200MHz.
>>>>
>>>> In order to calculate the right capacity-dmips-mhz, the following
>>>> test was performed:
>>>> 1. CPUFREQ governor was set to 'performance' on both clusters
>>>> 2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
>>>> 3. Calculated the mean result for each cluster
>>>> 4. Calculated DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
>>>> 5. Scaled results to 1024:
>>>>      result_c0 = dmips_mhz_c0 / dmips_mhz_c1 * 1024
>>>>
>>>> The mean results for this SoC are:
>>>> Cluster 0 (LITTLE): 12016411 Dhry/s
>>>> Cluster 1 (BIG): 31702034 Dhry/s
>>>>
>>>> The calculated scaled results are:
>>>> Cluster 0: 426.953226899238 (rounded to 427)
>>>> Cluster 1: 1024
>>>>
>>>> Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and
>>>> evaluation board dts and Makefile")
>>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>>
>>>
>>
>> Applied, thanks
> 
> Hi Matthias,
> 
> this patch doesn't show in your v6.4-next/dts64 branch, while the other patch
> you just applied does, so I just wanted to double check it was really applied.
> 

I forgot to push it, should be fixed now.

Regards,
Matthias

