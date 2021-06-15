Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E61C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B390613B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B390613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JR0VzAfDqqeT+K+nU5tb2jtvG9RB/EfJpFwwEQh6G4Q=; b=s9DsF7WX8aCv9k
	Dw9KSXk4hTfKgUCMGEzNat26GqtKR5kHiHDAMjLSSr6RuMA9XWkhyU6OKqaPQcnUtkElyZ5/uJRdX
	bCK+ZsYlEBAuU6DpofA6Q95U7ggUP1hUJpan91KywbLELZUpxhJbdCKvk5Z89LyvEWJ1TLkL63afx
	8RsqzGSfAawMonTBeK5K8tp9La5M2B5Be1nrfAkr0GikmCxowTVcJsqkj1oPLQvIeeNct5pv4kpBW
	rMek4t4s8fFUhi6ziL+WH0ImHzXyTtsEBraJk6jQte2mNo0WpF/av9nLktZqITjBLOMNMup/R7MGB
	wyQrCA526Gcr5X/zk7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltG0X-002uYh-D8; Tue, 15 Jun 2021 20:50:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCWn-001axD-Tw; Tue, 15 Jun 2021 17:07:08 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E05B6143D;
 Tue, 15 Jun 2021 17:07:04 +0000 (UTC)
Date: Tue, 15 Jun 2021 13:07:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mhelsley@vmware.com>, <peterz@infradead.org>, <samitolvanen@google.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] recordmcount: Correct st_shndx handling
Message-ID: <20210615130702.0292284e@gandalf.local.home>
In-Reply-To: <20210615163245.26164-1-mark-pk.tsai@mediatek.com>
References: <20210615114229.3b1f2c5f@oasis.local.home>
 <20210615163245.26164-1-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_100706_090458_5EF5AA15 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, 16 Jun 2021 00:32:45 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> > On Tue, 15 Jun 2021 14:47:20 +0800
> > Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >   
> > > One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> > > SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> > > 
> > > This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> > > 
> > > Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>  
> > 
> > Please explain the two signed-off-by's above. If you are just tweaking
> > Peter's original patch, please add at the start:
> > 
> > From: Peter Zijlstra (Intel) <peterz@infradead.org>
> > 
> > And then just above your signed off by, add what you changed:
> > 
> > Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > [ Changed something ]
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > 
> > But state what you changed.
> > 
> > Thanks!
> > 
> > -- Steve  
> 
> Sorry for messing up.

No problem. It's a learning process.

> I've fixed it in v3.

Thanks,

-- Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
