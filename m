Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084DFC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUqgdk8b8TM0QZbQqaZTq+OWO+F7LKI4LMbJVW5QLx8=; b=DtuekhhUqJZgze0sM4lf7cGDyK
	NVKZkk5HKxZBwEfxMHlUisEI0SsFOYyI9ig0qd5RiVWqBVDJht60LyGSBoSA4H6FF69HPv5e9u1fw
	tGl2TSsqxMFmzt1jviAjmnjKGlilBEyVNnGh99L9gRyARVBBHM57lGf5ERHo/e7d/CrvMRMGACeq9
	ePCtjTVLqKo/dnG2KJO29d80h0Vij00cZoPPssfslZLYva+KD6sQFKNX+uz4g4Avxqq7gTnOYu8MI
	EqIsF1n2koavQWOF8rvby6BM3BzQksQO04Pvxuv738mnzJpQQkPrCOrkyiPk48+FoZ63/9W1MjEGm
	nT9/kb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omELX-00Cgkz-PS; Sat, 22 Oct 2022 13:15:27 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omELN-00CgiH-60; Sat, 22 Oct 2022 13:15:18 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 71136188440A;
	Sat, 22 Oct 2022 13:15:03 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 51EDC250007B;
	Sat, 22 Oct 2022 13:15:03 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 2D6B09EC0013; Sat, 22 Oct 2022 13:15:03 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Sat, 22 Oct 2022 15:15:03 +0200
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Oleksandr
 Mazur <oleksandr.mazur@plvision.eu>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
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
In-Reply-To: <20221022120200.no5pl54bcfa3wcnd@skbuf>
References: <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
 <20221021163005.xljk2j3fkikr6uge@skbuf>
 <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
 <20221021173014.oit3qmpkrsjwzbgu@skbuf>
 <b88e331e016ad3801f1bf1a0dec507f3@kapio-technology.com>
 <20221021181411.sv52q4yxr5r7urab@skbuf>
 <37dc7673fde2b8e166a5ed78431a2078@kapio-technology.com>
 <20221022120200.no5pl54bcfa3wcnd@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <871cd2930adbed99d351da0864aee340@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_061517_404305_553B9C60 
X-CRM114-Status: GOOD (  19.96  )
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

On 2022-10-22 14:02, Vladimir Oltean wrote:
> On Sat, Oct 22, 2022 at 09:24:56AM +0200, netdev@kapio-technology.com 
> wrote:
>> I will not say that you are not making sense as for the mv88e6xxx, as 
>> it
>> needs port association in all cases with BR_PORT_LOCKED, MAB or not, 
>> and
>> port association is turned on in the driver with learning turned on.
>> 
>> That said, there must be some resolution and agreement overall with 
>> this
>> issue to move on. Right now port association is turned on in the 
>> mv88e6xxx
>> driver when locking the port, thus setting learning off after locking 
>> will
>> break things.
> 
> This already needs to be treated as a bug and fixed on its own. Forget
> about MAB.
> 
> You're saying that when BR_LEARNING=on and BR_PORT_LOCKED=on, the
> mv88e6xxx driver works properly, but the software bridge is broken
> (learns from link-local multicast).
> 
> When BR_LEARNING=off and BR_PORT_LOCKED=on, the software bridge is not
> broken, but the mv88e6xxx driver is, because it requires the PAV
> configured properly.
> 
> And you're saying that I'm the one who suggests things should work
> differently in software mode vs offloaded mode?!

Well :-) To be specific, I am talking about how things work from a user
perspective, where I have kept to BR_LEARNING off before turning
BR_PORT_LOCKED on.

I admit to a weakness in that BR_LEARNING off after BR_PORT_LOCKED on is
a problem that from my perspective at this point would be a user error.

> 
> Why don't you
> (a) deny BR_LEARNING + BR_PORT_LOCKED in the bridge layer
> (b) fix the mv88e6xxx driver to always keep the assoc_vector set
>     properly for the port, if BR_LEARNING *or* BR_PORT_LOCKED is set?

(a) yes, I have thought that documentation could handle this, but maybe
     you are right, maybe it should be enforced...
(b) BR_PORT_LOCKED ensures now that the PAV is correctly set, so I have
     basically distinguished between learning and port association (which
     I know mechanically is the same in mv88e6xxx), but still I have
     adhered to learning off while port association is on for the port.

