Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0FAC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Btl6lB7/jBAwJDOo52HZvR/bEdbyeTvFLPuY3K4Zko0=; b=nSV1sAi/NRy7QpueNHZVjZg+J7
	n7tGWq5afVUVwUBlEgZ5nJL/u13p8AtJZz9ADL/MRGAJTAAcUE16d6xotF29vKxM+n/D+obDaWPuv
	DISMzQEx6ELYTNg39gN8L92zHx7eZ4JKZTlMEx1/MeC+MA2fLUNaXOmNUb3T5K3SAW0V4r0beS1fD
	xkbtubmrLmfxNeSoyVT2PBPUdJRwgRj7/7y9P5y2r4f0Ka6jGtO8SLHTGSo8i1mKALTEdZKPGIuOl
	eSlFqWsBMwDCaN7XFHmyOsuXwWLmc6w1a30zus4jHhEK4ZcsG1rv2Hw0qBa3/kiU5VQZEMFAwzdQ6
	IiB/Xxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnzB-006f3Y-NI; Fri, 21 Oct 2022 09:06:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnz9-006f23-Is; Fri, 21 Oct 2022 09:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Btl6lB7/jBAwJDOo52HZvR/bEdbyeTvFLPuY3K4Zko0=; b=pyplzieDCI1Jkh1GoGLbvsYVVx
	uHCqQJzf9myydjTTCZyJlfAgIL1Ad0QHfgNBMrbpvkz7KgN1NltByM6anYZbVpEgik+sT8GiBRbAT
	003jASt0qJW3q47hyaUXY64m2CxLNu4WQ7Emdhdc804IodgwWCgGWPPZN6k0zHLCnvWsiAGQf5Ue8
	V/plhE17pQYby+ANZNCJzfQM3Bk0iBn/UjzZcx62Xbi8kABllHXJLFTR+reIcdzdrFJHv5LHpqIi6
	hJLuuJb6YzhZpjpzeiql/TKGeFMOoYRkwlvDaqIW6SALh19LUTHxkNhnXwgZKfqymljlkOrHSfqOF
	NU6e4DpQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34856)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1olnz3-0008Q4-Ka; Fri, 21 Oct 2022 10:06:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1olnyz-00042A-Dw; Fri, 21 Oct 2022 10:06:25 +0100
Date: Fri, 21 Oct 2022 10:06:25 +0100
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
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1JhEWU5Ac6kd2ne@shell.armlinux.org.uk>
References: <20221020144431.126124-1-linux@fw-web.de>
 <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
 <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_020635_638443_2E4E5942 
X-CRM114-Status: UNSURE (   9.80  )
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

On Fri, Oct 21, 2022 at 08:04:51AM +0200, Frank Wunderlich wrote:
> I have no register documentation to check if there is any way to read out pause/duplex setting. Maybe MTK can answer this or extend function later.

I suspect we can probably guess.

Looking at SGMSYS_PCS_CONTROL_1, this is actually the standard BMCR in
the low 16 bits, and BMSR in the upper 16 bits, so:

At address 4, I'd expect the PHYSID.
At address 8, I'd expect the advertisement register in the low 16 bits
and the link partner advertisement in the upper 16 bits.

Can you try an experiment, and in mtk_sgmii_init() try accessing the
regmap at address 0, 4, and 8 and print their contents please?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

