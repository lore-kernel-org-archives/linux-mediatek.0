Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43472C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Nov 2022 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhKasjGG3HcoK+Oubn1Au35QshHsoc35c1Bnzk9pzaY=; b=FcasiDJoCeeKhcGjmhU/y9SORr
	JLVqbLUJxHYbRCBiUktCvFVVXuO9qplGQ08y5OoR7K2rGxXcpHtVi+IrjrmiKiMnMnLgvnI5ENkTv
	BIL6hd14FB/9EUqvM0nOuZidC3sFUEtl4ux3WCiLla1CdUj8Hs8fXkk2mtxj4gKRxjzFHLcngn8DQ
	PZ101cYcOB1I0wZEAMXVx0UkXnLrpFjkzzgwas1Rn+fW8rkxkMM8oNechSEovqTT4IdMy2brixLGi
	KUgjg5ePvlYgae5QRVoe2tFdoJfcclUIB94XH62eW3FDa/C6jaft0eOiUGjT7mVxs9b7NqOxsBsZV
	A3kS1fKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owJtP-00Cc4x-5G; Sat, 19 Nov 2022 09:12:07 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owJtF-00Cc3X-Ep; Sat, 19 Nov 2022 09:11:58 +0000
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C49A62A02E2;
	Sat, 19 Nov 2022 10:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1668849116;
	bh=Mnj+XKy1eq+cpp4M1nNQ/BJ5gwNgtt/9NmvCYlk98lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkWUk44EuE6Qzf35kclftWpLfCtg5ilCYc4uaPR850QcfeUrf1tp1Xm1Ey8URAcvp
	 KPyU/rgiN1ln6vSNBM325IHlDDXjPBHs0iRmodqDjuzaL0p3qOU0jV6SjJOmUGXy32
	 aZCZXRxrcB3MT4F88H565tRMhKpsaqIv/5Iu9xz2zYZh4FZtMcZJGNcoekVl8hpuD6
	 q+2xw5rkrkBCeqXuPxDrwFq4N3LAGWW/kFPJHKks3Z+8eA6drLrbp/T4p/aQQ/WV6k
	 2f07Coc9oEeoftLXAwMzfR04vHUrJaWJYUqa4xmZkeRSNkDOGSIR6xRVYz9lNp8aSb
	 7XISudJwIVM+w==
Date: Sat, 19 Nov 2022 10:11:54 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/3] iommu/mediatek: Add mt8365 iommu support
Message-ID: <Y3id2iJdLxdr6L5o@8bytes.org>
References: <20221001-iommu-support-v6-0-be4fe8da254b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221001-iommu-support-v6-0-be4fe8da254b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_011157_662898_C4515C87 
X-CRM114-Status: UNSURE (   8.87  )
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

On Wed, Nov 02, 2022 at 04:18:06PM +0100, Alexandre Mergnat wrote:
> Fabien Parent (3):
>       dt-bindings: iommu: mediatek: add binding documentation for MT8365 SoC
>       iommu/mediatek: add support for 6-bit encoded port IDs
>       iommu/mediatek: add support for MT8365 SoC

Applied, thanks.

