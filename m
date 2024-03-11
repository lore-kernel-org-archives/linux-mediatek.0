Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E88FC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rPKvKsma6FoE/wzJdx9gKHE9T2VnaW/T7oZUANlwB8=; b=Ep3/U+oOf1XpEASY712BVCo6o7
	Aptf18tyaHFrQG2ZZXVPgO29Wm8m6fzwLkdh8tWX7yZJGXl0nsIWCwoFPEBGvqZT7lzMzYKNSiF8n
	sXK+4EvyOL7K/r+NhOSA4T3NIg9El8sPpd+Zw3gKCoDEMMmQaFdiXjxhv2hYH1R56oKDMvHFOo7UT
	L9nY20s1yQMInz9DApCmReJ+CurYZcFQGwR8CxO+W8Py5ix/7vDQMljb9gsRqxLaMKmFeQKD5F9aK
	B74VGmkxUYTK6/CxgEfLmv/3+R/77ZnG3bGj94pYTQJfeqBrw+CsWGirm43WgB+jSNkZ51Yaq9bPS
	FBIDNfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjd9d-000000018nO-3Sbc;
	Mon, 11 Mar 2024 10:45:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjd9W-000000018ke-3u8L;
	Mon, 11 Mar 2024 10:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710153905;
	bh=WrbwWD64V4NOfPkPm3GizaWD64FSlu+yEQ1HOGnLdCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATIYZUqhE0Y6GACEs8aEzAE32w5BtbEnMutK6Ff0O4F9+2U9fYByYCHvtQXoZwOTI
	 rJKQ9iU0FkY6GIH02fONVcBr29xXVlE2ddhrL5k/Vy8Ii9DfKR6fpeZIjDUVWrlKXy
	 2ar7C6dtTdAJEhyBLOJuUXaIGxqI15fjjVsJC8ldmuc3Pq6qj3/voYluLuFN8owS4m
	 leNqdnduF5GlAifd6RoytTnkmNem1zNpZ7Z0ivc5nlv/VJYeUHFYzesfNlQgSJbIFc
	 +I7vTUMaQUsu1aR1C0Bat+J9WGTtSi2SXWHnRbSQ4fi23l5TspfoX+RVOAbb8bM6QJ
	 kxm6DNT3D/0uA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0C7E53781FD3;
	Mon, 11 Mar 2024 10:45:04 +0000 (UTC)
Message-ID: <7692ec9b-52d2-4bae-a9af-a7a695b4e8f4@collabora.com>
Date: Mon, 11 Mar 2024 11:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240221155905.1217340-1-mwalle@kernel.org>
 <20240221155905.1217340-2-mwalle@kernel.org>
 <CZQSEKZ288OL.205CBK4EC7G2J@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CZQSEKZ288OL.205CBK4EC7G2J@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_034507_136603_6421CDD0 
X-CRM114-Status: GOOD (  22.46  )
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

Il 11/03/24 09:44, Michael Walle ha scritto:
> Hi,
> 
> On Wed Feb 21, 2024 at 4:59 PM CET, Michael Walle wrote:
>> Add basic support for the Kontron 3.5" single board computer featuring a
>> Mediatek i1200 SoC (MT8395/MT8195).
>>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
> 
> Any feedback on this? Should I repost after the merge window or is
> it fine as it is for now?
> 

My feedback is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...and no there's no need to repost after the merge window, at least, I'm not picky
about that.

Though, if I ever forget about this one for *whatever reason*, please feel free to
ping me or Matthias about it and we will make sure to pick it up.

Cheers!
Angelo

> -michael
> 
>> ---
>> v3:
>> - add vsys regulator
>> - correct the LDO input of the mt6360 regulator
>> - add missing interrupt-cells
>> - no underscores in node names
>> - dropped regulator-compatible everywhere and use the correc node name
>>    instead
>> - reordered mmc0 properties
>> - split mmc1 pinctrl properties, add no-mmc
>> - removed all MTK_DRIVE_8mA
>> - add i2c0 and i2c1
>> - add comments for spi and i2c busses
>> - add firmware-name property for scp (this should probably go into the
>>    base dtsi?!)
>> - add missing tpm compatible
>> - renamed thermal zones to something more meaningful
>> - add correct bias-pull-up to (some) i2c busses
>> - moved reset handling into the PHY node, also added a compatible string
>>    for the PHY.
>>
>> Mh, my memory is hazy, but IIRC I run into the same problem which was
>> discussed on netdev some time ago. That is, the PHY driver cannot be
>> probed unless it is taken out of reset. Which will only happen if you
>> probe it. And the workaround/advise was to use the compatible string in
>> that case, which is unfortunate.
>> Just wanted to point out, that it is *not* the same as snps,reset-*
>> because the latter will work just fine without the compatible. I'll
>> go with the compatible for now.
>>
>> I did *not* add the vbus to the USB ports, not even on the front port.
>> That is because of:
>>    dependencies:
>>      connector: [ usb-role-switch ]
>> and we just have a simple USB3.2 USB-A connector, no dual roles. IMHO
>> that is a bug in the driver, which should handle the vbus supply as
>> optional.
>>
>> v2:
>> - none



