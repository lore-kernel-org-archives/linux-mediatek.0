Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B87DE77188
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmaTD/Jckx/cv6eB5OjO9YLAVZkasrIkzAuDIUAig9Y=; b=Znpn4/nOk7KepmOE3pWsxnXagA
	SIjRoTGNObc4+YPnImpW0xmxsWdTN1R4RKRI9n1Kd+zpH7ruvonKxUSobaTX2zcL0qTo2hyQVoWDQ
	uOMj0IZFXWdGzLhmPzXSAtpLTLU5T7vrnZl+l14R6jccdiMDk1/MElNjJ5RrOgI+iro7LI7QBXQcd
	Ap3bM19SXech+g1q7Ys1DPBsHDyWxYS5VqWjnJoMvqZMPzgjhh3e1tmQYHDnrN/WPX9u4HOkxYzBU
	1SHzcG58a/PqcOMpkN/vmJOcRnSgz/1+ufhLFhaIobNRdK6+Y1GtJZkzaEo1ILDlRRbhVnXdBikaZ
	wrhpmWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKOb-0000000AMB9-44xt;
	Thu, 02 Jan 2025 12:33:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKNP-0000000AM62-1Yyt;
	Thu, 02 Jan 2025 12:32:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tTKNI-000000007GL-0FWk;
	Thu, 02 Jan 2025 12:32:28 +0000
Date: Thu, 2 Jan 2025 12:32:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <Z3aHUYOxCEGf9S_H@pidgin.makrotopia.org>
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
 <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
 <e1e271e3-b684-46d2-879d-e3481d25a712@gmail.com>
 <Z3ZVYeT0vD85Srsd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3ZVYeT0vD85Srsd@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_043235_420849_F1496692 
X-CRM114-Status: GOOD (  24.21  )
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

On Thu, Jan 02, 2025 at 08:59:13AM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 17, 2024 at 08:49:58AM +0100, Eric Woudstra wrote:
> > On 12/5/24 10:42 AM, Russell King (Oracle) wrote:
> > > Report the PCS in-band capabilities to phylink for the LynxI PCS.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> > > ---
> > >  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > > index 4f63abe638c4..7de804535229 100644
> > > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > > @@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
> > >  	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
> > >  }
> > >  
> > > +static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
> > > +					      phy_interface_t interface)
> > > +{
> > > +	switch (interface) {
> > > +	case PHY_INTERFACE_MODE_1000BASEX:
> > > +	case PHY_INTERFACE_MODE_2500BASEX:
> > 
> > Isn't this the place now where to report to phylink, that this PCS does
> > not support in-band at 2500base-x?
> 
> No - look at the arguments to this function. What arguments would this
> function make a decision whether in-band is supported in any interface
> mode?
> 
> The correct place is the .pcs_inband_caps(), which from reading the
> code, I understood that in-band can be used at 2500base-X with this
> PCS. See
> https://patch.msgid.link/E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk
> which was merged at the beginning of December, and if you are correct,
> the patch was wrong.

Yes, that patch was wrong. Neither is QSGMII supported at all by the
LynxI hardware, nor can in-band-status be used in 2500Base-X mode.
I will send a patch to fix that.


