Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0058C3ABCC
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTGtXYGRQL2cWLSakDL/RGJFBLjrVwjbgAU6H+932/4=; b=DC4jZDDz9JlL0iEwtGZfm0jJpT
	XXSOzDiYtgeEISgpZ7ORl/6JcwhBwVhukhzQDBe+/mvJN1DzOl50GDR0gDBBkOnz6qooHNdZhLGcP
	gLr2poGThqAkIisO3rga4WuVL7uDnWLabPxi2UIqs4VeGDrWLJtQLx9Tan/MgfrCsYKEGjJolcJK+
	v1WxIA30xSy74Ojo5I5t7MLpa0P0E8xA05fKDqboTmYN5Fllqb5xrWAg5VT2FjpIBrAYhKyo+TsIO
	ThdlHDT5QsN5zb7/swialJOyUX5pL1Lv0xkveOnEJsojgrBDf7nXU/CrjV+xEYf77ybBSHGgSjrgO
	zv0X6Hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqkB-0000000Cd2O-0GWD;
	Tue, 13 May 2025 14:36:31 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqf3-0000000CcKX-3VHa
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 14:31:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87F0D1305EF;
	Tue, 13 May 2025 16:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747146669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kTGtXYGRQL2cWLSakDL/RGJFBLjrVwjbgAU6H+932/4=;
	b=ImR3Veu6J/nE220woGoGu6PNkF3kLxvnZkxbQE/4KldytbKqDsZOUZnoMnhiG9MRVrfKIM
	VqYElVmt7vf03EstKHvnKxJM0zRU1ESnlzK4jub1UdD1wxkRXT0nUT2sSPy0VH0RoMAVwM
	qGRIopZd9ZWhZ87RIUlADZXFP864Oe0PlxZhIDW03lqHG3naBM6Y9adfBbf6NzZKFpetrR
	kTeQR80uS4xtTKq9l7P9Cf1f3RLuZjdgcgMkKu+Macr5Pq89s6TWqai9/Me57vWmCF52VJ
	d1uQrVS5HwyFhnxjJRHT0xV2jc50gCDCAj7OlZ/CGne8VFez8xuJDXOzXexKRA==
Message-ID: <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
Date: Tue, 13 May 2025 16:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aCNWM5Xq7wnHVCrc@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_073114_089381_FD58795F 
X-CRM114-Status: UNSURE (   8.53  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 13/05/2025 16:24, Daniel Lezcano wrote:
> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>> processors. They are found in xDSL and xPON modems, and contain PCM
>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>
>> The EcoNet MIPS SoCs are divided broadly into two families, the
>> EN751221 family based on the 34Kc, and the EN751627 family based on
>> the 1004Kc. Individual SoCs within a family are very similar, only
>> with different peripherals.
>>
>> This patchset adds basic "boots to a console" support for the EN751221
>> family and adds SmartFiber XP8421-B, a low cost commercially available
>> board that is useful for testing and development.
>>
>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>> peripherals, and for historical reasons Airoha chips are sometimes
>> referred to with the EN75xx prefix. However this is a different
>> platform because Airoha chips are ARM based.
>>
>> This patchset is against mips-next.
>>
>> v4 -> v5
>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>    * Improve explanation of HPT timer in changelog
>>    * Move pr_info to pr_debug per recommendation
>>    * Remove pointless debug on spurious interrupt
>>    * Small code-style change
> Shall I pick the clocksource + bindings changes through my tree ?
>
I'm new here so I don't know what that means for the merges which
will happen later, but I don't see any reason to do otherwise.


Thanks,

Caleb



