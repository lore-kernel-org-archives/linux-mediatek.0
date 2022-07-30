Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D3BC19F2B
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7NscnYW6e9l+s6/WtNH8K8Pr07LMRM/ZHwEmfI4Dlo=; b=0UeaycPtFOhAJs
	CBfAaZXAhmE2gKO/IOt7QUWGnkrnTSqQlYB3CNSXRB8zizYAVv9iHGh9YFDDA/yPHyVrRqhPdH/R4
	5uz02XgP5QZBjvzdTz5O07j/5Ta/V54izw8J/c2VHCsu6PojL31ViLNw2XqHFlfRBpDSIVgdNjesQ
	xkrGG0Ji7BHUiK2GKYw2SQCYhFJOUGW0Z/NANng+xibw5QVmceCqEwoiLKRHhwA3RyEDDLLxeT6Yi
	KNVqAiLSBJumEhAa27cbt4ks8GymL6za2I9Jq7VorYdbRF7HCgKXhD8jxAcNbBHgR0haGE4nuiiTQ
	5DibQrtd6iDUXlSEYhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHitD-00H2ul-1t; Sat, 30 Jul 2022 09:36:07 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHisz-00H2nb-3O; Sat, 30 Jul 2022 09:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1659173720; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TKQQjb7ac+ivNU+QKoCKvumYFhO1f97PFAruFCysvTptSPQ6dFkyqCRwciVZTXi/B8WOptwq0eP2M5UzaQFPCVw5SVk3ZZV2hSRl2GX2iEzWLLbNUrZgO2v5NYRBdo5KiDEdiwYCoEyw70ttCCDM3/QJrNzZ5+HpXjMwuh0cgxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659173720; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=G7NscnYW6e9l+s6/WtNH8K8Pr07LMRM/ZHwEmfI4Dlo=; 
	b=hZNWs04mn5LWF549DqyY8UPHDFtOKw4gT0tOtNjyJaNeY5jE1PsqP5C1WrORv84qbzeOfNBXUO23QAxkAsUWd2Ss/f2pu+166I1HOUn0gfC78iVv4aVhOD7EQBBWcM/Bc99MseFqyTEhmy9VIYpwLHlqFP34wRMlBIJKDjC3vkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659173720;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G7NscnYW6e9l+s6/WtNH8K8Pr07LMRM/ZHwEmfI4Dlo=;
	b=Ds0+LL7pCTJA9a/mNbBXd3J2CvzZpPydkY33AzWiQj6Czso0og16N3sdeOxyPziI
	1L+52f6RH7zrMsHsDg41ydBhKZaMfNUj0hmRqAEb3RasqZkclzJMYgjYKD9rZhRfZfy
	JAzwY1Z9crbXVa+Co2OkB7fwI0WW0Hyki1QRJ+Bw=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1659173718691412.0344941538166; Sat, 30 Jul 2022 02:35:18 -0700 (PDT)
Message-ID: <60be5351-8fd4-a7ae-9ff1-d336c2bcf391@arinc9.com>
Date: Sat, 30 Jul 2022 12:35:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
 <YuK193gAQ+Rwe26s@makrotopia.org>
 <980c9926-9199-9b6e-aa65-6b5276af5d70@arinc9.com>
 <CALW65jYfcfND4QiD=8OhMCgW0LZMSBYmVZK5Ce8u3cMPh+8Rdg@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CALW65jYfcfND4QiD=8OhMCgW0LZMSBYmVZK5Ce8u3cMPh+8Rdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_023553_225425_B635B859 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 30.07.2022 12:30, DENG Qingfang wrote:
> On Sat, Jul 30, 2022 at 5:15 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>> Thanks Daniel. To be precise, this is the case for MT7620AN, MT7620DA,
>> MT7620DAN, MT7620NN, MT7628AN, MT7628DAN, MT7628DBN, MT7628KN, MT7628NN,
>> MT7688AN and MT7688KN SoCs as all include a 5p FE switch according to
>> Russia hosted WikiDevi.
> 
> MT76x8 series uses a different switch IP.

Alrighty, only MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs then. 
Thanks Qingfang.

Arınç

