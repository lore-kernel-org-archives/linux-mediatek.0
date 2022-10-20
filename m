Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6ADC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHTOzGbQ8IFw4d74noMqd5X5uBgEHM+a1cx+m1O11ks=; b=svdpzhjOtyo4O7pcrETFCeRcgI
	o15PyAWbxTdXVOK53TgGn2QlERXrA0daYEpP9/NTlUcXHDr90kqlbu8GFUVN9LIyNjKD2fbrf0jyz
	ihxTim/qoa9H62lXemzinIBNi7xrNgyuD5x+KZBaHpM68pPZPaeBQv9feKR6mjpfke0oIW+5ZbyJE
	RydMzn4w+XyDjh6vM9ks0v5f1DWsalUSKg+b3guMWQ82dP24XV1rIpV0+hB97XZA8K34ef3fWJdvk
	jkrup1FGgZAyumyh5KusMhuPGfqn669ibrIUKE+Bx1Jek9tRx1VMApHhqBJzVRgoq9RysZoF7glCJ
	hCG1fBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbhH-001Z0M-NQ; Thu, 20 Oct 2022 19:59:19 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbh6-001YwO-5f; Thu, 20 Oct 2022 19:59:09 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 896781884703;
	Thu, 20 Oct 2022 19:59:03 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 6B69E25001FA;
	Thu, 20 Oct 2022 19:59:03 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 62A2E9EC0002; Thu, 20 Oct 2022 19:59:03 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 20 Oct 2022 21:59:03 +0200
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke
 Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Ido Schimmel
 <idosch@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>, Hans
 Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit
 Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 10/12] net: dsa: mv88e6xxx: mac-auth/MAB
 implementation
In-Reply-To: <20221020132538.reirrskemcjwih2m@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <77c2b6507fd267cefdaf74e53c2bd325@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_125908_383793_BE66DD42 
X-CRM114-Status: GOOD (  13.09  )
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

On 2022-10-20 15:25, Vladimir Oltean wrote:
>> +
>> +#include <net/switchdev.h>
>> +#include <linux/list.h>
>> +#include "chip.h"
>> +#include "global1.h"
>> +#include "switchdev.h"
>> +
>> +static void mv88e6xxx_atu_locked_entry_purge(struct 
>> mv88e6xxx_atu_locked_entry *ale,
>> +					     bool notify, bool take_nl_lock)
>> +{
>> +	struct switchdev_notifier_fdb_info info = {
>> +		.addr = ale->mac,
>> +		.vid = ale->vid,
>> +		.locked = true,
>> +		.offloaded = true,
>> +	};
>> +	struct mv88e6xxx_atu_entry entry;
>> +	struct net_device *brport;
>> +	struct dsa_port *dp;
>> +
>> +	entry.portvec = MV88E6XXX_G1_ATU_DATA_PORT_VECTOR_NO_EGRESS;
>> +	entry.state = MV88E6XXX_G1_ATU_DATA_STATE_UC_UNUSED;
>> +	entry.trunk = false;
>> +	ether_addr_copy(entry.mac, ale->mac);
>> +
>> +	mv88e6xxx_reg_lock(ale->chip);
>> +	mv88e6xxx_g1_atu_loadpurge(ale->chip, ale->fid, &entry);
>> +	mv88e6xxx_reg_unlock(ale->chip);
>> +
>> +	dp = dsa_to_port(ale->chip->ds, ale->port);
>> +
>> +	if (notify) {
>> +		if (take_nl_lock)
>> +			rtnl_lock();
> 
> Is this tested with lockdep? I see the function is called with other
> locks held (p->ale_list_lock). Isn't there a lock inversion anywhere?
> Locks always need to be taken in the same order, and rtnl_lock is a
> pretty high level lock, not exactly the kind you could take just like
> that.
> 

I am very sure that there is no lock inversions or double locks taken.
It is only in the clean-up from time-out of driver locked entries that
the nl lock needs to be taken (as the code reveals). In all other
instances, the nl lock is already taken as far as this implementation 
goes.

