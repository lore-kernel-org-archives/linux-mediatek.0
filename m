Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8968CC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXK3bax0cfz5rSkvK5+ePqNa/iax3Z0ee0GmtmgkQcE=; b=hmm/AqooLFdmvToxUEc6rj/nJr
	+xNbyNkev4RfnxKLYLLHgrv7vh51SRh1k7ovJR0gnFgrtMBydjD91Ll3INY80ieU5JkWl2hEIo3uu
	lqaWsdgz0pfFAEphfdfF38I1DfgsR7rGtvni0IN38k81X9yUDr5aUugFTirKq2A1bQnV+HozDtzCM
	5ltaRxTxwxnE+mhf2Mr46+5j+4bBTWerhroZLOTUHqASe29aKdg2O7VFcG9XtrV1S5v669qTTy+SE
	SubawxrzidLHqUvi1eHDTO0ZGr62e7EtSCyi6WfW+UWaaAjvMoGbVJPNMNV+H2g14rJWxcIT0qJAT
	ejK0Bcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6UtQ-0079jq-1C;
	Fri, 24 Nov 2023 12:02:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6UtM-0079dV-2R;
	Fri, 24 Nov 2023 12:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jXK3bax0cfz5rSkvK5+ePqNa/iax3Z0ee0GmtmgkQcE=; b=HfjakhJYxwThKIpbkYB7na4BGn
	09jJNyocLmM4DTc/n7jVdLxTtyi5M0lY2kAT06SQr+/haeCOIbaf72gz8L9uFnjwocQ76fYhuHpa6
	njop1sO4aVCJ+tOTlfnDnzGDUq886m8WDWpUfzjH40ooiCrl6OLI55rE8iUN99IEPwTLJ2tUJ8XBv
	WN+NNiYlDhvoeUF232CwwkcZbT8LmbkDWAiqOm3t5Zi64b7vzksL3S3kO5nfNjM0mnT1FyRUe9jjT
	P3HgWt8qLR6mZTnEJk3Pn9h6T9fzTkR6xeAlbxAUc669BqQQoMwI3RT3RM19tCezfx2c3U/83tb7V
	RJh/82gg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42224)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r6Uss-0002pP-25;
	Fri, 24 Nov 2023 12:02:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r6Usp-0007DH-It; Fri, 24 Nov 2023 12:02:07 +0000
Date: Fri, 24 Nov 2023 12:02:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <ZWCQv9oaACowJck0@shell.armlinux.org.uk>
References: <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
 <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
 <655fa905.df0a0220.49d9b.7afd@mx.google.com>
 <367c0aea-b110-4e3f-a161-59d27db11188@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367c0aea-b110-4e3f-a161-59d27db11188@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_040241_086517_FF9E9A96 
X-CRM114-Status: GOOD (  32.99  )
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

On Fri, Nov 24, 2023 at 07:49:27PM +0800, Jie Luo wrote:
> 
> 
> On 11/24/2023 3:33 AM, Christian Marangi wrote:
> > On Thu, Nov 23, 2023 at 03:57:58PM +0100, Andrew Lunn wrote:
> > > On Thu, Nov 23, 2023 at 02:35:31PM +0000, Russell King (Oracle) wrote:
> > > > On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
> > > > > > Just to be more precise qca807x can operate in 3 different mode:
> > > > > > (this is controlled by the MODE_CFG bits)
> > > > > 
> > > > > > - QSGMII: 5 copper port
> > > > > 
> > > > > 4 slots over QSGMII, plus the second SERDES is connected to the MAC
> > > > > using SGMII/1000BaseX?
> > > > > 
> > > > > > - PSGMII: 5 copper port
> > > > > 
> > > > > 5 slots over QSGMII, the second SERDES is idle?
> > > > > 
> > > > > > - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
> > > > > 
> > > > > 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
> > > > > 
> > > > > Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
> > > > > can use the second SERDES?
> > > > 
> > > > I think what would really help here is if there was an ascii table to
> > > > describe the configurations, rather than trying to put it into words.
> > > 
> > > Yes.
> > > 
> > > And also for ipq4019. We need to merge these two threads of
> > > conversation, since in the end they are probably the same driver, same
> > > device tree etc.
> > > 
> > 
> > For everyone that missed Robert response in patch 12 let me quote him
> > also here.
> > 
> > "
> > Hi Andrew,
> > I think that the description is confusing.
> > QCA807x supports 3 different modes:
> > 1. PSGMII (5 copper ports)
> > 2. PSGMII (4 copper ports + 1 combo port)
> > 3. QSGMII+SGMII
> > 
> > So, in case option 2 is selected then the combo port can also be used for
> > 1000Base-X and 100Base-FX modules or copper and it will autodetect the
> > exact media.
> > This is supported via the SFP op-s and I have been using it without issues
> > for a while.
> > 
> > I have not tested option 3 in combination with SFP to the copper
> > module so I cant
> > say whether that works.
> 
> For the option3, the last PHY works on SGMII mode, then it can't be
> used with SFP, only copper is supported in this mode.

So, from what you've written, and looking at the PDF for QCA8075:

		First Serdes mode	Second Serdes mode
Option 1	PSGMII for copper	Disabled
		ports 0-4
Option 2	PSGMII for copper	1000BASE-X / 100BASE-FX
		ports 0-4
Option 3	QSGMII for copper	SGMII for
		ports 0-3		copper port 4

In all cases, ports 0-4 have a copper (baseT/baseTx/baseTe) port
available.



This is a much easier to understand presentation than writing out a
longwinded description of the three modes. Please include the table
and the statement below the table in the commit description as that
is necessary to describe the hardware setup being addressed in these
patches.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

