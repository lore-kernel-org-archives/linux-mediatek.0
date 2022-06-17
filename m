Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E8EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc8b54ib4p0YjJfjY8+DsviI0qAHAjK0UvvBe++hrCU=; b=bna2dWNzXvVa5ygzrej1+mUDMS
	TyVXMhFT+IxF1f/OQUWhRCKR/GcbWraLDtiHX7k10fT5ly4EJhkvcHMurARNjswZnYOXOEtF5ts0Q
	yovs7ulMJSHXAirWaPAG1urHgtCbikbno34Ld6rX8Oxm2BqS5PZZgh8v7bNcwXAP6SMd3+x0BUfnW
	2q7+b00KvcZUjuypkd35Oj/9KIN4CAAm2kOU5yzVNV4wtgai8xwVvW1WUZvg4Lz3ap43VEsHGm5g5
	UA0F50hmv7BWeO5QfBewZqruzJstvZoR9BylzGfE0+4DzsZAnGu8sKPJfTqCLv6VA8q/B5ObxxVAK
	dvXDdGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26jb-0066V2-PG; Fri, 17 Jun 2022 07:49:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26W3-005zxu-FU; Fri, 17 Jun 2022 07:35:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 524266601798;
	Fri, 17 Jun 2022 08:35:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655451333;
	bh=6OlSCHB6/1AgdhTBa59KtFNBtIbrr/K3qDKoofVrLIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L3r/BTfW0+I/X3sUn+BdiylDXpmsjf8iieZgFV8CwmcjK/UAFCpaCnYgreBZMhcFx
	 GuPdOIM9G+rkv+JMVAIVuD2zmNojIBAY4uzMdY19I94mxP6FiWxAd1ZxGaBBKHMnZC
	 GxzOqetg+zTQ2VRx8lje6scxRmLGnSL2Bczr2CG1e6Z5v9vzTNxcBqiLDFqO6fOcrF
	 zTchzC/wAT7SwN48po97IdCIYyYgQ/jyv33++011ERNL2tmIUxIAW8DDF02cHNI5m1
	 5AZCrrk74KGsFRKA3ikjjogNvyfX5h4Buav/CCkr5idGuiwzTBAEuOkDLYevQk0KcG
	 Rz8S2h+ROUFBw==
Message-ID: <ef6d3ee1-550c-c243-31c1-7e088cc0f9c3@collabora.com>
Date: Fri, 17 Jun 2022 09:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] mfd: mt6397: Add basic support for MT6331+MT6332 PMIC
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-3-angelogioacchino.delregno@collabora.com>
 <Yqt5HPIXbOab6ik5@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Yqt5HPIXbOab6ik5@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_003539_697754_078EB667 
X-CRM114-Status: GOOD (  13.17  )
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

Il 16/06/22 20:40, Lee Jones ha scritto:
> On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:
> 65;6800;1c
>> Add support for the MT6331 PMIC with MT6332 Companion PMIC, found
>> in MT6795 Helio X10 smartphone platforms.
>>
>> This combo has support for multiple devices but, for a start,
>> only the following have been implemented:
>> - Regulators (two instances, one in MT6331, one in MT6332)
>> - RTC (MT6331)
>> - Keys (MT6331)
>> - Interrupts (MT6331 also dispatches MT6332's interrupts)
>>
>> There's more to be implemented, especially for MT6332, which
>> will come at a later stage.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/mfd/mt6397-core.c            |  47 ++
>>   drivers/mfd/mt6397-irq.c             |   9 +-
>>   include/linux/mfd/mt6331/core.h      |  53 +++
>>   include/linux/mfd/mt6331/registers.h | 584 ++++++++++++++++++++++++
>>   include/linux/mfd/mt6332/core.h      |  53 +++
>>   include/linux/mfd/mt6332/registers.h | 642 +++++++++++++++++++++++++++
>>   include/linux/mfd/mt6397/core.h      |   2 +
>>   7 files changed, 1389 insertions(+), 1 deletion(-)
>>   create mode 100644 include/linux/mfd/mt6331/core.h
>>   create mode 100644 include/linux/mfd/mt6331/registers.h
>>   create mode 100644 include/linux/mfd/mt6332/core.h
>>   create mode 100644 include/linux/mfd/mt6332/registers.h
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 

I've already pushed a v2 of this one :-)
Should I resend?

