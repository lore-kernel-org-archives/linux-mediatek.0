Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F90C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IY2hMjK0rmJAN3bJ+Eg8QMCUxrGb7upWooUPpPkBeII=; b=0rkhM5+0OAR7dB
	uUw4inGcIWZABfJWq3HCklQT8cFyJgpVJ8ye1eboI3/uXRw5FjPJNqGDqBbbDOyHR0UwmH/lvNnBG
	o5bfaRSBCIf10GMgVKMaVW+Gzl4S+LllYgLdzaEoijfyVeCCqZDBJ3jQsSkO2dMZIRFmB02pUFRzY
	cwqwmXKr0z3HvFdMNzoy6Y3goPYTBbVwGCVXgZtryTUf0a+FW/NhxVrUmED+BvUMaeBnOOw+1JmXi
	qLQ2fkVr72+yjbm4R8KjADjc0OToZ2omkELJY02Ok0OOhPzwyAFhkbggh868shu6ED25nS/FCC0pH
	QcllSxTAsncEDtws0zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVxb-00DO8o-Ey; Thu, 07 Apr 2022 17:30:19 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVxQ-00DO5u-MP; Thu, 07 Apr 2022 17:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i5967/a5oK0EGt/wrkemwwnhICguU6R5xviUzoKD7O8=; b=pOhYtIBmMilhtrc+5FBGc4SuH8
 YuC62mIwfZJzk3lKGHpaGHkD407+t2JCSVto8KRmiOVP+nZz4lGVAEL50VrfqVyNts7Y4EHQVhuXu
 fIONIhWZ41KxsGfZXDZ7xOrgna5/0lDeoPJIrBN+LEsIhd6nYvlU7q51Zv26NlWvW2j8=;
Received: from p200300daa70ef200411eb61494300c34.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:411e:b614:9430:c34] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ncVxI-0007Or-HM; Thu, 07 Apr 2022 19:30:00 +0200
Message-ID: <f9d76e22-0400-24fa-e4c4-af4b03ed5f8f@nbd.name>
Date: Thu, 7 Apr 2022 19:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie
 mirror node on MT7622
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-6-nbd@nbd.name>
 <4bafe244-6a3d-d0ec-59d3-3f3f00e71caf@linaro.org>
 <318163cb-c771-c7eb-73ba-35c66f7d0e68@nbd.name>
 <Yk8chzNBsRZR8e1q@robh.at.kernel.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <Yk8chzNBsRZR8e1q@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_103008_964511_FE5957A0 
X-CRM114-Status: GOOD (  25.91  )
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


On 07.04.22 19:16, Rob Herring wrote:
> On Wed, Apr 06, 2022 at 01:01:06PM +0200, Felix Fietkau wrote:
>> 
>> On 06.04.22 10:20, Krzysztof Kozlowski wrote:
>> > On 05/04/2022 21:57, Felix Fietkau wrote:
>> > > From: Lorenzo Bianconi <lorenzo@kernel.org>
>> > > 
>> > > This patch adds the pcie mirror document bindings for MT7622 SoC.
>> > > The feature is used for intercepting PCIe MMIO access for the WED core
>> > > Add related info in mediatek-net bindings.
>> > > 
>> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> > > Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> > > ---
>> > >  .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++
>> > 
>> > Eh, I wanted to ask to not put it inside arm/, but judging by your usage
>> > - you did not create drivers for both of these (WED and PCIe mirror).
>> > 
>> > You only need them to expose address spaces via syscon.
>> > 
>> > This actually looks hacky. Either WED and PCIe mirror are part of
>> > network driver, then add the address spaces via "reg". If they are not,
>> > but instead they are separate blocks, why you don't have drivers for them?
>> The code that uses the WED block is built into the Ethernet driver, but not
>> all SoCs that use this ethernet core have it. Also, there are two WED
>> blocks, and I'm not sure if future SoCs might have a different number of
>> them at some point.
>> The WED code also needs to access registers of the ethernet MAC.
>> One reason for having a separate device is this:
>> As long as WED is not in use, ethernet supports coherent DMA for increased
>> performance. When the first wireless device attaches to WED, IO coherency
>> gets disabled and the ethernet DMA rings are cleaned up and allocated again,
>> this time with the struct device of WED (which doesn't have the dma-coherent
>> property).
> 
> I'm pretty sure there are assumptions in the driver core that coherency
> is not changing on the fly. In any case, if it is, using 'dma-coherent'
> is not appropriate. You obviously have another method to determine
> whether you are coherent or not.
It's not really on the fly. Before changing coherency, all DMA memory is 
freed, and the subsequent reallocation uses the struct device of the WED 
core, which does not have the dma-coherent property.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
