Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304FDCDD1A9
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 19:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfnpayxvbHckI5Fb2Y/Fma2x8Bi6li2C2F98JErB9oA=; b=lXixdle7/IYlybiXYGU+CjnL5D
	osukSIEUGl6Ozuc9c19mWjxyGCmjSwwTI+uOKJ1N4P+JAO8gXgwevynv3Xt7yHERwIMJWLKBg4LeM
	3IdoDJC+EErAIvc1q806ifg612H7zVGcfoiq8JMenOHvEZQhZJAivFvrYKb6LU2Ii4iVWlTAmi9Ho
	ATEGb5ImGFWPe7jTV1OUMWi2ugM3SYybyIrbWa0Iaagx08tTsuR1SbwtZ7G8KQE/EU3todzZ+0RGU
	ttfyvANV9dH+KhQTwm16s03eROUCvbZxrkOSi5oNRQwVBJUuGinnYzKtGFsBiueeYoAKsNvpzyJpc
	KyOLXPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svLkm-00000000asj-0FLl;
	Mon, 30 Sep 2024 19:08:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svLjU-00000000akQ-0qit;
	Mon, 30 Sep 2024 19:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xfnpayxvbHckI5Fb2Y/Fma2x8Bi6li2C2F98JErB9oA=; b=oG00S9anb4B/Y+eAgvLpBarUcE
	jBX8kYNPUYiG+pwbkF6olY3nsudc6v/1QqGfkI6MB6Z3iELQtrjwSJlsMsy/kjdnoQQid7xcvMV5B
	Qn2P9o7vYjbz0YYJ49injjViejgSeXO+4Nxhr104bPjtEyli2PYbsZtix8eZ1NYUlMPE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1svLj4-008ehw-Dg; Mon, 30 Sep 2024 21:06:30 +0200
Date: Mon, 30 Sep 2024 21:06:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] [net,v2] net: wwan: t7xx: add
 PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Message-ID: <e2f390c7-4d58-47fb-ba86-b1e5ccd6e546@lunn.ch>
References: <20240930031624.2116592-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930031624.2116592-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_120656_260256_D6AD459F 
X-CRM114-Status: UNSURE (   9.19  )
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

On Mon, Sep 30, 2024 at 11:16:24AM +0800, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of Dell DW5933e,
> Add a new auto suspend time for Dell DW5933e.

Please don't send new versions of a patch within 24 hours.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#netdev-faq

You commit message is not very good. What makes this machine special?
What is wrong with the current code? Do you have any benchmark data to
show the improvement?

     Andrew

