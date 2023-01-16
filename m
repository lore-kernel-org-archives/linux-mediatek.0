Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BD6C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlUo0VHGiHMqOq7GALN7Pw8+2+ppyERsUnHndjGHafs=; b=ZoebtnEcRC0/u3Apid7P/Maobs
	Yy0kZYFF4uhBqDIk4FyivKAzy27QsuXPmOApT93E9idgbvL7B9n41L+UgEWZI0aY6QahCsKjZEltw
	jNUNeI0gy7vyi3joq45nnTdLSuropZL98Ob3+glmVPgH+AlIowOZ0siOFqrvZT+/6SsUR8idv3xFT
	2zt+QWSQVpoi/CnklEtJWiGLvAy9JGLTB4slRJQka4qI5hDMsJuLAIrC2FBoWJf5ugRdUYRMnCmgz
	syTSrUlN5ifGM0D8c3F9RITLeC6v5/7oA5ySNwKwUICUzxVPuCLFZ/DrbKtdV5fmvRg1ndo4cKgeg
	YCwb2XOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHTaa-00BZpA-WA; Mon, 16 Jan 2023 17:48:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHTaX-00BZnQ-Bx; Mon, 16 Jan 2023 17:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YlUo0VHGiHMqOq7GALN7Pw8+2+ppyERsUnHndjGHafs=; b=OkJyz9r3mgDSaw8Y2k1jx3/8VU
	c8RMeUzS9M04RYoq1Lk4ZHGQl0R+MP1845w3OzyAeAqYxy3M3RF1YhDYLyZRu/UCelyBeXKAkyK8T
	oM98rrAddjYBDUzkHi5/CNg0FXFcinO2Wrxgv77CMPZcCUB7Pqkpfd7fuolnMrgwOxR9K9r2zQOvh
	CVMtSThx2FDWKBeWPOm6UByPU66XVEO2OaBNDTgTCQp2WOHq6l+TACWelbDj7ZwRqZqa4qVIaKhRh
	qDKn7WUiILBPzXUMhAQ0QrII1eKTpWJzbXi9U2fgp+hqkSyeybbA2pf5T5Gl82oZMx8T/bbro38Br
	PCACa7/g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36136)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pHTaM-0005YZ-3b; Mon, 16 Jan 2023 17:47:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pHTaG-0006CW-EU; Mon, 16 Jan 2023 17:47:48 +0000
Date: Mon, 16 Jan 2023 17:47:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y8WNxAQ6C6NyUUn1@shell.armlinux.org.uk>
References: <Y1ansgmD69AcITWx@shell.armlinux.org.uk>
 <trinity-defa4f3d-804e-401e-bea1-b36246cbc11b-1666685003285@3c-app-gmx-bap29>
 <87o7qy39v5.fsf@miraculix.mork.no>
 <Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
 <87h6wq35dn.fsf@miraculix.mork.no>
 <Y8VmSrjHTlllaDy2@shell.armlinux.org.uk>
 <87bkmy33ph.fsf@miraculix.mork.no>
 <Y8Vt9vfEa4w8HXHQ@shell.armlinux.org.uk>
 <875yd630cu.fsf@miraculix.mork.no>
 <871qnu2ztz.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qnu2ztz.fsf@miraculix.mork.no>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_094805_425763_00F3CD58 
X-CRM114-Status: GOOD (  13.88  )
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

On Mon, Jan 16, 2023 at 05:45:12PM +0100, Bjørn Mork wrote:
> Bjørn Mork <bjorn@mork.no> writes:
> 
> >> You have bmcr=0x1000, but the code sets two bits - SGMII_AN_RESTART and
> >> SGMII_AN_ENABLE which are bits 9 and 12, so bmcr should be 0x1200, not
> >> 0x1000. Any ideas why?
> >
> > No, not really
> 
> Doh! Looked over it again, and this was my fault of course.  Had an
> 
>   "bmcr = SGMII_AN_ENABLE;"
>   
> line overwriting the original value from a previous attempt without
> changing the if condition.. Thanks for spotting that.
> 
> But this still doesn't work any better:
> 
> [   43.019395] mtk_soc_eth 15100000.ethernet wan: Link is Down
> [   45.099898] mtk_sgmii_select_pcs: id=1
> [   45.103653] mtk_pcs_config: interface=4
> [   45.107473] offset:0 0x140
> [   45.107476] offset:4 0x4d544950
> [   45.110181] offset:8 0x20
> [   45.113305] forcing AN
> [   45.118256] mtk_pcs_config: rgc3=0x0, advertise=0x1 (changed), link_timer=1600000,  sgm_mode=0x103, bmcr=0x1200, use_an=1
> [   45.129191] mtk_pcs_link_up: interface=4
> [   45.133100] offset:0 0x81140
> [   45.133102] offset:4 0x4d544950
> [   45.135967] offset:8 0x1
> [   45.139104] mtk_soc_eth 15100000.ethernet wan: Link is Up - 1Gbps/Full - flow control rx/tx

In your _dump_pcs_ctrl() function, please can you dump the
SGMSYS_SGMII_MODE register as well (offset 0x20), in case this gives
more clue as to what's going on.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

