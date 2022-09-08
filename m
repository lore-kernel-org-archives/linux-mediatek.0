Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02761ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJY6L4IoqV8Uk3IKDjyxOXAfkwX5SuNzin7NK5hFCZk=; b=uQBLZQ5+ZqodOxYwkMGBoJwlEB
	+TNoPfn1bvTxrL4DGPSL6vrnAl38+s6+s/W1JudISeDiRfzsW4hLaOfwot2ACCoz8VEfA+5ZDKw87
	NUDxHY4Omdbrk7emaXCJiCDAgn9CPmUAGUpvxI2n5Yx85ipMOC1zXTyBJmpQM14ju6TMtKPV28mbS
	B9MHB8YiVRYAj1CdEg5euqB1OmiRdjXMZN7NXuNwMVsLMYN+JvIOG+RSH1UaT8Z5uDU7mOGItq0Jp
	b/rI9Np4rSpgD6ZlZnUnfe55sfBkZ7wR8BqkGwid+lDHJS2K+tVYd2Ndq2Rsm0eChFJoyxF6oQZO6
	13s0bRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCZG-000uSG-VY; Thu, 08 Sep 2022 08:07:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCYv-000qmk-En; Thu, 08 Sep 2022 08:07:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0008D6600357;
	Thu,  8 Sep 2022 09:05:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662624347;
	bh=2Y7yHVTAEwpkAdCsJ8eUbrLTKB/JI5p+uR+ZL9OPGCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=as63iDwhRgAB7CCvwKim55w9EyCmboOuEiPtZK1t69u88aDlI/SjFC9dmHu5+dlyi
	 TnKsv9JOfGBjw7aMbjyr3m5Cuyoy6r00mQCeqEi7LL9OtqZRPEpnKZIEf/ZduGi7B3
	 RzEzvCcvbUihgnBK/aT768PuIZhM9RiTPlFijutTp4g9z7HHMR/hrVIeJtkazwE/3g
	 skIZvBcLIN9lHkTiWZehnnEwDw+mkWBcBdQyWi73Xm026mELU+Atw+rT6+1rktdF8O
	 CEIaHbfiC+cDHA+bz83mmdLmrUoW1pEliymco2qx6iJ2eJx1QD2sAa96nxrAL3PzZm
	 gI8hV6jc+RSGA==
Message-ID: <60b79718-3a33-1bc5-b271-012d94c86491@collabora.com>
Date: Thu, 8 Sep 2022 10:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/7] phy: phy-mtk-tphy: add property to set
 pre-emphasis
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
 <20220829080830.5378-3-chunfeng.yun@mediatek.com>
 <219aef5a-af2a-6873-f682-cb6aef862425@collabora.com>
 <a4e5f9e360a3fc6d094bc719aa4523a4886cae93.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a4e5f9e360a3fc6d094bc719aa4523a4886cae93.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_010701_710998_5EAB4FC0 
X-CRM114-Status: GOOD (  17.43  )
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

Il 08/09/22 03:39, Chunfeng Yun ha scritto:
> On Wed, 2022-08-31 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
>> Il 29/08/22 10:08, Chunfeng Yun ha scritto:
>>> Add a property to set usb2 phy's pre-emphasis, it's disabled by
>>> default
>>> on some SoCs.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>> v2: no changes
>>> ---
>>>    drivers/phy/mediatek/phy-mtk-tphy.c | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
>>> b/drivers/phy/mediatek/phy-mtk-tphy.c
>>> index 8ee7682b8e93..986fde0f63a0 100644
>>> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
>>> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
>>> @@ -72,6 +72,8 @@
>>>    #define PA5_RG_U2_HS_100U_U3_EN	BIT(11)
>>>    
>>>    #define U3P_USBPHYACR6		0x018
>>> +#define PA6_RG_U2_PRE_EMP		GENMASK(31, 30)
>>> +#define PA6_RG_U2_PRE_EMP_VAL(x)	((0x3 & (x)) << 30)
>>
>> Hello Chunfeng,
>>
>> can you please clarify which SoC is this change referred to?
> These bits are reserved before using 12nm process.
> 
>>
>> If I'm not missing anything, there may be a register layout conflict
> As I know these reserved bits are not used before, but now used to tune
> pre-emphasis after supporting 12nm or 5nm process.
> 
>> between
>> one version and the other for T-PHYs, for which, it may be a good
>> idea to add
>> a PHY version check before allowing to write settings that are
>> supported only
>> on a specific IP...
> Do you know which SoC used bits, I can confirm it with our DE.
> 

MT8195, MT8186 (and others), RG_USB20_PHY_REV is marked as bit 31:24.

Regards,
Angelo


