Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7334FC7EE39
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiy+F/Thxk00DAZfAeDvbH8iwPOVeSIk3RRSbBB7wL8=; b=Z5iPa1mdiJdpn5mqL0qF5lZvB7
	Scm9vZXig0lADlKP9VtDPngxNivhKT3Hob5qC5BPgWwhdEj3zYPB5Qgrp10PfpeAp6/njZSegZ+y6
	L29aytXG1adujVLaJTJ5ZdXw2YSUfxXXg2LveqR8wK0HYUyfUGQKEJS3GcgPW+lVIpicLpfYBHmUN
	78SfX/JJ5fk7MGhc4QOV6fsSGQfR1MiopXLIR0ulUO0l7IsZlE+/uHK4GPbP6HT7ST+u8sJW0kpCx
	CILxZTbZ8KmQWopFNRoWWSZilv8Jz/mku7Pqca0+MX0eXiZUZ3ncjbflynWl6uAWzpH3VjznASROq
	Yk7ycdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3gc-0000000Dqcc-3tvO;
	Fri, 27 Jun 2025 07:39:50 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Pk-0000000Dokg-2Jwq;
	Fri, 27 Jun 2025 07:22:25 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 53E654EF8A;
	Fri, 27 Jun 2025 09:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751008943;
	bh=Dk/pBSmbJ17G6vO11eCrfBy5crU9pUYl5+E7dDjzLlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W90/rGBohRzRVv6HgAAOv7PSVTsfEuTP3aUn5CDsuQmDT9XlTMO+0gR7jIt0qcOLH
	 fkmIndB80JUhTMxMGfy+d1/kyocyju5bZT8qEjBljyb0u9vPzJG4D+7RnsQz3zE3JV
	 b2wkrrhZGz2vgvXJ1siyMPBFgrA3rt+yCiLp6JTvNmd6/QnMFjW4t9FOgkOlaQT3xK
	 hPRXD8cf6rHD+eSRVVZnnQbenZF1hhilsdK0Xlfki1yrDNefaZVf+cQXWYchV0A8hy
	 RXkvZ+UGxAxk71dthG2jEp/vThsIzYGxldIoPKcl+npZucUoE0YYcw2j1zrYs7FHOo
	 0+P4869YykfoA==
Date: Fri, 27 Jun 2025 09:22:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] iommu: omap: Simplify few things
Message-ID: <aF5GrmCO7AkkKLaI@8bytes.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_002224_805720_5092F8D0 
X-CRM114-Status: UNSURE (   7.42  )
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

On Tue, Jun 24, 2025 at 02:22:29PM +0200, Krzysztof Kozlowski wrote:
> Krzysztof Kozlowski (3):
>       iommu: omap: Drop redundant check if ti,syscon-mmuconfig exists
>       iommu: omap: Use syscon_regmap_lookup_by_phandle_args
>       iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable

Applied patches 1 and 2 to the ti/omap branch, thanks.

