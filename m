Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B98CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oem0kLrvjEQjjsGM1nGawakjK2aV40DEUoiUUktuvzo=; b=UCY1ahK/jRSGeYcKj7yLtQ4S7q
	LEHlRMjLeJDXA0sP6b/V8wmQHqhxzTwwMyywnSMbQ6UvAPqW8u5FVKWj+eds5qlqX82GUsvj0j7Fz
	zJC3kE3JWKuK5ibUYLfItPcce7WZzZ9mNSkEuIBJZB5YLJ9zK7CFByZ3ioMEsu76cxhcLtYZ8fLZk
	NXvBlYOmpXweehRl3XMjmDeIGREitAohBEXpWOm66196B7NEHlLwWWYHNuDKtt5ur6cMjKTahX0Us
	gvUrCkoh4NoD4Bf9dvT2q923YYjqDDq5DDxkOI27vnRnmOHw3xZp3zAzK6nfkUzTK8yTT3aDSYqSo
	0WpPZdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2jl-003VLi-3d; Tue, 14 Feb 2023 21:21:17 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2jh-003UMG-G8
	for linux-mediatek@lists.infradead.org; Tue, 14 Feb 2023 21:21:15 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 53CD71884412;
	Tue, 14 Feb 2023 21:16:59 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 48AD725002E1;
	Tue, 14 Feb 2023 21:16:59 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 407DC9B403E3; Tue, 14 Feb 2023 21:16:59 +0000 (UTC)
X-Screener-Id: e32ae469fa6e394734d05373d3a705875723cf1e
Received: from fujitsu (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id 8F0F391201E3;
	Tue, 14 Feb 2023 21:16:58 +0000 (UTC)
From: Hans Schultz <netdev@kapio-technology.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, davem@davemloft.net,
 kuba@kernel.org, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh
 <woojung.huh@microchip.com>, "maintainer:MICROCHIP KSZ SERIES ETHERNET
 SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Russell King <linux@armlinux.org.uk>, Christian
 Marangi <ansuelsmth@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 5/5] net: dsa: mv88e6xxx: implementation of
 dynamic ATU entries
In-Reply-To: <Y+EkiAyexZrPoCpP@corigine.com>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-6-netdev@kapio-technology.com>
 <Y9lkXlyXg1d1D0j3@corigine.com>
 <9b12275969a204739ccfab972d90f20f@kapio-technology.com>
 <Y9zDxlwSn1EfCTba@corigine.com> <20230203204422.4wrhyathxfhj6hdt@skbuf>
 <Y94TebdRQRHMMj/c@corigine.com>
 <4abbe32d007240b9c3aea9c8ca936fa3@kapio-technology.com>
 <Y+EkiAyexZrPoCpP@corigine.com>
Date: Tue, 14 Feb 2023 22:14:55 +0100
Message-ID: <87fsb83q5s.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_132113_721723_4907D41B 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Feb 06, 2023 at 17:02, Simon Horman <simon.horman@corigine.com> wrote:
>
> Just to clarify my suggestion one last time, it would be along the lines
> of the following (completely untested!). I feel that it robustly covers
> all cases for fdb_flags. And as a bonus doesn't need to be modified
> if other (unsupported) flags are added in future.
>
> 	if (fdb_flags & ~(DSA_FDB_FLAG_DYNAMIC))
> 		return -EOPNOTSUPP;
>
> 	is_dynamic = !!(fdb_flags & DSA_FDB_FLAG_DYNAMIC)
> 	if (is_dynamic)
> 		state = MV88E6XXX_G1_ATU_DATA_STATE_UC_AGE_7_NEWEST;
>
>
> And perhaps for other drivers:
>
> 	if (fdb_flags & ~(DSA_FDB_FLAG_DYNAMIC))
> 		return -EOPNOTSUPP;
> 	if (fdb_flags)
> 		return 0;
>
> Perhaps a helper would be warranted for the above.

How would such a helper look? Inline function is not clean.

>
> But in writing this I think that, perhaps drivers could return -EOPNOTSUPP
> for the DSA_FDB_FLAG_DYNAMIC case and the caller can handle, rather tha
> propagate, -EOPNOTSUPP.

I looked at that, but changing the caller is also a bit ugly.

>
> Returning -EOPNOTSUPP is the normal way to drivers to respond to requests
> for unsupported hardware offloads. Sticking to that may be clearner
> in the long run. That said, I do agree your current patch is correct
> given the flag that is defined (by your patchset).

