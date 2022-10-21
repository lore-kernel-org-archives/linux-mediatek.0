Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0040CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAruxJpPbzStJK5fx2SuhE3rTupAKpI1qCDt3eNG/Gk=; b=PLh0J0wEfvTeNepgMKNqHtmVea
	W/btq1cr4/MTqenZqsm0ejSJ6nkvmRzJIpwvfI5I3DPwL5gRRPvbcAeTm31pI180X4Ws+8TV+NpDv
	LmNbqc8gLhCjOXeHpvMEt8fP1Fa1LeMXo82qNGylf9sGxBpMFJuwFKTf2fUknaPna6GgzPvZZE15M
	JCmRM9fIiIRQL/f5C1gT0q6KcmZmg/3AGi4r74uij9AuAEq284q1aY19Vvvi+7bj05Z1wBhgMe8GE
	1e589N4b4hhx7Wkm4qqf0QyqcnPqWZF2t/XdMHubV6zETcI6nzu5knSAxkmTJuzF10HyhQsEidmwl
	0oR+DchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrt8-007ql7-6D; Fri, 21 Oct 2022 13:16:38 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrsw-007qgb-FU; Fri, 21 Oct 2022 13:16:28 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 03CB41884D82;
	Fri, 21 Oct 2022 13:16:22 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id EDB80250007B;
	Fri, 21 Oct 2022 13:16:21 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id E48979EC0009; Fri, 21 Oct 2022 13:16:21 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 21 Oct 2022 15:16:21 +0200
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
In-Reply-To: <20221021112216.6bw6sjrieh2znlti@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
 <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_061626_700016_7BF42E3A 
X-CRM114-Status: GOOD (  27.53  )
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

On 2022-10-21 13:22, Vladimir Oltean wrote:
> On Fri, Oct 21, 2022 at 08:47:42AM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-10-21 00:57, Vladimir Oltean wrote:
>> > On Thu, Oct 20, 2022 at 10:20:50PM +0200, netdev@kapio-technology.com
>> > wrote:
>> > > In general locked ports block traffic from a host based on if there
>> > > is a
>> > > FDB entry or not. In the non-offloaded case, there is only CPU
>> > > assisted
>> > > learning, so the normal learning mechanism has to be disabled as any
>> > > learned entry will open the port for the learned MAC,vlan.
>> >
>> > Does it have to be that way? Why can't BR_LEARNING on a BR_PORT_LOCKED
>> > cause the learned FDB entries to have BR_FDB_LOCKED, and everything
>> > would be ok in that case (the port will not be opened for the learned
>> > MAC/VLAN)?
>> 
>> I suppose you are right that basing it solely on BR_FDB_LOCKED is 
>> possible.
>> 
>> The question is then maybe if the common case where you don't need 
>> learned
>> entries for the scheme to work, e.g. with EAPOL link local packets, 
>> requires
>> less CPU load to work and is cleaner than if using BR_FDB_LOCKED 
>> entries?
> 
> I suppose the real question is what does the bridge currently do with
> BR_LEARNING + BR_PORT_LOCKED, and if that is sane and useful in any 
> case?
> It isn't a configuration that's rejected, for sure. The configuration
> could be rejected via a bug fix patch, then in net-next it could be 
> made
> to learn these addresses with the BR_FDB_LOCKED flag.
> 
> To your question regarding the common case (no MAB): that can be 
> supported
> just fine when BR_LEARNING is off and BR_PORT_LOCKED is on, no?
> No BR_FDB_LOCKED entries will be learned.

As it is now in the bridge, the locked port part is handled before 
learning
in the ingress data path, so with BR_LEARNING and BR_PORT_LOCKED, I 
think it
will work as it does now except link local packages.

If your suggestion of BR_LEARNING causing BR_FDB_LOCKED on a locked 
port, I
guess it would be implemented under br_fdb_update() and BR_LEARNING +
BR_PORT_LOCKED would go together, forcing BR_LEARNING in this case, thus 
also
for all drivers?

