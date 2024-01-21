Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6AC47422
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8VBdnI6NY92PMdeoxReDdK2LAjdaJ+l1Yht1Nmj5Z4=; b=v4bbf0NQEo/DDp9+57UEGYUUHd
	otIFdM5/ImQkIW+li7gZH3zhU3cG7vwEVW73CaI0jbB6BIfFsljC9DFZP7h1o8g0DgZ8KN3h9CWiL
	fPNhP7WUTmDEK4ybAbmhlrf8S1iFP5zbEVfLn9aQVEi9xuL/ucY3AN53HKCHGg8RICDJlkNROcSeS
	OV/HuoGB40UnRq1BuKKXVfGFfvcNN6HsjNNdwzridBH3BlcH9MhQPltdK/ahAC98F6bZJDLntGko/
	illtyYdAEBud1H42jKFT7cW2LVSq0pkfF4qoQBgBpOwIXIPpF1Gt61nzslsEoDttw+QBd7jfiOQZ1
	1HVR/eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRagh-009k2D-1Q;
	Sun, 21 Jan 2024 16:28:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRagb-009k1Q-1x;
	Sun, 21 Jan 2024 16:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=b8VBdnI6NY92PMdeoxReDdK2LAjdaJ+l1Yht1Nmj5Z4=; b=2p9mswx+7FNaQYQFZ0hfI2ryxk
	0WBSo0i81zSkim2FOh27p0moMciEiC0XH865dQabv4d5HlswA3Pl7I52vw/S+wsTR4OklAqKHQmLD
	2crOrMiAZ2CnzMhQuNlG3Uog8xsGaaEh90OSkHiT0LJGN2ztpMoH4sUyWMS5lRH4ELAY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRagS-005f2l-Se; Sun, 21 Jan 2024 17:28:32 +0100
Date: Sun, 21 Jan 2024 17:28:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/8] clk: qcom: gcc-ipq5018: correct gcc_gmac0_sys_clk reg
Message-ID: <b616c6aa-9241-4eb0-a9cc-a7bc2e706d72@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB555644D4AF2C3C528BC6E6C0C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB555644D4AF2C3C528BC6E6C0C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_082841_647912_AEA1B33B 
X-CRM114-Status: UNSURE (   6.17  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jan 21, 2024 at 08:42:33PM +0800, Ziyang Huang wrote:

This, and all your patches need a Commit message.

What is the effect of this typo? What is broken because of it? Should
this be backported to stable? Does it need a Fixed: tag?

> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>


    Andrew

---
pw-bot: cr

