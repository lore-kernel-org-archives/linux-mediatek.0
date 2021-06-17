Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D45C48BE6
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 00:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDAB60041
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 00:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDAB60041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VMWZDIbUV1WZVIovnVPESroUtmZ4YkMvWOza1YZ07o=; b=ftKlLsjebvl+Um
	W45tFoTW5YrUAvNvG6MvWd/6SY1RH5eC/A9dXR8tFLvQG+TdYCCEo/+wyBvQMrVA++8PLxg80vP3n
	jsQJuJPDxNvSqrq0YnGQaZb2D0mYSZArykSwYu5py0vFAJ2udOHj7aBMJCCNJ9MsLUKi8LLr7GUfb
	0ZLQoMCP/axj0/fD2Zwv6Rz0HaQC5kKDkq5paZh4v88zrTq+7aFRla1K5rqulOX/KEkohBx4IMUgu
	d5kGANbtQi246H8wtQSKeWfCF8l8LiP8zQ/ioxTXeaBoiiXwvzS5C3MHflrhBv+jeVzLbpOgk1i7U
	WqLkdcN50rHeQZ4xqk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltfoT-008JdU-I0; Thu, 17 Jun 2021 00:23:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltfoH-008JcG-Vx; Thu, 17 Jun 2021 00:23:07 +0000
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13199613B9;
 Thu, 17 Jun 2021 00:23:03 +0000 (UTC)
Date: Wed, 16 Jun 2021 20:23:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: <peterz@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, <samitolvanen@google.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH v4] recordmcount: Correct st_shndx handling
Message-ID: <20210616202302.18522133@rorschach.local.home>
In-Reply-To: <20210616120227.6fc005c3@gandalf.local.home>
References: <20210616154126.2794-1-mark-pk.tsai@mediatek.com>
 <20210616120227.6fc005c3@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_172306_100737_EA92B134 
X-CRM114-Status: GOOD (  14.40  )
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

On Wed, 16 Jun 2021 12:02:27 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 16 Jun 2021 23:41:26 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> > 
> > This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> > 
> > Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > [handle endianness of sym->st_shndx]
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---  
> 
> Thanks, I pulled this in and started the testing.
> 

It passed my normal tests. I'll run my cross compile test, and I just
pushed it to linux-next. I'll wait a few days before I push it to Linus.

-- Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
