Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F537C0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWxvd8sfZ+ld8QVDTBw2xqKi5aq8NTst44zeMQ1EdNM=; b=1Q3jsQxZQTbWe5+YXe3AQTm2aD
	hdb0y52p0Z53FEbZqmhdA2PwhwXy9XEnflAm0Gw4vehaCdSG5D2AtosMwyJMSnLZ7JnrElDMOwlN8
	X3t7+T1sJYK3T8jVQYaXNFlAPDi5b96OjewS/m5+4hMjsxDQdCg3pG6wFtQ/OiT0CrMVByQ6jdT8L
	qOo3wVOCBRUXMblsLzj6GcmvjqBtOvNmFSqsatcFEpXmLfJKgo1ZZ14o/huBgZ+LUEABl4Q34oowg
	LjMDDByGUx24XLopJfkG1HETJlIK5CK2OTLvTgZ5Qtwu+TLk7a7HPQfqJr3ZSlFHtmDWp3YIDZbNy
	7kfAB2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO4XW-005bfq-2A;
	Mon, 24 Jul 2023 23:00:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO4XT-005bf2-2C;
	Mon, 24 Jul 2023 23:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28B7461407;
	Mon, 24 Jul 2023 23:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68B1C433C7;
	Mon, 24 Jul 2023 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690239626;
	bh=0gLqL+skDZyctyEo4XytA7Z78FygL1xuVREEMkFKdSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V9ZMTQWTDr69DqPhmCHg0Q5D5JNpks3fKkPvZjBfR72bXRLolOpcqpds0YGO+c8uC
	 L94c8N1csZFQGlQs06lg18PenCAvfJo794gW/uD4cBTdOGztzI4sKdN3hDFdkKVHhE
	 4M73DHrhwMOQepwfymJNAgO2SwaRy3SzYfnXmpj9MJUcDJ1ojX9pymGwoO7ed3oKN1
	 gSxENlM/QD3BPsHlAdNnv/brc+GyrKiAFcEOC5Ga8ReThNgJ/ZTDo5r7WDT8crlEeO
	 R+Gp9QYD0VlPXaLn6ruSxCe7D/cSGophyzs8wCDKe+0RkGThw4VX74tXurmLJO7Cky
	 cxWe4qzjMlo0Q==
Date: Mon, 24 Jul 2023 16:00:24 -0700
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
 Russell King <linux@armlinux.org.uk>, =?UTF-8?B?QmrDuHJu?= Mork
 <bjorn@mork.no>, Greg Ungerer <gerg@kernel.org>, Florian Fainelli
 <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 0/9] net: ethernet: mtk_eth_soc: add basic
 support for MT7988 SoC
Message-ID: <20230724160024.427b2bef@kernel.org>
In-Reply-To: <cover.1690148927.git.daniel@makrotopia.org>
References: <cover.1690148927.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_160027_948260_D5AA2E28 
X-CRM114-Status: GOOD (  11.95  )
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

On Sun, 23 Jul 2023 22:57:08 +0100 Daniel Golle wrote:
> The series should not conflict with Russell's recently submitted series
> "Remove legacy phylink behaviour", hence the order of them being
> picked into net-next doesn't matter.

Not sure what the exact conflict is, but:

Failed to apply patch:
Applying: dt-bindings: net: mediatek,net: add missing mediatek,mt7621-eth
Applying: dt-bindings: net: mediatek,net: add mt7988-eth binding
Applying: net: ethernet: mtk_eth_soc: add version in mtk_soc_data
Applying: net: ethernet: mtk_eth_soc: increase MAX_DEVS to 3
Applying: net: ethernet: mtk_eth_soc: rely on MTK_MAX_DEVS and remove MTK_MAC_COUNT
Applying: net: ethernet: mtk_eth_soc: add NETSYS_V3 version support
Applying: net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64
Applying: net: ethernet: mtk_eth_soc: convert clock bitmap to u64
Applying: net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC
error: sha1 information is lacking or useless (drivers/net/ethernet/mediatek/mtk_eth_soc.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0009 net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
-- 
pw-bot: cr

