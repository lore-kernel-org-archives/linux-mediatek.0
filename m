Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE17C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXXEiQFHGsHOFp40NlENsebvv36l63a37H1cQ9kU3ag=; b=S9e/m0ztym1M5CdGMrkLwUzoiN
	KUUKJdJFsCbp6T9Uw5/r53ArCFhc/10kZ4fGFsVRjC5zcQipsDbmn4S36rv8nTU1/LAOvAOs/dSZi
	A+/peRres/7D6gW+XKV/S7R/bjthFM9b9PnfzmGTJT9QVmqYOvytlVMFqmNUVYl8GuHJ0vBM8m71P
	vydCn+J24Sy41tFWWPxoL4R7wvMK73tB4Y3CXoAIba6aXHG9kR4HP8Nxkzuf/Hopx+s431OUYORhF
	g6d7wKAFnLwm6cVknXbYUBw/uqgQrZPERbEUNPUmshkzDphRF+ZtVSg36g3bP/ocapqWxhjfaMvXD
	DzC4MKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwIt-00485F-Pf; Thu, 29 Sep 2022 16:22:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwIg-0047z1-7y; Thu, 29 Sep 2022 16:22:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 305A3618E6;
	Thu, 29 Sep 2022 16:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A4FC433D6;
	Thu, 29 Sep 2022 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664468532;
	bh=d2xbFWd6cZFHqRqtchaW5YtreTtOFcfhK6VaJhknpbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n0wLICpr9rwLDoO4I22Q+j9GYGdUKtx6O4WAI2LoMiZB3FDSAWURYHUfaUCVoy0FM
	 qYyRxJgC0jSvph0Coo/utPsy68jMOH4DGqPFWjRqQEKttA/d/0ZrktDUcVfwwNuHYL
	 7S0HoBNZHiImbcIfMeTZSAaIn1zhtANzQbzqt32J/JeYD3OMUq74UVbliF+CfVlu/p
	 J0/ACe8PO1rnEPHBK1ESN38tRjPVVor7iVryP5kv1sA7xGmVWQ0mD3oN4aWaqOEzHm
	 9PdQWpxoqQyzL/n52vrIBKCwHTD8pcJQesLiDsZ8geoyB2WeoZD2mTUT3adNUZloCX
	 4w2/AXVJNLemw==
Date: Thu, 29 Sep 2022 09:22:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
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
 Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, Florent
 Fourcot <florent.fourcot@wifirst.fr>, Hans Schultz
 <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit Cohen
 <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 9/9] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
Message-ID: <20220929092210.0423e96d@kernel.org>
In-Reply-To: <6811b44516cf8bf37678bab23bca80ba@kapio-technology.com>
References: <20220928174904.117131-1-netdev@kapio-technology.com>
	<20220929091143.468546f2@kernel.org>
	<6811b44516cf8bf37678bab23bca80ba@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_092214_347522_1EC4B951 
X-CRM114-Status: GOOD (  12.68  )
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

On Thu, 29 Sep 2022 18:17:40 +0200 netdev@kapio-technology.com wrote:
> > If you were trying to repost just the broken patches - that's not gonna
> > work :(  
> 
> Sorry, I do not understand what 'broken' patches you are referring to?
> 
> I think that the locked port tests should be working?

Ignore it then. v6 does not build, see my other reply.

