Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D61C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B46qLyQJ0RLJG3V0owLH7AhzKF9F7MAxul4nuhS+mlc=; b=qT89tE4UhcXELTTJOJq2hVEsia
	ZXi/SnuXm1prEeueJ2zXynrnBjHQ/jz8HwQIngwTSjJNDGAhUGPuluhZhCeucu2gwsk2K/OuZ6B3Z
	yAQnv8RK5X/FuctLqvfqfXfE0nO0ecJ77y9SQwcry483BupYZZCD2X3ZOpd5830Pd/3/u4JGo0xTp
	ptLOXOdYEqHpRBSJmbG2cSOcy8Ok6V1v8PAqbqPoqMQf7zUWJXVsY57IxfKm+xsml1qWJXChWfKV6
	M4oHLx4BG2mL1sktXEb9ZUHv0LfXV0KJOnT6GKz7aUOn5ER0HyCAh82NjRi4mnUd987lJGaiBnqMI
	0b8DPMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOky5-00BTAR-08;
	Wed, 26 Jul 2023 20:18:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOky0-00BT9H-2w;
	Wed, 26 Jul 2023 20:18:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C16861CA5;
	Wed, 26 Jul 2023 20:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0FDC433C8;
	Wed, 26 Jul 2023 20:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1690402719;
	bh=MMioSWLe0J+F5cA3VOGFUM/YW6sX+D23b5MfVPZqMwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BAp862XDg5jm4GYl6C/MPJCbU0NcJd6qPBVRi+my42pt/DpGQq+SWl6YIT7fPp2PL
	 HcTDTo7GooY8BqKKq/e9K45b7acdnf/8e4JgzivN0rxkQUcPLhm+263tGJc5Oa2wxs
	 G7HZ6q+3UPSjZyikhKl7/dD9hL3rjG9tai4JLO+c=
Date: Wed, 26 Jul 2023 13:18:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Yang (=?UTF-8?B?5qWK5pm65by3?=) <Andrew.Yang@mediatek.com>
Cc: "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, Casper Li (=?UTF-8?B?5p2O5Lit5qau?=)
 <casper.li@mediatek.com>, "minchan@kernel.org" <minchan@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] zsmalloc: Fix races between modifications of fullness
 and isolated
Message-Id: <20230726131822.22ac039ee4c696ea0726b510@linux-foundation.org>
In-Reply-To: <42f1209a686404ffd0f9dff05ed10a8d23383a11.camel@mediatek.com>
References: <20230721063705.11455-1-andrew.yang@mediatek.com>
	<20230726031846.GJ955071@google.com>
	<42f1209a686404ffd0f9dff05ed10a8d23383a11.camel@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_131841_014324_48BD9E99 
X-CRM114-Status: GOOD (  18.24  )
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

On Wed, 26 Jul 2023 06:59:20 +0000 Andrew Yang (楊智強) <Andrew.Yang@mediatek.com> wrote:

> > Have you observed issues in real life? That commit is more than a
> > year
> > and a half old, so I wonder.
> > 
> Yes, we encountered many kernel exceptions of
> VM_BUG_ON(zspage->isolated == 0) in dec_zspage_isolation() and
> BUG_ON(!pages[1]) in zs_unmap_object() lately.
> This issue only occurs when migration and reclamation occur at the
> same time. With our memory stress test, we can reproduce this issue
> several times a day. We have no idea why no one else encountered
> this issue. BTW, we switched to the new kernel version with this
> defect a few months ago.

Ah.  It's important that such information be in the changelog!

I have put this info into my copy of the v1 patch's changelog.

I have moved the v1 patch from the mm-unstable branch into
mm-hotfixes-unstable, so it is staged for merging in this -rc cycle.

I have also added a cc:stable so that the fix gets backported into
kernels which contain c4549b871102.

I have added a note-to-self that a v2 patch is expected.

