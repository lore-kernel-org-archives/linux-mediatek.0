Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CAAC3600D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Mar 2025 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs4Fos6G4Lac0pmwn9hsltCdyR2yI1I/1l6/YH8nCK8=; b=1dT9uPVwU3/QlNTxga5VUDqRA8
	IRuofaXC9D34u5afe2wJqkgcH4R+cnLUEkwf+GUWWxSqgNAuH23WX5oPJG1zP9IWm9BSsCtMi6i9N
	nUZJ4fkBV8lM9fudzEeOk0UFmUtQALMCgnfmu6ri/NBaxjrbB5DYdK5Hz0iV82ZUv++zrPxE0HSU2
	KwPiLFVGuUHHvXIOyRzE7w6QWXJZk4EkjEgCtk93hQk4qQ9fH2cPlvSmbLCDSGqpWHuyt5QfEAui4
	HvMSQ0Zcm0eHGMpTt1SVIS2EBExmMjTkA2n3ly7G+DIgBFSFjgwFKrqb7pe6rhb17Qq3Ak/LddKWh
	PtzRAxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLfF-00000007qO6-1VB1;
	Wed, 26 Mar 2025 07:59:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLcn-00000007q2W-1wST;
	Wed, 26 Mar 2025 07:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CA106112F;
	Wed, 26 Mar 2025 07:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90007C4CEE2;
	Wed, 26 Mar 2025 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742975792;
	bh=93M97Q5kVlONcYkIQD1oTLgBJrmsEdqoHZ4roV1qLOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atJQTBWaSaSbmkMwadDwCo4Hfkoqb5TImfMBBTK35qPENk6X8U/WCXyE/HKpiXmwG
	 o7g/Tfy6tsesiE5L2JKbHnB8Tw9tXZoFn9sLsPtgekTVx559DoTXQCVAFc6a35lLrp
	 4JfBdjXxmFSm0DiPAa+8woSlls3S6SutNrTv/GAQ+ngqtklHo9Via3liBfIehZyyNo
	 O0BXr1H29a26C9U9Cluz6PXekohLGCrRauJ37s92HgoeGwfhJC29yf50IxBuA6OEvE
	 pLB02aG1Eh7Uo5H2P4e2R8h+llNlXwi6+QuFINzBcY7pjB6k94B09v0DSqKdMX2y1g
	 0LLbw4peq9NKw==
Date: Wed, 26 Mar 2025 08:56:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Message-ID: <20250326-courageous-cobra-of-promise-2c839e@krzk-bin>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326063041.7126-2-crystal.guo@mediatek.com>
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

On Wed, Mar 26, 2025 at 02:30:31PM +0800, Crystal Guo wrote:
> A MediaTek DRAM controller interface to provide the current DDR
> data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  .../memory-controllers/mediatek,dramc.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

Where is the rest of the patchset in DT patchwork? Where is any
changelog? Cover letter? What changed here?

I receive dozen or hundreds of emails, so if you want to make
it difficult for me to review, I will just ignore the patch.

I mark it as changes requested.

Best regards,
Krzysztof


