Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228BDC76196
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 02:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqXTrKvUnVXrUWsqcjNATzJ0Cm2253FEAku1Mewg2gw=; b=eTrM8fSI8hDPfXtpXFmi7HTC0q
	CIBiP7Rxd7TUjZ9g5nedDtC1e4hjb+v8BlgJcyJ3r9J+hwCi+BXhQ/y1/baJTrPoI+WHNv3UERM6V
	texFOUPhFUj5CJJEZoz51WvMkkX+CAIxNWq5b8Plnl5/HgdMqX9dKiwqajE9/Vxl2BxX68FUfu47Q
	wF39KqAD1e/4BUt1WcJ8KIeqae+XT1IPzlyLvEVGmas12VgFsjiZH401XvY2x5BJBp7Yve9aAMPQo
	gJhY3dg+J9Fd4kF6w44vw83/7wn+6i3gnJkb9jKTiZeu4vG3cpAgZK/cdNILfHdgSZLTA13GbU//s
	0KLMNvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQHQ-001cPK-1A;
	Wed, 12 Apr 2023 02:32:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQHN-001cOI-1w;
	Wed, 12 Apr 2023 02:32:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D67E262951;
	Wed, 12 Apr 2023 02:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0108C4339E;
	Wed, 12 Apr 2023 02:32:10 +0000 (UTC)
Date: Tue, 11 Apr 2023 22:32:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan Wu (=?UTF-8?B?5ZCz5r6k5Y2X?=)" <Tze-nan.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Cheng-Jui Wang (=?UTF-8?B?546L5q2j552/?=)" <Cheng-Jui.Wang@mediatek.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, "Bobule Chang (=?UTF-8?B?5by15byY576p?=)"
 <bobule.chang@mediatek.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "npiggin@gmail.com"
 <npiggin@gmail.com>
Subject: Re: [PATCH v3] ring-buffer: Prevent inconsistent operation on
 cpu_buffer->resize_disabled
Message-ID: <20230411223206.0bc5794e@gandalf.local.home>
In-Reply-To: <ef0ebc2f0f934ff5c35719f1960d24a5838ff770.camel@mediatek.com>
References: <20230409024616.31099-1-Tze-nan.Wu@mediatek.com>
	<20230410073512.13362-1-Tze-nan.Wu@mediatek.com>
	<20230411124403.2a31e12d@gandalf.local.home>
	<ef0ebc2f0f934ff5c35719f1960d24a5838ff770.camel@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_193213_694364_FFC55FFA 
X-CRM114-Status: GOOD (  14.15  )
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

On Wed, 12 Apr 2023 02:27:53 +0000
Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=8D=97) <Tze-nan.Wu@mediatek.com> wrote:

> > > @@ -5368,7 +5372,7 @@ void ring_buffer_reset_online_cpus(struct
> > > trace_buffer *buffer)
> > >       /* Make sure all commits have finished */
> > >       synchronize_rcu();
> > >=20
> > > -     for_each_online_buffer_cpu(buffer, cpu) {
> > > +     for_each_cpu_and(cpu, buffer->cpumask, &reset_online_cpumask) =
=20
>=20
> Maybe we should use for_each_buffer_cpu(buffer, cpu) here?
> since a CPU may also came offline during synchronize_rcu().

Yeah, I guess that works too (not looking at the code at the moment though).

-- Steve

>=20
> > > {
> > >               cpu_buffer =3D buffer->buffers[cpu]; =20
> >=20

