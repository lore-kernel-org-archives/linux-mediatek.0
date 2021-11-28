Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C682CC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 00:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKeVomCN/F159l8HFi0AIhlDkUEnGnZ+5uHoyNMS+YE=; b=OY2QYDUnR0foFO
	SWvkbtt1zKVodZfI3r8T/heoSx82Zo2beF4cDrTpd085BpG8t26Aqpzdg/i2aEbqtJLEXf3UBfHUL
	i3P+DSu4GFj4zx/uphp1CIgl1R/ATUIi++EW8EpMSvYZrkpK6e+IBcGOGtO7/GICCdza6YxfgfnfC
	u5wiogRoHVQyX/K30IQ1ITVNC+unh1wU/gHBEACctRP7ofw919Y25ZEtyCZjoI9TCSZWuuyYxyQjw
	bWUmlD2OsXm+bsy2sAqpFgTDJ2HxM0MetAlhJKYEyDIc9KthcX7y8KFxCGGGFPcRr2A2P608ATd1c
	03pH5vUu0u5hLLs4Hadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr7vz-00EgvQ-O3; Sun, 28 Nov 2021 00:20:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr7vm-00Egtt-6G; Sun, 28 Nov 2021 00:20:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 450BC60F4B;
 Sun, 28 Nov 2021 00:20:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B29560524;
 Sun, 28 Nov 2021 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1638058830;
 bh=CKZ+e8k135ZZUhwVMJEQB8rHyvFCB7GPOLchrJ0D5go=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0AOvXxVGgboRb7eA1NwxoOrMf3dtsAtHRbiyZJL4nEy3F08Oa/ZLj16GfcnXRIJmQ
 zNZm5UQQ+WtO20dXMQTea3IZT5FwLccbE4YPuMfSs7Jp9bVSU1rj6fTkfWTJcosPWc
 rf2Z7VW47FypZ3+a0a+W/VfSsCykoRdSyig12/zE=
Date: Sat, 27 Nov 2021 16:20:28 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chinwen Chang (=?UTF-8?Q?=E5=BC=B5=E9=8C=A6=E6=96=87?=)
 <chinwen.chang@mediatek.com>, Nicholas Tang (=?UTF-8?Q?=E9=84=AD=E7=A7=A6?=
 =?UTF-8?Q?=E8=BC=9D?=) <nicholas.tang@mediatek.com>, James Hsu (
 =?UTF-8?Q?=E5=BE=90=E6=85=B6=E8=96=B0?=) <James.Hsu@mediatek.com>, Yee Lee
 (=?UTF-8?Q?=E6=9D=8E=E5=BB=BA=E8=AA=BC?=) <Yee.Lee@mediatek.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH] kmemleak: fix kmemleak false positive report with HW
 tag-based kasan enable
Message-Id: <20211127162028.07d1a9fc392d91e7d234daae@linux-foundation.org>
In-Reply-To: <CA+fCnZchvHjU9G_SSf_M2--jHPqEa6PEr3u_5q-wJWvZK4N2pA@mail.gmail.com>
References: <20211118054426.4123-1-Kuan-Ying.Lee@mediatek.com>
 <754511d9a0368065768cc3ad8037184d62c3fbd1.camel@mediatek.com>
 <CA+fCnZchvHjU9G_SSf_M2--jHPqEa6PEr3u_5q-wJWvZK4N2pA@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_162034_330083_05C45EE0 
X-CRM114-Status: GOOD (  15.63  )
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

On Thu, 25 Nov 2021 17:13:36 +0100 Andrey Konovalov <andreyknvl@gmail.com> wrote:

> > > kmemleak_object *object)
> > >  static struct kmemleak_object *lookup_object(unsigned long ptr, int
> > > alias)
> > >  {
> > >       struct rb_node *rb = object_tree_root.rb_node;
> > > +     unsigned long untagged_ptr = (unsigned
> > > long)kasan_reset_tag((void *)ptr);
> > >
> > >       while (rb) {
> > >               struct kmemleak_object *object =
> > >                       rb_entry(rb, struct kmemleak_object, rb_node);
> > > -             if (ptr < object->pointer)
> > > +             unsigned long untagged_objp;
> > > +
> > > +             untagged_objp = (unsigned long)kasan_reset_tag((void
> > > *)object->pointer);
> 
> The two lines above can be squashed together.

That would make a too-long line even longer.  In fact I think it's
better to go the other way:

--- a/mm/kmemleak.c~kmemleak-fix-kmemleak-false-positive-report-with-hw-tag-based-kasan-enable-fix
+++ a/mm/kmemleak.c
@@ -384,10 +384,10 @@ static struct kmemleak_object *lookup_ob
 	unsigned long untagged_ptr = (unsigned long)kasan_reset_tag((void *)ptr);
 
 	while (rb) {
-		struct kmemleak_object *object =
-			rb_entry(rb, struct kmemleak_object, rb_node);
+		struct kmemleak_object *object;
 		unsigned long untagged_objp;
 
+		object = rb_entry(rb, struct kmemleak_object, rb_node);
 		untagged_objp = (unsigned long)kasan_reset_tag((void *)object->pointer);
 
 		if (untagged_ptr < untagged_objp)
_


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
