Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE975C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJbSi8Ek8YbEjTAaZCz3kjw1D2dhXW8bxUQbUXNhcaA=; b=G4fieOp1rF5Uw5DQwCMQ01I5Ku
	mzbGYtC3orqRlk2Hsu/tgzhob/q0fdK0RoBrnuo/VPshxR7xZLKoc38y+L4UG2cFsRXzdeOa59aTB
	ZeGCZu2BfPZLJiHIY9v9mG1Gt37e3o5zpAm3nywwwsmOAxZzEF3Y6oFTe+64R2x1yW+aD9gM8JqTC
	pkI8aUDeePsDxP8xj6QK2war8irOsA+dXYWWBKGIAD0C6boe22SKVsFvBtqxFmGbNlbX39DcTPW17
	v3vmOMCSC9ubXOxRFKlsq9XAb8/aN1XO5CjLN/X4EZi3j0TdltKggi/gWC9t4q3WCTW+CBPXBsMqH
	mXJ2QJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMQp-0000000GT9S-1IXN;
	Fri, 09 Feb 2024 08:40:23 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMQm-0000000GT7o-0755;
	Fri, 09 Feb 2024 08:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707468017;
	bh=rWeUK8kIRCrP3AvyVO4HwXkI+h4htosgYJJ/r64ObXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4YmH6zs1Fqk8U3NtnC/OFO6SYmTupi4k5jo5CSSJB7g7Btm0uiJrIDiCJNdCWjaA
	 +HlfZpeHCUJLFVoyTUeTeEikJLNssP9q/VDrbtrHS2+eZxzwVUmfWhc+i4YWTyR+SY
	 XGIjethQ12pQzgZX9N4a47kxBwlCIXOZ2TjjJPKmyo8d0Tbe/dfCQJwsZ3wRecV3QX
	 kFmWt8XE9AvRnZ7sQ3w3i0SLSdS9TnVFMM6h6dUyIww/GNgdn7pjHBJb5vHiIGsfsw
	 WhxpAb8wkrZIaFdArIdz+3P+4foadiehVHtM8PqHiWSP2QCj+hNxJ/IpNWl2pNQbwW
	 f8IlHktIJdVew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5EA8437809D0;
	Fri,  9 Feb 2024 08:40:16 +0000 (UTC)
Message-ID: <023a1706-f6ca-481e-8a95-bc9e0e7e46ad@collabora.com>
Date: Fri, 9 Feb 2024 09:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: convert Mediatek consumer IR to the
 json-schema
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240124095230.25704-1-zajec5@gmail.com>
 <62fca33c-eb1a-42ad-b7f7-31b14f0aa446@collabora.com>
 <6012ec99-4246-41b6-adb2-1bcd4dd159ac@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6012ec99-4246-41b6-adb2-1bcd4dd159ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_004020_374180_EE9BA433 
X-CRM114-Status: GOOD (  13.04  )
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

Il 09/02/24 08:24, Rafał Miłecki ha scritto:
> On 24.01.2024 13:33, AngeloGioacchino Del Regno wrote:
>> The driver says:
>>
>>      ir->bus = devm_clk_get(dev, "bus");
>>      if (IS_ERR(ir->bus)) {
>>          /*
>>           * For compatibility with older device trees try unnamed
>>           * ir->bus uses the same clock as ir->clock.
>>           */
>>          ir->bus = ir->clk;
>>      }
>>
>> This makes me think that requiring *one* clock on MT7623 would be a mistake
>> and the devicetree should use clk, bus - CLK_INFRA_IRRX_PD, CLK_TOP_F10M_REF_SEL.
> 
> Looking at mt2701-clk.h I can see CLK_INFRA_IRRX (which I guess you
> meant above).
> 
> I can't find CLK_TOP_F10M_REF_SEL however. This seems to be available on
> MT7622 and MT7629 only.
> Could you take another look at it, please? Can you somehow verify what
> clock should be used by IR on MT7623?

For MT2701/MT7623N you can use topckgen CLK_TOP_AXI_SEL as bus clock.

Cheers,
Angelo

