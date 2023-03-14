Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88147C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 23:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQPhhNBlCS6fcUFwNOTfLKKm1TR9Z5ixAZW9T52AJ9g=; b=HV+4NoqxP2CXebSH9YDCORhi8C
	e0Ekubey5ubCXTzuRKQTqchgq2MGYDYDrDR9BudLYWUhmCoLiqDdRd4tbUicz77MAI43vel2JhSgk
	KI7KRIK9qekk4NxUO4zCdQIq+1YNnbGzCEktGVqs2HFi7eQTI9flVcsNxFbxvCik5rkoZ8fqZLZox
	gTtPBgvnlnS4Oz+Hd/TF14MosKNVU6ZAuc+6iNTwM2VlmDvv61EVPTwQL+4LjbNMcODpqVjvPE4ra
	rWUluzdsnb05u5vR7ImHtIftX9EqQMmcy6lcd4gSZVbOXXwPpBThEaLfMK7JeyirNnxSV23OZmbiJ
	5Pvajxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDqg-00BlX3-23;
	Tue, 14 Mar 2023 23:14:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDqb-00BlK3-37;
	Tue, 14 Mar 2023 23:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tQPhhNBlCS6fcUFwNOTfLKKm1TR9Z5ixAZW9T52AJ9g=; b=XTCf5LQ0AL2PtBceVjBzHBzMcP
	9uuW7FreifwFbq8YHCPpuji3oM4j4FmJIJx29DCbDAuB+04bEKMhtugeaPkXyAkjYudnhr7kUpED8
	dbwCop4pHOB9gYbpg8ln1cb1Jx2Ywj5FUTqlyYf60G1x1DN1LM9eng93KlWv8VfFDeuYygXeDQQYg
	Qjul8HmNHC0fZQMj4WUISJngU8ou23L2wEAUzKjOUiVlfvK9PuNBw+oV7YCUukHJyn2IQKkl4ayD+
	AYVlgZ5o2SQGGb+nKMNN2loOlOP1WYbqcj/L1bUX9cR9p2qGgMsLgxrPrGQMzTs968mGhTw+3mPs/
	9KNtqAWA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57834)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pcDoM-00065K-4C; Tue, 14 Mar 2023 23:12:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pcDoE-0000m1-Qn; Tue, 14 Mar 2023 23:11:58 +0000
Date: Tue, 14 Mar 2023 23:11:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
Message-ID: <ZBD/PrMM7vxae5gY@shell.armlinux.org.uk>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
 <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
 <ZBCyqdfaeF/q8oZr@makrotopia.org>
 <c07651cd-27b4-5ba4-8116-398522327d27@arinc9.com>
 <20230314195322.tsciinumrxtw64o5@skbuf>
 <3e3e6a1e-61ba-a6e8-5503-258fb8e949bb@arinc9.com>
 <20230314223413.velxur7gi7snpdei@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314223413.velxur7gi7snpdei@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_161426_026342_B797724B 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 15, 2023 at 12:34:13AM +0200, Vladimir Oltean wrote:
> But the mt7530 maintainers have gone
> pretty silent as of late, and I, as a fallback maintainer with no
> hardware, have had to send 2 bug fixes to the mt7530 and 1 to the
> mtk_eth_soc driver in the past month, to address the reports.

That's an under-statement, and not just the DSA driver, but the
ethernet driver too. It's been years trying to get the attention
of anyone to sort out the pre-March 2020 crud in this driver, and
no one seems to care, and none of the alleged maintainers bother
replying.

I don't believe anyone who claims to be a maintainer for either the
DSA or Ethernet driver has commented on any of my patches or provided
any review.

In my mind, these drivers do not have maintainers.

What I have to resort to is spotting potential victims^wtesters on
the mailing lists to try stuff out for me - which is really not
how this should work.

It seems to me that this is the old "chuck code over the wall into
mainline, then do a runner" approach to kernel maintenance.

So, honestly, the sooner these drivers get proper maintainers, the
better - and if someone wants to step up to do that amongst those
who are involved in the current work, I'm all for that - it would
be a hell of a lot better than the current situation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

