Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DDC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EkbE2y+vcbwJNNHd4DS465z4SjWr4DEGtHXtbcg2xw=; b=jSDb0ktq+HwXNpx+Yd3r27eyFW
	iM2E3FG+KiONNp9kUfShkRnlAJ79B8QljPYvWox5cr5wQ5gf4t7zZbs85pBQuizG66gozl7RvFpEr
	FqaWSBslEyUaLPd6q/MhHU2rtl3aEURT6zPbrymMPaEOpLLetqr+VTnO4kBSFFqsGUNwjQdKFu7MH
	Q41MgZsMzUTjp7ln+uw/nSw3I9WFY2oXXIyaUD3gRNrwlg9g/k69r8z8TlsJgpLHI5FdEyrRhAMWX
	Of6C3TMRBkPw/j7ZCk4yQvrAnjLn6g5n+Bpyt87PyxtDEW8d98dMIxYP8cEJv0JoLTaeXXBt3KJMI
	VhZMhpXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOEF4-004kyM-K5; Sat, 04 Feb 2023 08:49:50 +0000
Received: from [46.183.139.199] (helo=mailout-taastrup.gigahost.dk)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOEDy-004kGY-4S; Sat, 04 Feb 2023 08:48:43 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 0664718839AA;
	Sat,  4 Feb 2023 08:48:25 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id E1FE9250007B;
	Sat,  4 Feb 2023 08:48:24 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id D3B8191201E4; Sat,  4 Feb 2023 08:48:24 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Sat, 04 Feb 2023 09:48:24 +0100
From: netdev@kapio-technology.com
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
 <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
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
In-Reply-To: <Y94TebdRQRHMMj/c@corigine.com>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-6-netdev@kapio-technology.com>
 <Y9lkXlyXg1d1D0j3@corigine.com>
 <9b12275969a204739ccfab972d90f20f@kapio-technology.com>
 <Y9zDxlwSn1EfCTba@corigine.com> <20230203204422.4wrhyathxfhj6hdt@skbuf>
 <Y94TebdRQRHMMj/c@corigine.com>
User-Agent: Gigahost Webmail
Message-ID: <4abbe32d007240b9c3aea9c8ca936fa3@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_004842_347140_11D3B327 
X-CRM114-Status: GOOD (  19.19  )
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

On 2023-02-04 09:12, Simon Horman wrote:
> On Fri, Feb 03, 2023 at 10:44:22PM +0200, Vladimir Oltean wrote:
>> On Fri, Feb 03, 2023 at 09:20:22AM +0100, Simon Horman wrote:
>> > > else if (someflag)
>> > >         dosomething();
>> > >
>> > > For now only one flag will actually be set and they are mutually exclusive,
>> > > as they will not make sense together with the potential flags I know, but
>> > > that can change at some time of course.
>> >
>> > Yes, I see that is workable. I do feel that checking for other flags would
>> > be a bit more robust. But as you say, there are none. So whichever
>> > approach you prefer is fine by me.
>> 
>> The model we have for unsupported bits in the 
>> SWITCHDEV_ATTR_ID_PORT_PRE_BRIDGE_FLAGS
>> and SWITCHDEV_ATTR_ID_PORT_BRIDGE_FLAGS handlers is essentially this:
>> 
>> 	if (flags & ~(supported_flag_mask))
>> 		return -EOPNOTSUPP;
>> 
>> 	if (flags & supported_flag_1)
>> 		...
>> 
>> 	if (flags & supported_flag_2)
>> 		...
>> 
>> I suppose applying this model here would address Simon's extensibility 
>> concern.
> 
> Yes, that is the model I had in mind.

The only thing is that we actually need to return both 0 and -EOPNOTSUPP 
for unsupported flags. The dynamic flag requires 0 when not supported 
(and supported) AFAICS.
Setting a mask as 'supported' for a feature that is not really supported 
defeats the notion of 'supported' IMHO.

