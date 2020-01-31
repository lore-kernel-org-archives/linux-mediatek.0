Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B9C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 02:16:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37620206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 02:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B29wh+gu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="naQx0E8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37620206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVxxJcZpw1mWck57bkhQE9LfvOOyX7FnzwLRVJ4ZnKc=; b=B29wh+guH1T4YX
	rjbz9Zpb1P6nK7aaqsYPPMcauUu8F1XkwYS89YPAO/9YdPkPGyNeD0zQSLzeJ9gZMWRO30EiSsgLG
	Z2ooGpDy/wjAMEadhjhpQYIMXHm0RR5Ytw4/MnApQkU6j4T/ibsfVqgvfQe3RkXSl0XPdNBFjLvQx
	xydkWqkMqHVwySltH9OOx7ldA31sysRtxvKmyOcz8MkSLRYCwVcmKTZEZUdZlrzZ4g2vMLviIIdqm
	qD4g5H059QPQUVp6AZEcbJSfMliG+iSZ3mdarloRr+oXU+K2BIHjwVm8OpJxJz3CgIxPnu7hnTIzI
	07THm9oyFw2zyYglIG2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixLr8-0002P1-6J; Fri, 31 Jan 2020 02:16:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixLqx-0002HT-JI; Fri, 31 Jan 2020 02:16:16 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3E66206F0;
 Fri, 31 Jan 2020 02:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580436974;
 bh=tyJKzLA16be5mNz2EBj3faXgdYPo6KX3V43I+YCflTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=naQx0E8TmVLVXc/yB0+otsJ3q2KIhHCnxBgDTYtppdT5Y26k7wkvZykakj9qBy608
 g2ovdKkyHPtcL2CzV5Ue0H58FpBp6X7DhhCv8iVr8JTITI5ba7U+7mBY/SB8LjC3TI
 32/VezsBlEl54vLgzoFT4LRgjVRBHlK8PnH/PgPs=
Date: Thu, 30 Jan 2020 18:16:13 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4 2/2] kasan: add test for invalid size in memmove
Message-Id: <20200130181613.1bfb8df8e73a280512cab8ef@linux-foundation.org>
In-Reply-To: <1580355838.11126.5.camel@mtksdccf07>
References: <20191112065313.7060-1-walter-zh.wu@mediatek.com>
 <619b898f-f9c2-1185-5ea7-b9bf21924942@virtuozzo.com>
 <1580355838.11126.5.camel@mtksdccf07>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_181615_658071_386B85EF 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 30 Jan 2020 11:43:58 +0800 Walter Wu <walter-zh.wu@mediatek.com> wrote:

> On Fri, 2019-11-22 at 06:21 +0800, Andrey Ryabinin wrote:
> > 
> > On 11/12/19 9:53 AM, Walter Wu wrote:
> > > Test negative size in memmove in order to verify whether it correctly
> > > get KASAN report.
> > > 
> > > Casting negative numbers to size_t would indeed turn up as a large
> > > size_t, so it will have out-of-bounds bug and be detected by KASAN.
> > > 
> > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > 
> > Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> 
> Hi Andrey, Dmitry, Andrew,
> 
> Would you tell me why this patch-sets don't merge into linux-next tree?
> We lost something?
> 

In response to [1/2] Andrey said "So let's keep this code as this" and
you said "I will send a new v5 patch tomorrow".  So we're awaiting a v5
patchset?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
