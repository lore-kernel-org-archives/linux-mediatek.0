Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A3C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44QI8hZRoJVOYLn7ocWGh1eAsXk8vAovm9ug3qdbNFQ=; b=4ZI1biFlTYfIrH3Qall7IAsjhG
	ZbBif/GjWToVvSnOpSYnkvLNWZCORUDym/yrAx9wKCmsd7HDKviZNOARHJelLhD7Sr2ESUQW3vC5V
	FyoN/hzpyRuV2jl3v9vAg0/6lQgOpFAtj2WUbg2koBoBM2XDmTKooNbLlN70xgAEnDeXajsiwh7Uf
	6QoiIgoG/eWpapU6dGJ1OV4IQzJPMNkwJLWw4a+CAtMyOA1+mVCEEeW7QpuXfySeJw144LUXIOTwi
	HTlQliSc7XfYcbwf7vNYlIf51j5FfsjrNLwply7kv9BR9gPacdrLw2RlWvdfFqPyYT+OjTFXOdvEx
	TNhJmK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgil-000000058qb-0G1n;
	Wed, 07 Aug 2024 13:28:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgig-000000058pE-2okf
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Aug 2024 13:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8495CCE111A;
	Wed,  7 Aug 2024 13:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66897C32782;
	Wed,  7 Aug 2024 13:28:46 +0000 (UTC)
Date: Wed, 7 Aug 2024 09:29:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan Wu (=?UTF-8?B?5ZCz5r6k5Y2X?=)" <Tze-nan.Wu@mediatek.com>
Cc: "zanussi@kernel.org" <zanussi@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Cheng-Jui Wang (=?UTF-8?B?546L5q2j552/?=)" <Cheng-Jui.Wang@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, "Bobule Chang (=?UTF-8?B?5by1?=
 =?UTF-8?B?5byY576p?=)" <bobule.chang@mediatek.com>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "eric-yc.wu@mediatek.com" <eric-yc.wu@mediatek.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH RESEND] tracing: Fix overflow in get_free_elt()
Message-ID: <20240807092936.1661ce6a@gandalf.local.home>
In-Reply-To: <52e8ccc5dd82668c17877c97fb96f255dc2e7052.camel@mediatek.com>
References: <20240805055922.6277-1-Tze-nan.Wu@mediatek.com>
	<20240806154008.502b6c7d@gandalf.local.home>
	<52e8ccc5dd82668c17877c97fb96f255dc2e7052.camel@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_062850_917862_2F0166C2 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, 7 Aug 2024 11:34:43 +0000
Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=8D=97) <Tze-nan.Wu@mediatek.com> wrote:

> > > -idx =3D atomic_inc_return(&map->next_elt);
> > > +idx =3D atomic_fetch_add_unless(&map->next_elt, 1, map->max_elts); =
=20
> >=20
> > I guess we need to add (with a comment):
> >=20
> > idx--;
> >  =20
> Thanks for reviewing this!
>=20
> By reference to "/include/linux/atomic/atomic-instrumented.h",
> `atomic_fetch_add_unless` will return the original value before the
> adding happens on operands.

Ah, right. I haven't used that before and was thinking this was the same as
the inc_return().

-- Steve

