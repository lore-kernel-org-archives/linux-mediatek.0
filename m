Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC90C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IG+aucFYrXcuoX6ZpIwhvoHvM5NCyWAHEHVKm/8nItw=; b=oYsLO8bo1tHtj7pf882+7TBykV
	zmi3idqEwN/L06WN73AFyH5h9iQXWW1OrStFNKTi1/JpAPD27LhUiji2EaNeRSjLJZqmcTw51Y51k
	4qKDwlQK4u/jcN2P7oyqeak3SUFkWotR/yG7PEy3+6lIpLh1J0HdY/RstNKXtNxNA6tG5PU3HjHKy
	DLOlzyTBvHE7IZZduOaglwRrpW/f7pHBrjOjhJup5+qREiseYiP2FPsgT82vXaEbwJ1HuKtMMFplb
	0bkEEwSlSgMvyPZhWPPc9T1/Tb7cBENJI3eYIe9Kzj9nKswu6GTRx60rO5OhdqFoAJdBlCFuJPKaJ
	r9WWz3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidBP-00000005wKk-3rai;
	Wed, 21 Jan 2026 18:43:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidBN-00000005wK8-24DI;
	Wed, 21 Jan 2026 18:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8ED24398E;
	Wed, 21 Jan 2026 18:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DFBC16AAE;
	Wed, 21 Jan 2026 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769021036;
	bh=tdP8IcHE3V6E2WPepo9Dt20ryBg+PeyHE8I+374/qzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9BQlKNOvdxV7n3Bjtlq1U1gQn6fVBSdcHrOxE+cEly/9B9Qqa4t3qcbuVDvD9Wxq
	 UBrtBLLWe+cMLLOf6u6s+gXXgLj7keOCYiA2FRpydbLPEbZwQ6ROlgBZmFEPY1Lnya
	 uRI6eD73CxMsJLs1mjb3aWS2r3BVQT7FpwkDur0ZwsjqCZcaGcTskJlURDiPREotVX
	 dNcyZU2y1hJrOyRyJjIBpxM7pe/MdtCnSxpfgmoR7WUdx0rRgY3xeTxZ/bwKnrpOAk
	 2+QtIONOjFpbd0Bd9UOMW3SwwmIsmlg47+glaC5usr+Er802DfZMa1IoecM2c1tf7v
	 Fo9V2PGeHK68Q==
Date: Wed, 21 Jan 2026 12:43:55 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
	conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, matthias.bgg@gmail.com,
	atenart@kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 0/4] Fixes for EIP97/EIP197 binding and devicetrees
Message-ID: <20260121184355.GA3842411-robh@kernel.org>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_104357_556989_836D6107 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, Jan 12, 2026 at 03:55:54PM +0100, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - Reorder commits
>  - Change to restrict interrupts/interrupt-names minItems to MediaTek only
> 
> This series adds SoC compatibles to the EIP97/EIP197 binding, and also
> fixes all of the devicetrees to actually declare those in their nodes.
> 
> The only platforms using this binding are Marvell and MediaTek.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
>   dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs

I applied these 2.

Rob

