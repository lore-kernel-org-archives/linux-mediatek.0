Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B2FC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+lRrmmMvRKf10mwLWm4O2MGSvNJLfntBiRFt459+lA=; b=nvvfFgVGfckGYyejDDZbd5VgSo
	Vp9EA2HrzctNzzKPeUsWsc6hiXiPMFVGF5eoT5mGtMrPYypz0SQCJcpLOCZWutq8uUmJnO2AKcLze
	YYlMkdILYvhBhl8NZbSGXcVY5b/VK4c6qucpmJGooYV08q+HaZUEMSqn6/pqFEDPJM4VjEjEMf3mQ
	2D+/NWtANussmI8phSt0UBBsOoAoc5XB1k/RVnJYWWQLEIxt1Y9T4idQ6TPRZt9lL7kk3rUky/Dsw
	70B0rGGysIWiZTu5rsomXH4jIy4/vxuo2jXKq7oyk566W2rrarEutnfCAO59EwWvKlsDaa6JadCcD
	E9qoD6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocmS7-004ZYz-Ae; Mon, 26 Sep 2022 11:39:11 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocmRw-004ZWc-4u; Mon, 26 Sep 2022 11:39:01 +0000
Received: from 8bytes.org (p549ad5ad.dip0.t-ipconnect.de [84.154.213.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 31E9E222642;
	Mon, 26 Sep 2022 13:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1664192335;
	bh=u0B6XPViiyWAnRZXSeK3V+bLPIyGlSA8ECSz5x8D8I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEqsYVedeZ/S22GY2PmZZFTx5QoCi/yyLT0EvXbZ/Y0/R5kCT0OMvho5Z7ZZKuEm+
	 695rmfuM1KAIoA2A8lOOzCZADpZEhtQOeT7XGFt6We3XPi6BV+ZEiHlQOHDIgMkUuv
	 VCjt5TZenOeF+Gax2SE0JLbG8KYjMXEpvmQlQ5iRFy2VyAE7pr8o8aefkc60UwsvFw
	 /Mdls73oTev7ahdys3cyZDqkAtluDq2VEGZ7LMe/TY0NGVx1XwcQTyD5qUgIesrvA1
	 gXPycW1mcGN5Mmmq4zzoAd/vPLo4jfFHfiAOQY6ViRn10oi0Wa/lsJz6Pnq/R4D/Ar
	 cd0mqIWkN6wRw==
Date: Mon, 26 Sep 2022 13:38:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
	martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, paul.bouchara@somainline.org
Subject: Re: [PATCH v6 0/3] MediaTek Helio X10 MT6795 - M4U/IOMMU Support
Message-ID: <YzGPTbRhT1d/EIs9@8bytes.org>
References: <20220913151148.412312-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913151148.412312-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_043900_454300_7207669C 
X-CRM114-Status: UNSURE (   8.94  )
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

On Tue, Sep 13, 2022 at 05:11:45PM +0200, AngeloGioacchino Del Regno wrote:
> AngeloGioacchino Del Regno (3):
>   dt-bindings: mediatek: Add bindings for MT6795 M4U
>   iommu/mediatek: Introduce new flag TF_PORT_TO_ADDR_MT8173
>   iommu/mediatek: Add support for MT6795 Helio X10 M4Us
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |  4 +
>  drivers/iommu/mtk_iommu.c                     | 21 +++-
>  include/dt-bindings/memory/mt6795-larb-port.h | 95 +++++++++++++++++++
>  3 files changed, 118 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h

Applied, thanks.

