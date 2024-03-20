Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CEC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3hah0VF3NuI3zxNyk+AIvcTPzt/CGCx8sXbYOztIEc=; b=AYYq0EwpBx1shERLoLin45/Fz4
	N+o2JgPgtma8RwCiZN7SP5baGUwZUDdPq+ZB3hnadqc2nRgw9mDX01D5nA+RIgSWfNjOb3MB8w731
	FSFFjODOfdfKOxBnhJtTTk5nboYIDg1m1fmRRec8O+1ASc9VqRoIJ56NlrfsKcq11rr5URxkfY2ix
	STeEYCDVelNhzrHLb2o7qjax/ILHtErzduupthcynCI0NIfMDPVSPQVKoNH9SPVjDohFvcdbAdKBK
	YFEDxWrW+AfbuB/KP5MKX1aUzfQ0uG5iUZwGEyIGEXJRZ4FmuIEFt6cPa6gbye9o18BzmLl99MtKP
	j1xqvucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2x0-00000000xRa-2oux;
	Wed, 20 Mar 2024 20:54:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2wx-00000000xQb-035q;
	Wed, 20 Mar 2024 20:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m3hah0VF3NuI3zxNyk+AIvcTPzt/CGCx8sXbYOztIEc=; b=jQptVRcaF1M/OvF8SdX5NTowuO
	dpufXaBGQkvFQQB8JCvtzPsaXmwTLiKNVCH8bdDvzjeFmUcGL3iDaG3U2O0wAMtlxxECD1jWS260Z
	0ECiVcRX/NaNtrxetJ5rQX59JtTUeJqpagHqsGp2MELPl7CwRfmlX354xeYzCMPbz72Qt9MsCjKh8
	9VEFD+OlOIHAm5BSC1cPqgeqQwQw+GTWmV9CJo5RfyOCEzq339X4mIK5mREBXr5s64nf6aOhz6F0w
	YlY0soxifFXkqVm3z7ghTXGHJfwiW/bkqeyXZCmWefkRD46GDcch/bI+dIvFof3lYDaTSJvNQYDQu
	r7b6PKfQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55412)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rn2wa-0006uN-0N;
	Wed, 20 Mar 2024 20:53:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rn2wU-0002yT-JV; Wed, 20 Mar 2024 20:53:46 +0000
Date: Wed, 20 Mar 2024 20:53:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] net: phy: mediatek-ge: do not disable EEE
 advertisement
Message-ID: <ZftM2vDYQ2+5nSRV@shell.armlinux.org.uk>
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-3-3f17226344e8@arinc9.com>
 <3698b522-d6dc-46c1-bab2-d5ee3bed1fce@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3698b522-d6dc-46c1-bab2-d5ee3bed1fce@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135415_092564_4860669A 
X-CRM114-Status: GOOD (  22.23  )
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

On Wed, Mar 20, 2024 at 11:40:56PM +0300, Arınç ÜNAL wrote:
> On 18.03.2024 10:46, Arınç ÜNAL via B4 Relay wrote:
> > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > 
> > There's no need to disable Energy-Efficient Ethernet (EEE) advertisement on
> > the MT7530 and MT7531 switch PHYs. EEE works fine on MT7530 and MT7531
> > switch PHYs. Remove the code where EEE advertisement is disabled.
> > 
> > This is a bugfix because there's a possible race condition where the
> > mediatek-ge driver would kick in after the MT7530 DSA subdriver which would
> > have EEE disabled until manually enabled.
> 
> Can I get an opinion on this? Is it actually possible that the PHY driver
> would start probing after the DSA subdriver? On the console logs for the
> DSA subdriver, I can see that the name of the PHY driver will appear, which
> makes me believe the PHY driver would actually never probe after the DSA
> subdriver.
> 
> [    4.402641] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.420392] mt7530-mdio mdio-bus:1f lan0 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.437791] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.455096] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.472422] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=POLL)
> 
> I don't want to submit a bugfix to the net tree if the bug won't ever
> happen in real life.

It would be really great if you could tell us which bug fixes you're
submitting are for a real problem that you or a user have encountered,
and which are down to essentially code inspection and things that
"aren't correct". Basically, don't do this.

It isn't true that the PHY specific driver will be probed before DSA
initialises - consider the case where the DSA driver is built-in but
the PHY specific driver is modular and on the not-yet-mounted rootfs.
That would result in the generic PHY driver being used even when the
PHY specific driver were to be loaded later - and thus only basic
standard 802.3 PHY behaviour will be supported.

That's not specific to mt7530, it applies to everything that uses
phylib. It isn't something that really warrants "bug fixing" in each
and every driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

