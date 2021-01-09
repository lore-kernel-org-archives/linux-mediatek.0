Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6088C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 07:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD752388E
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 07:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD752388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AgvG03iQXAeDwN728QjYPAFZxpu1fXQRgsi+1n6EWjc=; b=kmRrXQ8PVejcU1q3VBAAWFEPA
	s6vTVnIXLEBiYegH2WY+eSqRkhNzBGckKZcyM5MdtZpCRZZquCeN8dilO1e6RMy0m0K3V7noQPXAR
	1+Vm62ecMQU6cwKbNupL1rJBUmk9jkTX9+d5I4Y0RfwBBYc1jJK1VvwDUQX3Ww9nngWyWILMnmnCf
	ZrKh3vVVaExZWPhKqC4N/yV4L+fP2muNqwMgaRm1J/YW85+KmMV4+FMx0ABb4MF0S6jkSRzb/3DLV
	bw6CBOom2y5LT8uC3qHSvHiKiG7MdqvswIj+ZhUKb7mjTrf3twrL4wjXLyGEB854JVotxTrWmEPAv
	UKuShXiUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky8lt-0007df-0D; Sat, 09 Jan 2021 07:34:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky8lq-0007cu-Ct; Sat, 09 Jan 2021 07:34:47 +0000
X-UUID: fe573deec831474f9a0a5d0eab7ff24d-20210108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NHlJpQc0+QDOai36XvH2LY+KFkB/HyAXrVm3cptmLCM=; 
 b=suq7DDsIc5xfHVJnnOvQJUrBIxifSU/Lz5NcAAidZVW6Axn7Q5u5HfJfHvwuwkHxv3UsKgBqtcTz0YOS5u14vdCUXQT4/ENlAbTt2O+iggOey4JAenAJNEYH5O5HUFq912kBgWNRf3sQWXcQFKY70U8Kk2x0oT70fk8hF01kfok=;
X-UUID: fe573deec831474f9a0a5d0eab7ff24d-20210108
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735020800; Fri, 08 Jan 2021 23:34:44 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 23:34:42 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Jan 2021 15:34:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 Jan 2021 15:34:23 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <andreyknvl@google.com>
Subject: Re: [PATCH 0/3] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Sat, 9 Jan 2021 15:34:23 +0800
Message-ID: <20210109073423.7304-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAAeHK+xaVvvMfd8LhPssYi+mjS-3OVsDaiNq2Li+J7JLF6k3Gg@mail.gmail.com>
References: <CAAeHK+xaVvvMfd8LhPssYi+mjS-3OVsDaiNq2Li+J7JLF6k3Gg@mail.gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7E68C651933D07E578D2C654DCA4A58D67A68FF833FFF0EAAD1CDFA66580C7002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_023446_724172_FFC21AED 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: lecopzer.chen@mediatek.com, linux-mm@kvack.org, catalin.marinas@arm.com,
 yj.chiang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, lecopzer@gmail.com,
 glider@google.com, linux-arm-kernel@lists.infradead.org,
 aryabinin@virtuozzo.com, akpm@linux-foundation.org, will@kernel.org,
 dan.j.williams@intel.com, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrey,
>  
> On Sun, Jan 3, 2021 at 6:12 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
> >
> > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> >
> > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > by not to populate the vmalloc area except for kimg address.
> >
> > Test environment:
> >     4G and 8G Qemu virt,
> >     39-bit VA + 4k PAGE_SIZE with 3-level page table,
> >     test by lib/test_kasan.ko and lib/test_kasan_module.ko
> >
> > It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL,
> > but not test for HW_TAG(I have no proper device), thus keep
> > HW_TAG and KASAN_VMALLOC mutual exclusion until confirming
> > the functionality.
> 
> Re this: it makes sense to introduce vmalloc support one step a time
> and add SW_TAGS support before taking on HW_TAGS. SW_TAGS doesn't
> require any special hardware. Working on SW_TAGS first will also allow
> dealing with potential conflicts between vmalloc and tags without
> having MTE in the picture as well. Just FYI, no need to include that
> in this change.

Thanks for the information and suggestion, so this serise I'll keep 
only for KASAN_GENERIC support :)



BRs,
Lecopzer
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
