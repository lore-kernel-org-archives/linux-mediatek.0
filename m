Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE6CC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLWIy4tPK2TtZXb9p97/do1lAnFU80ICaOsv+Gag1Bs=; b=34Kng7+RU5GnrjGA+PV5EYsfrJ
	W76Tsuu+A0Wpi5AjHrEsvCOQCdsU93S+2ivHT03i5XvOXgHvIP6bvWq7ks/6UOcH81f5luTOmGOB9
	ks7w/8w+lmV0qMszLrg6CValWjisFGTvkh7y+gMwW4qIsDUgNgoe+PG7Lpnh9gz5bU53Hol7OFIe2
	jlSf/xml4y3Zt6BqzG0DnP+HMkZ1O4TXxkNuosstE2wl6lo6tdsZdigLA5yhgxYuoJ5S16iKGYO8W
	hOF0xkjAkcGFqu6Bn3bcElT8jsW8tiszpnhrusdsRcfWzLKTEjay7svbOoM9BG9oLRLjq9fNoPpgd
	5L6S9Ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQlM-005J1u-6v; Fri, 10 Feb 2023 10:36:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQlJ-005J0I-RS; Fri, 10 Feb 2023 10:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MLWIy4tPK2TtZXb9p97/do1lAnFU80ICaOsv+Gag1Bs=; b=ECiyVijl4f+mN+pXRMDOXfi9lq
	f+X1+jZSXjBu3C6KhSgNkvXDgeCcODCwEz6fXlTTi4sFE2y7JqLhgsEmfKfupZXtZwuWIsbukF6Wz
	KIm00sccn9QXWssI81HQRXNtOiaIg0g1XE61pMqAWmb68yz3bv5qIBnrgNwOT1yDZ3sOYaqu35Hl2
	Wxz8tcm5nVGNPglwOkyLwMFC79xqBtEyWhvr9C3Br1aEfIyj+tZZonaN5OGoehSr0zknkp8AYCo1n
	faqkl+d7WaTUa47dUyj6QnrSwcgqBc0Qjni/SnpZs25pbiVZkORF4vyDyT8RHqt+PaGz6KstXj0Wg
	7d+muppA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQQlF-0001HS-S5; Fri, 10 Feb 2023 10:36:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQQlB-0005Ul-Ud; Fri, 10 Feb 2023 10:36:05 +0000
Date: Fri, 10 Feb 2023 10:36:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2 05/11] net: ethernet: mtk_eth_soc: reset PCS state
Message-ID: <Y+YeFeStaS3mdgqW@shell.armlinux.org.uk>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <fec3af02420c4c241465abc28442b7a77bc588aa.1675779094.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec3af02420c4c241465abc28442b7a77bc588aa.1675779094.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_023613_902747_043C354B 
X-CRM114-Status: UNSURE (   7.86  )
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

On Tue, Feb 07, 2023 at 02:21:02PM +0000, Daniel Golle wrote:
> Reset PCS state when changing interface mode.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

