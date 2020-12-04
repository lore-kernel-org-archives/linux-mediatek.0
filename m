Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A13AC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 02:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2AD221E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 02:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA2AD221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OigA7XROIDepYL06IgKtbsqPbgtLuj/l53NqiIRk4OI=; b=hlapyoAun0oj+3qoiKacWZY8g
	9bvLoDBxZMXAy+uupmZhDA3VtJgwVKWQ+qB3ZaDVrLsCr5pBVQgV8EueOHvrNlZUfoq+h0marsUWt
	Oq1tdEZK99VWy8vjP1SSdEU85LbQfTDF17EPOWCi2+Gq/pJT/hAOaI9xTnM+ErDzGNe2ZGsTZ/Twy
	pYZMHaR/KBpF2evnVvsYtf/1myKeltHUY9zHGqDfhBy8eWwLXf9Fhg+ol1dy1If8inpEmsMlPu43h
	YqWiopBw0y3MOVvf0JwFqoUC9uUPpztoLUd6Xj2CHlNQF08N57nLrZ0fCHN/79X+gLh7SYAy9BpGT
	yo9DgCSJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl0rw-0007bS-34; Fri, 04 Dec 2020 02:30:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl0rr-0007ae-UV; Fri, 04 Dec 2020 02:30:45 +0000
X-UUID: 2fe39de0455a4f389d99adadc8d78647-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=poyb6ODY1nzdJu4VuolCu6hZIv/6rIbs3USR4sHKncU=; 
 b=TPJiHHmFZaxj6lXDUpKySe857ZODQ6sjk45PUBIPCtmbvFdVeeLj56tq7aXUaVCIAjgMWhFNxog9VAD0EX1gJ8bnXzdwjwCc6VrSU1BJwY2UweuDGmn0gTtxeJDGinLqNc9jsA1aqqOHU3jYX7SnXmIjWKEMrM9cKsS4fif10Mc=;
X-UUID: 2fe39de0455a4f389d99adadc8d78647-20201203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1506718716; Thu, 03 Dec 2020 18:30:37 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 18:26:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 10:26:17 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 10:26:18 +0800
Message-ID: <1607048778.15817.2.camel@mtksdccf07>
Subject: Re: [PATCH v3 1/1] kasan: fix object remain in offline per-cpu
 quarantine
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 4 Dec 2020 10:26:18 +0800
In-Reply-To: <20201203122854.c8d5ed270ec9cfc7c17569d9@linux-foundation.org>
References: <1606895585-17382-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1606895585-17382-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <CAAeHK+z+DPNysrUwfeu27h6sKdn5DDE=BL4t96KiF0mRBNPs+Q@mail.gmail.com>
 <20201203122854.c8d5ed270ec9cfc7c17569d9@linux-foundation.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_213044_134985_B8ED9591 
X-CRM114-Status: GOOD (  13.87  )
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
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 Miles Chen <miles.chen@mediatek.com>, kasan-dev <kasan-dev@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux
 Memory Management List <linux-mm@kvack.org>,
 Nicholas Tang <nicholas.tang@mediatek.com>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry
 Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 12:28 -0800, Andrew Morton wrote:
> On Thu, 3 Dec 2020 13:46:59 +0100 Andrey Konovalov <andreyknvl@google.com> wrote:
> 
> > >  #define QLIST_INIT { NULL, NULL, 0 }
> > > @@ -188,6 +190,11 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> > >         local_irq_save(flags);
> > >
> > >         q = this_cpu_ptr(&cpu_quarantine);
> > > +       if (q->offline) {
> > > +               qlink_free(&info->quarantine_link, cache);
> > 
> > Hi Kuan-Ying,
> > 
> > This needs to be rebased onto the mm tree: it has some KASAN patches
> > that touch this code and rename the info variable to meta.
> 
> Yup.  I'm taking care of that.

Hi Andrew,

Sorry about that.
I will fix that conflict.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
