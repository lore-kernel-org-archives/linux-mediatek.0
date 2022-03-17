Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D66C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyCa3jV05Ai40yCfhjfmtJKwCizhaIoi8qcuuQdwTco=; b=wOZwtiUDOw6UjK
	mpuy+qHaOJIbL5BFXQLc9Zrc+Dqz0dlT8yKJadb3Bzp3FMLDbqQyoY6x9C70cc96P01Qi1gp+3CfS
	+vdO5CYnVcgjT73U4dhEP7gFV4tQDj48FbqoXb++GtJJuW/dbyimdXz7DKwPd/aHavb8iiIveJ6CR
	zA5FV8hIeUDxkhqhk9oOu0d/FKThxcqxDMH2hGU9esrcxY8WbEJ8b8s8ApQEbKM6U1AkMBdGCTcxv
	8/U7EJtcvS9M2CT0//RWmpPuMMJJjvxJPN/fxiTTs1IWqWtQgzFFE0cShlBr7ST/VChwCjkTAq4+F
	GPS3QS2vjzLqu+lPQn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmWE-00FWtl-3Z; Thu, 17 Mar 2022 09:34:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmW1-00FWro-NA; Thu, 17 Mar 2022 09:33:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 58D771F44F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647509631;
 bh=8Er5GMCq22zzAAuQZRr5EH7rpvXOYy2RxuXWgEVIUdU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OXQ44H9PyxXsqT7XBKE+MUrrBX6Bte9NHGf9ZYP1I3YTg0m7l7yWzXM4a6sk5h2Pc
 3uySIHDN3dAo6mixFH88PgXju5IGvpvjiUQr6fj/SaT6U0k5P+wSjL/9w3UKh0ccQ4
 UnSpTM3cJW7NSl6JWFz8rs+H5uC2nUArtmAVPxPT9TTmHqEeLNKCGlH+4rucCmZuQt
 VdQK3lJAMliqNv0Zh3eXf5mz48J2PDUm/bPqNwrMmYI0FA1Q86FvIabDuTTDriq17p
 9SCS7ZG8oKJAPxPUbqvdt5W6R8zrqwmNGmpCsM24hHK/t2IHfv6LVHCIwM00WeXGzw
 K4G4rcZ6Z7E4Q==
Message-ID: <b6394c1a-28ee-f4bb-434f-afd311893fb8@collabora.com>
Date: Thu, 17 Mar 2022 10:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V4 4/6] spi: mediatek: add spi memory support for ipm
 design
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-5-leilk.liu@mediatek.com>
 <b237c1fe-9ddd-0a2e-ecf2-05bfb984c5dd@collabora.com>
 <602f93f020967789eff49e2fd821d1b03f5b009f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <602f93f020967789eff49e2fd821d1b03f5b009f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_023353_961628_C9144C8D 
X-CRM114-Status: GOOD (  23.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/03/22 10:27, Leilk Liu ha scritto:
> On Tue, 2022-03-15 at 10:31 +0100, AngeloGioacchino Del Regno wrote:
>> Il 15/03/22 04:24, Leilk Liu ha scritto:
>>> this patch add the support of spi-mem for ipm design.
>>>
>>> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
>>> ---
>>>    drivers/spi/spi-mt65xx.c | 349
>>> ++++++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 348 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
>>> index 1a0b3208dfca..8958c3fa4fea 100644
>>> --- a/drivers/spi/spi-mt65xx.c
>>> +++ b/drivers/spi/spi-mt65xx.c
>>
>> ...snip...
>>
>>> +
>>> +static void of_mtk_spi_parse_dt(struct spi_master *master, struct
>>> device_node *nc)
>>> +{
>>> +	struct mtk_spi *mdata = spi_master_get_devdata(master);
>>> +	u32 value;
>>> +
>>> +	if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {
>>
>> Hello Leilk,
>>
>> thanks for considering my advice about "spi-{tx,rx}-bus-width", but
>> there's
>> something that you have misunderstood about it.
>>
>> Simply, you don't need this function at all. Whatever you are doing
>> here is
>> already being performed in the Linux SPI framework: at the end of the
>> probe
>> function, this driver is calling the (legacy)
>> devm_spi_register_master(),
>> which calls devm_spi_register_controller().
>>
>> In drivers/spi/spi.c, function spi_register_controller(), will in
>> turn call
>> of_register_spi_devices(ctlr) -> of_register_spi_device(ctlr, nc)...
>> that
>> will end up finally calling function of_spi_parse_dt(ctlr, spi, nc).
>>
>> The last mentioned function already contains the logic and setup to
>> check
>> devicetree properties "spi-tx-bus-width" and "spi-rx-bus-width" (and
>> some
>> others, as well).
>>
>> This means that spi-mt65xx.c already probed these even before your
>> IPM
>> implementation, hence ***function of_mtk_spi_parse_dt() is not
>> needed***.
>>
>> Simply drop it and don't check for these properties: that's already
>> done.
>>
>>
>> Regards,
>> Angelo
>>
> Hi Angelo,
> 
> Thanks for your advice.
> 
> There are two spi controllor on MT7986. One supports single/dual mode,
> the other supports quad mode. Both of them can support spi memory
> framework(one's tx/rx bus width is 1/2, the other one's tx/rx bus width
> is 1/2/4).
> 
> Can I use of_mtk_spi_parse_dt() to parse the information? What's your
> suggestion?
> 
> Thanks!
> 

As I've already said, this does NOT require any devicetree handling in
spi-mt65xx.c, as setting the right mode_bits is already handled in
drivers/spi/spi.c - please follow the explaination that I have given
before to fully understand the situation.

Regards,
Angelo


> 
>>> +		switch (value) {
>>> +		case 1:
>>> +			break;
>>> +		case 2:
>>> +			master->mode_bits |= SPI_TX_DUAL;
>>> +			break;
>>> +		case 4:
>>> +			master->mode_bits |= SPI_TX_QUAD;
>>> +			break;
>>> +		default:
>>> +			dev_warn(mdata->dev,
>>> +				 "spi-tx-bus-width %d not supported\n",
>>> +				value);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (!of_property_read_u32(nc, "spi-rx-bus-width", &value)) {
>>> +		switch (value) {
>>> +		case 1:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
