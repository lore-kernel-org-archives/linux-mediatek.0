Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37745C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 13:18:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B0E613AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 13:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B0E613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RVc5C2y6wfsO79rYbM3omhuVaqi7TYg0i8lbVMp6KJs=; b=pQ8habExD4Egr2j+BMiuYi/EH
	OnkAe4R8B309Uq6Qgpft3kC0KIt+qGUkWRxagDqChpvdf/8FLZZZ7MLoqGA1Llp43UVI1XvM7U63/
	+T9Xe7c7APdJqkI8IMCr5IjPNfGZ8lZ+lGB0jyzHzW+xa3xxFF/B7UUqrZ4xVDbC+0AEplcXEaEkL
	oQtP5sAPM+g2kZ4fB2u0w2t65lUxvdnjeX9Glm4CwDclXo9xX74ZnZwk+e5QGpF+rEY8suc8ruCxj
	px1sRX/gWdviUuI5E8Gd5tms+g0eXvSTFy6+k9I87NftdYfZU6lq6L84J8OAv838QRzDbB8OrAD01
	u/ChItsIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWIvx-009LrI-Jr; Tue, 13 Apr 2021 13:18:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIuB-009LeL-3S
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 13:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=foqwV3LZUmXDdTNvR/fFhNELYb8TFDLpg4frq5Uu1wk=; b=TcH3fwO3SFxCEQGBu4+dtpbBZe
 57NNJDR4TdAwH2t857sc7PG8J4qGYIx4yPgJJjVYJvr+QJMxtq1VGr/Nu840AmCtZYPnS1bg4gy1d
 wxEUkai5zojS/OAyF3AGeshviGGcF+rXNmT5bVYXojUvcrE0vwpgJv9c/SjAsBQfLo+Z6vqdCZ1Kh
 tImhLdjwy+0vtjqke8afGQ4tKewQcCRrFa5iFUmnjbFqdfjG7NHZB5YmDtx+f3LcTCfZJQYcU2dRF
 M9K8jBGF3TNI4GiyuLBeWg6Oek4s8u2KB9fcgurVM3Wyqg8q50zu1NZcr63zDLDOzCpP6TCQfoBeR
 ha4df8VA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIu7-0073EL-0k
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 13:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=foqwV3LZUmXDdTNvR/fFhNELYb8TFDLpg4frq5Uu1wk=; b=Xz7TLVrDwoJr2Cf66bWhzW9QF
 WHeOD48tHgtmtJk98kZpCQKsC+wsS/ghnnNOG2pqGpJDSVT+X7IE2lW9nkVYitr5RvEn/YC9lAcSF
 3fkkNFcK+/1/ejCVlMPSv6NwXApaRWKB7/tcQAYK5nr08To45hIbHKQ6eTRDPAlgnh+wsGnRonNJc
 DpkEELgHFLqgQLZZIzDLi0C+ouDYh7wie83lmDRV+BSbkWNWYQWXEjRKUSSK2zGkWCxAUDVLFQ8QA
 3TQBXvDShIj0lAs2MrLgQOb92QuASnVXgR4SiZ1/4wK0Y/SmlAV9yrw45LVpcgL37easz1L2K5d6P
 trRRwq7dw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52380)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lWIqn-0005fZ-L0; Tue, 13 Apr 2021 14:13:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lWIqh-0008DM-Rt; Tue, 13 Apr 2021 14:12:59 +0100
Date: Tue, 13 Apr 2021 14:12:59 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>
Cc: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
Message-ID: <20210413131259.GP1463@shell.armlinux.org.uk>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
 <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
 <20210412150836.929610-1-dqfext@gmail.com>
 <20210413035920.1422364-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413035920.1422364-1-dqfext@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_061631_077613_B1D4E766 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 13, 2021 at 11:59:20AM +0800, DENG Qingfang wrote:
> Within 12 hours, I got some spontaneous link down/ups when EEE is enabled:
> 
> [16334.236233] mt7530 mdio-bus:1f wan: Link is Down
> [16334.241340] br-lan: port 3(wan) entered disabled state
> [16337.355988] mt7530 mdio-bus:1f wan: Link is Up - 1Gbps/Full - flow control rx/tx
> [16337.363468] br-lan: port 3(wan) entered blocking state
> [16337.368638] br-lan: port 3(wan) entered forwarding state
> 
> The cable is a 30m Cat.6 and never has such issue when EEE is disabled.
> Perhaps WAKEUP_TIME_1000/100 or some PHY registers need to be fine-tuned,
> but for now I think it should be disabled by default.

Experience with Atheros AR8035 which has a very similar issue would
suggest that before resorting to the blunt hammer of disabling
SmartEEE, one should definitely experiment with the 1G Tw settings.

Using 24us for 1G speeds on AR8035 helps a great deal, whereas the PHY
defaults to 17us for 1G and 23us for 100M.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
