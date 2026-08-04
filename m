Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51156C55182
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 01:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO7JjvLw7hnkPqHoC7TvmXBtgyEkXrMt3vhNNd4UZtY=; b=hcr6Y09gzQOSU3P3c1AsqZJ0GB
	Buj73vTUPc8C89RoJST0s1Ol1Vj/69bVDci9c6J706ZWoSh5Xe9ApAiUMtEOM636oVAKTxXzZa+xr
	J/LWAFIJCpcZOQwXPS2tLRsY/Zz8Z77H6+nFQ2a9N+sSVNoe96uU/L3XqDshU48ROvmCIKDcqG61j
	gH5TcnW4j4U5Q/DXeh3iZnpaOZRFknqz2QQRin1plMFjIZ9wj6JVCTRTEg7XEB8JRQFE9bQN6izNJ
	hO4L5TxD+ZPWu2wMBgjApCXPWfTPIM03qyIfVBKVPcwY7toM0nt6TmuSoNDyaatR7FNRrK+Lulc9y
	Sc7uhcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4BQ-00000000nfU-05Gt;
	Tue, 04 Aug 2026 01:43:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4BM-00000000ney-23cD;
	Tue, 04 Aug 2026 01:43:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD88E406EA;
	Tue,  4 Aug 2026 01:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37C71F000E9;
	Tue,  4 Aug 2026 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785807783;
	bh=DO7JjvLw7hnkPqHoC7TvmXBtgyEkXrMt3vhNNd4UZtY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mdryV+b/4inJrTTpR2WeVz0bsmaWlx281cGQ0MCds5qWkNGX5eOVQgHP/8RbmndM3
	 PGxjtuNDhhSsWwAIwQQoODjVPTSqAZFihsbykGp0kD6J+E/CaUMicMiNdaKDdwlf7g
	 j+z7oFzDEo5lCiNo86k+rz2clboOl2hN8KnUYxbMyCE97ZBERLwEF+bP5x+5ZuSg9N
	 /yACL6gAFE1Jo7Xn2bMFOr8xKHDHfBnD7ThURiy/0bnETMvl6dCFGZwt3d0i5Fyn7F
	 AQ35qxRxDCFsklqEXtLCw482xM4hQYw33Ex+eKlWvKpjUum2n8NNKRm2+9jsxTGDIV
	 Zlky0p/NN5oEw==
Date: Mon, 3 Aug 2026 18:43:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexander Couzens <lynxis@fe80.eu>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Russell King
 <rmk+kernel@armlinux.org.uk>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 0/4] net: dsa: mt7530: fix remaining swallowed MDIO
 access errors
Message-ID: <20260803184302.0df91301@kernel.org>
In-Reply-To: <cover.1785427248.git.daniel@makrotopia.org>
References: <cover.1785427248.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Jul 2026 17:03:00 +0100 Daniel Golle wrote:
> v1 of "net: dsa: mt7530: fix swallowed MDIO read errors" [1] was
> applied to net just before v2 [2] went out. This series carries
> everything from v2 which was not already applied with v1 and still
> qualifies as a fix: the two standalone patches v2 had grown following
> the Sashiko AI reviewers' findings on v1, and, as patches of their
> own, the companion fixes v2 added inside the already applied patches:
> the unchecked bus->read() in core_rmw() and the unchecked PHY_IAC
> command writes in the MT7531 indirect PHY access functions.
> 
> The remaining non-fix changes from v2, dropping a redundant read-back
> and improving the poll failure messages, will follow via net-next.

Let me ask explicitly this time -- are you planing to address any of
the Clashiko nit picks and send a v2? :)

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/c41c256a5b4695bec24abc6baa4f990fca88f834.1785427248.git.daniel@makrotopia.org

