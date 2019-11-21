Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76E6C432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 02:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D06B20855
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 02:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLj4aiDB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Bmf7v9ba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D06B20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGhhUli22alZmvgOJpaxwuGP3XgYiKc6b7c8TP7DtLg=; b=nLj4aiDBaWzM/K
	Z3rk3zM5R8E5e/1nsm/Vb/Si3rYAk2upfXxxLw7iEDUeuL5wfM9aXR95I446dQXpLLRzdPyIBTNzq
	dm7SX+nRpkuldlR/g0kpFhqORq0Q83KLZOqHoCiIg3lcNXdikv2pWXFUSZ2TRWAo88G27J2vEgdDr
	+Y0CpZxS+tut65VEZL6O4zwr8BagqK9+mPTVjiGSsgsVOLM4MAL6uIWFM8cwI4RsbkmzGPk78wOLY
	TlWr6UAb6Fo7af7tExNgr2TgyPNXD5+zTQ6GhbDgDBZ6OUqfHvxvyMEsyalbtv9KCQHkXU9gT+Kvj
	aFURbUfkgixG++jt9PEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXc2x-0008Hw-Oz; Thu, 21 Nov 2019 02:18:15 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXc2o-0008A8-G5; Thu, 21 Nov 2019 02:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qAkKunk23IfftGddy2mr2fXtQy4avDcjS8V5azXyJbE=; b=Bmf7v9bag6lEBI4LryUMTXnfQG
 u4GCxMREmKr3MSE23XME+XmJvGhzJsmc20sNat7tD5Rpwznz1fJ+ufqHYunvbY2FxsBxFpFKQ5iK2
 bcIneYtAgt74WdlqmNIHGuvQvWli2iEk4V+KRFbsRFR3bk/l+XBGT81f/FedUI+W4+6M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1iXc2O-00071y-VP; Thu, 21 Nov 2019 03:17:40 +0100
Date: Thu, 21 Nov 2019 03:17:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [RFC PATCH net-next] net: phylink: rename mac_link_state() op to
 mac_pcs_get_state()
Message-ID: <20191121021740.GE18325@lunn.ch>
References: <E1iX2jg-0005Us-6U@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1iX2jg-0005Us-6U@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_181806_536234_DD02745C 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> This is something I'd like to do to make it clearer what phylink expects
> of this function, and that it shouldn't just read-back how the MAC was
> configured.  However, it will require some testing and review as it
> changes quite a lot, and there's some things, particularly in DSA, that
> don't seem quite right from a phylink point of view, such as messing
> with state->interface in this function.

Hi Russell

Could you have more detail about DSA issues? Do you means the 6250
setting interface to PHY_INTERFACE_MODE_NA?

I think you and i have pretty similar marvell hardware. So i don't
think i can do much additional testing. Ideally we want Florian to do
some testing on b53.

Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
