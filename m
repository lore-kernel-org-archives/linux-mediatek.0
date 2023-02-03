Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C77C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6G42Y6um0k93OqcGPoxXKshxAsP3A6R59xAeReuSus=; b=chdSNIhpYaFDxSQ8QASqo/Ofib
	7VY5Hj3gq5kWp19kTdcHCHGycmf2rXbDLWcz+dV34NxZvWcbTEgDk2w7x1OCISQV7FhAmigJDMJQx
	1af8aBPB/L2gcxIGdedCUOtqpEH/JNLAeZBDeW3Mv5urBjhtw1lEjeq0UrXdN2j41HSPuQyeWcGFB
	bsUpGGpmEIyOIoXXu70dc9bP3r2tcK2NQIWFOmh2wh3TjnRuFBjyvn5x9BGJNCoDOX4wEnsajD326
	cqgeea6Lm1rBARTcAq8HsLF6vQENYcQnZ1fgh5YsrVE1uC7T4EKoArIOH8Z0KcdDmah/9oz61vIhh
	8Y46eGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO10H-003IQR-RJ; Fri, 03 Feb 2023 18:41:41 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO106-003IMP-OP; Fri, 03 Feb 2023 18:41:32 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 8C21D1883921;
	Fri,  3 Feb 2023 18:41:18 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 78969250007B;
	Fri,  3 Feb 2023 18:41:18 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 5F8CC91201E4; Fri,  3 Feb 2023 18:41:18 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 03 Feb 2023 19:41:18 +0100
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
Subject: Re: [PATCH net-next 3/5] drivers: net: dsa: add fdb entry flags
 incoming to switchcore drivers
In-Reply-To: <Y9zDApc6nDO2RzOb@corigine.com>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-4-netdev@kapio-technology.com>
 <Y9lj7RJgyMJfjtGp@corigine.com>
 <0b021777dfc1825b6565c0d9dbd6dbef@kapio-technology.com>
 <Y9zDApc6nDO2RzOb@corigine.com>
User-Agent: Gigahost Webmail
Message-ID: <687a1918326d23ec901c1f53f5860592@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_104130_972070_CC9CB069 
X-CRM114-Status: GOOD (  25.03  )
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

On 2023-02-03 09:17, Simon Horman wrote:
> On Thu, Feb 02, 2023 at 05:45:56PM +0100, netdev@kapio-technology.com 
> wrote:
>> On 2023-01-31 19:54, Simon Horman wrote:
>> > > --- a/drivers/net/dsa/b53/b53_common.c
>> > > +++ b/drivers/net/dsa/b53/b53_common.c
>> > > @@ -1684,11 +1684,15 @@ static int b53_arl_op(struct b53_device
>> > > *dev, int op, int port,
>> > >
>> > >  int b53_fdb_add(struct dsa_switch *ds, int port,
>> > >  		const unsigned char *addr, u16 vid,
>> > > -		struct dsa_db db)
>> > > +		u16 fdb_flags, struct dsa_db db)
>> > >  {
>> > >  	struct b53_device *priv = ds->priv;
>> > >  	int ret;
>> > >
>> > > +	/* Ignore entries with set flags */
>> > > +	if (fdb_flags)
>> > > +		return 0;
>> >
>> >
>> > 	Would returning -EOPNOTSUPP be more appropriate?
>> >
>> > ...
>> 
>> I don't think that would be so good, as the command
>> 
>> bridge fdb replace ADDR dev <DEV> master dynamic
>> 
>> is a valid command and should not generate errors. When ignored by the
>> driver, it will just install a dynamic FDB entry in the bridge, and 
>> the
>> bridge will age it.
> 
> Sure, I agree that it's not necessarily an error that needs
> to propagate to the user.
> 
> My assumption, which I now see is likely false, is that drivers
> could return -EOPNOTSUPP, to indicate to higher layers that the 
> operation
> is not supported. But the higher layers may not propagate that.
> 
> But it seems that is not the case here. So I think return 0 is fine
> after all. Sorry for the noise.

No noise at all... I think your concern is quite ligitimate. With this 
flag there is no iproute2 changes, so not to change behaviour of old 
commands the best is to ignore silently. But I have another flag coming 
up that will be accomodated with a new iproute2 command, and then your 
suggestion is more appropriate. The question will then be if the returns 
for that flag should be -EOPNOTSUPP.

