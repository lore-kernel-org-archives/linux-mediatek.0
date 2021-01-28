Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF77C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:54:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1F364DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1F364DCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=St9OYEkuiqnwvkN0ZAfm5nlhixggOKFXDabY8CY2vU4=; b=JuClELsCpH9zNk5EthtUXUa8c
	Foyv75p/uR9ocllIID6c1GcZflabkPLHraNLRcdOigP+EeZiIzqHGunk2e5VrLlvhi0WOcWuLPM4l
	/dfSqHPT0tzY6yl9Jp8DKbNVmrKrwaIxHAmEI0KKCYLC5M9JQbfosXmtK7wBJ2wQX7naUG925OsHa
	WN0aE4Qo+kZbOnk2lrKceq1i9u3HnzvrJybHcwC8GDtEP1OyNuyfM7KAc2EhiT5w1WiMuW9d3YOtu
	B/97YPf8l5beLbwLnKk9grGBn6Ybxh7/Kdj9p7PNHdVhZjp0ob1GEBjdxqxxDaPWdwnLfC+4xvYFw
	SPJv3MWIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l533p-00062y-Vn; Thu, 28 Jan 2021 08:53:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l533l-00061C-89; Thu, 28 Jan 2021 08:53:50 +0000
X-UUID: 59d995f64888430b9e3076d39af33d7d-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DJgNaO5cyLH0HZinglN5kuwAC5rL7Wm7tibcT50HPEM=; 
 b=odz86hBrRkCeG/z9hc49IXlowQiamhYQszaGo1nnbCIuBft29DZ/evzVuWv72yWh6LcpwNgiG50FZ8qkWCiAUxKdrerotjAGbzVCbwGQf7JDVO9MmZMsyPi1hzBliquO6b2HSWEX7DIJavsbtbEG8r2LTgN5CenIc5LsLAqm15s=;
X-UUID: 59d995f64888430b9e3076d39af33d7d-20210128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1975081759; Thu, 28 Jan 2021 00:53:39 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 00:53:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 16:53:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Jan 2021 16:53:36 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <will@kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: kaslr: support randomized module area with
 KASAN_VMALLOC
Date: Thu, 28 Jan 2021 16:53:26 +0800
Message-ID: <20210128085326.22553-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210127230413.GA1016@willie-the-truck>
References: <20210127230413.GA1016@willie-the-truck>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_035349_507001_2364F97C 
X-CRM114-Status: GOOD (  16.82  )
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
 lecopzer@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 
> On Sat, Jan 09, 2021 at 06:32:52PM +0800, Lecopzer Chen wrote:
> > After KASAN_VMALLOC works in arm64, we can randomize module region
> > into vmalloc area now.
> > 
> > Test:
> > 	VMALLOC area ffffffc010000000 fffffffdf0000000
> > 
> > 	before the patch:
> > 		module_alloc_base/end ffffffc008b80000 ffffffc010000000
> > 	after the patch:
> > 		module_alloc_base/end ffffffdcf4bed000 ffffffc010000000
> > 
> > 	And the function that insmod some modules is fine.
> > 
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
> >  arch/arm64/kernel/module.c | 16 +++++++++-------
> >  2 files changed, 19 insertions(+), 15 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> > index 1c74c45b9494..a2858058e724 100644
> > --- a/arch/arm64/kernel/kaslr.c
> > +++ b/arch/arm64/kernel/kaslr.c
> > @@ -161,15 +161,17 @@ u64 __init kaslr_early_init(u64 dt_phys)
> >  	/* use the top 16 bits to randomize the linear region */
> >  	memstart_offset_seed = seed >> 48;
> >  
> > -	if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> > -	    IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> > +	if (!IS_ENABLED(CONFIG_KASAN_VMALLOC) &&
> > +	    (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> 
> CONFIG_KASAN_VMALLOC depends on CONFIG_KASAN_GENERIC so why is this
> necessary?
> 
> Will

CONFIG_KASAN_VMALLOC=y means CONFIG_KASAN_GENERIC=y
but CONFIG_KASAN_GENERIC=y doesn't means CONFIG_KASAN_VMALLOC=y

So this if-condition allows only KASAN rather than
KASAN + KASAN_VMALLOC enabled.

Please correct me if I'm wrong.

thanks,
Lecopzer


 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
