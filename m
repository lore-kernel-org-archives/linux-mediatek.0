Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F11C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH2xdrJ8jhwVoCzK3Jz1WG+Ix6L6ggPYu5tC2jbpHtU=; b=Y9KlVMbti6hvz5
	vB2HAVkb6gqVxejGhUSvX6BRKXHR6kJTf/uabO2YGUha3nHObVWOSVj1OX/M4YVx2R2POCmqBBgfm
	vSgIydZ1e/M03R0+T9jMXlrN4in0eB8D76L/6A4E8ReG1jZX79JUdQ0GUuvwk21iO9bXby+DmEwXy
	1RcdCoIoehvtpYiNsPD7AivbqPcb2YiLi3H8yzsUBQ6k2PMqX2Hn8wJDc/9vUpsTQdG2RQ57fTJWg
	JIbZ7RAqyGA/xgYzXziy3UcHBfEP3o7g3kbZe1RMPIAtloWR42TA6Pw/4Kfo0GS6ERv4w3BHsRl8Q
	4bzLL1ev0GQcMno4HrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3QV-005dLH-00; Wed, 06 Apr 2022 11:02:15 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3PY-005cwX-3J; Wed, 06 Apr 2022 11:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=dcCn6+XhT4ZAObTnqeDa3+6jzJY/nPJWbAVScaaz0bE=; b=kQqBANK8BkSsr7+yPmY+Z09efb
 0NOveqsRX9wrNdCFVXF3J7Kr26T56o2BgYYrrD0jeoekQZkIe0TDN+4d99hR04yYGpj7/adwmWZcy
 dYUrxYIc73Kk/I1LEnAkxfk4ldascCUl2i3HfC4tKXcdMyWi9snsBXDlpl06K6FF4cJ4=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nc3PP-0001v5-AM; Wed, 06 Apr 2022 13:01:07 +0200
Message-ID: <318163cb-c771-c7eb-73ba-35c66f7d0e68@nbd.name>
Date: Wed, 6 Apr 2022 13:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-6-nbd@nbd.name>
 <4bafe244-6a3d-d0ec-59d3-3f3f00e71caf@linaro.org>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie
 mirror node on MT7622
In-Reply-To: <4bafe244-6a3d-d0ec-59d3-3f3f00e71caf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_040116_365217_707DDAD3 
X-CRM114-Status: GOOD (  17.05  )
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


On 06.04.22 10:20, Krzysztof Kozlowski wrote:
> On 05/04/2022 21:57, Felix Fietkau wrote:
>> From: Lorenzo Bianconi <lorenzo@kernel.org>
>> 
>> This patch adds the pcie mirror document bindings for MT7622 SoC.
>> The feature is used for intercepting PCIe MMIO access for the WED core
>> Add related info in mediatek-net bindings.
>> 
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>  .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++
> 
> Eh, I wanted to ask to not put it inside arm/, but judging by your usage
> - you did not create drivers for both of these (WED and PCIe mirror).
> 
> You only need them to expose address spaces via syscon.
> 
> This actually looks hacky. Either WED and PCIe mirror are part of
> network driver, then add the address spaces via "reg". If they are not,
> but instead they are separate blocks, why you don't have drivers for them?
The code that uses the WED block is built into the Ethernet driver, but 
not all SoCs that use this ethernet core have it. Also, there are two 
WED blocks, and I'm not sure if future SoCs might have a different 
number of them at some point.
The WED code also needs to access registers of the ethernet MAC.
One reason for having a separate device is this:
As long as WED is not in use, ethernet supports coherent DMA for 
increased performance. When the first wireless device attaches to WED, 
IO coherency gets disabled and the ethernet DMA rings are cleaned up and 
allocated again, this time with the struct device of WED (which doesn't 
have the dma-coherent property).

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
