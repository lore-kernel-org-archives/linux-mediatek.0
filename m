Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29EDC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQpbCrVhQIQxsbaSiD8JLOzXPqyQlFpylLQvoDgSYZA=; b=K4ozixCbNb9Cdsu0mcy9NEi1Yl
	FOUC4ncutw88MyxOReEaYaq1skLswDX/Cf2wPVbvgAC195gacp2zZmYMzJIUDd5RETjJkvx4FOuMW
	hO1sMWFIyUsnviWlSyKUlrhCotxpsB1uzh21JqHoEauj8aaH2GLMznTVSqtr9MTLo3+dEb6lLVmcT
	OSeQ2zPO589xneRvzDap+YDd27kBjOoXYkhE7hs3XZKxHSZFUUwCNS0YzKcxcCvNg8Byab3BUtDfS
	sdztOSBpNMtKMmEXDP9Y6kXA9p/dQjiTqzp1IsxZOdCZrTKQGoageMgfy/HeCBtrQ3be+tXoP2tBc
	QdG+I86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX1c9-009bbf-09;
	Fri, 18 Aug 2023 15:42:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX1c5-009baS-2p;
	Fri, 18 Aug 2023 15:42:15 +0000
Received: from localhost.localdomain (93-41-0-106.ip79.fastwebnet.it [93.41.0.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EFE4660724F;
	Fri, 18 Aug 2023 16:42:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692373324;
	bh=+Hv9exfgv7xX14b0KoI7ObSiwdSECkno/LP+jJg9ooQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vmy/G2bKH6FeAMy35lKKk+oJcCxYOwNm/Cc4IC4K6DsOHDkjd+uKO4DqSXP8hHHOf
	 asenBDMHlh5j5geVgJnQ8l9gvaeMzNtXX2ks/7NyRtw1L8iCmG8KRil8yuNn85nsdb
	 2MgurU6RtpMgmi9yI56xUZLiyuKnzj6uQ786C8q/KlwxEi7OHVwt/R1eSOFkiSe+Zr
	 tXv8bcM39/h6KnzFTvaQkmJw0TDIPoge4RufR2qawErNKRLa72Gyu9UN3jhy5pRku2
	 DOeFJZ3r160AJORKKMB0jcMFAfcMh2hmBsKGA/Ro0W3wOsBldOUN3OAYIzqC0wl/lI
	 H7uBezxrCMkwA==
From: Laura Nao <laura.nao@collabora.com>
To: yong.wu@mediatek.com
Cc: angelogioacchino.delregno@collabora.com,
	chengci.xu@mediatek.com,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	jianjiao.zeng@mediatek.com,
	joro@8bytes.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mingyuan.ma@mediatek.com,
	robh+dt@kernel.org,
	robin.murphy@arm.com,
	will@kernel.org,
	yf.wang@mediatek.com,
	kernel@collabora.com
Subject: Re: [PATCH v12 2/7] iommu/mediatek: Fix two IOMMU share pagetable issue
Date: Fri, 18 Aug 2023 17:41:56 +0200
Message-Id: <20230818154156.314742-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602090227.7264-3-yong.wu@mediatek.com>
References: <20230602090227.7264-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_084214_059910_C51A7B8D 
X-CRM114-Status: UNSURE (   7.95  )
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

Hello,

This patch is causing fluster tests to fail on MT8192, IOMMU read and write faults are reported in the log. Here's an extract is from the VP9 tests:

mtk-iommu 1401d000.m4u: fault type=0x280 iova=0x1ff7c0000 pa=0x0 master=0x5000480(larb=5 port=0) layer=0 read
mtk-iommu 1401d000.m4u: fault type=0x280 iova=0x1fe3ee000 pa=0x0 master=0x5000492(larb=5 port=4) layer=0 write

Tests are failing for H264, VP8 and VP9 decoding on next-20230817 with fluster in the same way, complete logs can be found here: 
- H264: https://storage.kernelci.org/next/master/next-20230817/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h264-mt8192-asurada-spherion-r0.html
- VP8: https://storage.kernelci.org/next/master/next-20230817/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-vp8-mt8192-asurada-spherion-r0.html
- VP9: https://storage.kernelci.org/next/master/next-20230817/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-vp9-mt8192-asurada-spherion-r0.html

Reverting this patch fixes the issue. 

From my understanding, on MT8192 the 16GB iova space is partitioned between display, vcodec and camera. The iommu domain configuration for vcodec was loaded from frstdata->bank[0]->m4u_dom (vcodec is preassigned to a specific iova range), while after this patch a new pagetable is created instead. 

Do you have any insight on how to fix this while keeping compatibility with MT8188 and MT8195?

Best,

Laura

