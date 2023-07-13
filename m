Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02325C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ/LFkDYElioH91NZhzdrHW+i+w8b59jw0PilkxQn5U=; b=HMYWrXAt5/412PLZl1qn0kpis+
	f2oMKl6VCF+WP4zWj9KkWYIJYAwK0MtKkJbjTtfPsRdUn08lRRMY3QQ+MFbHZ6KcO8/HTWXRENmq9
	hMyqvl2dXJnct6q1i1/Kk8q2qsG+S8t6y02df0HD8QovP0/QL1T4ZYetDvs00L/gibIei9hSHtvPB
	oEsX6qsLaOPKSeSHKn+pFH7xd37LiFU4W7PiPaVNLq2EPbXkkgQhjbbLsdFXyEIEMkWGpoGMXl0SG
	N4Ow2eQkDoKosjfWwAv152427OD0Cen6lO/DSdk1QHBi32XF4HaFACOac7Tu2SUr5FF8RJIV9hFft
	WmJciw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqPR-002BAl-1h;
	Thu, 13 Jul 2023 07:06:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqPN-002B9k-3D;
	Thu, 13 Jul 2023 07:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eQ/LFkDYElioH91NZhzdrHW+i+w8b59jw0PilkxQn5U=; b=lok/Ty9gc+9ceqLx7wvXtFv4rj
	NcCmCJexavQzqRQK1jk3M91UyOXRxJAb0t31cX5gxm9+VTka2hy5fwCxh+9Qs0XFK2G2hBbxShT53
	1JiywOFMbtrTNXjEOy1slQBlPx0/HI+GLzjK9nosTOaESycmRTBqtKLvIMxzl0qKjfcwLspvQDnhD
	htd+j4B4ffQbhTi/TP+yiUK8VfC8IMr3KXkuQs2SYaGPICq4x/Na1ZIiceeB0wbtuvNADSzAVl6My
	gtENuGSPDHKsR+sLiwU67Abe+AN0ooXMTV2NGFV6utVKMcfcwJI+0V/FI4ks4yrIfb6kEbu4hmXaj
	x1YVl2ZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60704)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qJqPE-0005oa-06;
	Thu, 13 Jul 2023 08:06:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qJqP6-0005us-Ga; Thu, 13 Jul 2023 08:06:20 +0100
Date: Thu, 13 Jul 2023 08:06:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: Re: [PATCH v2 net-next 3/9] net: ethernet: mtk_eth_soc: add
 MTK_NETSYS_V1 capability bit
Message-ID: <ZK+ibBKWFRniQ8rK@shell.armlinux.org.uk>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <a2022fd2db0f7ed54ab07bb93b04aa9fc59033b5.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2022fd2db0f7ed54ab07bb93b04aa9fc59033b5.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_000638_058854_AA612F89 
X-CRM114-Status: GOOD (  13.24  )
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

On Thu, Jul 13, 2023 at 03:18:23AM +0100, Daniel Golle wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Introduce MTK_NETSYS_V1 bit in the device capabilities for
> MT7621/MT7622/MT7623/MT7628/MT7629 SoCs.
> Use !MTK_NETSYS_V1 instead of MTK_NETSYS_V2 in the driver codebase.
> This is a preliminary patch to introduce support for MT7988 SoC.

Rather than using capability bits for versions, would it make more
sense to use an integer for this, so you can do:

	if (eth->soc->netsys_version >= 2) {
		version 2 and later stuff
	} else {
		previous version stuff
	}

?

I'm just thinking ahead to when we end up with stuff that v1 and v2
need but v3 and later don't.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

