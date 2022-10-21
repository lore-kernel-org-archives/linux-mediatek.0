Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6UoboT3GPFH+yR0u6A5+iJDgDFwbOcLPjKNv58lNNQ=; b=XuD1UFRbdQjnypVC8un9b3DE9p
	c5amInLIbSIH5/MgU3QVLG5pHn2YTnJM8mgQMGTCWoc05Rd45qlOTyOY4FtRH2M8nGRWRovE5H2+I
	ggzsB7dRgrdep9Q0gnx3RDlVjI36nNUwflv5nOKa7oJWcK01zHJriBB+0q+PljZ97W2v2fKWs9CiE
	nBCGcKK4hz1mRPis/1Tc3iY+vNy4Q9YAGJfJfRo0VAu2LuW9bbSpndd7QTITreDsDSU/zf1HJQiWk
	5dvOostZXfwaaItzsG1LQ7BRUuIxB7x/Ilcex4nP4PG8GSOdTtuYCFMfb7ZoHraHrcGWjNQj6YOz9
	M6GUw8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvzo-009Dqa-JE; Fri, 21 Oct 2022 17:39:48 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvzc-009Do3-Hw; Fri, 21 Oct 2022 17:39:38 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id D5B4618846E9;
	Fri, 21 Oct 2022 17:39:34 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id C5ECE250007B;
	Fri, 21 Oct 2022 17:39:34 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id BA4459EC0005; Fri, 21 Oct 2022 17:39:34 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 21 Oct 2022 19:39:34 +0200
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
In-Reply-To: <20221021173014.oit3qmpkrsjwzbgu@skbuf>
References: <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
 <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
 <20221021163005.xljk2j3fkikr6uge@skbuf>
 <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
 <20221021173014.oit3qmpkrsjwzbgu@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <b88e331e016ad3801f1bf1a0dec507f3@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_103936_931786_3CE791FD 
X-CRM114-Status: GOOD (  26.60  )
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

On 2022-10-21 19:30, Vladimir Oltean wrote:
> On Fri, Oct 21, 2022 at 07:18:59PM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-10-21 18:30, Vladimir Oltean wrote:
>> > On Fri, Oct 21, 2022 at 03:16:21PM +0200, netdev@kapio-technology.com wrote:
>> > > As it is now in the bridge, the locked port part is handled before learning
>> > > in the ingress data path, so with BR_LEARNING and BR_PORT_LOCKED, I think it
>> > > will work as it does now except link local packages.
>> >
>> > If link-local learning is enabled on a locked port, I think those
>> > addresses should also be learned with the BR_FDB_LOCKED flag. The
>> > creation of those locked FDB entries can be further suppressed by the
>> > BROPT_NO_LL_LEARN flag.
>> >
>> > > If your suggestion of BR_LEARNING causing BR_FDB_LOCKED on a locked port, I
>> > > guess it would be implemented under br_fdb_update() and BR_LEARNING +
>> > > BR_PORT_LOCKED would go together, forcing BR_LEARNING in this case, thus also
>> > > for all drivers?
>> >
>> > Yes, basically where this is placed right now (in br_handle_frame_finish):
>> 
>> As I don't know what implications it would have for other drivers to 
>> have learning
>> forced enabled on locked ports, I cannot say if it is a good idea or 
>> not.
>> Right now learning is not forced either way as is, but the consensus 
>> is that learning
>> should be off with locked ports, which it would be either way in the 
>> common case I
>> think.
> 
> I don't think I fully understand what you mean by forcing BR_LEARNING.
> A bridge port gets created with a default set of flags as can be seen
> in new_nbp().
> Those flags include BR_LEARNING but don't include BR_PORT_LOCKED.
> 
> The user can decide he wants to make the port use 802.1X without MAB, 
> so
> he enables BR_PORT_LOCKED and disables BR_LEARNING, all with the same
> netlink command (ip link set swp0 type bridge_slave learning off locked 
> on).
> 
> How was the driver forced into anything?

Well, with this change, to have MAB working, the bridge would need 
learning on
of course, but how things work with the bridge according to the flags, 
they
should also work in the offloaded case if you ask me. There should be no
difference between the two, thus MAB in drivers would have to be with
learning on.

