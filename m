Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2689C48260
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 21:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeSyT0KRwyOVIHE7b/FMS14no4aggtAsbaKosXzt7rI=; b=SosKZESDxOFywg0RVY4zEzZGHo
	cTj3HuvdiMpygAwrVKOTtufqHoOnePdFWjS5+jBS3J7hckA06oA4AUN2dLG85MIV5HMR3vJFra379
	NEX193BfR/DOtNymGhjPRMMh9lOH1gIQLXrG9jmcW1+rkTRPt1Prf7h/P86fIsk3L9VdpK73WE2XA
	EvSeTgKz0EY0zmJ+80p7L8tDqO5LLb0zEH4/Di9i5+GsG5QtWgh5t+EMEEmovRzJ/mwM6TTbN/F35
	JyF+rL0zK6THLHcjq8AqatbVi4pi4EY+imaDYTCvJfc+AA95FPdp1bF/JkqpaCS3oFIY/hgaVranm
	v0hjKcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Fr-00000001zAY-43RV;
	Thu, 25 Jan 2024 21:27:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Ff-00000001yzu-2RKQ;
	Thu, 25 Jan 2024 21:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jeSyT0KRwyOVIHE7b/FMS14no4aggtAsbaKosXzt7rI=; b=UYTOesEXnMh/Akcuh6TNOlqxno
	baBsC3gLyBnTjcCkLAH6p1sgfla8IV5mVCpEGjDsWBuV4QoAhh8nMDdpEbdGnwmRC8l0tlgp2xLyM
	Vy9t26KYxislMpLI9ZX3C7QHE969PGOTjdXS7nIMxvOOg0hYUV4VvNDf05O1IKrwF7T4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rT7FE-0067qy-5e; Thu, 25 Jan 2024 22:26:44 +0100
Date: Thu, 25 Jan 2024 22:26:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Breno Leitao <leitao@debian.org>
Cc: kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
	edumazet@google.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>, dsahern@kernel.org,
	weiwan@google.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net 08/10] net: fill in MODULE_DESCRIPTION()s for PCS
 drivers
Message-ID: <1e9528f7-d9b1-463e-bfd2-b7ae14a92ae7@lunn.ch>
References: <20240125193420.533604-1-leitao@debian.org>
 <20240125193420.533604-9-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125193420.533604-9-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_132711_666761_4114D905 
X-CRM114-Status: UNSURE (   6.16  )
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

On Thu, Jan 25, 2024 at 11:34:18AM -0800, Breno Leitao wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to the Lynx, XPCS and LynxI PCS drivers.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

