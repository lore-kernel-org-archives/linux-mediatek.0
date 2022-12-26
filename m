Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C02C3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ0s4RC8ixikC2btIIdHDJkIJhgIxIMo2x6A5xpALMk=; b=25N5fJVJHROizSakvi7mo6Nj46
	mvsa8KDpvzVkSAKbbm7FerlodppEpZr3aEUGnbk7nYj1Et2Pc/84E2Y0ZnSsuUJcYPLCvkw9uREIo
	OJ16a6kszfWG0w1dcuYkrbaBpkrcjI+jUxiHoBwGxphwpFLxexZYX9e89qKVtQbn/iUlbW99n7ppn
	KQunGcVkiubkoZkv9JAD7jlCrxWoYVtLP09PfFd1GOZz0oZ7ZDNPp7/OCjJD9LyP8O6s1dYKv6vD+
	3ZZFyu+rQI8D7IrlhQTLOdtPgq4UpK217lvpbtTsbTCWgGdO4V9FtMLfmHHE6F15fYBDDRY1cKihD
	VVC1lsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9pGb-0053qb-FD; Mon, 26 Dec 2022 15:19:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9pGX-0053k0-Ns; Mon, 26 Dec 2022 15:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CJ0s4RC8ixikC2btIIdHDJkIJhgIxIMo2x6A5xpALMk=; b=5Y2X3l4ayBSYhKB92xci3QHhza
	3+rZitQO+VAVq7GdeQsfaKzvkXLi3YAd5W/LiKV+lsp1KUfeDV6auyENA1c0Dn9bJ3HvJHZsNevHg
	Gedc5W2EBEAPzoAp15tYOHjSOeFhzkiTzreplDFmPnrLOA8oLtfIpitn+TeH3i8UnUCM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1p9pG4-000VyF-Uc; Mon, 26 Dec 2022 16:19:20 +0100
Date: Mon, 26 Dec 2022 16:19:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang =?utf-8?B?KOm7hOW9qik=?= <Biao.Huang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 1/2] stmmac: dwmac-mediatek: enable 2ns delay only for
 special cases
Message-ID: <Y6m7eNdWVL3IKFj2@lunn.ch>
References: <20221223015029.24978-1-biao.huang@mediatek.com>
 <20221223015029.24978-2-biao.huang@mediatek.com>
 <Y6W4vwJHG+6PI8fd@lunn.ch>
 <4a82aa5437e496e2b65b77ef08d7897a4b23f7e5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a82aa5437e496e2b65b77ef08d7897a4b23f7e5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_071949_818249_140B74DA 
X-CRM114-Status: UNSURE (   9.31  )
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

> We don't want to restrict phy-mode to rgmii-id only, so I don't think
> we need mask RXID bit, then, User can use rgmii-rxid/-txid/-id as their
> will.

The phy-mode is a property of the board. It describes what delays are
required, in addition to what the board itself provides via extra long
lines. As such, there is no choice, it is set by physics.

How you implement those delays is then up to the MAC and PHY. 95% of
all MAC drivers simply pass phy-mode to the PHY and let the PHY add
the delays. The Renesas MAC driver is one of the exceptions, it often
adds the delays, and then passes a different phy-mode to the PHY in
order that there are not double delays.

So you can be different to everybody else, have MAC do one delay, and
the PHY do the other. Just be aware that nobody else does this, no DT
developers will expect it, etc.

Or you can just do what everybody else does and let the PHY add the
delays.

What some MACs do is implement rx-internal-delay-ps and
tx-internal-delay-ps These allow fine tuning of the delays. These are
expected to be small values, adding 10s or 100s of pico seconds. They
are not expected to be 2000ps.

    Andrew

