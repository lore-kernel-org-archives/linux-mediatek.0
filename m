Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E98C47DB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfHl2R0O29ld+Mzx1s1Rs88vhawyyZKmjQRnSaFJKBY=; b=a45gWH68PojX3LthAKLf5Nr6f3
	sLCJwSxCo2Q0IuyDQqQIfM5QEedjkgoSvrN7T+S5K2k1xBUQb1ukB2U+N1YcYU7krzkCzSRg3csUq
	qZR2CCKXxAfV15vAI/qNMFJtROIOfTwhWWuCn/iu6MdsSlkGVTlNdKynTpE/34zDiwc0IuOiWqkz6
	WLaRDbdk6rxOHgnGHp+JShNLIpMTDYuy1RUEBlg5f5ZZfE8q7c5b+SSsagCf8VS8MTLKe88yD/AYh
	LBzY+1p8m6AG7/pKMNupDUuDHU1ZmIBg5/dr1p9FbFqvPqki9wzEUC8furtLMs1aCSiNqj1u5N3Zf
	iBR0QfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUcu-0000000DXeM-1rId;
	Mon, 29 Jan 2024 16:36:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUcq-0000000DXb2-2R63;
	Mon, 29 Jan 2024 16:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706546205;
	bh=KeRmE3stTSKqTV2GA+O/3KWIiAY8DmL3ppn/fIpoFW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=asPnCp/H8h6+VqbZ9tIYh5Vh4PY+FTVb/PmHnNL/1zsecKppZyoIPp6JiTq7LLyCY
	 DjSK1ST1Y8SghrKCQfbsE5r2QFu0gSpmvqzYdtw5wzzKN3mblPkrMoUTZwnS65X3aB
	 ndXrMWUF9aB1C8AhF3+RS4X1bEIZvOqQBFzIuYI8/mu4ICZ9gJZfhlDt84px+ixQ9+
	 bTXJSWaqccLPFvt8H+gTH/8Y0VE31bsGxo6K39iH4kQGSUGoIceR8cBndhMOySlwom
	 EuTIczHvBeR5nwOOVCcBK0ML05D5Tyt2GUrMuBEABJZyKVGCEqbp40RDeKN5AF5WQ3
	 pZiLyMHQIBeEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E834137814A4;
	Mon, 29 Jan 2024 16:36:44 +0000 (UTC)
Message-ID: <627c9ff9-06b3-4735-92ea-8c0ecfc2faf6@collabora.com>
Date: Mon, 29 Jan 2024 17:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth
 node
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240126063500.2684087-1-wenst@chromium.org>
 <20240126063500.2684087-3-wenst@chromium.org>
 <2c37a716-e4bb-4db3-a95f-a40e05b28cad@molgen.mpg.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2c37a716-e4bb-4db3-a95f-a40e05b28cad@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_083648_810721_E6D5BD45 
X-CRM114-Status: GOOD (  19.96  )
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

Il 29/01/24 17:31, Paul Menzel ha scritto:
> Dear Chen-Yu,
> 
> 
> Thank you for your patch.
> 
> Am 26.01.24 um 07:34 schrieb Chen-Yu Tsai:
>> Bluetooth is not a random device connected to the MMC/SD controller. It
>> is function 2 of the SDIO device.
>>
>> Fix the address of the bluetooth node. Also fix the node name and drop
>> the label.
> 
> Excuse my ignorance: Is this a cosmetic fix or does it fix the device somehow?
> 
>> Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>> Changes since v1:
>> - Collected reviewed-by
>>
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
>> index a2e74b829320..6a7ae616512d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
>> @@ -82,7 +82,8 @@ pins-clk {
>>   };
>>   &mmc1 {
>> -    bt_reset: bt-reset {
>> +    bluetooth@2 {
>> +        reg = <2>;
> 
> To avoid confusion, would it be possible to use sdio as a “name”.
> 

Names must be generic and descriptive; this is the Bluetooth part of the MT7921s
hence it's called "bluetooth". If its functionality was "sdio", it'd be as such,
but this is BT anyway.

"sdio@xxx" would be applicable to, for example, a controller that provides support
exclusively for SDIO (with no support for eMMC/SD).

Regards,
Angelo



