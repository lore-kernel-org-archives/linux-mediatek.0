Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA9DC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QiiPLMA6EN1qebA4TseZQrKhExhrqS7aCZXKTasAII=; b=tF3nw7SCi7i+xF
	hau+LYEqJHCoZhXPrTe0tfsqOVoEoYKJ+vuMWXhoBtfVebBVliFDsTPMs90VjUjJ7XfBgYaQh6Pof
	Wj58lCiP9iZ8TUXIIUhmdKJBKr8HqUJSnBVShy8sAYnvZpkLUuDCGKA0JKmPx++1dS7aOFp9hgLwA
	M+LviYD4g9UOWWWqL77POK9pKqybij1bz+cGQhvc01zlZGTz0SAkcLf9LMnqaGi9iNE/0LkuvAyb0
	yow0BwR8pf7dMvj7zvv0KVxRAggqRuv6hvR/RM0Loh03SyT9AucInd90wJnopHkx9sxp8ZHW2F/Y/
	ZUqcVEz1OAGgP3aL0CYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvNf-00Bbfk-2X;
	Fri, 21 Apr 2023 18:21:11 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvNc-00Bbf9-2v;
	Fri, 21 Apr 2023 18:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682101240; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k0bJ8Xx/Gm+nNVRnhuPQm9C5+CrsbRHg+eXpYk2MmRD0gO9iNab8B7NolroNQkd3itfNYdCBP6zxNRZqVbw/EI51kKyyXUpy1yVITCeIt1NNUvYApOlJdZOG+JmaADt9198lpF5HlxodVV0PRfPzQFSM0WRCuD4OeT/Rsl5YhF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682101240; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7QiiPLMA6EN1qebA4TseZQrKhExhrqS7aCZXKTasAII=; 
	b=fnel47tvWC8l2c9JvGqXJLH9USAeXQ1ykLYIHdfHl0ryPjRjjHMbpnHhUv5qsFFMvTXi4x9cwdaqpmfRIYdiv8OIRp0s/lg5jWrUBcOdyBIA04nnUPn8mf4U3+F5vVgcZam+vhmrlgpajrH54TMtpkk/T4B/Cv87O9dvaiO0+KQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682101240;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7QiiPLMA6EN1qebA4TseZQrKhExhrqS7aCZXKTasAII=;
	b=c+o+Ci0lBuGyktLuyGSqFnK/U2Zm9GsMWUP80v3P+BwtvkwlkhpEofYTVQI0p/9g
	QwXWPs5mBCEccxOI1skKkKZSlmMa/OKjRPM3FTsBU1ort/49+g8SnTgt4PDxdU9Q6fQ
	IMj8b5e0EGt6P+vCpNhyzYSK5oq/DKTZi/zu5MzA=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682101239384601.8860784088002; Fri, 21 Apr 2023 11:20:39 -0700 (PDT)
Message-ID: <f1c38c13-a1f6-93d8-90ae-4ea3f7e06dc2@arinc9.com>
Date: Fri, 21 Apr 2023 21:20:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH net-next 08/22] net: dsa: mt7530: change
 p{5,6}_interface to p{5,6}_configured
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-9-arinc.unal@arinc9.com>
 <ZELH2RlYLPjJGx6Y@makrotopia.org>
 <810aa47b-7007-7d53-9a23-c2d17d43d8a8@arinc9.com>
In-Reply-To: <810aa47b-7007-7d53-9a23-c2d17d43d8a8@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_112108_993539_A1ECB63E 
X-CRM114-Status: GOOD (  17.71  )
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

On 21.04.2023 21:17, Arınç ÜNAL wrote:
> On 21.04.2023 20:28, Daniel Golle wrote:
>> On Fri, Apr 21, 2023 at 05:36:34PM +0300, arinc9.unal@gmail.com wrote:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> The idea of p5_interface and p6_interface pointers is to prevent
>>> mt753x_mac_config() from running twice for MT7531, as it's already 
>>> run with
>>> mt753x_cpu_port_enable() from mt7531_setup_common(), if the port is 
>>> used as
>>> a CPU port.
>>>
>>> Change p5_interface and p6_interface to p5_configured and p6_configured.
>>> Make them boolean.
>>>
>>> Do not set them for any other reason.
>>>
>>> The priv->p5_intf_sel check is useless as in this code path, it will 
>>> always
>>> be P5_INTF_SEL_GMAC5.
>>>
>>> There was also no need to set priv->p5_interface and 
>>> priv->p6_interface to
>>> PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup() as they would
>>> already be set to that when "priv" is allocated. The pointers were of 
>>> the
>>> phy_interface_t enumeration type, and the first element of the enum is
>>> PHY_INTERFACE_MODE_NA. There was nothing in between that would change 
>>> this
>>> beforehand.
>>>
>>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> NACK. This assumes that a user port is configured exactly once.
>> However, interface mode may change because of mode-changing PHYs (e.g.
>> often using Cisco SGMII for 10M/100M/1000M but using 2500Base-X for
>> 2500M, ie. depending on actual link speed).
>>
>> Also when using SFP modules (which can be hotplugged) the interface
>> mode may change after initially setting up the driver, e.g. when SFP
>> driver is loaded or a module is plugged or replaced.
> 
> I'm not sure I understand. pX_configured would be set to true only when 
> the port is used as a CPU port. mt753x_mac_config() should run for user 
> or DSA ports more than once, if needed.

Looking at this again, once pX_interface is true, the check will prevent 
even user or DSA ports to be configured again. What about setting 
pX_interface to false after mt753x_mac_config() is run?

Arınç

