Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03830C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEh4cv/IiBUlEQPrhXi9p2fWPNI8o04lqTskgPtx5jk=; b=fyplyyNhW6h23dmdleqUDIoeVc
	43vnspc+fc9qJnCdD9NWvEg39mgLT/5zvfiPrhCR2hwdx7Q3kOCEJ2z2cS9F3CQNqfMPEEmkU4qq0
	4SeLohVONPgzJoEW0pu6gDMA3j/l+ZJjVV0fsPmXq8mLZuPnSSeGxCGpFHU5uu+TUtNw5QxK9yzGD
	e7b3REl/kqWFbJ4DYbVqS80QwERMRPhijZiHRAm3NXhNrtZOcisNiuWv4yds9mRW+sWN/kgXETq+5
	FPXtGDdcer6xOe6210DQXWf3jyc7Dks+p2OTkufkyFHdDSIRvPsB4PkPXLFR/cT21dN1z55sYei5p
	FvBjRnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCAZ-006xxl-14;
	Fri, 31 Mar 2023 10:39:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCA7-006xoa-1M;
	Fri, 31 Mar 2023 10:39:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id m8so1701783wmq.5;
        Fri, 31 Mar 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680259153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEh4cv/IiBUlEQPrhXi9p2fWPNI8o04lqTskgPtx5jk=;
        b=jwCxjNIRLM9CnNYShCAyldXTLn2ECc9ppPxCG4S7HYNNn/j2MK8ddWzxH8bGWyWQBY
         OI011512naw8QkAhE3Y972Iy9VkTCCZr1AFnFPeXyovjw7Kcu1VgnTnnZIxzFSVApi2/
         xzcj8VUpNoqckh8FMl0TfyYw6vEvsVZHf4oaYonbUtiv7NUPB4ZrrKNm32lef5JSfjch
         i7RiLnFkMJXkiuutR2Jse701srqeSikvqPhQqsvn9DxWm8wZaNvN4dKuVoCQoisIyYnO
         0h/oWJyQ1p1vphCnIh6Xo1m1Zkn73g8SVrvNCJaUzVBhhGr2BUWXebd4yBAu6v7fsm0p
         DlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEh4cv/IiBUlEQPrhXi9p2fWPNI8o04lqTskgPtx5jk=;
        b=JB/vWAs20nBunDdPnoXZ5ceFw9KrCMXG5H78+ps8ELx72/WbKctB0QPwsmAirMwjXI
         igZ+9WuVvV93y1fxb3/4yZjCILl1qurxK+4mlsRRXVHYR57oSHcR9Uj4yTAVaU/YwKav
         Tcd00DPJWQTj12zxt/8TNxNDuAqcA/Sftm0KRsZUjanYj0FhX0puBzQJUWa93sQbX8vM
         KjIyjEZ6A9SQIB12/saI2g++Jb7mNlpXs/Ohi6OpIHwCSp8GNYAWXv0uv/FJMn2ja/uG
         RGwmhNVDj7kjYji8Voz1Jx5hSR1MSKH3zduaYm+9dAYji+wasrlLffrM5NNHHevItrtA
         zHcg==
X-Gm-Message-State: AO0yUKX/gsnsM3T61YEo73OCfwOfdu5N8YIAw0aXBZ4czaAYyXE4eYot
	Ft9ieGzP9tHCy5n3LGBbe2Y=
X-Google-Smtp-Source: AK7set/59lb83lDWDpH/BSoC/UaKyAJ0vQRM4WgzAcqFG3sNFSoipOAJ/dkn1TWiCBllOCKcuNAl3Q==
X-Received: by 2002:a05:600c:21d8:b0:3ed:2b49:eefc with SMTP id x24-20020a05600c21d800b003ed2b49eefcmr21150194wmj.3.1680259152917;
        Fri, 31 Mar 2023 03:39:12 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q13-20020a7bce8d000000b003ef71d541cbsm2282636wmj.1.2023.03.31.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:39:11 -0700 (PDT)
Message-ID: <3780c57f-f496-6cf7-75b7-b582c53172a3@gmail.com>
Date: Fri, 31 Mar 2023 12:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/4] arm64: dts: mediatek: mt8195: Add display pwm
 nodes
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
 <20230223145426.193590-4-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Ff13sH9JTcBBi5j2mUX3BKOvpM=MxV-Fwwu370FdYjyA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5Ff13sH9JTcBBi5j2mUX3BKOvpM=MxV-Fwwu370FdYjyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_033915_574583_19070758 
X-CRM114-Status: GOOD (  10.32  )
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



On 24/02/2023 10:01, Chen-Yu Tsai wrote:
> On Thu, Feb 23, 2023 at 10:56 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add the two hardware PWMs for display backlighting but keep them
>> disabled by default, as usage is board-specific.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> and
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> for disp_pwm0

Applied, thanks!

