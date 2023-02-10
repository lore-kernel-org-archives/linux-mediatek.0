Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F8EC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjQumwk3nvQwR3Qjq3TUIc1Lnm3M+8mBL9xrBUbWiCU=; b=b/ivYIJZcHwD47sXgbG2tivsYJ
	mF8u1jzDuN93v55GHd9QC3gxG4HiaWHa0jh2K8BUDQjEHNuAWnin5oxFdF9ct1MwXS4m3G5+n+i3F
	cMwuPJPCn1dMj/WnJxCpp4pQfFBws2Zo4/4r49zJFCL/AbO2ZZVs8Fl2nyheEK9EN8hMfA3an2J2d
	fdj6hg2nmJGRBbva1gIZ/XnkqqII3QV24dEk0fMGo800oG4fDc9x4dkWR5ch1g8uf/wN4XybfnZVy
	vM256KKhe4yiuJsM7ONTBnwAApCTrvAfWNoaYVI0UH3tjo7qbBV4f1HDUPlAQOMbjsAmWN9Jd5jk4
	gCSLZ4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbFU-007hO1-GU; Fri, 10 Feb 2023 21:48:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbFS-007h2C-CI; Fri, 10 Feb 2023 21:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BjQumwk3nvQwR3Qjq3TUIc1Lnm3M+8mBL9xrBUbWiCU=; b=jME+vNuT0Oy/ihAHzQ1M6x8txM
	S4MR7MKYXvMiJMf3QlkAmkhOGKXFs3rR2HTlJUp733H2zv2FFSN5jY6cSQe1UwTuAnOa9vJfG/yiu
	ZbFJBvJDKdgkuNp5Ta/qDuFBH6v10Q1+nl++nRdBw++SNTwlPGH7lYy/S1eEOpBJJIIHXt6yW8/tW
	5U/mDZMCA6XbJcbs/DRZaYdFOxeVpebG6dICNFdeM0Yjh44k84jhidJ+eZKGSh0FtIWxPo7TTwhlO
	km4dWpSINKq2vedPR6k6d31FXJa0dbsWHeUiUZv6WVb+e2lSnrJqDX+xplYlypnK9nR6JYsMPQNsb
	z4Xaqx+g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55920)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQbDR-0000i3-5A; Fri, 10 Feb 2023 21:45:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQbDP-0000VH-Rn; Fri, 10 Feb 2023 21:45:55 +0000
Date: Fri, 10 Feb 2023 21:45:55 +0000
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
Subject: Re: [PATCH v3 10/12] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <Y+a7E5n6QrD/Igdg@shell.armlinux.org.uk>
References: <cover.1675984550.git.daniel@makrotopia.org>
 <70f9c17b694173cdef5f74901e5d0bc037c1eded.1675984550.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70f9c17b694173cdef5f74901e5d0bc037c1eded.1675984550.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_134802_452178_8D6F1E32 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, Feb 09, 2023 at 11:34:47PM +0000, Daniel Golle wrote:
> The SGMII core found in several MediaTek SoCs is identical to what can
> also be found in MediaTek's MT7531 Ethernet switch IC.
> As this has not always been clear, both drivers developed different
> implementations to deal with the PCS.
> 
> Add a dedicated driver, mostly by copying the code now found in the
> Ethernet driver. The now redundant code will be removed by a follow-up
> commit.
> 
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Comments on v2 also apply to this version.

(this is mainly for net-next tracking review purposes.)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

