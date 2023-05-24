Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B7DC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MR0O682RfrFBNse1p8Ql+KZ1F8A1Rs1HR/Xijg/qsHo=; b=sDTcT/1jlT322q
	SX8jlAGoAJSXILy31AqsVyj/Qi2H6D0D5k7LNaR4N0yPEtWcllzARaqYzS3kf2YQct0hL+WV7Zrag
	pECeyo89oXrYLXDxKsCdOQ7tXBLIesv6IOyXyE+NE4R9ltRK5pPzDTDxnSoQzvW1Obyemv8as1HEG
	wdbvKYC4E23D0QiaapqjlzKJ9JRDlHWN/zkJX3Sifjz0W2po9kSuaRs1wduIiuP9EPSL2h8V8587F
	fSn0nIiP/QE05lXTjbaqwdYKeZ1yqMWpXbnvoo3KiRMK3Wi/dghngbNLB8f1w3zw8Xvl1ZnZ1v/v7
	ZsTbH6NW00s9u7NNnZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1j8R-00Cdzq-1F;
	Wed, 24 May 2023 07:42:15 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1j8K-00Cdtx-2O;
	Wed, 24 May 2023 07:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684914092; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aKxvFDvhB4Kb4q7WHYCzmGiJUnx499T9hNTbQT49YsO5DtSfhxxDXFrIcz1JD4vRCr8TKos78852opVSGsGND3eIg42TZjO8tn8J1FpM7O03UK4dQ+3f1UF1t6mQ9OoVqmhPShUSAsoXQALsUv2y1w9VKZKb7K0Kes3Rp6zxecc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684914092; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=MR0O682RfrFBNse1p8Ql+KZ1F8A1Rs1HR/Xijg/qsHo=; 
	b=KPARimPIC8bQ0XGSJKJodyslgvqqwIbSgjURvmHDqIvxxz/7EGT7v3FUZhGtJqhkbMi20R7aCqwLSujGVW0r9QRHuNm/mDd24zGH7fgQZNUJIcxJVVU/C2rDH9xjC5CyrcgxfB8htLQO6wKw1wFZm631v1LuJZiuVttPiiV5IdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684914092;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MR0O682RfrFBNse1p8Ql+KZ1F8A1Rs1HR/Xijg/qsHo=;
	b=SdPuQP3V8HGpH/WOY38f44060GfQW1hFNzUyzqQnbk3V8q3oEWQS1aBWVS3jISpG
	ztEzUpa3KEcr7aUgp1t7PDKQHvRELaJQFwgzzhHithXUhHqIEP0+ulaf1ZmwKcNAx6h
	dhKdTXctBbWqqYz7cXsYRfBwrKo5kNysEMZ/RDUA=
Received: from [10.10.10.217] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1684914089227639.5522627095868; Wed, 24 May 2023 00:41:29 -0700 (PDT)
Message-ID: <a01fb61e-790d-9fae-6537-5556a11b56d8@arinc9.com>
Date: Wed, 24 May 2023 10:41:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 02/30] net: dsa: mt7530: use p5_interface_select
 as data type for p5_intf_sel
To: Andrew Lunn <andrew@lunn.ch>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-3-arinc.unal@arinc9.com>
 <8f73b826-5a1e-462d-91e4-5c518751c1ee@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <8f73b826-5a1e-462d-91e4-5c518751c1ee@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_004208_829058_D2CE4F98 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24.05.2023 02:31, Andrew Lunn wrote:
> On Mon, May 22, 2023 at 03:15:04PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Use the p5_interface_select enumeration as the data type for the
>> p5_intf_sel field. This ensures p5_intf_sel can only take the values
>> defined in the p5_interface_select enumeration.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>> ---
>>   drivers/net/dsa/mt7530.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
>> index 845f5dd16d83..415d8ea07472 100644
>> --- a/drivers/net/dsa/mt7530.h
>> +++ b/drivers/net/dsa/mt7530.h
>> @@ -675,7 +675,7 @@ struct mt7530_port {
>>   
>>   /* Port 5 interface select definitions */
>>   enum p5_interface_select {
>> -	P5_DISABLED = 0,
>> +	P5_DISABLED,
> 
> Is this change important in this context? Maybe add something to the
> commit message about it?

Not important, the first element in the enum is given value 0 so this is
merely a style change. I will mention it on the patch log, thanks.

Arınç

