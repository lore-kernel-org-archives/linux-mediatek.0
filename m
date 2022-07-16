Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0284C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNiFm0gBAMEGR8SpS6ErfJieYr73iFw+EHt4b17iuFY=; b=DaL5JL1BTgdTSYi0yaRFUxVOS0
	GE6gm7bUVQWJ1WPCpK4Tmof/xUevow5n8ew7PImidgw7bEnXAZKMee7nzUgU09pihW9TDu+PtM1jE
	QViAAtfSUa//wWBSojHE61oCtx1/y1d2IkscBgnb7eBn3PYwS+W2yQxPX7xpjaE0cvrWHMs14q9bc
	TsZfk7fhg1r4mn0fBzbPgzE7pmIgQteQVt5AvT/g4OHu9fLraHJhoGkVbFwxI4C0mL7+HU0oGodam
	RzRV2mV8Vm86RWs7ZrQT6xc0d8PbjZtt1VG6G1Un1kKq1Nm8FgukiXiHGjvXoQ69dy+JRCMzEYEh/
	f8l448ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCWnp-00Bimv-NY; Sat, 16 Jul 2022 01:41:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCWng-00Bilf-24; Sat, 16 Jul 2022 01:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XNiFm0gBAMEGR8SpS6ErfJieYr73iFw+EHt4b17iuFY=; b=NKYBP00u2y6vH5iaafzj5m7T1C
	YaOFZqR6WwFv7kC/DE7iqMfDfrCI234n29/xWaA3KLzv++u3G6e4rn93uCPn9I736+c4dUyZ8krGT
	sx0U/Maw+IN4lVFRkbomlA20YJECuJAQByfPNt51xGmZiIskWIerWPwSwLSxog6eO1lomgJ1rFU2n
	3FPUol2c4dwlg8voScmq90h4uOkopbcScZupIfhbEWYfvAI63XMe1/txY0+D5su6VYqlS0nYYK8gv
	snScZppxzyMmZgRCX7/xzTLmT6MlSdxfkG3YeRYfJ6uIqaunOQQ1+itJayJwdKaigtw42mSWQI5o+
	aPEQBgBQ==;
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCWnb-004Epo-3C; Sat, 16 Jul 2022 01:40:54 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 46EA234AD8;
	Sat, 16 Jul 2022 01:40:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id EC0D22002F;
	Sat, 16 Jul 2022 01:40:36 +0000 (UTC)
Message-ID: <e3b59b09c958e420b74aab9f51d6eca0c63005ca.camel@perches.com>
Subject: Re: [PATCH] mediatek: mt7601u: fix clang -Wformat warning
From: Joe Perches <joe@perches.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Fri, 15 Jul 2022 18:40:36 -0700
In-Reply-To: <CAFhGd8pJyRYq-3VrKM+6+k0AysfYbVJEJm3FMFt9eAysAKDUpQ@mail.gmail.com>
References: <20220711212932.1501592-1-justinstitt@google.com>
	 <84e873c27f2426ce003e650004fe856bf72c634b.camel@perches.com>
	 <CAFhGd8pJyRYq-3VrKM+6+k0AysfYbVJEJm3FMFt9eAysAKDUpQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: 9arxp8zrxrtfhr9woubqw46ao9rxwyoi
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: EC0D22002F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX188ldYAO7JJ3DMtC38rgMW1rKWpcluwGBk=
X-HE-Tag: 1657935636-65764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_024051_466332_5740C983 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, 2022-07-15 at 17:08 -0700, Justin Stitt wrote:
> On Thu, Jul 14, 2022 at 11:33 PM Joe Perches <joe@perches.com> wrote:
> >=20
> > On Mon, 2022-07-11 at 14:29 -0700, Justin Stitt wrote:
> > > When building with Clang we encounter this warning:
> > > > drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
> > > > specifies type 'unsigned char' but the argument has type 'int'
> > > > [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);
[]
> > I suggest s/%hh/%/ for all the uses here, not just this one.
>=20
> I also contemplated this change but I think it might be a bit out of
> scope for https://github.com/ClangBuiltLinux/linux/issues/378  -- What
> do you think?

It would not be out of scope.

> It could be argued that every single instance of %hh[dux] should be
> replaced with %[dux].

All the vsprintf ones, but not the scanf ones.


