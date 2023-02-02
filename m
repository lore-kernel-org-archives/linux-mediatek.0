Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3E6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p/RT6r4hoVWj+XOMGGmT+dsNYwT5cDnJsPSaVPK0zE=; b=n1a12ZTc+2IDzDYrLJcXqdarU/
	bUk/6+GgV5OXjiXVTrSmkyGEXubC0FBOa3co3TuRl6D8b2U8WNK0DKLE/6N2EdS5YQp5o6aavzkMj
	GFVGf6f0WMIxRlAcCEm+cll020mrdiKDaYCTHXNOGh7rmjD+x8TaufgfAJ2ZZrBxHLNpLnf9wiBOI
	ogxXhEL5wZW6LwUGviLuuwZP6vSZFIncjznjzDblxCPuNNMh9gRqLlNwhX4SOj2yUcAiDZws2rSxB
	h0eR3rSnNh/CLYsxSJ+IHnhCXfT0ywo68KIfLxsJv5/4oiFxWnwupfqpl2k2NOpw4kmxsxM2W6bMm
	7y0JkahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcbK-00GgJv-SY; Thu, 02 Feb 2023 16:38:18 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcbA-00GgI2-6m; Thu, 02 Feb 2023 16:38:10 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 965C318843AC;
	Thu,  2 Feb 2023 16:38:06 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 8D99F250007B;
	Thu,  2 Feb 2023 16:38:06 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 743E591201E4; Thu,  2 Feb 2023 16:38:06 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 02 Feb 2023 17:38:06 +0100
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@idosch.org>
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
Subject: Re: [PATCH net-next 1/5] net: bridge: add dynamic flag to switchdev
 notifier
In-Reply-To: <Y9vgz4x/O+dIp+0/@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-2-netdev@kapio-technology.com>
 <Y9qrAup9Xt/ZDEG0@shredder>
 <f27dd18d9d0b7ff8b693af8a58ea8616@kapio-technology.com>
 <Y9vgz4x/O+dIp+0/@shredder>
User-Agent: Gigahost Webmail
Message-ID: <766efaf94fcb6362c5ceb176ad7955f1@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_083808_570438_ED87A9CF 
X-CRM114-Status: GOOD (  33.98  )
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

On 2023-02-02 17:11, Ido Schimmel wrote:
> On Thu, Feb 02, 2023 at 08:28:36AM +0100, netdev@kapio-technology.com 
> wrote:
>> On 2023-02-01 19:10, Ido Schimmel wrote:
>> > On Mon, Jan 30, 2023 at 06:34:25PM +0100, Hans J. Schultz wrote:
>> > > To be able to add dynamic FDB entries to drivers from userspace, the
>> > > dynamic flag must be added when sending RTM_NEWNEIGH events down.
>> > >
>> > > Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
>> > > ---
>> > >  include/net/switchdev.h   | 1 +
>> > >  net/bridge/br_switchdev.c | 2 ++
>> > >  2 files changed, 3 insertions(+)
>> > >
>> > > diff --git a/include/net/switchdev.h b/include/net/switchdev.h
>> > > index ca0312b78294..aaf918d4ba67 100644
>> > > --- a/include/net/switchdev.h
>> > > +++ b/include/net/switchdev.h
>> > > @@ -249,6 +249,7 @@ struct switchdev_notifier_fdb_info {
>> > >  	u8 added_by_user:1,
>> > >  	   is_local:1,
>> > >  	   locked:1,
>> > > +	   is_dyn:1,
>> > >  	   offloaded:1;
>> > >  };
>> > >
>> > > diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
>> > > index 7eb6fd5bb917..4420fcbbfdb2 100644
>> > > --- a/net/bridge/br_switchdev.c
>> > > +++ b/net/bridge/br_switchdev.c
>> > > @@ -136,6 +136,8 @@ static void br_switchdev_fdb_populate(struct
>> > > net_bridge *br,
>> > >  	item->added_by_user = test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
>> > >  	item->offloaded = test_bit(BR_FDB_OFFLOADED, &fdb->flags);
>> > >  	item->is_local = test_bit(BR_FDB_LOCAL, &fdb->flags);
>> > > +	item->is_dyn = !test_bit(BR_FDB_STATIC, &fdb->flags) &&
>> >
>> > Why not 'is_static' and be consistent with the bridge flag like all the
>> > other fields?
>> >
>> > Regardless of how you name this field, it is irrelevant for
>> > 'SWITCHDEV_FDB_ADD_TO_BRIDGE' notifications that all add FDB entries
>> > with the 'BR_FDB_ADDED_BY_EXT_LEARN' flag set, which makes
>> > 'BR_FDB_STATIC' irrelevant.
>> >
>> > > +		item->added_by_user;
>> >
>> > Unclear why this is needed...
>> >
>> 
>> The answer to those two questions lies in my earlier correspondences 
>> (with
>> Oltean) on the RFC version.
> 
> It is not up to me as a reviewer to dig up old versions of the patch 
> and
> find out what was changed and why. It is up to you as the submitter of
> the patch to provide all this information in the patch posting. Please
> read:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> Specifically:
> 
> "Review comments or questions that do not lead to a code change should
> almost certainly bring about a comment or changelog entry so that the
> next reviewer better understands what is going on."
> 
> And:
> 
> "Other comments relevant only to the moment or the maintainer, not
> suitable for the permanent changelog, should also go here. A good
> example of such comments might be patch changelogs which describe what
> has changed between the v1 and v2 version of the patch.
> 
> Please put this information after the --- line which separates the
> changelog from the rest of the patch. The version information is not
> part of the changelog which gets committed to the git tree. It is
> additional information for the reviewers."
> 
> Thanks


Sorry about that. I thought it would be easily found...

On the first question please look here:
https://lore.kernel.org/netdev/20230119134045.fqdt6zrna5x3iavt@skbuf/

On the second question it is what Oltean pointed out to me here...
https://lore.kernel.org/netdev/20230118230135.szu6a7kvt2mjb3i5@skbuf/

Oltean says there:
"This is not true, because it assumes that DSA never called 
port_fdb_add()
up until now for bridge FDB entries with the BR_FDB_STATIC flag unset,
which is incorrect (it did)."

Though as I see it, if it is only from the DSA layer on, the new 
is_dynamic flag would not be set anyway in the case he references. And 
as can be seen the change is in the bridge layer, as the rest is just 
propagating the flag, but it ensures that to set this flag that it comes 
from the user adding an FDB entry.

