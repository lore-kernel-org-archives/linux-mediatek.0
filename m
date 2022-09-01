Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F711ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59KVKyo44arcJSEWdnpNMPNJsn7gA8wJcho+4e9oQPw=; b=g6vlDgYHC+fu0ze4ZPzRvUnRhG
	Aphu7/tQgRFFsteqxGJLQb/MM3S2PCOq6udl3ovvZassL4YORDHYBPa3DraHHzHCG+nVaYUqjxhXA
	63bEhdmhILtZz9IUk7a5zDxSU8ChSI5M2ISVU0IxiWFxu+fae3qFdzA2XXTiFeIOzyzOd0kp0F3fn
	wqqMOk8DR3bIAclulj4vLJzOdU5BzTzibxA/GbHprmmhChc7jfR4ZQ0FTWME0Q0PCRjfRkxW+rsSm
	GKqfALc2Yhn4S4e6Z7yJL7bt7g8wsZpD7DzecTeQQeFTQ2MlR+1xH75MClEFZB1ObKhf7EjVKJ74C
	xivz99qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThUr-00B38j-TT; Thu, 01 Sep 2022 10:32:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThUg-00B35c-QA; Thu, 01 Sep 2022 10:32:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A0CEA6601DF7;
	Thu,  1 Sep 2022 11:32:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662028337;
	bh=TzpDrl8aXnnF1e6jwiJCsiOD00pZJii9Kr+EB7ormQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iTqWZoDS3yvgnt+jDw5Qc5NchAtI2im7o+mTfK8C6XSsFjd7qsITKhYmIyd+NA9ov
	 7GaKfswPrjdZfi6wLkAIs542bKH2o4JPwyL+zt5lfgLgbTGIu1puZRN0rExw/FqnVA
	 h34K/IyizJVRxOmo66uipkYL8TYz02/6YiMTD8u8oebvommu1l9iBcx84MglmSPBcf
	 K9hOBwTkB/mTI6zMRKhrKFieVg7ZW2yqHEzxYDoJah00DYpYp125eulNdq4tB6exZn
	 oTQXfJQ6w8HfyaxHpso/olsozh2iyFx20xHsHKTeiAFml65UEXz9XwKCudVt/5ktiV
	 7yliHyLci4y7A==
Message-ID: <9b82849e-516b-c798-994e-6bc8945c4831@collabora.com>
Date: Thu, 1 Sep 2022 12:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
 <38910de5-89ad-e7a1-261f-18b51c8e7877@linaro.org>
 <955f7200-9d08-0d21-2d1a-5ccbd0f3a8af@collabora.com>
 <93d5de8e-31b2-4412-3348-7ba1903cde84@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <93d5de8e-31b2-4412-3348-7ba1903cde84@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_033219_010468_B0B4A8AA 
X-CRM114-Status: GOOD (  11.65  )
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

Il 01/09/22 12:30, Krzysztof Kozlowski ha scritto:
> On 01/09/2022 13:22, AngeloGioacchino Del Regno wrote:
>>> That's simply not a proper
>>> hardware description, so again:
>>>
>>> 1. If this is separate device (as you indicated), then it needs
>>> expressing the dependencies and uses of other device resources.
>>
>> Agreed. In this case, what about...
>>
>> mediatek,hopping-ssc-percents = <&provider CLK_SOMEPLL 3>;
>>
>> or would it be better to specify the clocks in a separated property?
>>
>> clocks = <&provider CLK_SOMEPLL>, <&provider CLK_SOME_OTHER_PLL>;
>> mediatek,hopping-ssc-percents = <3>, <5>;
>>
> 
> I propose the last one - using standard clocks property and a matching
> table.
> 

Right. I like the last one a bit better, as well.

Thanks for the advices!
Angelo


