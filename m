Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA23C47094
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 00:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74AF861246
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 00:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74AF861246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Or7wb68UB0oo+tX5ffFO8CBq55L1jkWhHuyIitTovtU=; b=XkKSekftnZWBFG
	2ies2hwTQJLcOE6NZaC7WnHMmC1vC+quFIoyJpcGQ3uZXt9Jt5gHy+iu9+1qcDM/gNnBpmXebKVFu
	GWiRnhVQt0ngcKJUr1IOTrnC9CiEE4qikr/xbwwC8ORHCcebexofsNQw6HbQfAqrtt/KD10MGoQci
	PuXQx62N7S9fqKgsryYWup4NcMW++Pj2nKvu0COEArgKJk8eRpf7nx8FSsiI64s3bkfdACFzM7E55
	mypOJdoYg7ncp6COYsvfkKCp8hnw/oNwjlcqf19YFX9fl26qDkMyuWwmq4KSmxR5/YU75thJ0tzU8
	AAbffYYvPpP67bi6n3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqQ4y-005sH5-7o; Tue, 08 Jun 2021 00:58:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqQ4s-005sFN-1e; Tue, 08 Jun 2021 00:58:50 +0000
X-UUID: 470aeff71e97401f9ff664280f06a943-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DugAEgirOFLM0hGG/frD7wOPGRgVncNd+Gv2qZ5SBm0=; 
 b=qm1QGKbl0aiPmMXc5vSu7TQCuyuKQP+mYj5jZYfZ7ZOzbeEIaX8j1w/p9lOQXVuEPaIzVN3W7kKGgDNAeCaYYuF1OHg0XjTVNaODv5AxwABNEZ3dejX33pCS+R1KO1j91rzcqt9GCacicGFyxrfK+AYlU+uVCjPDgSv4q6lKWto=;
X-UUID: 470aeff71e97401f9ff664280f06a943-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1420085996; Mon, 07 Jun 2021 17:58:38 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 17:52:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 08:52:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 08:52:04 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mingo@redhat.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm64: ftrace: don't dereference a probably invalid
 address
Date: Tue, 8 Jun 2021 08:52:04 +0800
Message-ID: <20210608005205.4900-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210607145049.645b235f@oasis.local.home>
References: <20210607145049.645b235f@oasis.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_175846_919488_DD004990 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

> On Tue, 8 Jun 2021 02:14:03 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > Should I resend this patch as v2?
> > Or you will upstream this fix?
> 
> I'll push it. I have some other fixes to add as well.
> 
> Thanks!
> 
> -- Steve

Thanks!

Here is my reported and tested by.

Reported-and-tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
