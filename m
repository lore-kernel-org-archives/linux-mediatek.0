Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7151EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 23:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETipKauCB8Ei7IGF1ikhncA3DjCbFvZXwzJqo+1AHTI=; b=JQhn8Tly89jcN2
	m/oUxxwiD7HIn7UMIi9yozA5ROHH+WJH6jcpp16UgF8NqrlXB07gFH2s6QY7ZK41OVrLizBxm+37f
	/LzLcT/+NyGoM5gBEtw7lFErLhp6biafHBhv2la1u6DcPkj7AIGhFzS1qn0mpsCKJwH6lmQXyaXXU
	iGakja8WTzXKx0owdxV/p91rGV0E1mdM45tMwfCYsJ5QtdqY3W2yEMyyrPVD+jUtgHcpNxfh+T22D
	Hty5BLIKm8ywfmuxxTvLkhXZhz1H53wdV14vwT4O2IP1cmx0v0Ajc6RnhdiGUlIpZ7KpLKL1vyQ7M
	bze6gvnFkDX1uhhjp9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrx6-008Lo3-SM; Mon, 13 Mar 2023 23:51:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrwv-008Lmr-Sz; Mon, 13 Mar 2023 23:51:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 79423B81670;
	Mon, 13 Mar 2023 23:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50790C433EF;
	Mon, 13 Mar 2023 23:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678751487;
	bh=4ba/LXqyFOYnPz1mlKuD3GEqjFZuQ2b9fp0nAZ/ueqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Syy5G1QewWWlZ9TK7ummt8gGsimvVOpxB46dZV+nbGl0ZBXIs5D6XBxc/oTSrtPds
	 /f7hXPQEB/BKeAPNVg4BhKpX17YXyt4zg5v7Q0uLv3hfpJtAVldzJblH7P/Hkgg1IM
	 HoQLM4cpXsvSfnlz53OEFG4xvWJ6Tf88IuPo/St6trdeCGG+kDBPrFneBSM0M5OND8
	 870RhbaOzGLdtLX8cQq0rtHklpBk6abM7+1G/VlXUhUAC3jB+stpO/D0S5xqsE/Vx3
	 EPxEojQLs+F12KA7iXywyE+B+TRjD338wp0r5iNe+GWR+AI1JtKaqRR22XVemKCBi1
	 Er/97XRKJBERg==
Date: Mon, 13 Mar 2023 16:51:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v13 00/16] net: ethernet: mtk_eth_soc: various
 enhancements
Message-ID: <20230313165125.4743e5c7@kernel.org>
In-Reply-To: <cover.1678357225.git.daniel@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_165130_249798_CB04EBAE 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 9 Mar 2023 10:54:23 +0000 Daniel Golle wrote:
> This series brings a variety of fixes and enhancements for mtk_eth_soc,
> adds support for the MT7981 SoC and facilitates sharing the SGMII PCS
> code between mtk_eth_soc and mt7530.
> Also prepare support for MT7988 which has been done while net-next was
> closed.

The netdev review queue is too long for me to comprehend, since the
discussion is still ongoing on v12 (even tho seemingly tangential) 
I'll drop this, please repost once conclusion is reached.

