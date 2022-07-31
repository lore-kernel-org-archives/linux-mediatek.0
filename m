Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6930EC00140
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jul 2022 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e44jgZLP1HEmwyKrbQI6PjgpbbGNrnF9zlgtzzmI5E4=; b=WMxVOg4dYuW9lsTvAvzfE3XHrf
	gCFE6CKCTzR/q0v/rNVFN099iWH5ed7r5BVxNZX3H94A3t9VrC5iS2qvmqNFR21IwYQT6obU8IVMp
	AIoEuzLEr6EoJTuMyHvaZpEM4aCTvF5qPiOjP3GinEFXUjVnSAQfgKS5U42us3zZyMuDVuI4kXfMa
	6WiMeh/Tym1dp9qTdnLS+BnZOsRRMgleQEC/UWc6PrVPeoH2P8XO+DDqJQNBq/CnEeia+bK/XMgQ3
	MkgTDdW5bx2Z/8zG/JB02kFNqrzndDGcqf0H2DodABr3RqS8yPqSaxwqz8aNR0V4U07MrzwSCJ7uu
	SNgivt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI4i1-00A9ee-1K; Sun, 31 Jul 2022 08:54:01 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI4hm-00A9V0-2X; Sun, 31 Jul 2022 08:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1659257594; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SwhoDV58nqvepP1FZQz3lBk58BugH67wtYS9Q533jp/uMQ95jx/de2mkaj+62SkIkjlgHeIiY+1xXVwbowtxMVQSMGIsLUPYArVtUwdofYo65L5mSbNliRl+N1c6lBRou/bwLNp/Ytm3XGj+hu8CzstSszG6zxYhvc7p9BAplD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659257594; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=e44jgZLP1HEmwyKrbQI6PjgpbbGNrnF9zlgtzzmI5E4=; 
	b=W/wQbvX1Ka30D8KO87ltRJuydbjYfjuTCwKDkTfz61x/+Bl7XNmO5VIe/ZPzFfp7gacNR4CwLADFlnl3G+TWqQ5FTuiI14dUv89nH0lXKqTYtL3wyUjnc0+9O2SPGwJNJAN6BBQr704g0DC0syC8PvXe+4JMLB8qnOgir+yQkEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659257594;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=e44jgZLP1HEmwyKrbQI6PjgpbbGNrnF9zlgtzzmI5E4=;
	b=KjN7uqVX/myj83W3MyCfA25qyyvecseRVcrxkS1mx32RyHFQTbo8l9HQhAQFM/uO
	Yq5+jpJp0R+wLCCPeQNp9x+6pCVOz3ZvrpT7MH5fY6uz8yWp8S1pk6FQTyM/rF5JUo5
	IxTGXg/gzfU/JrU7Kwjzt3SF5UuUR/oCROgWLHRU=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1659257591946592.7858418300208; Sun, 31 Jul 2022 01:53:11 -0700 (PDT)
Message-ID: <6b29e16c-d4b8-93af-ce0f-84d308a88089@arinc9.com>
Date: Sun, 31 Jul 2022 11:53:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] completely rework mediatek,mt7530 binding
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220730142627.29028-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_015346_232134_216E5897 
X-CRM114-Status: GOOD (  12.79  )
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

This is for net-next, I forgot to include it in the subject.

Arınç

On 30.07.2022 17:26, Arınç ÜNAL wrote:
> Hello.
> 
> This patch series brings complete rework of the mediatek,mt7530 binding.
> 
> The binding is checked with "make dt_binding_check
> DT_SCHEMA_FILES=mediatek,mt7530.yaml".
> 
> If anyone knows the GIC bit for interrupt for multi-chip module MT7530 in
> MT7623AI SoC, let me know. I'll add it to the examples.
> 
> If anyone got a Unielec U7623 or another MT7623AI board, please reach out.
> 
> Arınç ÜNAL (4):
>    dt-bindings: net: dsa: mediatek,mt7530: make trivial changes
>    dt-bindings: net: dsa: mediatek,mt7530: update examples
>    dt-bindings: net: dsa: mediatek,mt7530: update binding description
>    dt-bindings: net: dsa: mediatek,mt7530: update json-schema
> 
>   .../bindings/net/dsa/mediatek,mt7530.yaml       | 1006 +++++++++++++-----
>   1 file changed, 764 insertions(+), 242 deletions(-)
> 
> 

