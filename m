Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 16:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED02A611CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 16:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED02A611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReKfV7vwruvVjegYqDDa2S3gw+DDo2Jy/UC1Hw+GX3k=; b=3FhnH97zdgWuAp
	8nsxKd82f6zVFPRgM6XXFVmZPMsXcb1i6Ui5thWS8HP5LzjKC1FJzfZa2Ziw0uiP0ezecuAPU3+b0
	LfqTHHAw2+odLGjnnHbmJL9oBJxrip6QZsowf/kaae+2HCYvI5HNWh7IlYeEoFl0aV4SUXHCPfDnq
	Ryx+gxMckPd0wXgvqdA4/QGpx5pPsTxN07U0JBfO16qWNKZSmIojGt0l43xrzlJtQlk2iFWP+vXmj
	jxRJPP9tlMizI2BbXV/J8LPsoJj+z4mt+D+W82QT28LYbHH9Cu1/8QJT/Mru+HREuZXEcGzHjyD8J
	sp+5/aDOVmArAAoz0ojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQXPj-009VG4-Kh; Wed, 15 Sep 2021 16:05:35 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQXPf-009VEx-S3; Wed, 15 Sep 2021 16:05:33 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 073D222296;
 Wed, 15 Sep 2021 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631721928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdcHbBnWgBJkZLhfI91fatjdoluwa+ngRYImj4hNKsw=;
 b=Z2CECb+HpdKgJoPke2KE6qM+CoCoBBotOugtyIC/nOe+NQrTpSmNnshRy78LREFhgDiQBv
 i8YcCivfhW5gDUYu38PbY4u0mo1kX3tUNRjThse906PqkMQNnfHcfbPqxBYO90Yd8JE9bc
 OYV403CIzF+YolxvC9bj31cvjhENQEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631721928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdcHbBnWgBJkZLhfI91fatjdoluwa+ngRYImj4hNKsw=;
 b=72QXXUVdo3RcUbY60/Jor7fuRCZ/SYVWCSP0x42vgHPBahWnRmsxeRai1WgHefivyjMSif
 9DnJJu1IQaa8+mCA==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CD662A3B90;
 Wed, 15 Sep 2021 16:05:26 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
 id B2BD7607E0; Wed, 15 Sep 2021 18:05:26 +0200 (CEST)
Date: Wed, 15 Sep 2021 18:05:26 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Miles Chen <miles.chen@mediatek.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] scripts/sorttable: riscv: fix undelcred identifier
 'EM_RISCV' error
Message-ID: <20210915160526.tittz3fewddjrqu3@lion.mk-sys.cz>
References: <20210913030625.4525-1-miles.chen@mediatek.com>
 <20210915215432.02a5e08e@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915215432.02a5e08e@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_090532_105643_EEF7DA96 
X-CRM114-Status: GOOD (  22.66  )
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

On Wed, Sep 15, 2021 at 09:54:32PM +0800, Jisheng Zhang wrote:
> On Mon, 13 Sep 2021 11:06:25 +0800
> Miles Chen <miles.chen@mediatek.com> wrote:
> 
> > Fix the following build break by adding a conditional definition
> > of EM_RISCV in order to allow cross-compilation on machines
> > which do not have EM_RISCV definition in their host.
> > 
> > build break log from [1]:
> > scripts/sorttable.c:352:7: error: use of undeclared identifier 'EM_RISCV'
> 
> Looks strange I can't reproduce it. FWICT, this may be seen with some old
> toolchains.

I checked the history and EM_RISCV was added to <elf.h> in glibc 2.24 so
builds on systems with glibc headers < 2.24 should show this error.

Michal

> > [1] https://lore.kernel.org/lkml/e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com/
> > 
> > Cc: Jisheng Zhang <jszhang@kernel.org>
> > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Fixes: 54fed35fd393 ("riscv: Enable BUILDTIME_TABLE_SORT")
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> > ---
> >  scripts/sorttable.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> > index f355869c65cd..6ee4fa882919 100644
> > --- a/scripts/sorttable.c
> > +++ b/scripts/sorttable.c
> > @@ -54,6 +54,10 @@
> >  #define EM_ARCV2	195
> >  #endif
> >  
> > +#ifndef EM_RISCV
> > +#define EM_RISCV	243
> > +#endif
> > +
> >  static uint32_t (*r)(const uint32_t *);
> >  static uint16_t (*r2)(const uint16_t *);
> >  static uint64_t (*r8)(const uint64_t *);
> 
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
