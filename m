Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZKykl6rTxUa64xHAvAqTpV6O1Sje66RHgArWTF88SE=; b=g6JYFMZRJnqmUI
	2Fc2xi9/ahPNSvfSGNcEx4Bqs+EQljeGaBJjyLxr8ZMt7WgQk2b5wGmecdK1iGuqrim+8yKdXqgty
	xjB+cK+hYqgiqkH9Ab3Iiyc1MKC/RYNxnJPLOXSQm+8JhtVnzQHw99Rfx62g/1R0RkoMrvcHno+xJ
	Xj+weG6F2GeVmljdWHHp84CgQAYLokIaUhklhUJcLyoVMj3oAx2L0HZV6L/nl7MONQoPM5kcphThT
	b0oVY9qt39PiK8AhMX05cg4nNaBQnigmdPQRVpnusAfZRj69H/xlkZJj6L1S169BbTEUEtPj69haN
	oxvHC5ocuxM3LkEVaZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7zh7-005ypN-Gu; Thu, 13 Jan 2022 12:59:09 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7zfv-005yS4-8G; Thu, 13 Jan 2022 12:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642078675; x=1673614675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iycjm2C+Mf7QsOANPLMYnMeG7Nklub2C0BsuRJJMnhc=;
 b=IwQYXJRlETiq21CGn7bs86++TkahFiU5lR9elaqwp88EAFEC9ob2M5js
 uR/kgre9UFSIHy6AmJxL3xZMiAPEkPaXaqOERaPNxJO8lmathLXsnDGUk
 sZYyS1GrRBy78CDaSVWfkSVXGcgyQz83ghFiTO9WOMwwTul5fuCNydkre
 qNcM3tmbVP8a0XLVZK2wH99qSBS2GtxNGc5koVBvWloUjFCLeLGh/4UC3
 qN6chg3tsKmDj1iZ5ZqvrpMIJOI2ACk0mgKlEQ0RZzOFRZ/5bfZIXCwG6
 Q0UOUrfG8xjgjnTgS3xc37uc/cpBOySS2ZD47faf+HC7TZOJCXOfCtJA9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="223982892"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="223982892"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 04:57:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="691791936"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2022 04:57:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 04:57:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 04:57:51 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.020;
 Thu, 13 Jan 2022 04:57:51 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mingyuan.ma@mediatek.com"
 <mingyuan.ma@mediatek.com>, "wsd_upstream@mediatek.com"
 <wsd_upstream@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "yf.wang@mediatek.com"
 <yf.wang@mediatek.com>, "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "lmark@codeaurora.org"
 <lmark@codeaurora.org>, "labbott@redhat.com" <labbott@redhat.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
Thread-Topic: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
Thread-Index: AQHYCHnKJjUnVmCmlECrXD1d8qRuLKxg6T0Q
Date: Thu, 13 Jan 2022 12:57:51 +0000
Message-ID: <4f88205c1b344aea8608960e2f85b8f4@intel.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
In-Reply-To: <20220113123406.11520-1-guangming.cao@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_045755_364300_186229F7 
X-CRM114-Status: GOOD (  12.77  )
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


>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>guangming.cao@mediatek.com
>Sent: Thursday, January 13, 2022 7:34 AM
>To: sumit.semwal@linaro.org
>Cc: linux-arm-kernel@lists.infradead.org; mingyuan.ma@mediatek.com;
>Guangming <Guangming.Cao@mediatek.com>;
>wsd_upstream@mediatek.com; linux-kernel@vger.kernel.org; dri-
>devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org;
>yf.wang@mediatek.com; libo.kang@mediatek.com;
>benjamin.gaignard@linaro.org; bo.song@mediatek.com;
>matthias.bgg@gmail.com; linux-mediatek@lists.infradead.org;
>lmark@codeaurora.org; labbott@redhat.com; christian.koenig@amd.com;
>jianjiao.zeng@mediatek.com; linux-media@vger.kernel.org
>Subject: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
>
>From: Guangming <Guangming.Cao@mediatek.com>
>
>Add a size check for allocation since the allocation size is
>always less than the total DRAM size.
>
>Without this check, once the invalid size allocation runs on a process that
>can't be killed by OOM flow(such as "gralloc" on Android devices), it will
>cause a kernel exception, and to make matters worse, we can't find who are
>using
>so many memory with "dma_buf_debug_show" since the relevant dma-buf
>hasn't exported.
>
>To make OOM issue easier, maybe need dma-buf framework to dump the
>buffer size
>under allocating in "dma_buf_debug_show".
>
>Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
>Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
>---
>v3: 1. update patch, use right shift to replace division.
>    2. update patch, add reason in code and commit message.
>v2: 1. update size limitation as total_dram page size.
>    2. update commit message
>---
> drivers/dma-buf/dma-heap.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>index 56bf5ad01ad5..1fd382712584 100644
>--- a/drivers/dma-buf/dma-heap.c
>+++ b/drivers/dma-buf/dma-heap.c
>@@ -55,6 +55,16 @@ static int dma_heap_buffer_alloc(struct dma_heap
>*heap, size_t len,
> 	struct dma_buf *dmabuf;
> 	int fd;
>
>+	/*
>+	 * Invalid size check. The "len" should be less than totalram.
>+	 *
>+	 * Without this check, once the invalid size allocation runs on a process
>that
>+	 * can't be killed by OOM flow(such as "gralloc" on Android devices), it
>will
>+	 * cause a kernel exception, and to make matters worse, we can't find
>who are using
>+	 * so many memory with "dma_buf_debug_show" since the relevant
>dma-buf hasn't exported.
>+	 */
>+	if (len >> PAGE_SHIFT > totalram_pages())

If your "heap" is from cma, is this still a valid check?

M

>+		return -EINVAL;
> 	/*
> 	 * Allocations from all heaps have to begin
> 	 * and end on page boundaries.
>--
>2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
