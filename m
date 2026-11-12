Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E638B606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOWFwmSi;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=puI8dU53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LIrhVpNAMQnwriu22bOa0PqtW9YlSEthziGhemny7Ms=; b=YOWFwmSive2TDfBmG1AtUCMqce
	N4YPJvqjH0B6M7DKzIkI6s461ps8NYK88n0lCKzNkcOJ/MUYRy054ynYaK4TROE1KF0nvjNMOcLUt
	Tz+s63BBunQuhpmqYTUAVBvMRAw8hNPgZbkUjj6GjRaJZGRiP06RXo1C94XJPaXHYuSU2iWaJG6Pb
	xRde/pPu66W0qOz7z2FGs71eEDhjj4/H7kFuKxBnAtF+FwHPk78x+J1Km/bvk315HakeIKphPJ4Cu
	0TK/VQnEwmpf82kifPz9Eo+jVDqS9rKGzXiHUQIPI1Z4eGq9j6wTW6qqkvZxnzww4Evcj+IjFmtkr
	aYkMq8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRBu-00000009OGE-1Lf2;
	Thu, 12 Nov 2026 09:33:58 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRBp-00000009OEj-10lr;
	Thu, 12 Nov 2026 09:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LIrhVpNAMQnwriu22bOa0PqtW9YlSEthziGhemny7Ms=; b=puI8dU532w3bteGL0lW/oF1t9S
	20zPt5U/I9Xawvgy/6VwNm6MV0lfqy1sEMo2zmiIGyfky+MaXBzUrXdIZDSJOjnQKPjoGH6kx6rj7
	VcWdf6/Q2CBhYbnGJNDYm8k52wcBoSYbXHgwCNcgMr+1B+1an6PhPRbbvKwVNoqYI7s8ZtFT4/uUf
	3qplPELIuLv8Y/9S56t9/6NvAe4lYrKV9Oz9uWWuzktlelLvzKxoBrijs5rjDZ2+IRY+YJhnIACRj
	wOT/XB0wsOn0xgZUziRRw8mK8KqWF19PCOHmnagYyQ67hR4kOG53t+n2s05/rSJsyZwQlf+EXFyyb
	dwQ+AYdQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRRBQ-00DreI-0I;
	Thu, 12 Nov 2026 09:33:28 +0000
Date: Thu, 12 Nov 2026 01:33:22 -0800
From: Breno Leitao <leitao@debian.org>
To: Oleg Nesterov <oleg@redhat.com>, akpm@linux-foundation.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel-team@meta.com, 
	syzbot+8fdf0d8e10bdde1c2e88@syzkaller.appspotmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] reboot: halt when power off fails
Message-ID: <avWGu4l_nXP_eFyh@gmail.com>
References: <20261110-reboot-make-task-dead-v1-1-af88a3f37bf7@debian.org>
 <avTJ3o-n0UZS0YUj@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avTJ3o-n0UZS0YUj@redhat.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_013353_417572_983E91AA 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 09:02:38PM +0100, Oleg Nesterov wrote:
> On 11/10, Breno Leitao wrote:
> >
> > --- a/kernel/reboot.c
> > +++ b/kernel/reboot.c
> > @@ -791,6 +791,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
> >
> >  	case LINUX_REBOOT_CMD_POWER_OFF:
> >  		kernel_power_off();
> > +		pr_emerg("Power off failed: System halted instead\n");
> > +		/* kernel_power_off() already ran the shutdown, only halt. */
> > +		machine_halt();
> 
> Agreed. Even if I don't think my ack has any value in this area:

Thanks, Oleg.

I tried to find out who merges changes to this file and it is not clear.
akpm seems to be the closest, as most of the changes went through him,
and somehow he was not CCed here. :-|

Andrew, would you be willing to take this one?

thanks,
--breno

