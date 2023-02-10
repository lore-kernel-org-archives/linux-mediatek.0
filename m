Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6F8C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4ycTM6wjBzQxnmAN1l0VrC0z1bUlOmEH9rHmaSCS7Y=; b=vdv96uxBBFcmN8IesgQqNPAh7a
	iMMFqWDxje6gMM1aL9O03/ZAI6RYXStN4e7vJHAAqU9fqclvsjobImwrS7fcLG47aVLK7OrcRbYuP
	4yv16s858Bc0UrHa6PxynqiwKm4m9c2eN4nJ2dSWXQ1akWpmy/4xObHYxLBFIKLFd8Gd6k0TxxgSI
	KVpEKdVck2T1QmWcM2WEiVpIWHRFHuDWuHFBcO4dGAN5kIUPjZGT3Pu2KLll2o7bc85D5Lb2sQqHh
	LY1gvmSYvuN6y9DVHzYCSFrPwJHA1WASbycL/zWoN4uv3z7A26grHfIelerjzm3ud12PIQr7VWz9I
	MSb/FGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbED-007h6p-8m; Fri, 10 Feb 2023 21:46:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbEA-007grh-HG; Fri, 10 Feb 2023 21:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q4ycTM6wjBzQxnmAN1l0VrC0z1bUlOmEH9rHmaSCS7Y=; b=SbS8AXmj9RhgHzGEoljuzMLM5d
	QkbKoM9XzPbnNltx4q3Ehcod7YTDuGAoNbylMlU33dHqjXtYBNGJbov6Vd7vlvkXzgikcAAqdrbAu
	/PxBsPCk8r+AZPx6Aw77YmK0q9WxYCpoLf7bx99XPjz26YitrhpdopmVU94xuDCqoOqvA0A2cVVEP
	DtV28WyswTdHzn7F99dlJlnQYxfsGfGDaGSTH4e+A7KV0SvSGO1Ud14r8bnXOkc3qNJFGEhkiHuJZ
	Id5KnjJSe6fNwaOoU++CS7O/7Mgwngon9xYtrcWqOJ2WCkbs8OdzaDJ8ykiWnLjisTRDt2cPbo7Zp
	ADDCaD4w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60080)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQbBy-0000hg-Ew; Fri, 10 Feb 2023 21:44:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQbBr-0000V9-W4; Fri, 10 Feb 2023 21:44:20 +0000
Date: Fri, 10 Feb 2023 21:44:19 +0000
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
Subject: Re: [PATCH v3 07/12] net: ethernet: mtk_eth_soc: only write values
 if needed
Message-ID: <Y+a6s0xGXWE7gdF2@shell.armlinux.org.uk>
References: <cover.1675984550.git.daniel@makrotopia.org>
 <655926d824fac09cf188d746ae18cfb823135525.1675984550.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655926d824fac09cf188d746ae18cfb823135525.1675984550.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_134642_595012_52E9CA5A 
X-CRM114-Status: UNSURE (   9.87  )
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

On Thu, Feb 09, 2023 at 11:31:51PM +0000, Daniel Golle wrote:
> +		/* Setup the link timer and QPHY power up inside SGMIISYS */
> +		link_timer = phylink_get_link_timer_ns(interface);
> +		if (link_timer < 0)
> +			return link_timer;

My comment on the previous iteration of this series applies here.

(this comment for net-next review tracking purposes.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

