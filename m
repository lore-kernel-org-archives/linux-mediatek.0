Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6416EC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 05:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpB8FunqnyFPgVxL+87HsNcuc7Et8PX72oCQ94PfQUs=; b=gy8oLvc1cB23GxYEmdFuk7VnHY
	EXIu5ueGldgF7sXnU2pPPr7ZkftuJX67A/kXRXzOmWrn2vIK+RWC6poksJ8+uaj5wSEgOFWumcEC8
	tc+JhMheb5gzo2oNbU964rILXIaRsHq9iX/ex5KO2lyr8ET/5g++jUFXHEv70XbysaVybq32Nuh87
	QTufYmThQflWAoXgdbsJ3slSqD8iN3FbwLGG83a4ctYMG1MFPMYMR2p6ZKlpCssCGxxDnkTr8I8yY
	OSUtdblZCNmEPk1t3I94Vxt75ebTtS5O/P6Au1T7ohLY+Ihgawl4SjoDhkingEg3Ef6AbkTlnKZQL
	tBS3uDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOtDt-00C9b9-1d;
	Thu, 27 Jul 2023 05:07:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOtDp-00C9ac-31;
	Thu, 27 Jul 2023 05:07:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCB7C61D3B;
	Thu, 27 Jul 2023 05:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E3DC433C7;
	Thu, 27 Jul 2023 05:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690434452;
	bh=cu24BaSm7VP+M85cUQ+qtwEsAD/RBo9rNcVLe3xa3fo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u7MpNZdjK9fIYG2Pm23NLI7mZ3K/ANtsyc1c9bdh/SW1J9LKevMEUip+NbtDDOf//
	 D5f+QXcGPKpxao454lTjfOErll5zWqeONgsBqbWLoE5kk+asdbstSZfADqGFma+Huu
	 slsZjURasGfqLtK9Z+GdkrNK9pymB5jlRoRrbwHOZBJOvFl/7dr3crLLQnsEkJa68g
	 HlVB+M/xTdoUteD9iMKyNxAPrHSJnnEG0JXvjtV1AkGL/IU9YbdhxxNL45Xrj3DaJF
	 d4mpBfzc7TbyNNsyn2zVuJtuI5/G6uzhns67xPHWVP4hECjISAq/mGH65DnL8sxi+F
	 K9DlyBwGMn/og==
Date: Wed, 26 Jul 2023 22:07:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@kernel.org>,
 =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Florian Fainelli
 <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/8] net: ethernet: mtk_eth_soc: add basic
 support for MT7988 SoC
Message-ID: <20230726220730.6f78c790@kernel.org>
In-Reply-To: <cover.1690246066.git.daniel@makrotopia.org>
References: <cover.1690246066.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_220734_018521_C90A0AAF 
X-CRM114-Status: GOOD (  16.35  )
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

On Tue, 25 Jul 2023 01:51:00 +0100 Daniel Golle wrote:
> The MediaTek MT7988 SoC introduces a new version (3) of the NETSYS
> block and comes with three instead of two MACs.
> 
> The first MAC can be internally connected to a built-in Gigabit
> Ethernet switch with four 1000M/100M/10M twisted pair user ports.
> 
> The second MAC can be internally connected to a built-in 2500Base-T
> Ethernet PHY.
> 
> There are two SerDes units which can be operated in USXGMII, 10GBase-(K)R,
> 5GBase-R, 2500Base-X, 1000Base-X or SGMII interface mode.
> 
> This series adds initial support for NETSYS v3 and the first MAC of the
> MT7988 SoC connecting the built-in DSA switch.
> 
> The switch is supported since commit 110c18bfed414 ("net: dsa: mt7530:
> introduce driver for MT7988 built-in switch").
> 
> Basic support for the 1000M/100M/10M built-in PHYs connected to the
> switch ports is present since commit ("98c485eaf509b net: phy: add
> driver for MediaTek SoC built-in GE PHYs").

This was dangerously close to Russell's recent work.
Do double check that I haven't fumbled applying it..

