Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC52CF8551
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAQSElL87icq/DzNokdy8Ec4ZT54ZRG6X/DUUXDUGSk=; b=I57AcXir4I7Bv4WE5iWhdu8wop
	dvlGvvURs5k5B6R6fimr+s/ZzYg3MjAgRuX5zVvzOzJFaTS+Bo+XrosW1Rhjv3zWTTWLB5eb6jXop
	Gmc7PQZppUJuEqeLfYwXr2p1YnwC42zm9nrxA4oKrS8J18uXCwCpDQChIyPhSgw1k95Jh0b6zVt9h
	iIcpHrWCoo+2Vj6OVljDhFvsdO/QnJY904zuARSYuVAS0zyArwxQGkz1KXTg05mLvmYT7oszHLFLs
	bfIjG+XxOI8LZ+zhM/Sr0hW2/42bnglHQyq3ajWf0h9loObDbY5vyOg0e7xNQmkqc/gvJjphR4600
	sdRvAjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGu1-00000008VK9-1ncd;
	Thu, 03 Oct 2024 08:09:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGsi-00000008V14-3ecn;
	Thu, 03 Oct 2024 08:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727942893;
	bh=9obnleDI85uC1/OH57INKgO5FDblTLxyLq0nyXOJI0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xzet3/KthlycX8GfZxfuoR7EtnFyY/w4xpPPKHkSGEHjfEPYpwdwZzBDyCL5z3JnE
	 NTFAbxFPLs/oBXX7c/H5bnX7tsD/MUbJTR7XdrNi5SogDVWB44E1fmla+2Me3mu41G
	 UyQynCBAyqJgQdKQVXxQI4piVFkTjJhKBtDAJ+7gm5H0fY6vU8oi1qaZEXQbplB8zT
	 kYrRAx7BQH+yW/mudwghnvQImQVSvcZilSvyDAGXgemHehZDNkqtOVdCOlTNkh90rC
	 vih0xrkREKsS6iInFGcYX7SYc8FuxoIYuzwIH1GbxGGG5Lui6u8mqTuqxm+XC2Czr8
	 Hz1v4LAVf+HVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82A9417E10AA;
	Thu,  3 Oct 2024 10:08:13 +0200 (CEST)
Message-ID: <ae5eb5a8-d843-488a-8b68-9f6dd5d4603d@collabora.com>
Date: Thu, 3 Oct 2024 10:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] soc: mediatek: mtk-cmdq-helper: Various cleanups
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <172786008674.33539.15432336067797076322.b4-ty@collabora.com>
 <3e0c8b18-81ce-4c9b-886f-d7c50fdf4c3d@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3e0c8b18-81ce-4c9b-886f-d7c50fdf4c3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_010817_129172_541D3FEC 
X-CRM114-Status: GOOD (  12.09  )
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

Il 02/10/24 15:00, Matthias Brugger ha scritto:
> 
> 
> On 02/10/2024 11:08, AngeloGioacchino Del Regno wrote:
>> On Wed, 18 Sep 2024 12:06:17 +0200, AngeloGioacchino Del Regno wrote:
>>> This series performs various cleanups to the MediaTek CMDQ Helper lib,
>>> reducing code duplication and enhancing human readability.
>>>
>>> This also avoids double initialization struct cmdq_instruction as,
>>> in some cases, it was stack-initialized to zero and then overwritten
>>> completely anyway a bit later.
>>> I'd expect compilers to be somehow smart about that, but still, while
>>> at it ... why not :-)
>>>
>>> [...]
>>
>> Applied to v6.12-next/soc, thanks!
>>
>> [1/3] soc: mediatek: mtk-cmdq: Move mask build and append to function
>>        https://git.kernel.org/mediatek/c/2400e830
>> [2/3] soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
>>        https://git.kernel.org/mediatek/c/21ab3dae
>> [3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
>>        https://git.kernel.org/mediatek/c/66705b89
>>
> 
> You probably oversaw the sparse warning email on 3/3?
> 
> As I oversaw that you already merged this.
> 

Yeah, I did. There's no problem anyway, as we can always replace the commits
without noise, I haven't pushed anything to -next :-)

I plan to do that (drop patch 2/3, delete `.mask = 0` on 3/3) soon, at max
next week anyway.

Cheers,
Angelo


