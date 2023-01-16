Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A76C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ/eIqVO5uQMasPeB15wvp3K//r6DTxoyyALad2UpFA=; b=TNPRZjGEN/mOl7dgbVEVF3IPWM
	H991kbWkxsellCL//DDiQEfg4HL9Psi8ILBYkL4SThzLZ6SvEVoRLilmjNQEvdln+q9npWMldyNgo
	ibCx2hiKJlfN5F6NXT6HFjTMwFBr1dbivk1BEt9ac0LZW3qq4xv3Pc/ujlh0V6htbaKvyklCDtPNL
	jeCtOJJcof3eXr5hrDOSimBoKnWZWfCyrww5tmWIWLNGcfvTsc3gQJlmjvfHH6l/3vF3SgUI+uVvk
	xdG4ZPW8g9IOYGCOnxU7RFukEafOA+uTjHg0NE6RAf0/sn1aakqMqTAF8Z2/+6c1/o2H4c4jfJ4wY
	EE4DKFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHTzm-00Bg5e-Te; Mon, 16 Jan 2023 18:14:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHTzk-00Bg3I-7N; Mon, 16 Jan 2023 18:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oZ/eIqVO5uQMasPeB15wvp3K//r6DTxoyyALad2UpFA=; b=aPBcR9TgPdrX8Re8IVHqBUFNUK
	XyNlwN0rPdVq/8bvRhdN3fuubtm/R2AaMXi6XE+rObMlbJUo3P/1o/UXtfhl86pFo/ZY4xChj2bSp
	zFnBEX90KCjYcXtuh4RsZL9JtcfiGpMdl+v2sAGyd98aYIVwJKZBW7/uinb/h7ti07Ps76lzsh9aD
	494/TqDNMEQFctOU+FJgwXJ+lo1qdYzvsDmwo0Z+5SvmrPX1HJMz/Yd21t5M5TUKFOKzmATYp9j7f
	PB3wtuAUJdKSMKzDnaL4imf664WUh99ukXpuvglfwAb+447oafXyGAJsLwHIwBZYzQ0iW0mnbmupz
	dulPqpNg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36144)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pHTzf-0005dC-ND; Mon, 16 Jan 2023 18:14:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pHTzc-0006Du-NE; Mon, 16 Jan 2023 18:14:00 +0000
Date: Mon, 16 Jan 2023 18:14:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y8WT6GwMqwi8rBe7@shell.armlinux.org.uk>
References: <Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
 <87h6wq35dn.fsf@miraculix.mork.no>
 <Y8VmSrjHTlllaDy2@shell.armlinux.org.uk>
 <87bkmy33ph.fsf@miraculix.mork.no>
 <Y8Vt9vfEa4w8HXHQ@shell.armlinux.org.uk>
 <875yd630cu.fsf@miraculix.mork.no>
 <871qnu2ztz.fsf@miraculix.mork.no>
 <Y8WNxAQ6C6NyUUn1@shell.armlinux.org.uk>
 <87pmbe1hu0.fsf@miraculix.mork.no>
 <87lem21hkq.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lem21hkq.fsf@miraculix.mork.no>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_101408_287284_ADCFD262 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 16, 2023 at 07:04:53PM +0100, Bjørn Mork wrote:
> Bjørn Mork <bjorn@mork.no> writes:
> 
> > [   52.473325] offset:20 0x10000
> 
> Should have warned about my inability to write the simplest code without
> adding more bugs than characters.  20 != 0x20

Ah, that kind of explains the lack of change in the values at offset 20!

> [   44.139420] mtk_soc_eth 15100000.ethernet wan: Link is Down
> [   47.259922] mtk_sgmii_select_pcs: id=1
> [   47.263683] mtk_pcs_config: interface=4
> [   47.267503] offset:0 0x140
> [   47.267505] offset:4 0x4d544950
> [   47.270210] offset:8 0x20
> [   47.273335] offset:0x20 0x31120018
> [   47.275939] forcing AN
> [   47.281676] mtk_pcs_config: rgc3=0x0, advertise=0x1 (changed), link_timer=1600000,  sgm_mode=0x103, bmcr=0x1200, use_an=1
> [   47.292610] mtk_pcs_link_up: interface=4
> [   47.296516] offset:0 0x81140
> [   47.296518] offset:4 0x4d544950
> [   47.299387] offset:8 0x1
> [   47.302512] offset:0x20 0x3112011b
> [   47.305043] mtk_soc_eth 15100000.ethernet wan: Link is Up - 1Gbps/Full - flow control rx/tx
> [   56.619420] mtk_soc_eth 15100000.ethernet wan: Link is Down
> [   60.779865] mtk_sgmii_select_pcs: id=1
> [   60.783623] mtk_pcs_config: interface=22
> [   60.787531] offset:0 0x81140
> [   60.787533] offset:4 0x4d544950
> [   60.790409] offset:8 0x1
> [   60.793535] offset:0x20 0x3112011b
> [   60.796057] mtk_pcs_config: rgc3=0x4, advertise=0x20 (changed), link_timer=10000000,  sgm_mode=0x0, bmcr=0x0, use_an=0
> [   60.810117] mtk_pcs_link_up: interface=22
> [   60.814110] offset:0 0x40140
> [   60.814112] offset:4 0x4d544950
> [   60.816976] offset:8 0x20
> [   60.820105] offset:0x20 0x31120018
> [   60.822723] mtk_soc_eth 15100000.ethernet wan: Link is Up - 2.5Gbps/Full - flow control rx/tx

That all looks fine. However, I'm running out of ideas. What we
seem to have is:

PHY:
VSPEC1_SGMII_CTRL = 0x34da
VSPEC1_SGMII_STAT = 0x000e

The PHY is programmed to exchange SGMII with the host PCS, and it
says that it hasn't completed that exchange (bit 5 of STAT).

The Mediatek PCS says:
BMCR = 0x1140		AN enabled
BMSR = 0x0008		AN capable
ADVERTISE = 0x0001	SGMII response (bit 14 is clear, hardware is
			supposed to manage that bit)
LPA = 0x0000		SGMII received control word (nothing)
SGMII_MODE = 0x011b	SGMII mode, duplex AN, 1000M, Full duplex,
			Remote fault disable

which all looks like it should work - but it isn't.

One last thing I can think of trying at the moment would be writing
the VSPEC1_SGMII_CTRL with 0x36da, setting bit 9 which allegedly
restarts the SGMII exchange. There's some comments in the PHY driver
that this may be needed - maybe it's necessary once the MAC's PCS
has been switched to SGMII mode.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

