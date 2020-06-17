Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EA7C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 23:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A8020734
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 23:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tci/MjGo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A8020734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rf5GoIytIr5zlIedPR6Qi14759C+RoaPpS1CKjmkbsc=; b=Tci/MjGom9wcCz
	U36d4k54S8IqG85usvKX3Z/S2wTnvGJ78t1XeeZ0l3mWGHX/g0fHkLNDKrgE/qN+o+Lfpo/+cqqqT
	wU1ObB089DVAPbuc0OSGQ0ARlad+n9JxZq2CVP4ZnVWAXHqujNbjvXcWmeQLBHt8OLcoXXxQdurwV
	8UBR3ky67KiPM30jCcBVjxkkfRkf4ET6P8wszMVceU1PuNacsYVZZNvvYdk9czL7cODp1JMZH3jex
	wVH1HNJ8xWJmG4SGAYn3HePScSz25D/DsviMtxtKgN07Ftw9f3oW0P7GFqmOZDsd7klBOZBfhrYHo
	rbGVSK8/KLG3h7J8u4JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlhEI-0005RL-5V; Wed, 17 Jun 2020 23:12:26 +0000
Received: from smtprelay0057.hostedemail.com ([216.40.44.57]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlhED-0005Pq-SH; Wed, 17 Jun 2020 23:12:23 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id C6BF8181D330D;
 Wed, 17 Jun 2020 23:12:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: anger66_3706ec726e0b
X-Filterd-Recvd-Size: 3931
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed, 17 Jun 2020 23:12:07 +0000 (UTC)
Message-ID: <38c5745d14cff75fe264a3bc61d19fd837baf7ad.camel@perches.com>
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
From: Joe Perches <joe@perches.com>
To: Denis Efremov <efremov@ispras.ru>, Waiman Long <longman@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Howells
 <dhowells@redhat.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox
 <willy@infradead.org>, David Rientjes <rientjes@google.com>
Date: Wed, 17 Jun 2020 16:12:06 -0700
In-Reply-To: <17e4fede-bab0-d93c-6964-69decc889d7d@ispras.ru>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <17e4fede-bab0-d93c-6964-69decc889d7d@ispras.ru>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_161221_978464_44755C9C 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 David Sterba <dsterba@suse.cz>, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-06-18 at 00:31 +0300, Denis Efremov wrote:
> 
> On 6/16/20 9:53 PM, Joe Perches wrote:
> > On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
> > >  v4:
> > >   - Break out the memzero_explicit() change as suggested by Dan Carpenter
> > >     so that it can be backported to stable.
> > >   - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
> > >     now as there can be a bit more discussion on what is best. It will be
> > >     introduced as a separate patch later on after this one is merged.
> > 
> > To this larger audience and last week without reply:
> > https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
> > 
> > Are there _any_ fastpath uses of kfree or vfree?
> > 
> > Many patches have been posted recently to fix mispairings
> > of specific types of alloc and free functions.
> 
> I've prepared a coccinelle script to highlight these mispairings in a function
> a couple of days ago: https://lkml.org/lkml/2020/6/5/953
> I've listed all the fixes in the commit message. 
> 
> Not so many mispairings actually, and most of them are harmless like:
> kmalloc(E) -> kvfree(E)
> 
> However, coccinelle script can't detect cross-functions mispairings, i.e.
> allocation in one function, free in another funtion.

Hey Denis, thanks for those patches.

If possible, it's probably better to not require these pairings
and use a single standard kfree/free function.

Given the existing ifs in kfree in slab/slob/slub, it seems
likely that adding a few more wouldn't have much impact.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
