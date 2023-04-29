Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE114C77B60
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Apr 2023 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoO8GtlEEfShlzES7R1A0L+o88kt7MrkfhdZxdS1mIU=; b=jzffk1nNJi8x9p
	YeJbSOnCSaZRoTMo5vIljAwcFJYEuaPSugqu1mZQW/LbJfuBaVHt803TfSkgLaHyP8XGmCASNEeEE
	BCHk5BB3tri+LXK+4oUZan4tK4LmDgZP2qP0h8Ep5lYvlDEdnBi6+2EPDwsM64q4+LemRdXGzeaFh
	w0k+espT1wU8DuHp1Ui74ax7IrolPKt0WibA4+z5ITE+bXxC/oIfWlfGfA/N/VpWpxO0323XK3xP4
	C/CtTe48imagZ3Z5jpiPXEri6vblVjlrWm6T8UEoXPquqC44Nxy2wlOym8JGlm8gGbSkPRREjOHeX
	4e19benLRG/nUzAj9cZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psmee-00Cr7k-25;
	Sat, 29 Apr 2023 15:38:32 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psmeZ-00Cr6q-08;
	Sat, 29 Apr 2023 15:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682782659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VFyR3ye08EJmM5ySRRHjn1Iyo+VtlJPvjMSLAy0S/63KUfkVFZXUdzXyPXqJigcBK8stujWFB/I6tT2+pco2RBUx45h8AqhslPZZKD2nnJFl/iEj+ftT6ZEr/V+EUoVdIWrLWzebK5/s8gRoXafnXioYK2BA6npMw2SVDx5phUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682782659; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=FoO8GtlEEfShlzES7R1A0L+o88kt7MrkfhdZxdS1mIU=; 
	b=TdiU0AxjdNKv/baFo/+CY1YKhaS16SapyPcZysi40FrKr+vuGpysB6OPqOclzIYNTrb4P2Qhg+Sukr4293h9UfQtz0EbZYGr8lCEw8VTzipopocgoRWP7xoE8GuQNb36QRo8ITLilJTpHcfezYeOnAkGlmryiJC98sZRR6rvIzw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682782659;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FoO8GtlEEfShlzES7R1A0L+o88kt7MrkfhdZxdS1mIU=;
	b=bHY3QMarE/DGX3+PqtMCZm92igCcmd9MWWdF2GzC6iqXPb2+LX+ZDHVsKSmyI7CX
	mvil6GjOtfIzoIYm8rJ0zg1PJkL5LXMRPbioniWZy5s5Jn0zAeRLaFfWeGY5iQf9pvq
	mApr+kDXDBor1BQqlj8cZ7EEso/oeQRLGRqUwL+8=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682782658162526.4446392840155; Sat, 29 Apr 2023 08:37:38 -0700 (PDT)
Message-ID: <428b1582-7444-308b-6c45-f49a616875ca@arinc9.com>
Date: Sat, 29 Apr 2023 18:37:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH net-next 20/22] net: dsa: mt7530: force link-down on
 MACs before reset on MT7530
To: Daniel Golle <daniel@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-21-arinc.unal@arinc9.com>
 <ZELZAd4O9SyHLkwn@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZELZAd4O9SyHLkwn@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_083827_148241_9BCE358A 
X-CRM114-Status: GOOD (  20.86  )
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

On 21.04.2023 21:42, Daniel Golle wrote:
> On Fri, Apr 21, 2023 at 05:36:46PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Force link-down on all MACs before internal reset. Let's follow suit commit
>> 728c2af6ad8c ("net: mt7531: ensure all MACs are powered down before
>> reset").
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index ac1e3c58aaac..8ece3d0d820c 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2203,6 +2203,10 @@ mt7530_setup(struct dsa_switch *ds)
>>   		return -EINVAL;
>>   	}
>>   
>> +	/* Force link-down on all MACs before internal reset */
>> +	for (i = 0; i < MT7530_NUM_PORTS; i++)
>> +		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
>> +
> 
> Moving this part to mt753x_setup just before calling priv->info->sw_setup(ds);
> is probably better. Though it isn't documented I assume that the requirement
> to have the ports in force-link-down may also apply to MT7988, and for sure
> it doesn't do any harm.

Now that I'm reading through the programming guide for MT7531 [0] and 
MT7530 [1], I see that the SW_PHY_RST bit on the SYS_CTRL register 
doesn't exist for MT7531. This is likely why forcing link-down on the 
MACs is necessary for MT7531.

I didn't come across any documentation for the switch on the MT7988 SoC. 
Should I assume the registers are identical with MT7531 or have you got 
a document I can look at?

You also don't do system or register reset for the switch on the MT7988 
SoC, what's up with that?

I'm not going to do this change for MT7530 as I think SW_PHY_RST is 
sufficient, and there's no mention to this like on MT7531.

[0] 
https://drive.google.com/file/d/1aVdQz3rbKWjkvdga8-LQ-VFXjmHR8yf9/view?usp=sharing
[1] 
https://github.com/vschagen/documents/blob/main/MT7621_ProgrammingGuide_GSW_v0_3.pdf

Arınç

