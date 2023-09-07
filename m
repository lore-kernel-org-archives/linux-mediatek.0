Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3148EB8FDE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEBBcJjt6f+bOPG8Fu0Z1CIwuONpBrPLNGsjFC8C1KQ=; b=k+lvUpMX4dxDNpG2r4YD+3Wx22
	yfh1tuCMdgcEpsm7gFBkfo6Va9RmjRd6tVcQRTnpp/keXHSiYWQiyX9tXq3wunYKVCzeQZl/4xICk
	F45zPZI3YagGcvevLLjaU/uzIRNOJlgJ9Y6HqBGW2Ilu9DLOYfDEj3C+NOrjEM1kOXAjZvNGob8rD
	PkBjftxP0tfxq2NGdjM7xdZRuhPgabJup8o1FoXnBU7+DYxvOMXWpwzmxmoK0/J0GNxzrz8UvtudN
	hDuG9USPRY2A2V35T/97bLH4zZiJAXiKvMEehRzNBohtVY9fiFDZhlJluKRBXNp5/x6t9XK6scI+5
	o+dQRvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDtb-00C4GO-1n;
	Thu, 07 Sep 2023 12:14:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDtX-00C4Fk-1a;
	Thu, 07 Sep 2023 12:14:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A6789CE1924;
	Thu,  7 Sep 2023 12:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42ABC32783;
	Thu,  7 Sep 2023 12:13:53 +0000 (UTC)
Date: Thu, 7 Sep 2023 08:14:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan Wu (=?UTF-8?B?5ZCz5r6k5Y2X?=)" <Tze-nan.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Cheng-Jui Wang (=?UTF-8?B?546L5q2j552/?=)" <Cheng-Jui.Wang@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, "Bobule Chang (=?UTF-8?B?5by1?=
 =?UTF-8?B?5byY576p?=)" <bobule.chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ring-buffer: Do not read at &event->array[0] if it
 across the page
Message-ID: <20230907081408.6156b6f0@gandalf.local.home>
In-Reply-To: <0944a5f3e10c0eba8b32e51fb941e0dd98ec086d.camel@mediatek.com>
References: <20230905141245.26470-1-Tze-nan.Wu@mediatek.com>
	<20230905123953.3c0b3d7a@gandalf.local.home>
	<3a89d49ae0da6378de83bc68690cf6664d97cb24.camel@mediatek.com>
	<0944a5f3e10c0eba8b32e51fb941e0dd98ec086d.camel@mediatek.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_051359_888454_507ADF8A 
X-CRM114-Status: GOOD (  48.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 7 Sep 2023 10:10:57 +0000
Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=8D=97) <Tze-nan.Wu@mediatek.com> wrote:

> > Same as my thought,
> > since every time the reader try to access the address in next page,
> > the below condition hold in rb_iter_head_event function:
> >=20
> >         if (iter->page_stamp !=3D iter_head_page->page->time_stamp ||
> >                 commit > rb_page_commit(iter_head_page))
> >                         goto reset;
> >=20
> > I observe the result by the debug patch provided below:
> >=20
> >         @@ -2378,6 +2378,19 @@ rb_iter_head_event(struct
> > ring_buffer_iter *iter)
> >                 commit =3D rb_page_commit(iter_head_page);
> >                 smp_rmb();
> >         +       if ((iter->head >=3D 0xFECUL) && commit =3D=3D 0xFF0UL)=
 {
> >         +               pr_info("rbdbg: cpu =3D %d, event =3D 0x%lx,
> > iter- =20
> > > head =3D 0x%lx,\ =20
> >=20
> >         +                       commit =3D 0xFF0, type =3D 0x%x, ts =3D
> > 0x%x,
> > array addr =3D 0x%lx\n",\
> >         +                       iter->cpu_buffer->cpu, (unsigned
> > long)event, iter->head,\
> >         +                       event->type_len, event->time_delta,
> > (unsigned long)(&(event->array[0])));
> >         +               mdelay(500);
> >         +               pr_info("rbdbg2: cpu =3D %d, event =3D 0x%lx,
> > iter- =20
> > > head =3D 0x%lx,\ =20
> >=20
> >         +                       commit =3D 0xFF0, type =3D 0x%x, ts =3D
> > 0x%x,
> > array addr =3D 0x%lx\n",\
> >         +                       iter->cpu_buffer->cpu, (unsigned
> > long)event, iter->head,\
> >         +                       event->type_len, event->time_delta,
> > (unsigned long)(&(event->array[0])));
> >         +               if (iter->page_stamp !=3D iter_head_page->page-=
 =20
> > > time_stamp || commit > rb_page_commit(iter_head_page)) =20
> >=20
> >         +                       pr_info("rbdbg: writer corrupt
> > reader\n");
> >         +       }
> >                 event =3D __rb_page_index(iter_head_page, iter->head);
> >                 length =3D rb_event_length(event);
> >=20
> > Note that the mdelay(500) in the debug patch can reproduce the issue
> > easier with same test in my environmnet,
> > I am now able to reproduce the issue within 15 minutes if the debug
> > patch on.
> >  =20
>=20
> The debug patch may give something similar to the below log just before
> the invalid access happened, for me it looks like the padding event had
> just corrupted by the writer before the reader invoke rb_event_length
> function on it.
>=20
> [  338.156772] cat: [name:ring_buffer&]rbdbg: cpu =3D 0, event =3D
> 0x????????????dffc, iter->head =3D 0xfec, commit =3D 0xFF0, type =3D 0x1d=
, ts
> =3D 0x0, array addr =3D 0x????????????e000
> [  338.656796] cat: [name:ring_buffer&]rbdbg2: cpu =3D 0, event =3D
> 0x????????????dffc, iter->head =3D 0xfec, commit =3D 0xFF0, type =3D 0x0,=
 ts
> =3D 0x0, array addr =3D 0x????????????e000
> [  338.656803] cat: [name:ring_buffer&]rbdbg: writer corrupt reader
> [  338.656810] cat:
> [name:report&]=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  338.656819] cat: [name:report&]BUG: KASAN: invalid-access in
> rb_event_length
>=20
>=20
> > > > Since the content data start at address 0x71FFFF8111A17FFC are =20
> > >=20
> > > 0xFFFFFFC0. =20
> > > > event->type will be interpret as 0x0, than the reader will try to =
=20
> > >=20
> > > get the =20
> > > > length by accessing event->array[0], which is an invalid address:
> > > >     &event->array[0] =3D 0x71FFFF8111A18000
> > > >=20
> > > > Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> > > > ---
> > > > Following patch may not become a solution, it merely checks if
> > > > the =20
> > >=20
> > > address =20
> > > > to be accessed is valid or not within the rb_event_length before =20
> > >=20
> > > access. =20
> > > > And not sure if there is any side-effect it can lead to.
> > > >=20
> > > > I am curious about what a better solution for this issue would
> > > > look =20
> > >=20
> > > like. =20
> > > > Should we address the problem from the writer or the reader?
> > > >=20
> > > > Also I wonder if the cause of the issue is exactly as I
> > > > suspected.
> > > > Any Suggestion will be appreciated. =20
> > >=20
> > > I guess this depends on if you have the fixes or not?
> > >  =20
> >=20
> > yes, I could try to pick the patches that only included in mainline
> > but
> > not in kernel-6.1.52 for ring_buffer.c file,
> > and do the same test to see if the issue is still reproducible.
> >  =20
> > > >=20
> > > > Test below can reproduce the issue in 2 hours on kernel-6.1.24:
> > > >     $cd /sys/kernel/tracing/
> > > >     # make the reader and writer race more through resize the =20
> > >=20
> > > buffer to 8kb =20
> > > >     $echo 8 > buffer_size_kn
> > > >     # enable all events
> > > >     $echo 1 > event/enable
> > > >     # enable trace
> > > >     $echo 1 > tracing_on
> > > > =20
> > > >     # write and run a script that keep reading trace
> > > >     $./read_trace.sh
> > > >=20
> > > >     ``` read_trace.sh
> > > >        while :
> > > >        do
> > > >            cat /sys/kernel/tracing/trace > /dev/null
> > > >        done
> > > >=20
> > > >     ``` =20
> > >=20
> > > Thanks, I'll look at that when I finish debugging the eventfs bug.
> > >=20
> > > -- Steve =20
> >=20
> > Also thank for your reply,
> >  =20
>=20
> And the temporary fix patch in my first mail should have some modified
> as shown below.
> +               if (((unsigned long)event & 0xfffUL) >=3D PAGE_SIZE - 4)
>                                              ^^^^^^
>                                             PAGE_SIZE-1
> +                       return -1;


Your email is getting really hard to read due to the line wrap formatting.

Anyway, can you try this patch?

-- Steve

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 72ccf75defd0..5b0653378089 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2390,6 +2390,10 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
 	 */
 	commit =3D rb_page_commit(iter_head_page);
 	smp_rmb();
+	/* An event needs to be at least 8 bytes in size */
+	if (iter->head > commit - 8)
+		goto reset;
+
 	event =3D __rb_page_index(iter_head_page, iter->head);
 	length =3D rb_event_length(event);
=20

