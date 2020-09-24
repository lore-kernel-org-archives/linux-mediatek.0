Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA75EC4727D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734A1221EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+pI16SY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YgF878XP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734A1221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bupHznpNcRwGv4lz4rk0+EPD7JJu8UhARCMsShSMLtE=; b=r+pI16SYpY+MXua6XiLLwVYuD
	nx4kvzZhbD1Q4CXZ7E7PlOpRNZIPZ6EUBPbeVmO8hAffFf40d0GYqkboy/YRTm/Ey5d8DqjcpbCmO
	95/H8nOSTtNqxz2Mvzvbo2sUvh5tbn54PD+EMLL8+Kj2fKeBaJWw2ArkUUhSUGuO7qWqsl78s0FQx
	rZS4RR26TgnAilc+q4a39TmK6hX9eOPQu1LDB3gsqhpFyvETB2p4uE2Gks0t30Lep/UVAHiS3O8YM
	I7Opf0rbODuBUfIaCBsurA3+Nli21LICVNx043SGib8WnI+8ZiR1FE/xU68To7B7BPcv/e7XtI45L
	LJf8S35Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQRv-0002Jw-D8; Thu, 24 Sep 2020 12:34:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQRn-0002HX-Q1; Thu, 24 Sep 2020 12:34:06 +0000
X-UUID: a780ce2bf59141c4ad3d9594beba7239-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3xhvL/jxHoFM4lCpaJFVgA5szl9rK3NZUTpqOY0oS0A=; 
 b=YgF878XPHogI4aTUl5UXQky6mdiiEW+RWb6ulCfUOWiPS5hWL6B3fqUN5C0ngx5Nlx2pbx55PDn1qNdeFUCuublJ5JySfEtLL3ftvy2zXc/0j/oI4H5haOX1q70dbsv9rbe6xcB6I2GLmW6hC8qVP6sB5tms4ariWW/MlE6q86A=;
X-UUID: a780ce2bf59141c4ad3d9594beba7239-20200924
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 485968116; Thu, 24 Sep 2020 04:34:00 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 05:33:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 20:33:42 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Sep 2020 20:33:43 +0800
Message-ID: <1600950825.19591.2.camel@mtksdccf07>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Alexander Potapenko <glider@google.com>
Date: Thu, 24 Sep 2020 20:33:45 +0800
In-Reply-To: <CAG_fn=U_dshqBB8HBhGyYnn_vScTOcLJX=mfU+8Wi5wjZL2oYA@mail.gmail.com>
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <CAG_fn=U_dshqBB8HBhGyYnn_vScTOcLJX=mfU+8Wi5wjZL2oYA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 06AAE36FCA1A35D7BBA6DD440E2BA708F1295AAE573EAC13CD5AE6AAD26BA90B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_083404_069380_BF991B23 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Linux
 Memory Management List <linux-mm@kvack.org>, Stephen Boyd <sboyd@kernel.org>,
 Andrey
 Konovalov <andreyknvl@google.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Tejun Heo <tj@kernel.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-24 at 13:51 +0200, 'Alexander Potapenko' via kasan-dev
wrote:
> > ---
> > Documentation/dev-tools/kasan.rst |  5 +++--
> > kernel/time/timer.c               |  3 +++
> > kernel/workqueue.c                |  3 +++
> > lib/test_kasan_module.c           | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > mm/kasan/report.c                 |  4 ++--
> > 5 files changed, 66 insertions(+), 4 deletions(-)
> 
> While at it, can you remove a mention of call_rcu() from the
> kasan_record_aux_stack() implementation, as it is no more
> RCU-specific?
> 

Thank you for your reminder. v5 will do it. 

Walter
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
