Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D201C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 04:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gPa0nwvmyXROQj70tlYH91LsTrIn8+UxP4ZHlm7p2Y=; b=4KZTFNEsKitXok
	MDYv0fdtJrxOJUuNvUxW4E6IJHrNbs8TzILzSq8DxYyJUISEe6VjUDA21UA4TibHzWxB/i1FbsNRx
	zwmLyHpJf8eZAj6aPbilzi+Pkc8HZn/e4Ptvu8lQ4JTnXWDNbLxlppInHz3TDWNZ2wkf5Af5FgOLa
	0L1Tkr/XXMbU9ACrTuz3+tT2EnltB3MlDeRREXRJ8pxjg3JVmBOp9V1BMJ0rvmpuo/gdopyhg3M12
	dfr+DhH68RVHswvyoYYp51jlMeBBgrX4sdrCC7yrT/2V4ri9pJw1Puc3TiRWUz3NNVbBamooHHuYb
	6WuSgwwqTca935Nr3P4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTygs-007hlQ-ML; Tue, 15 Mar 2022 04:21:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTygg-007hj7-6l; Tue, 15 Mar 2022 04:21:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF877B80FAC;
 Tue, 15 Mar 2022 04:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DFCC340E8;
 Tue, 15 Mar 2022 04:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1647318088;
 bh=92N7wiO5DH6MIG7OI/keYmonozvVE63Ota9hoIR7/bo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a3nmDbj9hIT5BHXOrUkOgHJYejfbiyt36AMauCj+660L/ij+0r8qn3+t7ZeUru05p
 WmdLq6/EgFi+wTmQStXFtofJdKqaaEwD4lQAg9BIftk1nxnhH5IwKLeX47t6SzeBmJ
 moVvwt94fdpD5H2p6mEK36/n8WHJ+mkJBLKt07w8=
Date: Mon, 14 Mar 2022 21:21:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Matthew Wilcox
 <willy@infradead.org>, "Vlastimil Babka" <vbabka@suse.cz>, David Howells
 <dhowells@redhat.com>, "William Kucharski" <william.kucharski@oracle.com>,
 David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Marc
 Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Nicholas
 Tang <nicholas.tang@mediatek.com>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: Re: [PATCH] mm/migrate: fix race between lock page and clear
 PG_Isolated
Message-Id: <20220314212127.a2797926ee0ef8a7ad05dcaa@linux-foundation.org>
In-Reply-To: <20220315030515.20263-1-andrew.yang@mediatek.com>
References: <20220315030515.20263-1-andrew.yang@mediatek.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_212134_435092_1F03A60F 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, 15 Mar 2022 11:05:15 +0800 Andrew Yang <andrew.yang@mediatek.com> wrote:

> When memory is tight, system may start to compact memory for large
> continuous memory demands. If one process tries to lock a memory page
> that is being locked and isolated for compaction, it may wait a long time
> or even forever. This is because compaction will perform non-atomic
> PG_Isolated clear while holding page lock, this may overwrite PG_waiters
> set by the process that can't obtain the page lock and add itself to the
> waiting queue to wait for the lock to be unlocked.
> 
> CPU1                            CPU2
> lock_page(page); (successful)
>                                 lock_page(); (failed)
> __ClearPageIsolated(page);      SetPageWaiters(page) (may be overwritten)
> unlock_page(page);
> 
> The solution is to not perform non-atomic operation on page flags while
> holding page lock.

Sure, the non-atomic bitop optimization is really risky and I suspect
we reach for it too often.  Or at least without really clearly
demonstrating that it is safe, and documenting our assumptions.

I'm thinking this one should be backported, so I'll queue it for
5.18-rc1, with a cc:stable so it gets trickled back.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
