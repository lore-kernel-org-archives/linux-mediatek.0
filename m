Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B480C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 13:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8189207A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 13:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8189207A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hMsUQaXOVIDhMnTMf7xxszPmvA4jlZQluUuvM+lx4Lg=; b=n7wgTuurOVDCKNFrploc8a5V9
	ea0HA1SQ8mkkVr4UjosjeLHOdDX4U/iOhHzafXeK4voc6yVInzjpt4N2B6PXZABGA68Uh8W/0ed5E
	UbPAPLnpD5ZtykWbCSzfhQ+AS6dybvLiiBdP0Jekpd79V++cSaJFTnqb4BX1oW81g9f2B1vfgD7Ix
	VzrxzZXNcWQkEE1Ab3kEDGm1+bSntsCDNhYgxX0/j4LNcEBMOJzBBjGf5qYiHyeXkJ4IwGDH4blMV
	dbclNlBFkrRIwNQNijY0irfq7kYt0bmA9D11rLk3w+/+q4AKE/1xjmbe6oqI+5HPWL1T5ImcKWIMw
	9wPvH2fiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4kjx-0006bY-M3; Wed, 27 Jan 2021 13:20:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4kjq-0006a0-3h; Wed, 27 Jan 2021 13:20:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52CDF207A2;
 Wed, 27 Jan 2021 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611753600;
 bh=inUC5PP/mCtOcJb9zEFFxMqaSkScQIwSvgVH1JRqWvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VNuRicZmVe/PskXlJzjLEJ722ZnXFAQLGeRAKTwdR9iqt8/1zUf0zHi0a93TqOGkP
 rd8J65szwWJe+FtycVSdjA/Pp/AKW60v17pMS7LryT8DkN5iWh0XRN509189hWu1NC
 jOXWisvo/4jyP2t9Bd+lGFriZvCvIB8ss7aB45OJw7wtGKw+k4zm3ftZh65z5ODLxm
 1Ol1KFwT6HKrPc7oGrdIdPgYUU49minUmwqG3Q3rdt0Y+1iKUtoXMA7U/bgxniSlHS
 bzV8KHX8UUQSGKM4SAl1HSQgAXL1RXse2L7wLfmgvCLY9frBzkvDeDYcOMrLBPNXuZ
 qP3grMuikAOow==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 0/7] MediaTek IOMMU improve tlb flush performance in
 map/unmap
Date: Wed, 27 Jan 2021 13:19:53 +0000
Message-Id: <161175074760.1106263.14591124622667700357.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107122909.16317-1-yong.wu@mediatek.com>
References: <20210107122909.16317-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_082002_252084_0FC69DB7 
X-CRM114-Status: GOOD (  10.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: anan.sun@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Will Deacon <will@kernel.org>, Tomasz Figa <tfiga@google.com>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 David Laight <David.Laight@ACULAB.COM>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 7 Jan 2021 20:29:02 +0800, Yong Wu wrote:
> This patchset is to improve tlb flushing performance in iommu_map/unmap
> for MediaTek IOMMU.
> 
> For iommu_map, currently MediaTek IOMMU use IO_PGTABLE_QUIRK_TLBI_ON_MAP
> to do tlb_flush for each a memory chunk. this is so unnecessary. we could
> improve it by tlb flushing one time at the end of iommu_map.
> 
> [...]

After discussion with Joerg, I'll queue this (and hopefully the next posting
of your IOMMU driver) along with the Arm SMMU patches, and then send that
all together.

Applied to will (for-joerg/mtk), thanks!

[1/7] iommu: Move iotlb_sync_map out from __iommu_map
      https://git.kernel.org/arm64/c/d8c1df02ac7f
[2/7] iommu: Add iova and size as parameters in iotlb_sync_map
      https://git.kernel.org/arm64/c/2ebbd25873ce
[3/7] iommu/mediatek: Add iotlb_sync_map to sync whole the iova range
      https://git.kernel.org/arm64/c/20143451eff0
[4/7] iommu: Switch gather->end to the inclusive end
      https://git.kernel.org/arm64/c/862c3715de8f
[5/7] iommu/io-pgtable: Allow io_pgtable_tlb ops optional
      https://git.kernel.org/arm64/c/77e0992aee4e
[6/7] iommu/mediatek: Gather iova in iommu_unmap to achieve tlb sync once
      https://git.kernel.org/arm64/c/f21ae3b10084
[7/7] iommu/mediatek: Remove the tlb-ops for v7s
      https://git.kernel.org/arm64/c/0954d61a59e3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
