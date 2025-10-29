Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0E1CCF9F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/v0zo/mXJp1eqDSZs81X2kYmENmq+DmgWPaQLy4E3g=; b=1+QfMvCLdJ0iubowG5nwAdXdgx
	3KZ70qnu4Ks6vvscihdJHjFUD213vDW7sArq66l+gAjrthzsmCFCQlIsUc+DXAOO55BiCPtaSjOaP
	LnSU6QUbUizm/mAwplXiAJFwDDcCruq3JdlpQn7nZuu5HSh2XArCd6pjpmyJ7Z/phM2333sjk07uf
	7odPRXn1Y6TofsuwAZBV1jGbGGlDsBVIDBlpXfwO6BfxS8gK/hE+iY/xoURso6TJg8NRZ2pDs4YXD
	Zqp/B3hiATX0PGwAsx/3FCiQqTDhSfzUpbZh1k0lNU9f4xsppY3Iqyjru5IIOvD0blxU/TyiTHlc9
	VznsFYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ih-00000001pvG-0vSz;
	Wed, 29 Oct 2025 15:41:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ie-00000001pt1-2yS5
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 15:41:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2947d345949so65209095ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Oct 2025 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761752483; x=1762357283; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/v0zo/mXJp1eqDSZs81X2kYmENmq+DmgWPaQLy4E3g=;
        b=Zh9TztBQyH7q4CjO6yUPxvi9/SzjFV/GW0LYqzmQ1vaZxn74iucSm6V16K3JFeTyCv
         JKakvSibWqyWvH+13quYH7ixetW1KowcBYm3eVD77TTfB8WKrW3rvRb7GwCPaj3+GSHM
         de46DQWV5pbsFeuILgZt+CArsgITewfjt4/dqdvNswZV8b7usW4VGaKYkUwn/b5MUSLd
         QKcqkU5NC5tEjUnRZb/eB+eVmPvjGvgOpCf/vLWQdgXVwn3pRn9oBDR8Ca3RHbWs4oxd
         M/4L2u/0Jm14mD92qE/lZXsioYZaWva7xK1NKvvL0LlW+B673/fRtr0937dIezmFTl6n
         Kndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752483; x=1762357283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/v0zo/mXJp1eqDSZs81X2kYmENmq+DmgWPaQLy4E3g=;
        b=cSBRUeVPJ1iC4XKP/+7WhKdUn6ehTW/Agg9ANR4pbRA6432JSkpIxEAtjfZ5/poFwo
         hgHSSvkKyCfuHrvh1AhPhoNiKQHvThKowvyOAAWUp+J4XGt0nGGlrJc1ZnEmn666O2sg
         wX2BYbJPjKoKov6WaOXM2nOOiifu8iiQGJ3WEMnbEwZibkbiyD0vSy2mxY1YxGSJNsAW
         YNXEI8SVSxzhBolNlrMJ9j0Z+QSuWeAFFxkl7wlm5/Ph82BEw3xXSMToDbIy3Ghd06ul
         H8BpDivn7I36Zto4EJxb0PtAexKaNxKeO5BQlJ+yeIO9sl8StG8nXPEl0+mi0sxBQad0
         91Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVay+SEUSrWOsLtoTgYGQyZTL3IL7CF0w2mIqKwYQgBe/JxbmLnUdGBE4eh0s/2Y2+4wk1KvP3isAJw4gXvrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5M/DERFu2zYtdi3XfyYsHZuZEL+nhIp6nCiQrg/9DxGyb3oDX
	iUYFdaHyUabQAO/kfNQBdQpO4HVsTnBWyjXAJLb+kiRjg9BgS2CC/PCZ
X-Gm-Gg: ASbGncu/wE5NZziduUgejl/w0kUzZCuPZx8S7jpFJondZp0c3SobtxaXNfUa5gGhCgi
	3+VDmX1AU5zY6i2+JfNQBHDychvPAPy0p1AOl7YzUa2LNHEpwB/s1JMKj/zZ1JQ08MRVdldx7Co
	J//I+Q/0kkhd5SIFNvdi0rpEVTaGo1jLapPu9hCQg0ReROsjXloJGIXJFK+uyW8LfalkeiGZF7q
	wXDJhVngciCTn2F4ZJVWkHFjV3bgYZTxVKyizwTBRjjUhxlN7YZsupfFCjZmSwU1jgieS2v0kxU
	pavickN+ry8hfjfQRyTqD71u1RcT3XTiA+VGsmLXbRD197CzGk1igfCqSVWS+Li6UebB/MozrP7
	dDfjHypS2DSI1n13FNehcJRC5zLcnOvBhKw2b4P5XA7xmraGNpE0LNKlCt2Yze6rUp3zNV37f8C
	btdEOYh5zKSlOo2BjGfLMnrEb3jVwG2cAgBaODLEGyqPv7xLSA0j297JIQzXLS
X-Google-Smtp-Source: AGHT+IHTX+Ow2y8Hi8c0rRLKMQlmI+u7C/NGkFheWrGjKnKPUoBmwC8nhsbP1FbgqylJ1UJ/aCLp7g==
X-Received: by 2002:a17:903:234c:b0:28e:7841:d437 with SMTP id d9443c01a7336-294deea30e2mr37900855ad.38.1761752482989;
        Wed, 29 Oct 2025 08:41:22 -0700 (PDT)
Received: from [192.168.0.3] (124-218-201-66.cm.dynamic.apol.com.tw. [124.218.201.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm153773295ad.12.2025.10.29.08.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:41:22 -0700 (PDT)
Message-ID: <d2d031ab-6a88-4c7e-bf61-29ad95d8ecaa@gmail.com>
Date: Wed, 29 Oct 2025 23:41:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
To: Sjoerd Simons <sjoerd@collabora.com>, Eric Woudstra
 <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>,
 albert-al.lee@airoha.com
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-12-de259719b6f2@collabora.com>
 <4f82aa17-1bf8-4d72-bc1f-b32f364e1cf6@lunn.ch>
 <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
 <05610ae5-4a8a-47e9-808b-7ff98fade78e@gmail.com>
 <408842eda1caa53247ff759cd9ea75dcab624594.camel@collabora.com>
Content-Language: en-US
From: "Lucien.Jheng" <lucienzx159@gmail.com>
In-Reply-To: <408842eda1caa53247ff759cd9ea75dcab624594.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_084124_797508_EB9B5DB0 
X-CRM114-Status: GOOD (  15.55  )
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

Hi

Sjoerd Simons 於 2025/10/28 下午 09:24 寫道:
> On Tue, 2025-10-28 at 12:14 +0100, Eric Woudstra wrote:
>>
>> On 10/21/25 10:21 PM, Sjoerd Simons wrote:
>>> On Fri, 2025-10-17 at 19:31 +0200, Andrew Lunn wrote:
>>>>> +&mdio_bus {
>>>>> +	phy15: ethernet-phy@f {
>>>>> +		compatible = "ethernet-phy-id03a2.a411";
>>>>> +		reg = <0xf>;
>>>>> +		interrupt-parent = <&pio>;
>>>>> +		interrupts = <38 IRQ_TYPE_EDGE_FALLING>;
>>>> This is probably wrong. PHY interrupts are generally level, not edge.
>>> Sadly i can't find a datasheet for the PHY, so can't really validate that
>>> easily. Maybe Eric can
>>> comment here as the author of the relevant PHY driver.
>>>
>>> I'd note that the mt7986a-bananapi-bpi-r3-mini dts has the same setup for
>>> this PHY, however that's
>>> ofcourse not authoritative.
>>>
>> Lucien would have access to the correct information about the interrupt.
> Thanks! For what it's worth i got around to putting a scope on the line last
> night. It looks like the interrupt line is pulled down until cleared, so it
> appears it's indeed a Level interrupt as Andrew guessed. But would be great to
> have this confirmed based on the documentation :)

The Airoha EN8811H Interrupt behavior is as follows:

When the line side link changes (up→ down or down → up), GPIO 8 will 
output low.

After you clear the interrupt, GPIO 8 will go high. Regarding the 
documentation, let me check where I can put it.

If you have any questions about the EN8811H, please feel free to discuss 
with me.



