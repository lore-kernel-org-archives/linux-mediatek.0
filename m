Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 02:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFu1/Qhk2zMwVtphyafk1fsoz4x5N+GJZcltovB8F1Q=; b=VJGO+ufKpOxJIOHTeXdc17uAAt
	E+LkBMp2ihJG5dkc8OZe1Aj/mCUhxnoBNsF4VjhKp48zCo4UNse39lQa1aZatfQgN6961iZSNkOj4
	VvtkJfeamdFIJXeJCpVcyv2O6b1xmnlR3cPVAOIudpgoLOzG9d6Qgw5+cIMiNN+++pP8z+/KwwI7X
	b4ARQE+oQT/Nkfz2MNbV55aiL+ue/NvtQkBKWIuMqTq7R0LBJnnp1OKY7fVwFs/CU4EiMccvAi/q1
	8sq1HrKhatXxo4nO6SP70XGJzz6kjPqFPEoYLkTAPjRanwEEnalGxhPher9mlzboeyPnbmLRKPzi6
	rMAT5APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPByR-0000000Bv6i-1rRa;
	Thu, 04 Jul 2024 02:13:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPByD-0000000Bv2m-2lCD;
	Thu, 04 Jul 2024 02:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7E08CE31F2;
	Thu,  4 Jul 2024 02:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7D4C2BD10;
	Thu,  4 Jul 2024 02:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720059190;
	bh=7aPBsszqMYduEcu5a5wXNLYXdxnU8/yyohMqYvXO56c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rH8a5j8FtGcFZikQ/khrBlA/nEUjRassUOXtiiwFAoL18Wak0TVJP+LGuumESiKEh
	 Kbs+ZSo5/m1AxakP01xHVU0pLFpoJ2oqsWRnUjDh1CGch3Pz0JRa+8Xk3QQsnRv0Cd
	 QmjaFB5XedvS4ykjbEPZcT4BtDpk+chwbTyW2VbNGYZZRioNgLzfJNi3lZQQhmmeyk
	 5kG1dGRitMwqwLgV6H102nBtdNawaBUmj2nMODjHr28MCSOCVfpfL/uMuezp4G/IX4
	 DO5XGcZSQlfXqs+Fh865Y2FOjnFtAeMrJc73HYKq94CJS5eCB2WCbQcuG2WX96wlqx
	 8MkVKPsgGNxig==
Date: Wed, 3 Jul 2024 19:13:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Frank Wunderlich <linux@fw-web.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address
 and issue warning
Message-ID: <20240703191308.3703099c@kernel.org>
In-Reply-To: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_191313_906582_8A227E9D 
X-CRM114-Status: UNSURE (   9.42  )
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

On Wed, 3 Jul 2024 00:44:28 +0100 Daniel Golle wrote:
> +	/* The corrected address is calculated as stated below:
> +	 * 0~6   -> 31
> +	 * 8~14  -> 7
> +	 * 16~22 -> 15
> +	 * 24~30 -> 23
> +	 */
> +return ((((phy_addr - MT7530_NUM_PORTS) & ~MT7530_NUM_PORTS) % PHY_MAX_ADDR) +
> +	MT7530_NUM_PORTS) & (PHY_MAX_ADDR - 1);

nit: the return statement lacks indentation

but also based on the comment, isn't it:

	return (round_down(phy_addr, MT7530_NUM_PORTS + 1) - 1)	& (PHY_MAX_ADDR - 1);

?
-- 
pw-bot: cr

