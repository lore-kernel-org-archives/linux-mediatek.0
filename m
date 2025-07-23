Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93980C83F17
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jul 2025 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pY/V30RRpfZyND/Za1DMOG3v7uchMZyX3xxQ5swFazM=; b=Qq1U/u0Z+Q9nyFRxzY7+6ZxtIB
	ubEZu1k4+la+jlJP01RSwOXenyrOj0IkHV7ClxuZyb1wJbat8gjAtgSL7oiJtzwtzJTMYCE2mjugA
	WUUZ6Be/EqNlxfgx5H1hegjZWQZMt8uIavkDK+ijqLi7zQpzeTPIGdL1NHdjQQgcCIUQvIQ2nJKUS
	JdPVHKCosQe4XBNSs8NYlPB7xyEHK5VGGq3nqJTVo+Vx4vWZSapZENKSM7jic4WHALyPLwzrxOL5j
	yPmDmm3VmFuiOlAs3imO4A3kDf88YPCn0hGv+I32tqz7X7GAJsNfAqXtuvEYovBY5xrBGkKXISLiU
	NcEVy86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUKs-00000004It1-1kdt;
	Wed, 23 Jul 2025 07:56:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU91-00000004GwI-17sM;
	Wed, 23 Jul 2025 07:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70043A55D4A;
	Wed, 23 Jul 2025 07:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF27C4CEE7;
	Wed, 23 Jul 2025 07:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753256646;
	bh=Ac7MqmvxZYLH/0zq09mvIBTiUSZ6NHJ4LWStoolGqkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mv4l+vVxHvh6MbEBikyP+nWZshJPaKipljRjLeil11Jrx2QyqSDjD4ozOMYAxVoE2
	 gDIgKydcR1OM7E7Vbue/0Won/TJndwSYXW5cQyBFUgBPiLoU3bOWicZfWTr4X4wnqW
	 AVEs2UotWsXo2297444Fl6klcFAinHZgcYxAedvbMsAb5iJA3DYy71ob+/y0EIHxAM
	 giFmnsCmCgbN+mmUD4TMZl3D0HDDL9LVn7PytwrL1CD1UdJfp/6iZAZ10LPRYq7OBM
	 8ixX5cBX/sYykzw8966T+1g2psTqI2WqqFq5W8NoJxUnut2xNsbZHEMCPTOMRRsfs8
	 JbIeEHncMe2KA==
Date: Wed, 23 Jul 2025 09:44:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: mt8395-genio-1200-evk: Move
 common parts to dtsi
Message-ID: <20250723-nimble-crystal-cassowary-229ee0@kuoka>
References: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
 <20250722085811.2062790-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722085811.2062790-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_004407_376475_AAF63B82 
X-CRM114-Status: GOOD (  10.27  )
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

On Tue, Jul 22, 2025 at 04:58:09PM +0800, Macpaul Lin wrote:
> In preparation for introducing the Genio 1200 EVK UFS board support, split
> mt8395-genio-1200-evk.dts file in two to create mt8395-genio-common.dtsi
> file, containing common definitions for both boards.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../dts/mediatek/mt8395-genio-1200-evk.dts    | 1189 +----------------
>  ...-1200-evk.dts => mt8395-genio-common.dtsi} |    4 -
>  2 files changed, 1 insertion(+), 1192 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


