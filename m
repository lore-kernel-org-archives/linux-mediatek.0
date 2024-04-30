Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1684EC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBOmTqBpNMaalH4AUgByChrqGj1SS6inw+H7gW/YWKM=; b=A/+dld7BslWz3D4+2RppL7pPOE
	ABQUmrAzLCZvMaEjPmRrPM81pfW96w7mQBgmqREFiOWhoO54xvCOsXfGwGHdwcqYxyllZixMCYyQA
	GUuXzRQGWcrqkQNuFfxsvQqb63WbG51o4SH7onhdHeuyLxe/D61Q3SYypJqrI5njU1G2pCFajSU9g
	3h2GpRptgkTFmXVi6k981F50XjO1XpfEDdcca0G65EKHNJh0P3PwvKAjqD2dvxXePtbms9BbwRbIk
	xQATZWbMassJr6I9+GPOk8Mzr1yuV1ZA1s6Hm/sTpvSTgONnObD/z0M4To83fy61V14USQstPlCZD
	Zk2IbKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1toA-00000007pTF-17UL;
	Tue, 30 Apr 2024 20:10:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1to2-00000007pQQ-3MEa;
	Tue, 30 Apr 2024 20:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33BEBCE0EDB;
	Tue, 30 Apr 2024 20:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C0CC2BBFC;
	Tue, 30 Apr 2024 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714507821;
	bh=58CBaYeu4exH4ljqyrgLewfHjjrJsr+lwEV4eBnRRBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WImPU34vi9oog0mmRTYwMKyo1ISHKsDV6YPWI+6u3+xUXQD8qpYdkh3C/41+D6CJw
	 k6UKJmZXrLyk5BK2449OfE1cJpyzZgF9BxLmxWHNjFuDNGZudLuAXQSJKMr8FdYCQV
	 cIEig5Y9rFDOqmC2AJQLvqY3T39W804ABIfyx3tLU0gZeu1lre7MEyjzk+57HmK9OT
	 mYlEXGZh2NVuCp9T1OIwqLDSqmZV580TjPigcNNiN6CtS4oF6eVQHiZ3WNf0YPsEbu
	 W4pzjqjzlUQ7Y9m+2ZqyTh7DDtM1ly32OG7YCKWgtLAsuBKB4WT4rvc+6gb628z1ZP
	 H8aC6Gjk+siug==
Date: Tue, 30 Apr 2024 21:08:44 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <20240430200844.GE2575892@kernel.org>
References: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_131027_250172_A9EAED0D 
X-CRM114-Status: GOOD (  20.49  )
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

On Tue, Apr 30, 2024 at 12:45:46AM +0100, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31 (ie. only 3 and 4 can be configured, bit
> 0~2 are always 111). Practically all boards known as of today use the
> default setting which is to have the switch respond to address 31, while
> the built-in switch PHYs respond to address 0~4 in this case.
> 
> However, even in MediaTek's SDK the address of the switch is wrongly
> stated in the device trees as 0 (while in reality it is 31), so warn the
> user about such broken device tree and make a good guess what was
> actually intended.
> 
> This is imporant to not break compatibility with older Device Trees as
> with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> switch from device tree") the address in device tree will be taken into
> account. Doing so instead of assuming the switch is always at
> address 31 which was previously hard-coded will obviously break things
> for many existing downstream device trees as they contain the wrong
> address (0) which previously didn't matter.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

The cited commit is present in net-next but not net.
So I think this patch should target net-next.

...

