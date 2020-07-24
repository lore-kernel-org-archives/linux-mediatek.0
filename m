Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35029C433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:30:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053D820737
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmseYiXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 053D820737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oJyS/0maWypLbqEC+9v+1dOQnMRIJeSV25wQP1EVYcQ=; b=OmseYiXdVuoTvmJd6zRbXilG/
	7IKiBDcF0WwQuOIa5B6swhXVo6RZecD84VohXi9EMHoUG5p9QPs9JsoQ+AqmJGGUrVMIXdSbfPXbD
	joxBGmjo9It+GHdu6Kom3rwg4B0tuxjlThjjMEP5EhddUoeqQcKhTI+OozdYK8Tr8ujF5ua0XJW8D
	nrvkHq1qGf/7Y6mxLIhPnJviI5oXq3Nixfih1IAG7TgEJBQHHHaVZ9+yhm2SW+jrEAMJxqgMRqilx
	1tFgoaOSL+jQ15n7X3b3fdInVqTciViLACZsrv768izkjiPj4mo9UDpDrxym3N+MoUd60oj4v0Qfx
	WeQMTQrdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jywqT-0002q8-4i; Fri, 24 Jul 2020 12:30:37 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jywqP-0002pH-67; Fri, 24 Jul 2020 12:30:34 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 88ADF46A; Fri, 24 Jul 2020 14:30:31 +0200 (CEST)
Date: Fri, 24 Jul 2020 14:30:30 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200724123030.GT27672@8bytes.org>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
 <20200714082821.GC4516@willie-the-truck>
 <20200723113652.GA104096@VM20190228-100.tbsite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723113652.GA104096@VM20190228-100.tbsite.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_083033_408771_09719192 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com,
 airlied@linux.ie, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, baolin.wang7@gmail.com, robdclark@gmail.com,
 agross@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, matthias.bgg@gmail.com, steven.price@arm.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 07:36:52PM +0800, Baolin Wang wrote:
> Thanks Will. Joerg, could you apply this 2 patches if no objection from
> your side? Thanks.

Applied both, thanks. Modified the first patch because another patch
already made __iommu_map static.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
