Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C7DC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 14:56:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01B022287
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 14:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nh9qiSgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F01B022287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RAdP7IAc3ISr9SXbN9IGZWBW7kuWeiOluVQBEb5QbcU=; b=Nh9qiSggKbz9HAQO2us/TtQEj
	UYEOOdbL/U3M1vtpp7KiaOdlr+O/Lz7NGWaNw3gDdEq8VwyKB1G1WuWBCPNB7aO31iWLA6s5fYA3A
	7JrN2GO2isXQSi9IHOAjU3OW/reJbJFHDqAMw3mseWCfs7KHJT85oFcLmiT3yPYzvGScMnk/VERdm
	dVt3rJwjd1pJfcVbGUH3vAUg6Y0Ki7q+fgPO8tRvoW/aOS2ERiVbvD5v+1F9q9rYLnKtoOf5rR9F0
	ehpUktil2rbEmh+NxtwbdFu59kB8uLiNiovqEA58ymN1zsBTv+2a1aJntqrdVpB+iTHafStcFTm/h
	ruTiJsE+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIYra-00025K-IR; Wed, 16 Sep 2020 14:56:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYrV-00023F-F6; Wed, 16 Sep 2020 14:56:46 +0000
Received: from gaia (unknown [46.69.195.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 902F222283;
 Wed, 16 Sep 2020 14:56:42 +0000 (UTC)
Date: Wed, 16 Sep 2020 15:56:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Phil Chang <phil.chang@mediatek.com>
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Message-ID: <20200916145639.GC3122@gaia>
References: <20200916083703.GA26411@infradead.org>
 <20200916133324.6280-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916133324.6280-1-phil.chang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_105645_616204_CBCB4CAC 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alix Wu <alix.wu@mediatek.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 YJ Chiang <yj.chiang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Mike Rapoport <rppt@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 09:33:24PM +0800, Phil Chang wrote:
> this patch allowing the DMA32 zone be configurable in ARM64.
> For some devices, the main memory split into 2 part due to the memory
> architecture, the efficient and less inefficient part.
> One of the use case is fine-tune the dma32 size to contain all the
> efficient part of memory block on this kind of architecture
> 
> Signed-off-by: Alix Wu <alix.wu@mediatek.com>
> Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
> Hi
> 
> supplement the reason of this usage.

That's really not a good enough justification to merge such patch. As
Christoph said, DMA32 is defined as addressing the first 4GB of RAM.

Is the memory inefficient (presumably slow) for device or for the CPU?
Maybe you can pretend it's a separate NUMA node for the CPU.
Alternatively, change your device DMA coherent mask and allocate only
from ZONE_DMA (currently first 1GB on arm64).

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
