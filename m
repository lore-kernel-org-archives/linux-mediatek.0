Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A085FC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pjn465tBlWE2TKJcQ1vmz28ymlMtNutMRGiw9pjsKU=; b=WPgtpDeTSVtH1hz2vngl4dEVv1
	QXvxRfcxHTy5B2gmAEF8jYC82+fdZdYleg3kGp5Fih7igT334J4VA56KglsLLrDiNqyuYdx2iOmB6
	TuGQMuKjqrwZHSBH3EZ/yzOBIMhRBPErTOSn4sw6ZKqCzj0HXPBgRA9XGwLyZ4r32zxz9+5tEEGQa
	4zyWywSnOiTrBQppWJvEYMkN4qD9ZULl3kHd35JfWKkcE0dUANR8JA+rJPnqrZNKkXkHQVhw/03dn
	4H0SanSlMUeRPhKgq3fsGdLJRofO1mVanyq4DwOyVz8qF4qoa6vVSUSjmfQhuBZ90LUN3cWuOre2C
	8PbDcKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oizyL-00CErS-5y; Thu, 13 Oct 2022 15:18:09 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oizyA-00CEnl-DP; Thu, 13 Oct 2022 15:18:00 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id E44781884C4B;
	Thu, 13 Oct 2022 15:17:42 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id B029F2500015;
	Thu, 13 Oct 2022 15:17:42 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 74E139EC000A; Thu, 13 Oct 2022 15:17:42 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 13 Oct 2022 17:17:42 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Petr
 Machata <petrm@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>,
 Hans Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>,
 Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 net-next 9/9] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
In-Reply-To: <Y0ggn5SZnw+4SGLC@shredder>
References: <20221009174052.1927483-1-netdev@kapio-technology.com>
 <20221009174052.1927483-10-netdev@kapio-technology.com>
 <21f799c5a7a79e2e4b111a95fff6fe3d@kapio-technology.com>
 <Y0ggn5SZnw+4SGLC@shredder>
User-Agent: Gigahost Webmail
Message-ID: <46112084313969f9a6dfdea9fe52b4b1@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_081758_652435_6660E3F7 
X-CRM114-Status: GOOD (  11.70  )
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

On 2022-10-13 16:28, Ido Schimmel wrote:
> On Wed, Oct 12, 2022 at 11:46:55AM +0200, netdev@kapio-technology.com 
> wrote:
>> Ido, have you had time to look at this patch set, and do I need to 
>> release a
>> v8 to fix those two forgotten statics and maybe also this new 
>> switchcore
>> driver that was not there when I posted this patch set?
> 
> I don't know which changes you are referring to, but v8 should
> incorporate all the changes requested so far. Do not post it as long as
> net-next is closed (unless marked as RFC):

Ohh, I missed declaring two functions as static in chip.c, and 
unfortunately my compiler did not give me any warnings...

What is the schedule for net-next to be open (I guess that it is closed 
as of now)?

> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#how-often-do-changes-from-these-trees-make-it-to-the-mainline-linus-tree

