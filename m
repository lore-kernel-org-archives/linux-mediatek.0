Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F6EC021B6
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOuZPCStwfD1O+RI8GQPdvosH3lkT+V03FIAVC/43cw=; b=rKd74Yn25SFJblQ2DCWRdJMzdR
	tVGMTLXgTNpNv8mso4W26Q+JZv38buE1qrtj3EZvr9aYYzvHyWaDwyXc4gqWazaHhRLAe6y9aGhf/
	7j7tRbNb+FPuubfryOEr3UlSBGZTTn0jg5Xu8y9MgFylbHt7Kt1Xsgvs5M2QRbHxT8YzOidm4JUwt
	on3e0KMgyFW98klGCxhpLo87hn6Jz6hEOHeP0j6ysJvabWy693NmonDZtpE0/6OEKH2pnz5TLPf2b
	b5qrj/WXpz8Z4Enja3z4/5wPnZSYHygITEC9qi4Rjki2Xbia0Gpheiha0WZ5T1HrgZ/f57igeAjxo
	hUFIoVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUU6-0000000CqBp-39QD;
	Mon, 24 Feb 2025 09:10:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUAR-0000000Clap-2W5q;
	Mon, 24 Feb 2025 08:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740387022;
	bh=ImnSkDvCyNzWrsxhRq8yrR/K/8hCkVqMMnOSMPJSgKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oHtW+b+yNkL+q1CHUWFn0ieZHUza/61O+G4CcpW1+kGwZUKbRuylTrG1l/CQl9Y4n
	 EAbSEPdPGp2XDLmJLGbPR1NO2Y48alxQ6QJVFPqfTosGHpp2AckGElZBRbg4UBAfiJ
	 2CqRV8RmGsLlv8gxKaydQvvJeeNMvKo2FFIGEVK7xZbmO0RfotU/MvW8fbUlhf0PXq
	 jaAYtMim1zopKUeYWiwlMh06TwY76HEwRytSBH5koZu4XL3uD8d+1E3Jm4WiAz/Bdd
	 wFNwzuI+pNaQUKIjIT6TVgRUeFJQxOu0Wp0IfkKMGwGI9NPP2F06SFjj/+SyTqZC1c
	 RtoPpVsL5w/zA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5727617E001F;
	Mon, 24 Feb 2025 09:50:21 +0100 (CET)
Message-ID: <b37788f6-7aa6-46c6-993c-fa30fcaba4c9@collabora.com>
Date: Mon, 24 Feb 2025 09:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] MediaTek MT8188 MTU3 USB and Genio 510/700 TypeC
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
 <790ebe87fdaa8d785813a46269036562c405fb01.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <790ebe87fdaa8d785813a46269036562c405fb01.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005023_785761_207D6FEE 
X-CRM114-Status: GOOD (  13.78  )
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

Il 22/02/25 09:45, Chunfeng Yun (云春峰) ha scritto:
> Hi Angelo
> On Thu, 2025-02-20 at 11:55 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> This series adds MTU3 nodes to the MT8188 base devicetree, fixes the
>> Geralt Chromebooks to use it, and adds support for all of the USB
>> ports, including TypeC Power Delivery, Alternate Modes, etc, found
>> on the MediaTek Genio 510 and Genio 700 Evaluation Kits.
>>
>> This also adds the missing SuperSpeed port to the mtk-xhci binding.
>>
>> AngeloGioacchino Del Regno (3):
>>    dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
>>    arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe
>>      USB
>>    arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller,
>> MUX
>>
>>   .../bindings/usb/mediatek,mtk-xhci.yaml       |   4 +
>>   .../boot/dts/mediatek/mt8188-geralt.dtsi      |  18 +++
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 121 +++++++++-----
>>   .../dts/mediatek/mt8390-genio-common.dtsi     | 151
>> +++++++++++++++++-
>>   4 files changed, 251 insertions(+), 43 deletions(-)
> Do these patch have also changed the chromebook's dts?

Yes

> 
> if changed it, do test it on chromebook?

Yes, and there's no need to hide the MTU3 hardware on Chromebooks,
as I already mentioned multiple times.

Just lock it to host mode and it's always fine :-)

Cheers,
Angelo

> 
> Thanks
> 
> 
>>
>> --
>> 2.48.1
>>


