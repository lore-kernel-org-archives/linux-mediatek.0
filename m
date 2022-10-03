Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D7BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3q+BQKcNyI2ujwbBsOmzuHN1DRl2+umc35Y383OznIs=; b=PqoC5iDJJQx9ebcH/PTdcEsZKh
	sgaeF0FREwUvtSac7Qe/+mmqpwZuEVg00D3srZdvat2EpBS1rJOEe9PO0inkmZ9Dgjeo6WyQqDkpS
	s1pOPAcAlsyQKvu6VJasTheiTamiyK7MzfpNleR7iQkCTFtGd52F8BMJZ132kMm96LSWj0QyWk1Dn
	rEtGF6HA0Y3feeG1R6cSDenKef7LB1V5g1jTaIm4l6C1q+IWhlmavvbI6gvIflw3VN32MWE/8CFas
	19Ln6qNJ2lh/C8eR5E572xF+y7lZYNRONdh8L/VzntySverR34VMzBC2J2JwjkwPIIyYisu6hmYL6
	z7NslZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofQ85-007CD4-2q; Mon, 03 Oct 2022 18:25:25 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofQ7u-007BfF-QA; Mon, 03 Oct 2022 18:25:16 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 3303218847DA;
	Mon,  3 Oct 2022 18:23:05 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 2131F25002BC;
	Mon,  3 Oct 2022 18:23:05 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 039A69EC0002; Mon,  3 Oct 2022 18:23:04 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 03 Oct 2022 20:23:04 +0200
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
Subject: Re: [PATCH iproute2-next 2/2] bridge: fdb: enable FDB blackhole
 feature
In-Reply-To: <YzhfDgqjBvhqNUHX@shredder>
References: <20220929152137.167626-1-netdev@kapio-technology.com>
 <20220929152137.167626-2-netdev@kapio-technology.com>
 <YzhfDgqjBvhqNUHX@shredder>
User-Agent: Gigahost Webmail
Message-ID: <d4d110223244b27ade43fa50326be2d7@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_112515_045387_97354657 
X-CRM114-Status: UNSURE (   6.68  )
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

On 2022-10-01 17:38, Ido Schimmel wrote:
> 
> Need to patch the "SYNOPSIS" section as well
> 

Does this look right to you for the addition to the "SYNOPSIS"?...

bridge fdb { add | del } LLADR dev BRDEV [ self ] [ local ] [ blackhole 
]


