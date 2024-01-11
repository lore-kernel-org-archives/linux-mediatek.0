Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F86C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuJBlV06ppRnszpdf66nFgCdRNYXCituaw+6Mc6xX7A=; b=O/12rrUIdxgw+nPwUIUIN+NqgD
	+FdiEbBjJYcFRy0GfZzcS54SpEAAzNvqB/onvEDvovWz8mcKKE7bIV8Go0z1n0HygwQX1EXeb37p6
	qMUkBXfqtZKVsBAJURsulLQ2VKFNl3FA2J4ixNwdTymA9s/ojNcadDiWE9Ar0DtoAqzNr28h6vojI
	Vbi60+UR0vCBb8pfMoi6vsFay/cJMP2vDMc0qhh1TOL9CHEnM/8rAx6qHH4LYq6ixAbdQ748eeBOx
	mARM2EJA/YXUX0pliC8q6l54/jdeA3CZjOF39Y04vKz32WaK5eqJt8CH7f2rlNfbiBWaA7chgxap9
	WMt6YdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsjr-00H8IG-2b;
	Thu, 11 Jan 2024 10:56:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsjo-00H8Ft-0d;
	Thu, 11 Jan 2024 10:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970598;
	bh=HsX3oWaHYvaVq5DEKrjIniKdQPIuXWrIZcYPPGl0S0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dAeApq8OV4J2GdqaCosfDkz6H+gpiKgp/LOCmVgGJaV82DjC57g9WSxrOOfwQv9ki
	 n1Uu1lCTy4pOpcflys0VNJquTaIgDnVX9iVKOnFSAxwUbpfTaNtOwObRnCcCCGfohn
	 wo6LVIlBfd8tTtpWEeSBgvDAYJQwRmLl64ap+eanv+SASJb2RP/5NgfgD1ympja7wh
	 67ylVrT68HjMxHU6fSgF0TkRboWJBLzJwRBWgNWBdUm0dk1/6XFG7AWPRjgLiI8oUQ
	 GUkJAu1oHrtc18fJXCX07CS5OP5UYg74Ogld1Y+20BWz4L8URqcdUK8c5tL9Er6vcS
	 DM47q20DfNtQQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B58B537811D1;
	Thu, 11 Jan 2024 10:56:37 +0000 (UTC)
Message-ID: <13493023-7b68-4a25-83c3-b870bf00ccb3@collabora.com>
Date: Thu, 11 Jan 2024 11:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] mt7981b: initial DT code
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240111103928.721-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240111103928.721-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025640_360003_CE93DC90 
X-CRM114-Status: GOOD (  10.86  )
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

Il 11/01/24 11:39, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This work is based on linux-next content and was successfully verified
> using "dtbs_check".
> 
> I'm not sure who should apply this work. Given I received reviews from
> AngeloGioacchino should I expect Arnd to pick it to his tree directly?

This is MediaTek and gets picked by MediaTek maintainers - either me or Matthias.

Cheers,
Angelo

> 
> Rafał Miłecki (2):
>    dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
>    arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |   4 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 105 ++++++++++++++++++
>   4 files changed, 125 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> 



