Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BBBC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 12:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F395664F58
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 12:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F395664F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvRde858EQySBrb0e48xlFS6xkh2eAQq/Cbov7WJSG8=; b=BiFZLnVQILYI+vV00v61AiDdh
	shl0AYNwfg6G0uttQF/65bGfWHgK2LJD5Lg1llFDS/HNEl1gT2hzD0vEgU/IIxr2fzpZZeGRXUGqs
	zju7y0V93d04gWWxrarqW6cYU8Remvol7ndOGa2Hn47EwuGmZVdruRIkmzY5+XzIYcYzIaD1tgoX0
	Ao1o8zHexTUbLMLLQzFqAykoMZy1u9FV4ahoYOYLQtbNf5kJNd97Mq0fB5VfEVYh6abU3vNYd9ZK6
	D/O2kR3dwUk/9hdzPAo/oTwdwARoi+0mLtMGBqI1TGobuH8JLVKcJEtKephpq3z3LXApfMBsdDhaU
	eCc/MnYSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7e4f-0002Il-E6; Thu, 04 Feb 2021 12:49:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7e4Y-0002GQ-Lr; Thu, 04 Feb 2021 12:49:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11F4464DF8;
 Thu,  4 Feb 2021 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612442961;
 bh=evq41kJogdMign7eZfsMLjpvkEQt0WpyoEhGnh7ALbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5ESek0ogYAsRxTgPFKCH2o4S7NHSkwWHsah5+WgKQ4R/NRNs8uKwOJpG2MbprQlh
 d2rBQMD0wt5M7hFw44yRDrzBEMaCF7nVCHPiCwxOifB0iD9inaqeUjHTkVjy0ECQ/B
 EpEHJ5xcmcIWyxRAsqp3bbuQeW1zftjtzUhAbpxiAIJHQ9a/SpIVB7HrxlBP2hx7Rw
 wUw/tHH1S/PZtziQBzQffSQKIhmLJRtOaL/jubf2IXPAIjPZGdCsjMROfrDlzHfla4
 hQtkFBEmfZUqcYHjY9+p0hyrqlsbmXwaISOU1f2O5KDRajgYCoi+k4tBfdwkaew/gG
 jUfoa0i0RZqCg==
Date: Thu, 4 Feb 2021 12:49:14 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
Message-ID: <20210204124914.GC20468@willie-the-truck>
References: <20210109103252.812517-1-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_074922_806354_81345CCF 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, aryabinin@virtuozzo.com,
 linux@roeck-us.net, andreyknvl@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dan.j.williams@intel.com,
 dvyukov@google.com, gustavoars@kernel.org, akpm@linux-foundation.org,
 robin.murphy@arm.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jan 09, 2021 at 06:32:48PM +0800, Lecopzer Chen wrote:
> Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
> 
> Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> by not to populate the vmalloc area except for kimg address.

The one thing I've failed to grok from your series is how you deal with
vmalloc allocations where the shadow overlaps with the shadow which has
already been allocated for the kernel image. Please can you explain?

Thanks,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
