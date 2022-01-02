Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcAtPDh83presr+IrKvaA3cXRuZLwqeBkN0HJl2g0gc=; b=CQHeOzVlAf/39o
	ZcVSoscnD5EsdsECg/+tF3KJRZb7TQTrBdcB5vR9KyJGZYGafswPg1ZZkwYxQ8/k4Q2KQw4BQbtHR
	08B4oz2h+Q553CMKlfWwG9gxgs4jNN9MpgHPKSk6KF7zVEWm4ZwTcApcUtfNRoz6EBEXHdhgumlD6
	hB/VNLHtk2Ow00s5F9XNAbZ/mC3zaghkgS9IUf3lrzWsHR87AZstGDwkIUaAueVOPozWWAq9VF1p/
	0NCshVnXZ1fc8vVGWChlN7Tq1X6TmRvcG4p8KTlf1CMvqGAhh2OzviLszimOv5H/ZhmmqynQgZCf7
	+klMq5OHIkIYyaPq/K1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n43f5-007wcb-Fs; Sun, 02 Jan 2022 16:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n43f3-007wbO-FV; Sun, 02 Jan 2022 16:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4KlxMSqwpI+8J07Pz0YWGyZ05XaJV5IHIKw4TRudFLE=; b=NwlFuJ3l4nrgvkuq3VCwoAwCB5
 yG80nNqb95mATLl04b7179/ymu+Lupyef+IhwfCrjf6qkQ5WShHsLfSw1ECrftinrzm4rPs/yjz63
 pA2SYacThvz72owSztwc2YDlh/NkezdEFCmc0qNC2rrIV06G71WjoVI6sTrq6rcnnpTJcXTmB0Lrh
 V//iAel8w5ye6Ss5DNHkTqPfRlVet6LDkIEXMfi5PdQt8KvmtquxEXykS5CJFwfRPd1mYaYTL5V09
 D9V33AxytzC/gq2iPcbzfY5nP07NqaJ0r9i5jd4Xs/OgRDeb7HsaaKVq8cNG8weA8zrqWGaZ/TLHf
 xhDOWTtw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n438r-004xpV-NL; Sun, 02 Jan 2022 15:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4KlxMSqwpI+8J07Pz0YWGyZ05XaJV5IHIKw4TRudFLE=; b=DG4+Kv7XE5pzB9ai02NSG8WMVm
 1jinkfqxPJ8NtcvCpXSZJueff4RpaoSJq3i69zkhTFmLznrhrVB8ORNjtX6GfUwn2hRyAG8JA97qH
 h9xLhye24g0CWJaKimYaFZ5aU08ZzktVQG9C9eNzzF1pMeOUwxZARVcapGTQgT1pdoEGQGJ0Oohcv
 BnIqg+IXb7xl14NwBkBUB0fqtEQUF6vqS5hgVg8cUoMPcXP4oo/UiwJrg20SLKCOV+6xMOsbB9Fxd
 o5NebSM/wUf4QBfKdPefWv6K1Mxp6FXmMLp7mVOS4TrxI1iF1dks+f7RzuWR16rkeBDug7GUtRh9+
 fuaCjBeA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56522)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1n438j-0005Z5-L2; Sun, 02 Jan 2022 15:51:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1n438e-0005TU-J5; Sun, 02 Jan 2022 15:51:16 +0000
Date: Sun, 2 Jan 2022 15:51:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Michael Lee <igvtee@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v10 0/3] net: ethernet: mtk_eth_soc: refactoring and
 Clause 45
Message-ID: <YdHJ9Kkl4+zwCV1+@shell.armlinux.org.uk>
References: <YdCNZh5PsBwbfMtp@lunn.ch>
 <YdHJKLfFCJvYBcdB@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdHJKLfFCJvYBcdB@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_155129_841313_DA008103 
X-CRM114-Status: GOOD (  12.96  )
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

On Sun, Jan 02, 2022 at 03:47:52PM +0000, Daniel Golle wrote:
> Rework value and type of mdio read and write functions in mtk_eth_soc
> and generally clean up and unify both functions.
> Then add support to access Clause 45 phy registers, using newly
> introduced helper macros added by a patch Russell King has suggested
> in a reply to an earlier version of this series [1].

Can you please stop threading each re-post to the previous posting of
the series. It's getting rather annoying after ten iterations to have
the subject lines disappearing off the right hand side of the field.
This is not a request to re-post, it is a request for the next posting.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
