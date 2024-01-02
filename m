Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF61EC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTWK/uZV1kkx8JdNSuAByCvLyhYTn0JHSMyI9KBhW58=; b=ZHBFNyMuiBcX/66TG0GmDUI7kb
	uouK1Rok/tL2eUOJmBM5gswNMcGs3WZe3TBniArOc/PWj5HKz/jt/6cDVq8vyS6RTtvDK5aF6G5g+
	7/PJ2ocfndGAn/GKgW6WKyl8RXYJn45psldO2eBTdq4Uhfyl2tPPwKLkpWzURhwPyV9Hs3nnYIS3d
	SmF5DJh+yO95A/98CtRzAocdL1YyVev4RAOadkgbt5JdJhOce8xBWc4pNqlmfWhcNshs2hPn+j+QF
	KhAZ2yNSyZ5yqPex8mFKoncHTYo7btK3ZdMxo9zQ/+Gj+qPjYgehE8M2dXw+bJAHmRDtf9Jbr4nzt
	thIsGkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKnxU-009HR3-24;
	Tue, 02 Jan 2024 23:14:04 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKnxQ-009HPh-2f;
	Tue, 02 Jan 2024 23:14:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rKnx0-0001EK-1z;
	Tue, 02 Jan 2024 23:13:35 +0000
Date: Wed, 3 Jan 2024 00:10:54 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC net-next] net: pcs: pcs-mtk-lynxi fix
 mtk_pcs_lynxi_get_state() for 2500base-x
Message-ID: <ZZSX_oNUIQr6R9FU@pidgin.makrotopia.org>
References: <20240102074408.1049203-1-ericwouds@gmail.com>
 <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
 <92190426-3614-4774-9E9F-18F121622788@gmail.com>
 <74223164-ab50-4d6d-a4f4-561b0a70d396@gmail.com>
 <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org>
 <6666EB36-984E-4898-A41A-2D9713DE4DB0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6666EB36-984E-4898-A41A-2D9713DE4DB0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_151400_867400_0F49F504 
X-CRM114-Status: GOOD (  17.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 02, 2024 at 11:13:58PM +0100, Eric Woudstra wrote:
> I believe the general idea is that phylink should be aware wether to use inband or outband negotiation in order to setup the hardware correctly. Speaking of a situation where there is a PHY attached.

Well, SGMII speed/duplex AN is not defined for 2500Base-X by any
standard and not supported by the hardware (unlike e.g. RealTek
which came up with their own proprietary extension called HiSGMII).

So we should simply never set the SGMII_SPEED_DUPLEX_AN bit if using
2500Base-X on MediaTek LynxI PCS -- in-band link status will still work,
and as 2500Base-X anyway only supports 2500M speed at full duplex it is
not a problem that speed and duplex are hard-coded in the driver in this
case imho. And that works fine for SFPs with and without
present/discoverable/accessible PHY.

Surely, having phylink take care whether SGMII_SPEED_DUPLEX_AN should be
set would be even nicer.

I believe that source of confusion here is simply that

in-band-status != SGMII_SPEED_DUPLEX_AN

We *do* have in-band-status even without having SGMII_SPEED_DUPLEX_AN set
with 2500Base-X link mode (as in: link being up or down and link, duplex
and speed is fixed anyway for 2500Base-X).


> 
> On January 2, 2024 9:01:23 PM GMT+01:00, Daniel Golle <daniel@makrotopia.org> wrote:
> >On Tue, Jan 02, 2024 at 08:33:32PM +0100, Eric Woudstra wrote:
> >> [...]
> >> 
> >> So if phylink_mii_c22_pcs_decode_state() should not set the speed, then it is not correctly set somewhere else.
> >
> >Yes, but the fix should go to pcs-mtk-lynxi.c and you don't need to
> >change phylink for it to work.
> >This should be enough:
> >https://patchwork.kernel.org/project/netdevbpf/patch/091e466912f1333bb76d23e95dc6019c9b71645f.1699565880.git.daniel@makrotopia.org/
> >

