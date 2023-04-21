Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD5CC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 19:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhLjyN4tYEO6qiQco1Fdg6Ccp2OH168n/MpjpP46Wr4=; b=G3FZRYxmm7NOFUZjVrtuq7d6Kg
	3Q77GdZ2gFI+iibubDa6HG9vC76XgolfIxH9JkiKuPk+ZkWtbQKSGIJkVSTe2BURJlRYOF83I4u28
	kVBJVPZdGpb4yRxOXC/XXiBJZ5KGf2U8dRqHngzu3j8SVYmLxPBNDiYFK1T9vDoGULfMp0gq6wcKz
	jm32AdwI924THlgqmP5VWVMkOP9FaGZrVT1p/CvKA84Tu2MqAEzc6qHuPoeBzn9uo+YbBkEPg+lRa
	yG/KcRwsMK9KXoJP80Qbo7UL2i8rktyGvC/wUFtryZbIICtTksELK/DU4r772my8n+fTAaUaJ/MEW
	y9z8ueBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppw36-00Bgs6-24;
	Fri, 21 Apr 2023 19:04:00 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppw33-00BgrE-0T;
	Fri, 21 Apr 2023 19:03:58 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppw2m-0002mI-06;
	Fri, 21 Apr 2023 21:03:40 +0200
Date: Fri, 21 Apr 2023 20:03:37 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [RFC PATCH net-next 08/22] net: dsa: mt7530: change
 p{5,6}_interface to p{5,6}_configured
Message-ID: <ZELeCYZ0_eHTKFF_@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-9-arinc.unal@arinc9.com>
 <ZELH2RlYLPjJGx6Y@makrotopia.org>
 <810aa47b-7007-7d53-9a23-c2d17d43d8a8@arinc9.com>
 <f1c38c13-a1f6-93d8-90ae-4ea3f7e06dc2@arinc9.com>
 <235c80fc-3f1b-a9c9-6364-6f50ee45b21b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <235c80fc-3f1b-a9c9-6364-6f50ee45b21b@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_120357_179926_DB77208E 
X-CRM114-Status: GOOD (  37.43  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 21, 2023 at 09:25:39PM +0300, Arınç ÜNAL wrote:
> 
> 
> On 21.04.2023 21:20, Arınç ÜNAL wrote:
> > On 21.04.2023 21:17, Arınç ÜNAL wrote:
> > > On 21.04.2023 20:28, Daniel Golle wrote:
> > > > On Fri, Apr 21, 2023 at 05:36:34PM +0300, arinc9.unal@gmail.com wrote:
> > > > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > > > 
> > > > > The idea of p5_interface and p6_interface pointers is to prevent
> > > > > mt753x_mac_config() from running twice for MT7531, as it's
> > > > > already run with
> > > > > mt753x_cpu_port_enable() from mt7531_setup_common(), if the
> > > > > port is used as
> > > > > a CPU port.
> > > > > 
> > > > > Change p5_interface and p6_interface to p5_configured and
> > > > > p6_configured.
> > > > > Make them boolean.
> > > > > 
> > > > > Do not set them for any other reason.
> > > > > 
> > > > > The priv->p5_intf_sel check is useless as in this code path,
> > > > > it will always
> > > > > be P5_INTF_SEL_GMAC5.
> > > > > 
> > > > > There was also no need to set priv->p5_interface and
> > > > > priv->p6_interface to
> > > > > PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup()
> > > > > as they would
> > > > > already be set to that when "priv" is allocated. The
> > > > > pointers were of the
> > > > > phy_interface_t enumeration type, and the first element of the enum is
> > > > > PHY_INTERFACE_MODE_NA. There was nothing in between that
> > > > > would change this
> > > > > beforehand.
> > > > > 
> > > > > Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > > 
> > > > NACK. This assumes that a user port is configured exactly once.
> > > > However, interface mode may change because of mode-changing PHYs (e.g.
> > > > often using Cisco SGMII for 10M/100M/1000M but using 2500Base-X for
> > > > 2500M, ie. depending on actual link speed).
> > > > 
> > > > Also when using SFP modules (which can be hotplugged) the interface
> > > > mode may change after initially setting up the driver, e.g. when SFP
> > > > driver is loaded or a module is plugged or replaced.
> > > 
> > > I'm not sure I understand. pX_configured would be set to true only
> > > when the port is used as a CPU port. mt753x_mac_config() should run
> > > for user or DSA ports more than once, if needed.
> > 
> > Looking at this again, once pX_interface is true, the check will prevent
> > even user or DSA ports to be configured again. What about setting
> > pX_interface to false after mt753x_mac_config() is run?
> 
> On a third thought, pX_interface will never be true for the port if it's a
> user or DSA port so this should not be a problem at all.

I also followed the individual codepaths and conclude that you are
right. I've also tested this by now on several boards with MT753x,
incl. BPi-R3 and SerDes interface mode switching is anyway handled in
the PCS driver (I should have rembered that...)

Hence
Acked-by: Daniel Golle <daniel@makrotopia.org>

> 
> Arınç

