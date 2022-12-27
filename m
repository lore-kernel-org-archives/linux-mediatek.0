Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmv9qJfBtcw5jcK3wWiJ1+zfAYgavU3BfZcZHM2JKLM=; b=lOlAH363Z0wvxvVWe/7tdW9zNj
	Uj2kNaEGgX38NSM7L7LXhC2q/LumP1o2ecJgbyp8ilcXJBeHnpNsV3mVgXMHkMFFI3OyBzQPIatU9
	p1rXQc/NxLm72uN4oTxb6JALPXjuFzD+oEMM1RUisj2pmURWUBtgzz1KImsV43yh7LNp77AGceyHc
	oNW21YID6F/SXi4nUHAeM8nymZizGYoK86bVCjTPHpBlJJ8mmWotqcrVZhTGWpB3nxFD5NyDWlO7D
	dhubnw1RUfVlAv29eQbJx68xto7aTlm+ompPuDjmjUEl25JCnqQGkHgktGgLtSguFSn/tAaCrjIox
	O5PKZJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAChC-00ER95-PI; Tue, 27 Dec 2022 16:20:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pACh9-00ER6I-4g; Tue, 27 Dec 2022 16:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qmv9qJfBtcw5jcK3wWiJ1+zfAYgavU3BfZcZHM2JKLM=; b=P1rEhehbRarbBagJWTp7m71NhN
	Fq5DHFjdxctaBx1bZ7UrnFoPAzDRGpZ3qABcrc3Ts4FnY5KDPG8GM0QAIPpMyvEZoKRiX6xCE9hYo
	iIuc5CcYHBr1GA3PkDLAtFTNMvKnJ6vPS/mnS3KNj2qRcQn9xqFR0BMWo/mRLarCy6IU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pACge-000a1a-RI; Tue, 27 Dec 2022 17:20:20 +0100
Date: Tue, 27 Dec 2022 17:20:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang =?utf-8?B?KOm7hOW9qik=?= <Biao.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>,
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
Message-ID: <Y6sbRPbDDzeGbkM+@lunn.ch>
References: <20221223015029.24978-1-biao.huang@mediatek.com>
 <20221223015029.24978-2-biao.huang@mediatek.com>
 <Y6W4vwJHG+6PI8fd@lunn.ch>
 <4a82aa5437e496e2b65b77ef08d7897a4b23f7e5.camel@mediatek.com>
 <Y6m7eNdWVL3IKFj2@lunn.ch>
 <5baa7c88716042421b0dd1d579c6aa70d253a546.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5baa7c88716042421b0dd1d579c6aa70d253a546.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_082051_696740_1D64A436 
X-CRM114-Status: UNSURE (   5.31  )
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

> OK, as to this series, Is the following modification enough?
>     1. phy-mode = rgmii-id;  in dts.
>     2. remove the fix_mac_speed() in driver.

Yep, that is good.

     Andrew

