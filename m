Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAED0C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/7BhUFOLEFg63ackGozBt7/egbQJCdzavg0WynPGE4=; b=O74KjzoBQHAeDOs0rfbznDXlel
	5Q3/ShVOAsEHnx8PQSPI4rtYT0pQzyXQw+uoihCU+zcUaLWTTjmn8OzoJK71hK0DTHGRAV5kjti5F
	KNY/cqnFMJ70Fbh3nJkQH5WV4Ge//8B51fo//wJcN0+glPRf+hsmHrFSzuGIsG0ypT3ATdxAB6kYU
	kSdEDd9qEX43L3fxEgrbKCd/zuAB1qXhLc7J2NHSuBJVAIUVWYGha3MI3fTGSx4XuSpotuXJ3pZJs
	rKTLdE9uwTfrWXTJXUpTdPV7c5FaxD7tYcZecyg7F9nHf/IfTvBPVr5SvYccCIjjybHeHzYd1Z7OR
	CZrHfGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamUq-00GkGO-Ta; Fri, 10 Mar 2023 23:50:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamUf-00GkBZ-7h; Fri, 10 Mar 2023 23:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8/7BhUFOLEFg63ackGozBt7/egbQJCdzavg0WynPGE4=; b=mLZ3x6YQ2r6fnqslk59NjraeHR
	Qva7B+nAA1CH2VG44/u06kiWAC8aoyQwdNGIsezbFq0cu5oDL/Z431uV3qQhcG2JIbEjuiy4uCLTY
	eufKXWnoLiJSWufyCMNyLyCpmZMlgs6RTbTUMxNH30erOpKm36XoyVpTk2qvvmhpcoUo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pamTv-0071Qo-BW; Sat, 11 Mar 2023 00:49:03 +0100
Date: Sat, 11 Mar 2023 00:49:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Michael Walle <michael@walle.cc>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-aspeed@lists.ozlabs.org,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
References: <20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_154949_289475_B0ED9471 
X-CRM114-Status: UNSURE (   8.02  )
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

> Yes, that helps. Primarily, because mdiobus_scan_bus_c45 now is called only once,
> and at least some things are done in parallel.

Great. Could you cook up a proper patch and submit it?

> (Still, ~2s waiting for the C45 scan to complete).

The number of times it polled for the bit is somewhat high. The silly
thing here is, you are doing MDIO over MDIO. The inner MDIO bus should
be just as fast as the outer MDIO bus, both around 2.5MHz. So i don't
see why it should need to loop more than once waiting for the inner
MDIO to complete..

     Andrew

