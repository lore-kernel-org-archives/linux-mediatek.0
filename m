Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 04:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92496113E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 04:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B92496113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UO2IF1KI9UnpuZx4YNmDsTWgaaIqmd6lmtoFDCN9dvk=; b=hXJSct1r4iIbfy
	eJVHGgAPaj/bE6VK4iX5aUg+fYRmkklGcOblyiA5lasu24D5I2SP4YS/EfleQIt2LadiQ1lqTn2n0
	1qYKtjj884SteZ2N90PiDaieHo52d/UJ3l34O1Hq4iHe9odACsjfv+cpsnBWOGT/zx61z8Mc1Ou1X
	6rn6YzdXyBU3QEJ+ZkPBrdMn3H1vfP9EncMDxrrKc25F7qjKELZb/0xOwh/i0+BGfqjnlP8CkfzgK
	qS5dcrh27MtDhIViwd/MEd3T1I5DddoVmmRDgz4GJPHI+gleOTyjuyU7c9VGlvTaFwiK+3huxKV1P
	s+FP3hEpCtQT8cHCutjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR5TM-00DBbF-NU; Fri, 17 Sep 2021 04:27:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR5TI-00DBaB-6m; Fri, 17 Sep 2021 04:27:35 +0000
X-UUID: 457c45a9bcf14128a035866e4099be31-20210916
X-UUID: 457c45a9bcf14128a035866e4099be31-20210916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 333507105; Thu, 16 Sep 2021 21:27:27 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 21:27:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 12:27:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 12:27:24 +0800
Message-ID: <b96f2415d14bcf00338b036155ea7f54b25d9a6d.camel@mediatek.com>
Subject: Re: [PATCH] scripts/sorttable: riscv: fix undelcred identifier
 'EM_RISCV' error
From: Miles Chen <miles.chen@mediatek.com>
To: Michal Kubecek <mkubecek@suse.cz>, Jisheng Zhang
 <jszhang3@mail.ustc.edu.cn>, Andrew Morton <akpm@linux-foundation.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
 <jszhang@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>
Date: Fri, 17 Sep 2021 12:27:24 +0800
In-Reply-To: <20210915160526.tittz3fewddjrqu3@lion.mk-sys.cz>
References: <20210913030625.4525-1-miles.chen@mediatek.com>
 <20210915215432.02a5e08e@xhacker>
 <20210915160526.tittz3fewddjrqu3@lion.mk-sys.cz>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_212732_311462_71CE5E13 
X-CRM114-Status: GOOD (  24.46  )
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

cc Andrew,

On Wed, 2021-09-15 at 18:05 +0200, Michal Kubecek wrote:
> On Wed, Sep 15, 2021 at 09:54:32PM +0800, Jisheng Zhang wrote:
> > On Mon, 13 Sep 2021 11:06:25 +0800
> > Miles Chen <miles.chen@mediatek.com> wrote:
> > 
> > > Fix the following build break by adding a conditional definition
> > > of EM_RISCV in order to allow cross-compilation on machines
> > > which do not have EM_RISCV definition in their host.
> > > 
> > > build break log from [1]:
> > > scripts/sorttable.c:352:7: error: use of undeclared identifier
> > > 'EM_RISCV'
> > 
> > Looks strange I can't reproduce it. FWICT, this may be seen with
> > some old
> > toolchains.
> 
> I checked the history and EM_RISCV was added to <elf.h> in glibc 2.24
> so
> builds on systems with glibc headers < 2.24 should show this error.
> 
> Michal
> 
> > > [1] 
> > > https://urldefense.com/v3/__https://lore.kernel.org/lkml/e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com/__;!!CTRNKA9wMg0ARbw!2wBeUUDf3Z2m7uJLF51GeZnBFWXRlEQrzGJ72JWIT0MPUcS_RgW98QWTXkEjy9-lhg$
> > >  
> > > 
> > > Cc: Jisheng Zhang <jszhang@kernel.org>
> > > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > Fixes: 54fed35fd393 ("riscv: Enable BUILDTIME_TABLE_SORT")
> > > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > 
> > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>


Hi Andrew,

I cannot find the maintainer for scripts/sorttable.c, would you pick up
this change, please?

thanks
Miles

> > 
> > > ---
> > >  scripts/sorttable.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> > > index f355869c65cd..6ee4fa882919 100644
> > > --- a/scripts/sorttable.c
> > > +++ b/scripts/sorttable.c
> > > @@ -54,6 +54,10 @@
> > >  #define EM_ARCV2	195
> > >  #endif
> > >  
> > > +#ifndef EM_RISCV
> > > +#define EM_RISCV	243
> > > +#endif
> > > +
> > >  static uint32_t (*r)(const uint32_t *);
> > >  static uint16_t (*r2)(const uint16_t *);
> > >  static uint64_t (*r8)(const uint64_t *);
> > 
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!2wBeUUDf3Z2m7uJLF51GeZnBFWXRlEQrzGJ72JWIT0MPUcS_RgW98QWTXkH74aYBWQ$
> >  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
