Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A7C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhtGCpgs8VG3ou8855pH8L7tkz77AnXTHtobCoUAuVM=; b=ZTw3FDvYaaF/q6
	Bl7GxaKHVEqr05e0J6jIpU+3oS99fVIGt/B5VMCCv6cV/jy+myGubJrplKNcpARJgHj/DV9RA/h+e
	7TL0qw2/q3pX+TPHsDpK/AahpCHArVP4YRmJV/IO7Apy5wP5XLThN1ybcKSqJ/s4wEwj1QVcX4byy
	5LJ0igfQHfZNciYVrfnYNOCS7GETVuKftFAq9QplL1IRa8zcf4xzyLeOlOtNX8V3kAhM/CUN3TaG+
	0Mx+li0hKn8aSSMsdadM2OOcThU7wSkEDt5e53F9t7+4RXxvSb+xV3ifG2q8dZaYcHLacdyXNS2mF
	m2W8HXxnDyE66WXg5sRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvUl-00BciH-1o;
	Fri, 21 Apr 2023 18:28:31 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvUi-00Bch2-0I;
	Fri, 21 Apr 2023 18:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682101673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SaSBoPob1vx8UxWGw/1V+TbNRkGJAsK90tRye9/VlpgU8VwLnDSHghVoWUYgAjhPjoRrCWPMCItu6Twjq/fMouX8cle3IP85FsAzQ+fuTOMJmV5hyfaI60KAaEpIB/vcn4xbhatpIi6wyGmnthH1/wbL4H8s7U2zI4yryNVrGJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682101673; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HhtGCpgs8VG3ou8855pH8L7tkz77AnXTHtobCoUAuVM=; 
	b=jDUZmxX2h5DWOd56WLqqY9Owk6FnqPIR/pjpPBoRhXGffhpEG2g6jacEeok7CPfMWcXKqXOzA3fnFRfr7ixvriIPCROSr12kBjLl+wwxcdmvK4iU4832VvBUlD6ZpN+GV/UISRD/tKMd2OnKwmjglhADyikmXLq165b5dpL6p0U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682101673;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HhtGCpgs8VG3ou8855pH8L7tkz77AnXTHtobCoUAuVM=;
	b=Y4ageSokWBom/G2ZCmFb/b81B/hbHdFJvx36UnHpALK+9EHjrIBm1URAAg1Ra1hW
	zPny3BfiOWOHfbi26F2qoXjgHI4nSL9KeR0quy6dEeAEPYHP63eaiDKdgtiimB8c9Tv
	gRdrOTcPG0Ix59uu3nHkY8IwbIQc9FTHmFcxDIAc=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682101672038904.708571478262; Fri, 21 Apr 2023 11:27:52 -0700 (PDT)
Message-ID: <6493c52f-247c-c9c0-8352-4b312b7e67e4@arinc9.com>
Date: Fri, 21 Apr 2023 21:27:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH net-next 02/22] net: dsa: mt7530: use
 p5_interface_select as data type for p5_intf_sel
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-3-arinc.unal@arinc9.com>
 <ZEK4gVx-WQv0j2cR@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZEK4gVx-WQv0j2cR@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_112828_174445_497B19E4 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21.04.2023 19:23, Daniel Golle wrote:
> On Fri, Apr 21, 2023 at 05:36:28PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Use the p5_interface_select enumeration as the data type for the
>> p5_intf_sel field. This ensures p5_intf_sel can only take the values
>> defined in the p5_interface_select enumeration.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
>> index 845f5dd16d83..703f8a528317 100644
>> --- a/drivers/net/dsa/mt7530.h
>> +++ b/drivers/net/dsa/mt7530.h
>> @@ -674,13 +674,13 @@ struct mt7530_port {
>>   };
>>   
>>   /* Port 5 interface select definitions */
>> -enum p5_interface_select {
>> -	P5_DISABLED = 0,
>> +typedef enum {
> 
> We usually avoid adding typedef in kernel code. If the purpose is
> just to be more verbose in the struct definition, you can as well
> also just use 'enum p5_interface_select as type in the struct.
> 
>> +	P5_DISABLED,
>>   	P5_INTF_SEL_PHY_P0,
>>   	P5_INTF_SEL_PHY_P4,
>>   	P5_INTF_SEL_GMAC5,
>>   	P5_INTF_SEL_GMAC5_SGMII,
>> -};
>> +} p5_interface_select;
>>   
>>   struct mt7530_priv;
>>   
>> @@ -768,7 +768,7 @@ struct mt7530_priv {
>>   	bool			mcm;
>>   	phy_interface_t		p6_interface;
>>   	phy_interface_t		p5_interface;
>> -	unsigned int		p5_intf_sel;
>> +	p5_interface_select	p5_intf_sel;
> 
> enum p5_interface_select	p5_intf_sel;

Will do, thanks.

Arınç

