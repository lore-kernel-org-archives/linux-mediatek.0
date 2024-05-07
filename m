Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A27C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rlt99zmcVILKclqpbjv2utXWPqAc4TJPPlL31nMJt8=; b=xfXjqjCYd1TidGhRBwJZcNS8LQ
	sg8M2P/cOEKiEevQO4MLUZxRCU1+qHTUY62iWAtFNYmwyFDQMNUrMxWUBTmLX8CGxwo13WyT3NUdW
	ENzsyq5VbWg88RMPmFQODYZkz1DgBXLCpezFct1HZctSdcr8560C7nZqBvGWoXLwcRAmf/cfxb+L2
	l8eGHgSkVDTI0IQK9BwU4+EvLM4PEThRkhw7V3UKkFVnF9tF6zD8y85F153o7y+i00X7xqqkwkzty
	+QvC0xfGKScjoTJfbHcCdv2LkIDWTVOnuqCLyWgJd2pAAkjHUcdnnbgyZl2kQa4hBHOMY5I2qc9B0
	vxX3d1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QPp-0000000CY6f-2kst;
	Tue, 07 May 2024 19:23:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QPl-0000000CY5M-0DDM;
	Tue, 07 May 2024 19:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1Rlt99zmcVILKclqpbjv2utXWPqAc4TJPPlL31nMJt8=; b=DGHZcDwQt05/ofsRmHCXxB7F7p
	4+19AHlf/kB9ynBunr+XzmEvyFe6jOB5Bi4Rg6t+TMauL7eOeAIVct20JsAWJK4OCulTHdC9kwooI
	piaA8++amm65GJTBciceqX7s9AIYLi/5LAzyO1mzBOTXaqL3R65vQlUcICSp/KtxsspkpnGaEw/jv
	BFFDRAv6XEpLYVjeNMGIqqF6+U84USuu86U1FYPS/48Wb2aAdf83MBClnEzbI40mPdQEnJjsMlRxA
	jA2Mxibyz2aoHWw87X0TBKAU7uJ6LRcRJ4xY4XkjrvGCwdIf2txmwWpBcVfF0tuTv/Uq/WjjhOrdl
	Mj+cEspQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s4QP6-0004C4-0A;
	Tue, 07 May 2024 20:23:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s4QOw-0000ZA-Of; Tue, 07 May 2024 20:22:58 +0100
Date: Tue, 7 May 2024 20:22:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Allen Pais <apais@linux.microsoft.com>
Cc: netdev@vger.kernel.org, jes@trained-monkey.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	kda@linux-powerpc.org, cai.huoqing@linux.dev,
	dougmill@linux.ibm.com, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com,
	tlfalcon@linux.ibm.com, cooldavid@cooldavid.org,
	marcin.s.wojtas@gmail.com, mlindner@marvell.com,
	stephen@networkplumber.org, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	borisp@nvidia.com, bryan.whitehead@microchip.com,
	UNGLinuxDriver@microchip.com, louis.peens@corigine.com,
	richardcochran@gmail.com, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acenic@sunsite.dk,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org, oss-drivers@corigine.com,
	linux-net-drivers@amd.com
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
Message-ID: <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507190111.16710-2-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122349_112857_986FD9C5 
X-CRM114-Status: GOOD (  13.13  )
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

On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/ethernet/* from tasklet to BH workqueue.

I doubt you're going to get many comments on this patch, being so large
and spread across all drivers. I'm not going to bother trying to edit
this down to something more sensible, I'll just plonk my comment here.

For the mvpp2 driver, you're only updating a comment - and looking at
it, the comment no longer reflects the code. It doesn't make use of
tasklets at all. That makes the comment wrong whether or not it's
updated. So I suggest rather than doing a search and replace for
"tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
it with) just get rid of that bit of the comment.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

