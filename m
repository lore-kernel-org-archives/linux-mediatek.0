Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24D5C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEPXGxKInLAqqM7Gn3/Nq4Q2FQVKObM43fcSshZmOCA=; b=RLCaoWSgSxVv0tz+bBmmIUv6rH
	KcMS2msMic+ZR2MAXN16wd0v2FUTaowE/C3mnABsqSo1b615MA5lA1Q6ATToMyRBZSe1S9ROkCuyj
	d7FyO7Z8yrdC7Yx/f9pN90RMA4hoygP0IxYmk+WLaeJDLUVoWqXZFWvjduYXzrAiIWw5QST+Lnt3V
	LcZ5Op2wK9RwLjuQGh5F584/huYnPjzRgi3XjUF8ho49QiHC+1TIfjeXZYaOttC3POnCqgTA2uH9p
	qCqn4mFS/D0VZRWFUXoEujHXb1Mt0us+xof9sJWuZYcAW+7/zLGfz6S8dPxKVd5c1GPk+HWqkfR1O
	C9Fw8Dyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcwX-00Gk4Q-E7; Thu, 02 Feb 2023 17:00:13 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcwM-00Gk07-HG; Thu, 02 Feb 2023 17:00:03 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id B73B0188374A;
	Thu,  2 Feb 2023 17:00:00 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id AA3FC250007B;
	Thu,  2 Feb 2023 17:00:00 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id A43119B403E1; Thu,  2 Feb 2023 17:00:00 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 02 Feb 2023 18:00:00 +0100
From: netdev@kapio-technology.com
To: Simon Horman <simon.horman@corigine.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9m?=
 =?UTF-8?Q?ent_L=C3=A9ger?= <clement.leger@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 5/5] net: dsa: mv88e6xxx: implementation of
 dynamic ATU entries
In-Reply-To: <Y9lkXlyXg1d1D0j3@corigine.com>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-6-netdev@kapio-technology.com>
 <Y9lkXlyXg1d1D0j3@corigine.com>
User-Agent: Gigahost Webmail
Message-ID: <9b12275969a204739ccfab972d90f20f@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_090002_801182_1BBF40D1 
X-CRM114-Status: GOOD (  13.83  )
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

On 2023-01-31 19:56, Simon Horman wrote:
>> --- a/drivers/net/dsa/mv88e6xxx/chip.c
>> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
>> @@ -42,6 +42,7 @@
>>  #include "ptp.h"
>>  #include "serdes.h"
>>  #include "smi.h"
>> +#include "switchdev.h"
>> 
>>  static void assert_reg_lock(struct mv88e6xxx_chip *chip)
>>  {
>> @@ -2726,18 +2727,25 @@ static int mv88e6xxx_port_fdb_add(struct 
>> dsa_switch *ds, int port,
>>  				  const unsigned char *addr, u16 vid,
>>  				  u16 fdb_flags, struct dsa_db db)
>>  {
>> +	bool is_dynamic = !!(fdb_flags & DSA_FDB_FLAG_DYNAMIC);
>>  	struct mv88e6xxx_chip *chip = ds->priv;
>> +	u8 state;
>>  	int err;
>> 
>> -	/* Ignore entries with flags set */
>> -	if (fdb_flags)
>> -		return 0;
>> +	state = MV88E6XXX_G1_ATU_DATA_STATE_UC_STATIC;
>> +	if (is_dynamic)
>> +		state = MV88E6XXX_G1_ATU_DATA_STATE_UC_AGE_7_NEWEST;
> 
> What if flags other than DSA_FDB_FLAG_DYNAMIC are set (in future)?

They will have to be caught and handled here if there is support for it, 
e.g. something like...

else if (someflag)
         dosomething();

For now only one flag will actually be set and they are mutually 
exclusive, as they will not make sense together with the potential flags 
I know, but that can change at some time of course.

> 
>> +	else
>> +		if (fdb_flags)
> 
> nit: else if (fdb_flags)
> 
>> +			return 0;
>> 
> 
> ...

