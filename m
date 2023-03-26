Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EEFC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEiG75v5j15tNIUli4H2SDRDPK1F/fPhkD69bf1zzUc=; b=Cym1DU9sMrFqa2hWC7TOUmdeQj
	+ezReT+XqQ38PgepHpmdgXOZRQMpeb+TyAGko9HqvcX6rLxkCn+OjZKEQVD7A69RX4TFXHCQ6lzn6
	b3VLYRfLmW7A8z/2y0KVyBI0mFXMu3nC+nUCf4OMv+OIjthO0H2asayeBQ0kQmIVj3o3DRLNpn+Fz
	Z9WbrxXtxwY6K+AECjU9gO1LPE7XMg64ycsDgFWIVM8WZDN8E0qn/ou7rXID15HkguCq2fLzUdkn6
	wVm3zOZ7wsufFLham0+o7BxWEO2UJIer9TgbCo4nDoyoZMZFDz40DSkJNI0rRvajbAQFaSnFXi7jE
	vazDPoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSZD-008jqi-2E;
	Sun, 26 Mar 2023 15:45:59 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSZA-008jOn-1m;
	Sun, 26 Mar 2023 15:45:57 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id DD21F188397D;
	Sun, 26 Mar 2023 15:43:44 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id C9D3025002FD;
	Sun, 26 Mar 2023 15:43:44 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id BBDAA9B403E2; Sun, 26 Mar 2023 15:43:44 +0000 (UTC)
X-Screener-Id: e32ae469fa6e394734d05373d3a705875723cf1e
Received: from fujitsu (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id C4E5391201E3;
	Sun, 26 Mar 2023 15:43:43 +0000 (UTC)
From: Hans Schultz <netdev@kapio-technology.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke
 Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>, "open
 list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB
 test
In-Reply-To: <ZBgdAo8mxwnl+pEE@shredder>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder>
Date: Sun, 26 Mar 2023 17:41:06 +0200
Message-ID: <87a5zzh65p.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_084556_732812_8F7879CF 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, Mar 20, 2023 at 10:44, Ido Schimmel <idosch@nvidia.com> wrote:
>> +	$MZ $swp1 -c 1 -p 128 -t udp "sp=54321,dp=12345" \
>> +		-a $mac -b `mac_get $h2` -A 192.0.2.1 -B 192.0.2.2 -q
>> +	tc_check_packets "dev $swp2 egress" 1 1
>> +	check_fail $? "Dynamic FDB entry did not age out"
>
> Shouldn't this be check_err()? After the FDB entry was aged you want to
> make sure that packets received via $swp1 with SMAC being $mac are no
> longer forwarded by the bridge.

I was thinking that check_fail() will pass when tc_check_packets() does
not see any packets, thus the test passing here when no packets are forwarded?

>
> Also, I suggest executing 'bridge fdb get' to make sure the entry is no
> longer present in the bridge FDB.
>

