Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06911606A31B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPwkf+0P;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=Su106odv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tF2GiLip2eghBn6G11QIbGdBYa2x2FuFEYyBYxkrvXc=; b=JPwkf+0PkqNj0+
	9+vNNs7EVAmGZSEN9GK0t6qIN2NRqn/hyzj7pZhvuLPtTcNE5Yh+173aDdEFjo+bRVDUbOGK6F+YQ
	1l7wihA4sq2xLvAi4dZsbntvBwsRz3EM08eeCS67iul0KsXZPlRYtdAcWbrLQRqxa0Q22mjPJQsX9
	TilSxiv2M8+tu9xl+c7xOryC78atQcK6qPrL+Y+oCkmrXVefZ1uDm9FTHvqLOftGWA/+g6m5tLN1J
	0yH1lLEFwQFFxCKcsz+TfRAsMTNsuolKCr/e1um6RCWhWBa66cp/YOBl7Sqca3aQGR5eB/zAfIS77
	4ToHaA5/PhwWTBU2PvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5J3-0000000AlSy-2yjU;
	Thu, 05 Nov 2026 21:47:37 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5J0-0000000AlRd-0N5N;
	Thu, 05 Nov 2026 21:47:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7508337ADE;
	Thu,  5 Nov 2026 22:47:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793915245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tF2GiLip2eghBn6G11QIbGdBYa2x2FuFEYyBYxkrvXc=;
	b=Su106odvYiSUdlTy4gAn6reXaT7CU3p8XbrNLGRsW0G1/51JVSQTtsC8y6+C0vTLEFp29q
	ZuCAYRIt/vXquLBTqbVQ2plZcOYu/GZNugKlPmQFY6Tcj6kD5Uw6iNDK1Vw11Qj2MsU073
	eASRdfK2XuDz3N1J3vmddrc8+HvPoYoZ8sH2sWAQDBh9tREDyQ+v6NmFuzW/Hz0fZ0w6MQ
	iGmKqkuMT24HraaUlhQx06Vb2GLkqk2GIqvQP8a04KrfRMk4SmDyQhotpbYR8TTHB13RpJ
	TPU1I8CFu6tU19rcp+Nd2wiuItzAnKupzERHjr3ShL52t5HXj/ufX24LMNku1w==
Message-ID: <8cc1d8d6-c563-4eb7-a738-5ba51ae60ac0@cjdns.fr>
Date: Thu, 5 Nov 2026 22:47:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 6/7] dt-bindings: net: dsa: mediatek,mt7530: add EcoNet
 EN751221 switches
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-7-cjd@cjdns.fr>
 <20261103-soft-lyrical-squid-c5a108@quoll>
 <39cb446e-b667-4766-bd79-2635eb36166c@cjdns.fr>
 <7c15c254-d157-4f5b-bfae-06a5301af222@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <7c15c254-d157-4f5b-bfae-06a5301af222@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_134734_467290_C9A3D4F3 
X-CRM114-Status: GOOD (  19.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 04/11/2026 08:20, Krzysztof Kozlowski wrote:
> On 03/11/2026 14:15, Caleb James DeLisle wrote:
>>>> +        const: econet,en751221-gswitch
>>> That's almost the same compatible, which makes me wonder if you describe
>>> the same device twice. Same device, same compatible.
>>
>> Well, these are both MT7530 based, but one of them is on-die with the
>> SoC and the other one is an MCM so for the driver they are very
>> different - they're even loaded by different kmods. I think since one is
>> MMIO and the other is MDIO, using the same compatible won't cause a
>> driver problem - but I don't know if it's best practice to smooth over
>> such a difference or not. Your advice here would be most appreciated.
>>
> The drivers do not matter - we have one compatible for I2C/SPI/Serial
> devices as well. The only question is about the hardware, what are these
> devices and what are you here exactly describing. Compatible is en751221
> but you call it MT7530, so even more confusion.


Let me address these in reverse order: The compatibles are 
econet,en751221-switch and econet,en751221-gswitch but the switch is an 
MT7530. This is a convention used for this switch: When it is integrated 
in an SoC and has customization for that SoC, it is identified using the 
name of the SoC suffixed by "-switch" (except in the case of 
mediatek,mt7621 where it takes the exact name of the SoC, but this looks 
like it was a mistake).


Regarding the en751221-switch vs. en751221-gswitch dichotomy, the 
meaningful difference to the DT is that the gswitch is a 
multi-chip-module so the CPU port is phy-mode "trgmii", and on the 
on-die switch it's "internal" since there's no PHY between it and the 
CPU. Moreover the gswitch requires the mediatek,mcm; attribute while the 
on-die switch forbids it. I can of course relax the restrictions so they 
can use the same compatible, but I don't know which way is most 
appropriate so I would like to follow your advice.


Thanks,

Caleb


>
> Best regards,
> Krzysztof

