Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A293CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:56:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207AC6135C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 207AC6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Clc7Autz6gCgCvkix3MqvJUUHr4MH9dsajvhElQPm+c=; b=SnQZi4IJxPTtL1TSjeGYvm7q6
	vHhFp6k3ZSJMZxuh9dxhSzgVlP9N2THeyyzUWx3NbumDKvPjz6UoWemk4UJgaG2gPU9pIqD7v6M5A
	iBenbXymos3DZmT5M4ofEeGjPSPZStrdPuyh3LtJZmOFR4mveEAakWHAKS47nVocJsGdk9xMXXdW1
	7MhReLBvHwAhqr78KLwpdMQqM1xqPskLN9JcMBXjL1uH60vOrMUM13Oqe9ftpz1nfmJ4KNULRCM5k
	NfALPTRQkGjaVDg+h8s3U3WfQlFAkyMs/BI0lYnNfROE/14vWGm6zjEmEAaQP7J8aKK8nrHrJzSO5
	w0tlcheZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljDJJ-002evq-He; Wed, 19 May 2021 03:55:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDJG-002ev1-Qs; Wed, 19 May 2021 03:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=S/KAedclNU8qmnqec3Ml95ZT6h/23axBf0ZQuILgxHU=; b=35zKIaD1MCU7xbGvjr09k5KBVh
 loELaszjjG+qWB0yK21eKnVYqfDQwmcr3tmzrczNG7vxV5POmPEMZ4MkjlyUdxct0KY8tfKLuyp9t
 D5e6m5UrEiuM6PUD8IKF48m0GkbDfEhwVpRVPjbeq+bScTB9DkC++UxFJeJUgcCaY7SonLhIkftnq
 qMxcJHFXQxYTrKthsW7m8xYF29eh5j8OpCWvvw9An/wPBXGJ2A1mZDfK04+sqg/qFB/bJUXK924m3
 S2gncv+uJqYIJq5bHVBaoNYGHxyrTe60NyZwzrOGB4edVQbTT+t1Ma76g+1+wgCneCKn7YxH6u5j+
 scm7Euhg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDJD-00F6cb-G1; Wed, 19 May 2021 03:55:49 +0000
X-UUID: 193191836dcd467098e55df2779b503a-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=S/KAedclNU8qmnqec3Ml95ZT6h/23axBf0ZQuILgxHU=; 
 b=YToRZ8NaMqOYXDrnE8bDlqAAOkUKR45jAYu4PJTKKfssqrbclns3pyBkfYRZiMlmM04qcxmadyj941yPJzcJxnMc8iAm4k8cmsIbqEgwFneGXL91JIP3VMvGzTBtkZuC7tK2ZIk4IyLm/6D7s1sQitftcS5iMVM3AjyUVfLm+Dw=;
X-UUID: 193191836dcd467098e55df2779b503a-20210518
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1756794877; Tue, 18 May 2021 20:55:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 20:55:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 11:55:40 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 11:55:39 +0800
Message-ID: <1621396540.12301.7.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@kernel.org>
CC: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal
 <vgoyal@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, Andrew Morton
 <akpm@linux-foundation.org>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 19 May 2021 11:55:40 +0800
In-Reply-To: <YKSKq68E9Ompn0vE@kernel.org>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
 <YKPmxEu6YFDXRyTg@kernel.org> <1621383126.12301.4.camel@mtkswgap22>
 <YKSKq68E9Ompn0vE@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_205547_560711_8D729FC2 
X-CRM114-Status: GOOD (  31.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-05-19 at 06:48 +0300, Mike Rapoport wrote:
> On Wed, May 19, 2021 at 08:12:06AM +0800, Miles Chen wrote:
> > On Tue, 2021-05-18 at 19:09 +0300, Mike Rapoport wrote:
> > > Hello Miles,
> > > 
> > > On Tue, May 18, 2021 at 05:24:44PM +0800, Miles Chen wrote:
> > > > This patches is created to fix the __pa() warning messages when
> > > > CONFIG_DEBUG_VIRTUAL=y by unifying the allocation of pglist_data
> > > > instances.
> > > > 
> > > > In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
> > > > pglist_data is allocated by a memblock API. If CONFIG_NEED_MULTIPLE_NODES=n,
> > > > we use a global variable named "contig_page_data".
> > > > 
> > > > If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both
> > > > allocation and symbol cases. But if CONFIG_DEBUG_VIRTUAL is set,
> > > > we will have the "virt_to_phys used for non-linear address" warning
> > > > when booting.
> > > > 
> > > > To fix the warning, always allocate pglist_data by memblock APIs and
> > > > remove the usage of contig_page_data.
> > > 
> > > Somehow I was sure that we can allocate pglist_data before it is accessed
> > > in sparse_init() somewhere outside mm/sparse.c. It's really not the case
> > > and having two places that may allocated this structure is surely worth
> > > than your previous suggestion.
> > > 
> > > Sorry about that.
> > 
> > Do you mean taht to call allocation function arch/*, somewhere after
> > paging_init() (so we can access pglist_data) and before sparse_init()
> > and free_area_init()?
> 
> No, I meant that your original patch is better than adding allocation of
> NODE_DATA(0) in two places.

Got it. will you re-review the original patch?


>  
> > Miles
> > 
> > >  
> > > > Warning message:
> > > > [    0.000000] ------------[ cut here ]------------
> > > > [    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
> > > > [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
> > > > [    0.000000] Modules linked in:
> > > > [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
> > > > [    0.000000] Hardware name: linux,dummy-virt (DT)
> > > > [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
> > > > [    0.000000] pc : __virt_to_phys+0x58/0x68
> > > > [    0.000000] lr : __virt_to_phys+0x54/0x68
> > > > [    0.000000] sp : ffff800011833e70
> > > > [    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
> > > > [    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
> > > > [    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
> > > > [    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
> > > > [    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
> > > > [    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
> > > > [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> > > > [    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
> > > > [    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
> > > > [    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
> > > > [    0.000000] Call trace:
> > > > [    0.000000]  __virt_to_phys+0x58/0x68
> > > > [    0.000000]  check_usemap_section_nr+0x50/0xfc
> > > > [    0.000000]  sparse_init_nid+0x1ac/0x28c
> > > > [    0.000000]  sparse_init+0x1c4/0x1e0
> > > > [    0.000000]  bootmem_init+0x60/0x90
> > > > [    0.000000]  setup_arch+0x184/0x1f0
> > > > [    0.000000]  start_kernel+0x78/0x488
> > > > [    0.000000] ---[ end trace f68728a0d3053b60 ]---
> > > > 
> > > > [1] https://urldefense.com/v3/__https://lore.kernel.org/patchwork/patch/1425110/__;!!CTRNKA9wMg0ARbw!x-wGFEC1wLzXho2kI1CrC2fjXNaQm5f-n0ADQyJDckCOKZHAP_q055DCSWYcQ7Zdcw$ 
> > > > 
> > > > Change since v1:
> > > > - use memblock_alloc() to create pglist_data when CONFIG_NUMA=n
> > > > 
> > > > Miles Chen (2):
> > > >   mm: introduce prepare_node_data
> > > >   mm: replace contig_page_data with node_data
> > > > 
> > > >  Documentation/admin-guide/kdump/vmcoreinfo.rst | 13 -------------
> > > >  arch/powerpc/kexec/core.c                      |  5 -----
> > > >  include/linux/gfp.h                            |  3 ---
> > > >  include/linux/mm.h                             |  2 ++
> > > >  include/linux/mmzone.h                         |  4 ++--
> > > >  kernel/crash_core.c                            |  1 -
> > > >  mm/memblock.c                                  |  3 +--
> > > >  mm/page_alloc.c                                | 16 ++++++++++++++++
> > > >  mm/sparse.c                                    |  2 ++
> > > >  9 files changed, 23 insertions(+), 26 deletions(-)
> > > > 
> > > > 
> > > > base-commit: 8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
> > > > -- 
> > > > 2.18.0
> > > > 
> > > 
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
