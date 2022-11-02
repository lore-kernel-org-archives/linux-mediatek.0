Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75754C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 00:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWk9XVbEvlPQhcbuvs8Zhj5ryFiUIaTsLcKMHnwr2tk=; b=LzNUDpNAslFiBnHEiao/zSN43D
	vJ8SBCCfMHdBJC8fxLD32Tk67Uk7qe4WiJP85VyyIw5aoZEIjmkKuWtOe5ZPyP0sZIv1HQuJiiN2U
	jwieFnhvyq39B9OPjfuFeLH9pEmrKKlIwR1PqwcyVL7IiSPdqPT3j0Bogj3FqC+YaulaH94Ljt7xQ
	bSLzD80UdWKXdDuOn+n4JOphwi8rV6klAZPGGwUH+j7JYSFiHScrJMoL+Pw1FQkEF42ECcMGsDm7w
	lqy8kZgx9YqWBif7CCfzccqX9+xs12i0dpNqz/+GVLmcZJO3RyQ2P6gH9k//vaODUsnxeldFq98cR
	eBgj93vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq1z2-007ohq-MO; Wed, 02 Nov 2022 00:51:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq1ys-007ofn-6I; Wed, 02 Nov 2022 00:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NWk9XVbEvlPQhcbuvs8Zhj5ryFiUIaTsLcKMHnwr2tk=; b=O48gEHf8cG8YQ540qN5Nww6sFA
	jUeLbaPO9G9hI90U4tJNCRh+qYd5/5ZPO7dmufPlDqI36GfrQcSiX/jaL6FcR7iJ9PiELs+JNhuO+
	yE1OvCy9G0ebH69z3tY/7BMpa8vOcneDleBvE54LzpFxLH2GErH6gDljVgK0bC+eiqUI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oq1yT-0019Ys-Vi; Wed, 02 Nov 2022 01:51:21 +0100
Date: Wed, 2 Nov 2022 01:51:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: ethernet: mediatek: ppe: add support for flow
 accounting
Message-ID: <Y2G/CaPrTVsYeGWB@lunn.ch>
References: <Y2G9ANkdaaENNnOd@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2G9ANkdaaENNnOd@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_175146_252239_C72DFFA4 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed, Nov 02, 2022 at 12:42:40AM +0000, Daniel Golle wrote:
> The PPE units found in MT7622 and newer support packet and byte
> accounting of hw-offloaded flows. Add support for reading those
> counters as found in MediaTek's SDK[1].
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Sorry, but NACK.

You have not explained why doing this correctly via ethtool -S cannot
be done. debugfs is a vendor crap way of doing this.

   Andrew

