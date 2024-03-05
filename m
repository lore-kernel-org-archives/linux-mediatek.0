Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2127AC54E41
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrDqOCAVFnIywCjY1vOYOH9E3WkzoSBd6y1AwGw2QPk=; b=Zg/XTg4qJpeagXKi/iPL5QlZx5
	lZHLUwq2wm4QrluwuAPjQGIE1oMNx82jqxESsy24hPts8fUwQHvP5Ma1/+AvkW1RjJuM8QzMYO0tN
	DKua1ptzs50OxQ0o94J04D73lKUcCNjJsQXWSwSsacLQZqMyia4OviKLcE66Ubf4IhvDd/1hXqHM2
	p6raWcF6g+b2JmgTmLJaT39XztNYFScGOWX8UdzQe1rgcqXtlPpwsNSvpXys1V4SxYr8x67bwht7+
	AN2c1XmztoPhAEFB/S3A1yr+2+rpcM8pGEOhvIHAhWWwYg/D/9JK09GvtWLMx5lA5vLmK+bSGKO04
	cObPtZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhT6X-0000000DOdi-2GJV;
	Tue, 05 Mar 2024 11:37:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhT6U-0000000DOcQ-0EEP;
	Tue, 05 Mar 2024 11:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IrDqOCAVFnIywCjY1vOYOH9E3WkzoSBd6y1AwGw2QPk=; b=z70saEw0Uyr9DpMfHt0qmGvV1r
	IOgrK0UzVt4WJkKKwAMA6Z+nNottmESro61dl/j3LTnq31i1c+asqMGnwzPAvYM72RaYzTTEbC3yb
	lTUOsmvv2A3qnseBp+jV3aRZ0ZBtoU4We8+GxzKqDQtZguiRW3k53w60f8sbwQflPkz/Dj2E5bh/O
	o/gQMWYUgydc8kAI++cxof0gKS0uuMSLzTM6nhNeyQJy1J7nTLoSuBjJ+KeF7Zv8sF9hGnxj37P7H
	tct7YVX5TePcXBQ2NDbPInfBNBTBvsZiQ8DOJK287YDCFLkUml+LdV4SmIO7NyF6+oKRs5pXeoTtf
	Ux9MzmpQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43258)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rhT6J-00073t-1k;
	Tue, 05 Mar 2024 11:36:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rhT6D-0005NL-BL; Tue, 05 Mar 2024 11:36:45 +0000
Date: Tue, 5 Mar 2024 11:36:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v3 0/9] MT7530 DSA Subdriver Improvements Act III
Message-ID: <ZecDzbAMrXgMG72Z@shell.armlinux.org.uk>
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
 <81a5d191894e6a7741d3c266079f3404def2bb07.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81a5d191894e6a7741d3c266079f3404def2bb07.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_033702_123652_87D79EBB 
X-CRM114-Status: GOOD (  20.17  )
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

On Tue, Mar 05, 2024 at 12:30:20PM +0100, Paolo Abeni wrote:
> On Fri, 2024-03-01 at 12:42 +0200, Arınç ÜNAL wrote:
> > This is the third patch series with the goal of simplifying the MT7530 DSA
> > subdriver and improving support for MT7530, MT7531, and the switch on the
> > MT7988 SoC.
> > 
> > I have done a simple ping test to confirm basic communication on all switch
> > ports on MCM and standalone MT7530, and MT7531 switch with this patch
> > series applied.
> > 
> > MT7621 Unielec, MCM MT7530:
> > 
> > rgmii-only-gmac0-mt7621-unielec-u7621-06-16m.dtb
> > gmac0-and-gmac1-mt7621-unielec-u7621-06-16m.dtb
> > 
> > tftpboot 0x80008000 mips-uzImage.bin; tftpboot 0x83000000 mips-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000
> > 
> > MT7622 Bananapi, MT7531:
> > 
> > gmac0-and-gmac1-mt7622-bananapi-bpi-r64.dtb
> > 
> > tftpboot 0x40000000 arm64-Image; tftpboot 0x45000000 arm64-rootfs.cpio.uboot; tftpboot 0x4a000000 $dtb; booti 0x40000000 0x45000000 0x4a000000
> > 
> > MT7623 Bananapi, standalone MT7530:
> > 
> > rgmii-only-gmac0-mt7623n-bananapi-bpi-r2.dtb
> > gmac0-and-gmac1-mt7623n-bananapi-bpi-r2.dtb
> > 
> > tftpboot 0x80008000 arm-zImage; tftpboot 0x83000000 arm-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootz 0x80008000 0x83000000 0x83f00000
> > 
> > This patch series is the continuation of the patch series linked below.
> > 
> > https://lore.kernel.org/r/20230522121532.86610-1-arinc.unal@arinc9.com
> > 
> > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> @Russell, I see you went through some patches; my understanding is that
> there are no objection to this series in the current form. The series
> LGTM, so I'm going to apply it: I think it would a pity if it should
> miss this cycle.

That's fine - I did read through the entire series, but only gave my
r-b on the ones I felt I'd done a good enough job on. You may have
noticed I haven't submitted much network stuff this cycle... I have
limited bandwidth at the moment.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

