Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84DDC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 17:42:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC2364F35
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 17:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC2364F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O9cRG/WVqbJhrLgmtSrjgMUWxPqK9dCMrMRFFhzaquI=; b=aNfBY6xHUe/zQTYprk55uDVGO
	W2ohopqgZvEUgq035MhTu/ADBq25TSIGiuWuDZUxst0ZG5XVobx/ynqPaQcij78Nwk+KC5mXT0R/p
	aLDg7syA62vS6Ao+XzV+CTYadQw5mx/vvOP5dbggsSBC5KI0DQCL3PGcRxE/4DMNNbGDM5NREBJ/u
	8cP72mGj3GXf8H+HK04t+6TfUIYHPxH+c6F2zX4NB8zwybIhl4xbm3XTPa9vaOaYq1mh991ORAlcr
	Bxi6Pi6p+yVC1jAPSCqxdu0W5lc2wkojF79ZhiQp9gxnJFHs9PZYvxum/oWtvMb1YZzUgmdx0teuR
	SP9jrfMrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKPJy-009lCK-AV; Thu, 11 Mar 2021 17:42:02 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKPJk-009lAZ-9e; Thu, 11 Mar 2021 17:41:50 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lKPJc-00AOPZ-Fp; Thu, 11 Mar 2021 18:41:40 +0100
Date: Thu, 11 Mar 2021 18:41:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next,v2 1/3] net: dsa: mt7530: setup core clock even
 in TRGMII mode
Message-ID: <YEpWVAnYLkytpIWB@lunn.ch>
References: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_174148_453683_18874EAD 
X-CRM114-Status: GOOD (  11.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 10, 2021 at 06:09:52PM -0800, Ilya Lipnitskiy wrote:
> A recent change to MIPS ralink reset logic made it so mt7530 actually
> resets the switch on platforms such as mt7621 (where bit 2 is the reset
> line for the switch). That exposed an issue where the switch would not
> function properly in TRGMII mode after a reset.
> 
> Reconfigure core clock in TRGMII mode to fix the issue.
> 
> Tested on Ubiquiti ER-X (MT7621) with TRGMII mode enabled.

Please don't submit the same patch to net and net-next.  Anything
which is accepted into net, will get merged into net-next about a week
later. If your other two patches depend on this patch, you need to
wait for the merge to happen, then submit them.

	  Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
