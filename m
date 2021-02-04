Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9803AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 17:57:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4315B64E27
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 17:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4315B64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hGjQWwW3xMYE4VH6k1W4+50Y3//lwI/04YrPwd+o20k=; b=NyIBs5xjCbKPq0QDMo3Ufnow9
	OLpqk748Cao84A8QkNKShqNZPl66hMfKyhw15tIsIpCya6v1tpOMqvstS+5b/XlDsQutKs2384Lem
	bMjtmPLhU4fnHWDOBV48hwboz4HY5s3ecY74Q5NBeQI+i7/ZEkGD26uQbmq25qkeuVxncJh157Ei6
	6G8ORGPGvbtS1CGAX2oGbXyy5sSvCbZJQoMOqrKO1h1XInVanJnnk2HUwHng/8vdvXgAX7BRSxqzG
	X3fNa85NmUdtk7meGRUgV3zCRrNPTI0vGfKsza2nEzOegEqn0wOkCS6DZLq+a97yrg72YnZfD2d9g
	31b+KbnCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7isS-0005B5-6w; Thu, 04 Feb 2021 17:57:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7isO-00059l-2G; Thu, 04 Feb 2021 17:57:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6061964E16;
 Thu,  4 Feb 2021 17:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612461427;
 bh=3sPIg9fnAown5IUecDaUUMqiHn7bKJeyVpbW19hTsso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvZC0GgAhbuDO6RriMojAl/CW+Fp3wdv9ID1v6pR5TsmJRuUTuY3Yk4dEnvXcfstE
 2S7BoGrI11pVfImSibDzFy3l9+tRdSS1jqpVHwGPN7ldhHUL7Eo7iHkJpEWpD4s8Bf
 zMI+nTiKiWxrJBnGhVEcPL5AXZCxn8enHrCLxdMpdeWuscnZO2q5FFeiVKzA9TThTO
 3fjCXiLzybhHWpVLQQwBDyNuF0tsp+E6UarJkit7bwil7PB1+jaiRS0y/s/8cB+W6s
 V05v52MdeOXWXxplLWoeWSwvs3oOISA6vUGgdjFq3yd2r5u7TEvsQ39PFF3KlW0cWF
 ztCFT1Up4ukXg==
Date: Thu, 4 Feb 2021 17:57:00 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
Message-ID: <20210204175659.GC21303@willie-the-truck>
References: <20210204124914.GC20468@willie-the-truck>
 <20210204155346.88028-1-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204155346.88028-1-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_125708_222116_5D7198EC 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com, dvyukov@google.com,
 aryabinin@virtuozzo.com, linux@roeck-us.net, andreyknvl@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 11:53:46PM +0800, Lecopzer Chen wrote:
> > On Sat, Jan 09, 2021 at 06:32:48PM +0800, Lecopzer Chen wrote:
> > > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > ("kasan: support backing vmalloc space with real shadow memory")
> > > 
> > > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > > by not to populate the vmalloc area except for kimg address.
> > 
> > The one thing I've failed to grok from your series is how you deal with
> > vmalloc allocations where the shadow overlaps with the shadow which has
> > already been allocated for the kernel image. Please can you explain?
> 
> 
> The most key point is we don't map anything in the vmalloc shadow address.
> So we don't care where the kernel image locate inside vmalloc area.
> 
>   kasan_map_populate(kimg_shadow_start, kimg_shadow_end,...)
> 
> Kernel image was populated with real mapping in its shadow address.
> I `bypass' the whole shadow of vmalloc area, the only place you can find
> about vmalloc_shadow is
> 	kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> 			(void *)KASAN_SHADOW_END);
> 
> 	-----------  vmalloc_shadow_start
>  |           |
>  |           | 
>  |           | <= non-mapping
>  |           |
>  |           |
>  |-----------|
>  |///////////|<- kimage shadow with page table mapping.
>  |-----------|
>  |           |
>  |           | <= non-mapping
>  |           |
>  ------------- vmalloc_shadow_end
>  |00000000000|
>  |00000000000| <= Zero shadow
>  |00000000000|
>  ------------- KASAN_SHADOW_END
> 
> vmalloc shadow will be mapped 'ondemend', see kasan_populate_vmalloc()
> in mm/vmalloc.c in detail.
> So the shadow of vmalloc will be allocated later if anyone use its va.

Indeed, but the question I'm asking is what happens when an on-demand shadow
allocation from vmalloc overlaps with the shadow that we allocated early for
the kernel image?

Sounds like I have to go and read the code...

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
