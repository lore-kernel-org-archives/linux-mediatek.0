Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD4EE7718B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuzBbqkS/z0WnT3EUTrIONeKqkaT9Dd7A20R0CmxM10=; b=SVEn6FfkhbY0Gb5gBnXVK0X4S6
	RGs9Q9WfGUJzc92KB4iBljtRiLsetXMwVol4u3rWlXWnlmek+NzxkMmjUiBH5gQh03SoG6yp/U5Eh
	y/oObQA7P+WTOQjTL9PtpULPlMvm+fNseuybjq2YpmgiDFX6kUAcQhaEHfa5KGU9N5WTLQtSQrCHU
	+1pYGQ8dxKjNA4x0OevhGBKayJfJ6Wa65HlcpJgaoxAE5Lyjdw3c0Eccy/lIVEEy3rC3pjW+yZc33
	uRDHiMMUCDGt81kkPGvATg8JF6kMeTUARolELvNRLxka6+63ddASSGKOoMdTjs2VFZLkjSrmW38q6
	/OGbj3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTH6d-00000009zsW-0vr8;
	Thu, 02 Jan 2025 09:03:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTH5N-00000009zNN-1Hs9;
	Thu, 02 Jan 2025 09:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GuzBbqkS/z0WnT3EUTrIONeKqkaT9Dd7A20R0CmxM10=; b=P0nQ7ipfrJ/GVTcuxDFmXS9x4S
	NBziIaeO76goIc6IjWfvMTA5jwbO59Xi916Wrp5EbRpRsILdkQuZzaEvtPsfDYAHt+Qx4q5dqhAyw
	YWhytYMHO7hFzmrw2wn+U4dF9HTI3JZ6HKMUyvmQ30iLEyRLXfBJgfBOQHHQMwTso6s4XTMMbpioR
	etfcpbA3ZEBEcSWxVgmh10/7ctaAGTg9QTJtmFikElQ4WoloRsZ8vhQZp+iY7OvNQCU+rcct2KWSp
	uj39x8c0rGcw3MDvaNOLgOMNfL4S5k5wRIia7forqgx9wRSDNk4KI95dIV8jaiyR+PdPVkzaknN7x
	Uzod0GLQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40590)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTH30-0001mb-24;
	Thu, 02 Jan 2025 08:59:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTH2v-00008E-0w;
	Thu, 02 Jan 2025 08:59:13 +0000
Date: Thu, 2 Jan 2025 08:59:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/3] net: pcs: pcs-mtk-lynxi: implement
 pcs_inband_caps() method
Message-ID: <Z3ZVYeT0vD85Srsd@shell.armlinux.org.uk>
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
 <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
 <e1e271e3-b684-46d2-879d-e3481d25a712@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1e271e3-b684-46d2-879d-e3481d25a712@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_010145_375926_DD1F409F 
X-CRM114-Status: GOOD (  20.18  )
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

On Tue, Dec 17, 2024 at 08:49:58AM +0100, Eric Woudstra wrote:
> On 12/5/24 10:42 AM, Russell King (Oracle) wrote:
> > Report the PCS in-band capabilities to phylink for the LynxI PCS.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > index 4f63abe638c4..7de804535229 100644
> > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > @@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
> >  	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
> >  }
> >  
> > +static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
> > +					      phy_interface_t interface)
> > +{
> > +	switch (interface) {
> > +	case PHY_INTERFACE_MODE_1000BASEX:
> > +	case PHY_INTERFACE_MODE_2500BASEX:
> 
> Isn't this the place now where to report to phylink, that this PCS does
> not support in-band at 2500base-x?

No - look at the arguments to this function. What arguments would this
function make a decision whether in-band is supported in any interface
mode?

The correct place is the .pcs_inband_caps(), which from reading the
code, I understood that in-band can be used at 2500base-X with this
PCS. See
https://patch.msgid.link/E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk
which was merged at the beginning of December, and if you are correct,
the patch was wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

