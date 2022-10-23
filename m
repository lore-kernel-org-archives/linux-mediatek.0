Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20737ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JdFeK5UqtCYSbJ/pLvnPqPwekVxocfsCax4PKOecpI=; b=R6qa4qOUwLJoIXy1gOQPt96/Nj
	XfCDv75iURnZ3IX/HyLLz294AoqvUn6jkITqiOZKje2nuWkRpIPTitMfhYKkyArDG1f6hMg3+vJnC
	AiS96nS4+4HM/BLiAQfY/yR/tg3jKKSCVRX2Lnz3Wi3ckAHv91Qp0s2JDWQYSFnH2TQ0pXioCWYnJ
	C8y6szT1Bw8TFZCbxlaepry7iAz5YjsXSTelUFFzHz2GM5Y9OTkMbQsB1Bio4Rh59P2iQp2WH469g
	PkvvL8ayOPw2sNmhskGaA0XPTXbVviIJi3H3HiEU/ybFjvY5wlhrcW8EMJ/PAWNO05I1Hnm72t999
	mkJcdsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omhIH-00G9bl-3Q; Sun, 23 Oct 2022 20:10:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omhID-00G9Zx-EF; Sun, 23 Oct 2022 20:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/JdFeK5UqtCYSbJ/pLvnPqPwekVxocfsCax4PKOecpI=; b=1SSq7k+wJpBurFDYPIDbQdlDgz
	77y4+U4FgH6oIyqAcjeDy2F22LUM24UJJDyKRwTgfd0Zlbyg9hKU5o0VNPBe8tGuOrasxyI9I4fo5
	AGIfWkDzf3IYcrmiNsTY5/vUEUl6uBKQ7yjApIfbgi3sKxbo+YtSUev2PRNJu0OySkRum4RF7hwxb
	LJXDrjrvuuFUsYKUPP4pppU6TlFIy+iWG30ThEWuNUwj1Ayj9Bhrc/olMxhiMrIWK40TACFc3RRHj
	j62ugn3OVaogAn35DnvNbGc+02VjnD9iAAOE+IDuvHPIr/eJxWFgvgkGwHtnQf1r8fQX1jqiPjwUu
	oiJJ2SPQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34916)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1omhHr-0002GD-R1; Sun, 23 Oct 2022 21:09:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1omhHf-0006NE-Ap; Sun, 23 Oct 2022 21:09:23 +0100
Date: Sun, 23 Oct 2022 21:09:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
	Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1Wfc+M/zVdw9Di3@shell.armlinux.org.uk>
References: <trinity-164dc5a6-98ce-464c-a43d-b00b91ca69e5-1666461195968@3c-app-gmx-bs49>
 <Y1RCA+l2OHkrFfhB@shell.armlinux.org.uk>
 <trinity-ff9bb15b-b10c-46d6-8af2-09a03563c3c8-1666509999435@3c-app-gmx-bap20>
 <Y1UMrvk2A9aAcjo5@shell.armlinux.org.uk>
 <trinity-5350c2bc-473d-408f-a25a-16b34bbfcba7-1666537529990@3c-app-gmx-bs01>
 <Y1Vh5U96W2u/GCnx@shell.armlinux.org.uk>
 <trinity-1d4cc306-d1a4-4ccf-b853-d315553515ce-1666543305596@3c-app-gmx-bs01>
 <Y1V/asUompZKj0ct@shell.armlinux.org.uk>
 <trinity-ac9a840b-cb06-4710-827a-4c4423686074-1666551838763@3c-app-gmx-bs01>
 <trinity-169e3c3f-3a64-485c-9a43-b7cc595531a9-1666552897046@3c-app-gmx-bs01>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-169e3c3f-3a64-485c-9a43-b7cc595531a9-1666552897046@3c-app-gmx-bs01>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_130957_515747_0D7D8B97 
X-CRM114-Status: GOOD (  16.58  )
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

On Sun, Oct 23, 2022 at 09:21:37PM +0200, Frank Wunderlich wrote:
> > Gesendet: Sonntag, 23. Oktober 2022 um 21:03 Uhr
> > Von: "Frank Wunderlich" <frank-w@public-files.de>
> 
> > if you fix this typo you can send the patch and add my tested-by:
> >
> >         regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
> > -       if (interface = == PHY_INTERFACE_MODE_SGMII)
> > +       if (interface == PHY_INTERFACE_MODE_SGMII)
> >                 val |= SGMII_IF_MODE_BIT0;
> >         else
> >                 val &= ~SGMII_IF_MODE_BIT0;
> >
> > should i send an update for my patch including this:
> >
> > state->duplex = DUPLEX_FULL;
> >
> > or do you want to read the duplex from the advertisement like stated before?
> >
> > regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
> > regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1 + 8, &adv);
> >
> > phylink_mii_c22_pcs_decode_state(state, bm >> 16, adv >> 16);
> 
> with the phylink-helper it works too
> 
> https://github.com/frank-w/BPI-R2-4.14/commits/6.1-r3-sgmii2

This is amazingly great news - we now know how to configure this
hardware! Let me cook up a proper set of patches for tomorrow - if
that's okay.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

