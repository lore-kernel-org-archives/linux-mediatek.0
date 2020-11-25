Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCEBC5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 12:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED6F206E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 12:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTIOjbTM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYtQ0Ok0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BED6F206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GOlz0Mntfl+P5aMXooDdk4p8SA0H7nH3TopnEgSTG3E=; b=GTIOjbTMkaRDuao4z4nMaCNkR
	yT0YMTJzoyEUg1mMEcQ9aOH52mx2Ahhia8Ve2or9vL5GVoGlxbeE48cA8pZMvnqyZ+0wO1vZTxB21
	QgTBmnl3HxRyEUQ0DLSfbMak4fBCyJu2/eHIfPkUEmLwUIBODc00oGE+qh54y/0d50LnlBBFe7eJM
	ONgaHLhmnnmlZgdyylWBCeUml+QwbfhmdZpIf2FQs2MtdYLUzZR+ATxWw5xu75Scdaj9OCt9UtOsS
	8vQ2NtEwWq7n+kqQlxc47ChX7JU1H76x2FobkZvVCRxFyHHXU/7+Xtp5mM7XKMnONI+lw8pH5sdtu
	C9tfHt1ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khttS-0000hK-HZ; Wed, 25 Nov 2020 12:27:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khttO-0000gG-NB; Wed, 25 Nov 2020 12:27:27 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE9A9206E5;
 Wed, 25 Nov 2020 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606307245;
 bh=evEwLaFL1TOZnnmN2k1Ii9RUrk1eDitE23z2suTvQ6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYtQ0Ok0TCUzNBLXPdRIrDidqt/+lGu4bC88noEHv4ZMCgWO/rJgzP+yJkNy7Oa90
 l9N+Vo+HlQF+Xwy2MM/kcLk3cTL83wXG64ym2wPiLcJMKvrogdozHwhQjRstglhPfG
 kBPeDf+3nYbBXC3BUX7o89t6jAJIpzXJZPE5pgAs=
Date: Wed, 25 Nov 2020 12:27:19 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>, robin.murphy@arm.com
Subject: Re: [PATCH v2 0/6] MediaTek IOMMU improve tlb flush performance in
 map/unmap
Message-ID: <20201125122719.GB15697@willie-the-truck>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119061836.15238-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_072726_857408_C0B4E0B4 
X-CRM114-Status: GOOD (  20.69  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 jun.wen@mediatek.com, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 02:18:30PM +0800, Yong Wu wrote:
> This patchset is to improve tlb flushing performance in iommu_map/unmap
> for MediaTek IOMMU.
> 
> For iommu_map, currently MediaTek IOMMU use IO_PGTABLE_QUIRK_TLBI_ON_MAP
> to do tlb_flush for each a memory chunk. this is so unnecessary. we could
> improve it by tlb flushing one time at the end of iommu_map.
> 
> For iommu_unmap, currently we have already improve this performance by
> gather. But the current gather should take care its granule size. if the
> granule size is different, it will do tlb flush and gather again. Our HW
> don't care about granule size. thus I add a flag(granule_ignore) for this
> case.
> 
> After this patchset, we could achieve only tlb flushing once in iommu_map
> and iommu_unmap.
> 
> Regardless of sg, for each a segment, I did a simple test:
>   
>   size = 20 * SZ_1M;
>   /* the worst case, all are 4k mapping. */
>   ret = iommu_map(domain, 0x5bb02000, 0x123f1000, size, IOMMU_READ);
>   iommu_unmap(domain, 0x5bb02000, size);
> 
> This is the comparing time(unit is us):
>               original-time  after-improve
>    map-20M    59943           2347
>    unmap-20M  264             36
> 
> This patchset also flush tlb once in the iommu_map_sg case.
> 
> patch [1/6][2/6][3/6] are for map while the others are for unmap.
> 
> change note:
> v2: Refactor all the code.
>     base on v5.10-rc1.

Robin -- please can you take a look at this series? I'm not sure I'll
have time to get to it at the moment and you understand how this stuff
is supposed to work.

Cheers,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
