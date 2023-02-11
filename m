Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF7C636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 12:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLTpt9NribeB5KMCID04Kp1GCZg75vTmz/0Yqc7IzK8=; b=QCjPrA4A0uzKF5QBFzz8nO9yEp
	67dweXABJ59XqDQLzWRwP9zY0s725NxwOoOuXAdq70Zg3MzpeHpeJOconbVUs62deNV6etYmga35e
	EuWuOGSCV1SSgvCooi17Ynww01FbSTS9F1CVbHDv3cl4Xbt+48RD/ZfPJxRCPvx1foc1GAx3DeGIv
	6/l4VpTs91cKKEb7Zs6/JPrVokxOYGM7+BnSqOJ0wGXIqqtHE+8UNesmZUTcSgdFROHzA/Mwqo0ig
	RbQaAjvrmjyOiN4oNwpmiBioFWDp2PNLFmFd8Xjz7lBJl9Wzov8qbpr0ocfN8uhsauU5Et8HyYvhD
	9/PSpAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpGx-009SwC-SO; Sat, 11 Feb 2023 12:46:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpGu-009SuL-Ep; Sat, 11 Feb 2023 12:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BLTpt9NribeB5KMCID04Kp1GCZg75vTmz/0Yqc7IzK8=; b=SYdAdt329gXs0IyLorGGnNrYdS
	DiDXFkDFWfxgHN3HJC5FK/t2HW2KvLZkhzruaFkR2Pcf4qf6KMOR+mto7EY92Gruhe/BTtRiFCL2h
	sp2wW+5rsLboE6bTcfE7fnViX6xGGVT3Ua/+nhB/VO2+7jiPTkEY64zzXDCB/Uidq18tbLbQ7er9+
	hueOkzq+yPWOuu2Xa7Bi9CWzYWyD+7Y0hZClKdV3mNMr05nqCYDYiXHzOZgOpWHM/ErFUnbsQzefn
	LL3JOtDQSva9o74ZvNnaO5ieglQUUgFrf6cUjeckaQyeKnMhvPzNh/7IWf0X6f7EDVKWC7rGqLEgx
	KsLL4OVA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQpGk-0001av-9g; Sat, 11 Feb 2023 12:46:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQpGd-00017Z-BF; Sat, 11 Feb 2023 12:46:11 +0000
Date: Sat, 11 Feb 2023 12:46:11 +0000
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
Subject: Re: [PATCH v4 07/12] net: ethernet: mtk_eth_soc: only write values
 if needed
Message-ID: <Y+eOEx2KqvfV4TNo@shell.armlinux.org.uk>
References: <cover.1676071507.git.daniel@makrotopia.org>
 <ca95a266578bc52df44b432dfb2de7410d5202d9.1676071508.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca95a266578bc52df44b432dfb2de7410d5202d9.1676071508.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_044628_518902_B622305F 
X-CRM114-Status: UNSURE (   7.26  )
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

On Fri, Feb 10, 2023 at 11:38:36PM +0000, Daniel Golle wrote:
> Only restart auto-negotiation and write link timer if actually
> necessary.
> 
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

