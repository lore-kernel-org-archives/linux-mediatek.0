Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FA2EE57E4
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXnhsorUHK5Bf5MDGsHtvKrSDEvw0CRZTu4ZdbI4RRA=; b=O8NpXxb3ZyAp8WOyoDJUIPjtNh
	mgcpdKsoCbcaKlNlU7Puy45ZNUnJydLDLDhu6xLoJIx6z6AgZuHtAAqz1IQUXVjWzMFMSpD94RqLi
	vJTdkM/ZtZRbWtJ3gVTO3k95bjMsnf6dRK2ITdXci294UxH3RDxfQYIbbbGESmKvU9Lug1dp0I6g/
	tMZxUSgnS9RrClc2eiYcBhitFVb8+fkYEtMax/Iau0PB0xlSaqKfrjvUQBLke35CNbCdV8D1HV2ij
	QpwyDpQYm7cJaOyH9OcOuvcXuubokwzW8vhi375NCnGZQYVCggQKig74dYNzIr8lj0UnyVI38t8vG
	BnNEmcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeX2H-00DKma-2P;
	Fri, 08 Sep 2023 08:40:17 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeX2D-00DKll-1U;
	Fri, 08 Sep 2023 08:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VXnhsorUHK5Bf5MDGsHtvKrSDEvw0CRZTu4ZdbI4RRA=; b=vfF7vs85iyrVRu/FjEGzcFMQ+w
	yBlIpvaSAxF6F+FTBO02CmBnUp/KXRXkVTmz2xzwgwwB7UDdiB2Hxdy32TIarFJKuvzem3AeRbelM
	LhiSNZXoNYfTWUnj+d8PCTkg7p8mzeaBM3LnCui838zR4QAc8PpeH6v1rDDWIbDBxtZrhQoCYYQZK
	/HRgerpP8/fhPTQT6mX4akDaDnH/3HkZoITL2XCR1rDKIF1BKqbRi7SDALO8ycQ57VEO8GPaCa2I7
	LbyySbBkGk6V+xlR2B69Tn8f2PxNoiUn7QZpmurkGSsLg/FwEcjWTAQWPtjXuZwIhWpHEF7epdFvt
	ZmVQFTCA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35414)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qeX1r-0004kU-0Z;
	Fri, 08 Sep 2023 09:39:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qeX1m-0006kZ-Tw; Fri, 08 Sep 2023 09:39:46 +0100
Date: Fri, 8 Sep 2023 09:39:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Hangyu Hua <hbh25y@gmail.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mw@semihalf.com, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com, nelson.chang@mediatek.com,
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] net: ethernet: mvpp2_main: fix possible OOB write
 in mvpp2_ethtool_get_rxnfc()
Message-ID: <ZPrd0madH5Z+Ptve@shell.armlinux.org.uk>
References: <20230908061950.20287-1-hbh25y@gmail.com>
 <20230908061950.20287-3-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908061950.20287-3-hbh25y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_014013_501035_CE0FDC93 
X-CRM114-Status: UNSURE (   8.20  )
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

On Fri, Sep 08, 2023 at 02:19:49PM +0800, Hangyu Hua wrote:
> rules is allocated in ethtool_get_rxnfc and the size is determined by
> rule_cnt from user space. So rule_cnt needs to be check before using
> rules to avoid OOB writing or NULL pointer dereference.
> 
> Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

