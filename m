Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C38C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0hPlToOSi/MvMO1G8SvXMXSNsW9mrelqvh/GnDOO90=; b=fehx7/IzdUe8iBwE4ZkNH5Y/UW
	e7ZRYdSXtkrbXx1G2Cls1Onau9jKTnM4UBhyJ0oK28bHvCEFOdLe/1rdF0OgsmvAMJQ4xhjooxdL+
	CoLQNbBx2SeYJHCJkUXMC6mWkveerQTsppedN9vq8zf/8cy6sg8H5JpcUbHxqQwrLktn0uNrKaxfJ
	GWy4ksNAFkRIbRVDKjU2NZUBLGPYB7/DoY2PQAR1aJqQxND8yqzdNuHFbjNLtiac/jLrSqESAm6/l
	zgd7Wu7cRF6YeA4OM9JwPvy77ibnQ+3VzftiIDL1swBVfTcESsoavyWDBXU61j+PbaBTBFB0ZF8gc
	tLPRnUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOSA-0000000DiGW-0xZE;
	Thu, 04 Jul 2024 15:32:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPORv-0000000DiBp-0CHu;
	Thu, 04 Jul 2024 15:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DDA6CCE31F3;
	Thu,  4 Jul 2024 15:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C08C3277B;
	Thu,  4 Jul 2024 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720107159;
	bh=BPia1XTw5EqPymabVp1MSYoRjr4IprzDUwrpt+2SMEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=appUfOoSUGRAbC3AgYNmvw+JnlvdX9cmKklRWc5eYj5vJicB0vIzLxF2S9kkcao0I
	 scslKSS69xufPP4m00C50H2aTpEvZfW0+nhQJfdInWE63Rgo+NBjKT3bUZqaDUpPeB
	 g93cMCp+7J31RllKKec1L8Uw6QacBT7iHv+8b/bLxafvBUVduMB6fl2tqKUXJDe02v
	 IJ0evEjepySopi+i0eN5IjF9RyCsZ6i34Q3O5QgkUDde5VlXB1+L3+/IiZh8R9tbM1
	 kPeBNQijU6LRCm3XSDxWFz0hKjNpa3Iuh125cHkmdNKz8l/vG3TvjUmxBQbRV5kiSH
	 Uh6Jds9vH5kBw==
Date: Thu, 4 Jul 2024 08:32:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Landen Chao
 <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix impossible MDIO address
 and issue warning
Message-ID: <20240704083237.0be7de00@kernel.org>
In-Reply-To: <1c378be54d0fb76117f6d72dadd4a43a9950f0dc.1720105125.git.daniel@makrotopia.org>
References: <1c378be54d0fb76117f6d72dadd4a43a9950f0dc.1720105125.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_083243_293576_632589EC 
X-CRM114-Status: UNSURE (   5.96  )
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

On Thu, 4 Jul 2024 16:08:22 +0100 Daniel Golle wrote:
> +return (phy_addr - MT7530_NUM_PORTS & ~MT7530_NUM_PORTS) + MT7530_NUM_PO=
RTS & PHY_MAX_ADDR - 1;

This is still unindented! :)
Also GCC doesn't trust you with removal of the parenthesis:

../drivers/net/dsa/mt7530-mdio.c:149:18: warning: suggest parentheses aroun=
d =E2=80=98-=E2=80=99 in operand of =E2=80=98&=E2=80=99 [-Wparentheses]
  149 | return (phy_addr - MT7530_NUM_PORTS & ~MT7530_NUM_PORTS) + MT7530_N=
UM_PORTS & PHY_MAX_ADDR - 1;
../drivers/net/dsa/mt7530-mdio.c:149:58: warning: suggest parentheses aroun=
d =E2=80=98+=E2=80=99 in operand of =E2=80=98&=E2=80=99 [-Wparentheses]
  149 | return (phy_addr - MT7530_NUM_PORTS & ~MT7530_NUM_PORTS) + MT7530_N=
UM_PORTS & PHY_MAX_ADDR - 1;

even your you're correct.

