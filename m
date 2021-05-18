Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F21FC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:40:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B4F61353
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B4F61353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYjVK3U/pOkTcC0lbxrqeQSL8z9vBBTQ3g8MF2krAHY=; b=cRkF1rRPn6pKr1Z7MBxEoTfJM7
	3SpLJHCjyx7TR0jgRdtIRB+1RbtxIHD8i5RtEE6YZ/WPcsGUl+JOwD9Q3i1xIH7RFMMsleoBJd7eV
	Cwcjk0/7pe16reOsJZg1LWJ5cJ0B4puztWYrvHCe64dvmUFajFb0N0UTrCSYKN2PXCZJyyzq4/uFT
	XH1kJ5+Cjn8dzRtphAwm8wcdWgoAJ0tN2cwnUO1eB+vgzEszq/9r4ruttt5aD+PpTwjuBtK8OMkqP
	DvvTkE7IsAfkiOcrua3y1DDM3tO11JdMbQKaskQC5LioNZCVlKTX4XelXaUbjwTy3fuMeBlufnVA+
	tJidF1IA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwDC-000Bca-3F; Tue, 18 May 2021 09:40:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwD8-000BbS-Kn; Tue, 18 May 2021 09:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=d+riBQgSqs2G+wl0ukQcn5Ovjj2Flf7ONxklhZAuy4A=; b=DFkWEahBaXQKpFfdr/+Yk7kdAm
 E5AXmsKc2Le6GgadCqrTbD6JxQP+AcuFX+aD/P+/RFcAu2ZoY9GPRfINdqmNG7SY/r/xL88M8kMhL
 5sy8Hzgy/UWHFxWFDWBJJMVkJB/Z17JIvUrtaJFKMo34XLNTgg9DAGd0JJuPPnbOsT0Pb2lDYcAeL
 GtScW2kb/hhoq9SaptKbMaK1l4/UrJDGsVmqo5C3sIBpcM78Bv5RpMAx1Mg0q9d8rtQy+AxlzlqiN
 CP4y5alpZvwVhLSvC+lsyP40iGmKW1EPdaXQtZBkiwW0foYGYDWNSLMtjfuSnEQiGJtyQp5XIoK97
 XrpGTvOw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwD4-00EWBD-Ol; Tue, 18 May 2021 09:40:21 +0000
X-UUID: 730d835563134aa5a6f4fc375b2d3ee1-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=d+riBQgSqs2G+wl0ukQcn5Ovjj2Flf7ONxklhZAuy4A=; 
 b=rswuSQPg6Uw3lgSXNMMP1DQm34yK+opTxgm+9OPQxleQ9XvG7GNYLyJeWnOttst7iMbA5Lc7Q1UyNNBO9ie6cHmSQSCK+W2pvEOrx00NQyitjNHQrI8s3Plp+9gGaXD83d9nRDJVmnBad++mddK6gX7cONMvqVuF0DWD9BiNztw=;
X-UUID: 730d835563134aa5a6f4fc375b2d3ee1-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 541981679; Tue, 18 May 2021 02:40:11 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 02:40:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 17:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 May 2021 17:40:08 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal
 <vgoyal@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Mike Rapoport" <rppt@kernel.org>
CC: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
Date: Tue, 18 May 2021 17:24:44 +0800
Message-ID: <20210518092446.16382-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_024018_859643_AD083809 
X-CRM114-Status: GOOD (  13.44  )
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

This patches is created to fix the __pa() warning messages when
CONFIG_DEBUG_VIRTUAL=y by unifying the allocation of pglist_data
instances.

In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
pglist_data is allocated by a memblock API. If CONFIG_NEED_MULTIPLE_NODES=n,
we use a global variable named "contig_page_data".

If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both
allocation and symbol cases. But if CONFIG_DEBUG_VIRTUAL is set,
we will have the "virt_to_phys used for non-linear address" warning
when booting.

To fix the warning, always allocate pglist_data by memblock APIs and
remove the usage of contig_page_data.

Warning message:
[    0.000000] ------------[ cut here ]------------
[    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : __virt_to_phys+0x58/0x68
[    0.000000] lr : __virt_to_phys+0x54/0x68
[    0.000000] sp : ffff800011833e70
[    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
[    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
[    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
[    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
[    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
[    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
[    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
[    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
[    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
[    0.000000] Call trace:
[    0.000000]  __virt_to_phys+0x58/0x68
[    0.000000]  check_usemap_section_nr+0x50/0xfc
[    0.000000]  sparse_init_nid+0x1ac/0x28c
[    0.000000]  sparse_init+0x1c4/0x1e0
[    0.000000]  bootmem_init+0x60/0x90
[    0.000000]  setup_arch+0x184/0x1f0
[    0.000000]  start_kernel+0x78/0x488
[    0.000000] ---[ end trace f68728a0d3053b60 ]---

[1] https://lore.kernel.org/patchwork/patch/1425110/

Change since v1:
- use memblock_alloc() to create pglist_data when CONFIG_NUMA=n

Miles Chen (2):
  mm: introduce prepare_node_data
  mm: replace contig_page_data with node_data

 Documentation/admin-guide/kdump/vmcoreinfo.rst | 13 -------------
 arch/powerpc/kexec/core.c                      |  5 -----
 include/linux/gfp.h                            |  3 ---
 include/linux/mm.h                             |  2 ++
 include/linux/mmzone.h                         |  4 ++--
 kernel/crash_core.c                            |  1 -
 mm/memblock.c                                  |  3 +--
 mm/page_alloc.c                                | 16 ++++++++++++++++
 mm/sparse.c                                    |  2 ++
 9 files changed, 23 insertions(+), 26 deletions(-)


base-commit: 8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
