Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A52CCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezZ8o/FeIX6PBFnHYKiq1w8u1XEF5lPwz2UvsPz5F3A=; b=nGU+TDb9glqHib8QbzLGmKyJbC
	V9gb6dmtCQQHKl2uj1CXddaMLDIK7OKKF1Eu7mgtHarchfVgQP/hV8ha9zNokt0DkyeaUsVBaSKRs
	OL2YFPG5SROP0XEiETFZ4OM6ggOz+5ima5O/7udAtwpJyyOiT/l15zqhhbcAU4KGxJoJQOIl9ot+M
	IePEi6nyAXrMD8SiZbh5IlfJ6m7SS7k7sIuCSeur3jjys2FEOGbnBYJtTmlKMphxXPv4ut04lqowm
	L4PZXcDW/lWhz5FaV+EQMRXXp9xIqCGRrmJHrgzuP/06fNpXCANiFpzo+1MaKSubGZdLLzS8XFlEb
	ff2tFqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMXD-0000000Dv8u-2WG6;
	Mon, 27 Oct 2025 12:41:15 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMX9-0000000Dv7h-3Dtj;
	Mon, 27 Oct 2025 12:41:13 +0000
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B93D659903;
	Mon, 27 Oct 2025 13:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761568866;
	bh=igQFF0LAtPQV99bIr387rWS186dezYa19i/THLPhjSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4RjCFF5lA02+c+sEf23kjw/bg91wHHikccPRvpR6HrVOR3MHLBgk8LUTsOYSfAc6
	 V/w0sk0gAu2fqxw65/HR1oWMLwmTDrOU9Ca3O1A7hI8i74ugs7/Sj091vlwq/R1aYa
	 OvoG1S5BArCYlJIYnZ/Jm6D9iTZ5tyfK/HSKwqkIdmtSKgSLMREKZl2IS8jRNyeBtE
	 h1qxTsGj2JJOAfF8Js7G12Z8TIijtiMV5Ggkl678X+Okc47GsHM7npqOmF2bzVUFBM
	 fyVDHQyILVtOMEGFu65TKOzTG8lCiASocuHDlXF1YkpAdgIsnIjoxaIBeEOOjH0uBW
	 kpji/5yNJuYcA==
Date: Mon, 27 Oct 2025 13:41:05 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Zhengnan Chen <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 0/5] MT8189 IOMMU SUPPORT
Message-ID: <xjzigctqrjzbfuneejicj5o6jppxdoous3iwmhhz6tfy62vnaa@zu4zsdlh26hx>
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_054112_031632_CA60D2FA 
X-CRM114-Status: GOOD (  10.35  )
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

On Wed, Oct 15, 2025 at 11:24:16AM +0800, Zhengnan Chen wrote:
> Zhengnan Chen (5):
>   dt-bindings: mediatek: mt8189: Add bindings for MM & APU & INFRA IOMMU
>   iommu/mediatek: Add a flag DL_WITH_MULTI_LARB
>   iommu/mediatek: mt8189: Add APU IOMMUs support
>   iommu/mediatek: mt8189: Add INFRA IOMMUs support
>   iommu/mediatek: mt8189: Add MM IOMMUs support
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |   7 +
>  drivers/iommu/mtk_iommu.c                     | 132 +++++++-
>  .../memory/mediatek,mt8189-memory-port.h      | 283 ++++++++++++++++++
>  3 files changed, 409 insertions(+), 13 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mediatek,mt8189-memory-port.h

Applied, thanks.

