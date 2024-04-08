Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A4CCD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyDYERK6l30+oDEBuARqGCRNtAGvvbmEpKNmF9iObNE=; b=b/1dp9zZ6msl/Z4z2qzreJnCQV
	LFi/CQ/eoB8ktPqI4kry5DYKFLYBgcLVrn2bu5J00Esk5KQhPGm0R7BpyeTMY5uB/TtWGRdvoaPKn
	oFVux0jbQ7Op1/sy02salDIJ7spVZufV/uDARrp3xelAN1X2tM+EXy67xDmUYNAFHa/SBBXcLzMSX
	WcgwPRMJQ0PJqbIqBeWMqe14+OaKPJCvqzw29B8AQ94xi8N87D/ef2BlLiXdWTwnS6RewpNPMfBkd
	OcDs2ujTTqKRLQQvtLAYTHsCS3UBX8JJX+WK5Ssm4Ar/zOBUBSAtl3uZWMHKAk/xG4up40o6H7Nsq
	l3lHfnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjLd-0000000Ee1e-3Msm;
	Mon, 08 Apr 2024 07:23:21 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjLZ-0000000EdzD-2uF7;
	Mon, 08 Apr 2024 07:23:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75566E0006;
	Mon,  8 Apr 2024 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1712560982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyDYERK6l30+oDEBuARqGCRNtAGvvbmEpKNmF9iObNE=;
	b=hkS1kS6JejD8PCxzYAB99s8mrC/a2KTdaxqAII8bbnMJNBwsoOnoTHB1v63oUMItk8mXlF
	4VfQ0PfNZ1GbTUVHmuULqxkrLImkjASykz44FdUQAZNzbANm+c3xPs83O+7p7Tl0R+Lbx2
	1Lrp9U8Cbf0PjZSlTC2MG5wPub4FjnxuXI4c/oqykZ6iAD9kTJ44B9QyDkwpET2dHa9Oe4
	sw2Zb113De6qb8V9rN7xmjBCvEp1Wb1wSIwAek0LmZU4BD9sMOK829aaWGoSvxMC4Xk7Va
	EcVEKoRla575rGuzrF3FYcUH+NCSi7AvLfUOxqEYAux24d64pixQdnVqxxBMaA==
Message-ID: <a60fc16d-4236-427c-b4a8-ec6fdf62d9f0@arinc9.com>
Date: Mon, 8 Apr 2024 10:22:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Set PHY address of MT7531 switch to 0x1f on MediaTek
 arm64 boards
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <ff196055-ecd8-4563-bc01-ff2533a07109@arinc9.com>
Content-Language: en-US
In-Reply-To: <ff196055-ecd8-4563-bc01-ff2533a07109@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_002317_919081_FDDC9293 
X-CRM114-Status: GOOD (  10.66  )
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

On 31.03.2024 12:28, arinc.unal@arinc9.com wrote:
> On 14.03.2024 15:20, Arınç ÜNAL via B4 Relay wrote:
>> Hello.
>>
>> This is a small patch series setting the PHY address of MT7531 to 0x1f on
>> all boards that have the switch.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>> Arınç ÜNAL (2):
>>        arm64: dts: mediatek: mt7622: set PHY address of MT7531 switch to 0x1f
>>        arm64: dts: mediatek: mt7986: set PHY address of MT7531 switch to 0x1f
>>
>>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
>>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 4 ++--
>>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 4 ++--
>>   5 files changed, 10 insertions(+), 10 deletions(-)
>> ---
>> base-commit: ba90af39ba57b3fe3ecfdba0c87a80d20c7b788d
>> change-id: 20240314-for-mediatek-mt7531-phy-address-9d0b4cfeca21
>>
>> Best regards,
> 
> Reminder that this patch series is waiting.

Another reminder that this patch series is waiting to be applied.

Arınç

