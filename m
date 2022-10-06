Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C00C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbl2sqAncpllKGuOCbPF4knZ+D81ldDQn9qCCcipX7g=; b=4v5ElFIXSoRiHFV49RQfR3bkPu
	2p8RHoADte3jxD5nGq1ajWq2nPR/QNDCN20tDPS4a8EEC1JsvDt8opi1lt0xsMVI5T8smZ46FNHbL
	9x3+rXBf4s1tD8QHQ5/Js3wKXN57lgK7IuJY617QdWLgnDf0vVJtzIi36vGbieeCyZ1NOAbYjMoTZ
	Lq5jJKJbCu9IgKNZOLXQBIfuIUpXw3EBWF7ZPeoqtCtCk+gx/oByHtn+paXoOPJI6AKJH0rxLAAVG
	03d+M7MijZ0FOrOBFiFajbXR8Jop/bSWhL4A+oZaqHPLfCXUbv7bJ8ksDd6QYZnyMHL3ey0qJcv09
	3uVbNhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLhQ-000WOd-JF; Thu, 06 Oct 2022 07:53:44 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLhF-000WIX-Ik
	for linux-mediatek@lists.infradead.org; Thu, 06 Oct 2022 07:53:34 +0000
Received: by mail-lj1-x229.google.com with SMTP id m14so1301382ljg.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gbl2sqAncpllKGuOCbPF4knZ+D81ldDQn9qCCcipX7g=;
        b=KJikq2u4YaMAiclDPOqBu7az8d5be3+5ghPcv1oUClRdCp8sawmrjfcQNiVxvJJO0S
         I/Io/7dkU86k8naUE/KMJZyoeV8W3QWHUFhzFcaPkbYEWjV/r7PsLE2+DiCuVt9S9Tmq
         zotrYr7KXIO+tZ6DZcTIP6kICfHlNfSQTSzh1RG1Ai1pfq6d+/WpFlQpHQLek6iujPz4
         yIes+husiLc21yJjNMqgchyGvXpweIFAXxmAD0GONQEqIhs57xjpFH8CxFExds15GCtW
         BRyXo5uNphwlw/DfRBS90yHJd4iilCdxlLMKIhB++iTwiI8IhL1Id1uR/n3JRV6pbV8/
         Ua9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gbl2sqAncpllKGuOCbPF4knZ+D81ldDQn9qCCcipX7g=;
        b=1TksIvIDV3Eckms1ZFcARQ8fSwd7NFq1JVdP5VDR9v5ZzwRkDQskd4Y4He/01i6rQ7
         VC0S1eNHf+15AMQny2gmDDPEVf2SP3XkHV+HlGtvE2LKdcfRG+b0kGWCHCU4QqgXiP2r
         6HEzj1wBMUkzQ0Mb05MAHXze0MAeSIvmrkijBqwqxSlDImFar3Mu317M429NNb2+bA8O
         N75qSmzW7cU74ZyyqRUauYvGBSB1LJJ8BM8K2lYAsZiN5zeJhPo67Wpp3paI85ehPcAb
         nDc8AZOu8luOkbrjPIQaUMt6fFaBPVS0/GJtt5xKiDHb0jRfch5YCppunpBm2RbK97B1
         RQEg==
X-Gm-Message-State: ACrzQf0qtw300w9nSgEwFyu7qQhS0cZSMzFaNsqyu+T/Eu8mz5K0b5rz
	eghh4a3XzOVqnI3pmVotXMSqQxkA76ziWg==
X-Google-Smtp-Source: AMsMyM63+lsKjqS9rbt0n60RV+mLp4etB8Di6xPlg3WpquQtq7M5ay9DT1wK45eOy53hn25eJwctwA==
X-Received: by 2002:a05:651c:158e:b0:26b:46a6:bf63 with SMTP id h14-20020a05651c158e00b0026b46a6bf63mr1155856ljq.21.1665042807390;
        Thu, 06 Oct 2022 00:53:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o20-20020a056512231400b0049f54c5f2a4sm2600306lfu.229.2022.10.06.00.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:53:26 -0700 (PDT)
Message-ID: <6bca0fd0-395e-0fae-f500-d9c78a5dc719@linaro.org>
Date: Thu, 6 Oct 2022 09:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] dt-bindings: leds: mt6370: Fix MT6370 LED indicator DT
 warning
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, pavel@ucw.cz, matthias.bgg@gmail.com
Cc: chiaen_wu@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <435f6888ebc20c5abae63eb9cb3a055b60db2ed1.1665050503.git.chiaen_wu@richtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <435f6888ebc20c5abae63eb9cb3a055b60db2ed1.1665050503.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_005333_644537_7B4D466D 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

On 06/10/2022 05:16, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add '$ref' and 'unevaluatedProperties: false' in 'multi-led', and remove
> unused 'allOf' property.
> 
> Fixes: 440c57dabb45 ("dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator")
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


