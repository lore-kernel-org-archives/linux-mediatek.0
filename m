Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB8EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAWWnDm7dRfdfL1HmqTHFE1I+5HoqUMPdvT4lPVEVoE=; b=2fgd1lMSe5XPJ4KFM/Mx0W1IAK
	+Cl4ir1StP60V1vACBaXk3W/M9r3d87Ciy6GiLsnL15oLSNfnwTg2c6gg9AkngSbkvu9QkIdMDzo6
	r4i5XqDHsMKufSzjH2NXYV68mHvwdoWoeny89EwzfHENGHK4PTMHR8RZoqLxUANXmRXpBPL2GtBZu
	VsPOdM+GKHmCpcbj8V8AH+gxOIUOap6hMSsMaxiUaGFwVWV8wglqPS+Odf1jvOdGZSWm/qcSwujQf
	yUg1YImqcweiKDph/JBBllLIVg57Gb8Atp9jsYatu4UyAnGvR9OTH4eM3BWCeV+Kc3X6i4fgazpYU
	kDEbBEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHNE-009w6X-IY; Fri, 30 Sep 2022 14:52:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHN3-009w3A-Dd; Fri, 30 Sep 2022 14:52:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D86C4B82919;
	Fri, 30 Sep 2022 14:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241ABC433D6;
	Fri, 30 Sep 2022 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664549526;
	bh=wAWWnDm7dRfdfL1HmqTHFE1I+5HoqUMPdvT4lPVEVoE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bJQRnCgWgZS/Y4k3DPIVn8jCZvgWNT8MnReKAQQxb9c7BvikjAFxBUbelfmcH+g/8
	 BnLeyvMclzeZw9EyFesPMH5HJftJHAQyAVx3uzjeOYbWf+tsLFfVnnsfbNYO/MpRWn
	 89z7zInb1EqAj4CB3WO7e0+pAAsCIxVYGhnMj97QnCAf/VAwvyt2vJZSxob/n17hD+
	 +3qptHAyJuCpgRLDppuF4+PSlZYWUIUx6bspwZuCzGROyytwzBG9k/Sp508GdImeej
	 GXaeifMfOoC2Tut/0wuCnBLHLJgmYvD62nyPwwIezJpkF6cqAL+Bqo2gyw4/wTgMl1
	 HLtS0Q7AAdxAw==
Date: Fri, 30 Sep 2022 07:52:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@kapio-technology.com, davem@davemloft.net,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
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
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Florent Fourcot
 <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
Message-ID: <20220930075204.608b6351@kernel.org>
In-Reply-To: <Yzb3oNGNtq4GCS3M@shredder>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
	<20220929091036.3812327f@kernel.org>
	<12587604af1ed79be4d3a1607987483a@kapio-technology.com>
	<20220929112744.27cc969b@kernel.org>
	<ab488e3d1b9d456ae96cfd84b724d939@kapio-technology.com>
	<Yzb3oNGNtq4GCS3M@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_075209_658049_11615D28 
X-CRM114-Status: UNSURE (   9.96  )
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

On Fri, 30 Sep 2022 17:05:20 +0300 Ido Schimmel wrote:
> You can see build issues on patchwork:

Overall a helpful response, but that part you got wrong.

Do not point people to patchwork checks, please. It will only encourage
people to post stuff they haven't build tested themselves.

It's documented:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#running-all-the-builds-and-checks-locally-is-a-pain-can-i-post-my-patches-and-have-the-patchwork-bot-validate-them

Only people who helped write the code and maintain the infra can decide
how to use it which means me, Kees, or Hangbin. Please and thank you :S

