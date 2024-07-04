Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C8FC3271E
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh5DPmIx0NQ19sZdu8pwq37GYbVEx4AH+iWTXpw/zIs=; b=KUMxiZ7tYrh1VhUviGs4qXX9Vy
	MiUftM5MK1JiHqPlWd9hSW1CWQaBwUEFGY0bi4htdOKKu0m34gKXIkIDCHJFMvkCIHEqAyJvdjUaD
	vsV9H+QZoM/Tk9vWiHWKsVztWo7cDfC0E/4q0VVWf1kPCoFqvZw2xadFXSKJXZSAnMHaFzxN3uPo9
	rd3d6zHW141y9MWKP5N3OgJjonmJlvFqIfZcyvICBZaCVrNsbQj1DiMfNd6qh+mKb5CMIBa84qzNu
	x0g33DhDy5aK4WPiQyykLR0Kzrez5fs80/fGHUc0R0no6LxWPyHElWdTuJyI7w3zuTGzl5FhrQAb5
	GIF9flpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNJL-0000000DQlU-2EJX;
	Thu, 04 Jul 2024 14:19:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNIv-0000000DQUI-1fCN;
	Thu, 04 Jul 2024 14:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8168962795;
	Thu,  4 Jul 2024 14:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D26C3277B;
	Thu,  4 Jul 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102759;
	bh=tinAthcwQkmZq5KjGGBqNh5ILmv4D1DBUWw8o3PmhJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZgWS9U64Q1Rtj422AwKvl9ZE9rydQmtc6v/Q5Z/DUzQF1i5OY5nlH5ox5+QxxSO/9
	 ZKjqyxyWhDNLpg5S15389t71NFQJaQgSPSy4J0WqmBrQrwRn4k1o43ywOYetAvj8mr
	 jbGZIEmcKMlCbHzxjGvnc/LBfKE4mqLhicpTGTMnjbPs7k8Cx+V0QizTEYAm4cj2ah
	 K+OzuTzvAe6PtsNdaBkH50xntcVzaq2s+zHn6+ag+7cSVgfVa6ZsL/kewqnVbNfhYV
	 t5PQacqKf89obLN8RNcl70u0escDHH1Nt958Tq2xbirpt51CnAd2pEN4j4xNKe+Jcm
	 UU6pN9bgsEuJQ==
From: Will Deacon <will@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	yj.chiang@mediatek.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] docs: iommu: Remove outdated Documentation/userspace-api/iommu.rst
Date: Thu,  4 Jul 2024 15:18:59 +0100
Message-Id: <172010203418.3924652.5794968126024490754.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240702120617.26882-1-mark-pk.tsai@mediatek.com>
References: <20240702120617.26882-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_071921_628631_22869708 
X-CRM114-Status: UNSURE (   9.16  )
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

On Tue, 02 Jul 2024 20:05:39 +0800, Mark-PK Tsai wrote:
> The Documentation/userspace-api/iommu.rst file has become outdated due
> to the removal of associated structures and APIs.
> 
> Specifically, struct such as iommu_cache_invalidate_info and guest
> pasid related uapi were removed in commit 0c9f17877891 ("iommu:
> Remove guest pasid related interfaces and definitions").
> And the corresponding uapi/linux/iommu.h file was removed in
> commit 00a9bc607043 ("iommu: Move iommu fault data to
> linux/iommu.h").
> 
> [...]

Applied to iommu (core), thanks!

[1/1] docs: iommu: Remove outdated Documentation/userspace-api/iommu.rst
      https://git.kernel.org/iommu/c/d926e7c04843

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

