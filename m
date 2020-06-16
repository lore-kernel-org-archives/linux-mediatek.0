Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B16C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 15:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED3520E65
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 15:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGPE+Q8v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrdyVPoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED3520E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRj0WTgM5r7CufbY0UTE7StmQiTWr90YL0GtaJdlc2I=; b=SGPE+Q8vgmnUlK
	CUBsZBS1bwppSaHudnoPEfkFK2tJTxtQo+CnRAF9u9vvqMftwFOGuDCfvc9QcMLzpEDCfYPeaMAiW
	+jox5p9OKgTm17r+KZiiycsx+oZQzctHCBV8P9/YTdu5ZW/XxtFDVjiC1SjEzg4VzJ0/fjXMhfMPg
	WbQ/FeMfrBYNXUC7TrtweCxfNG/fJ5uQFiTLGzlrg+XHr/fZxnLYd5FRDUFZzLKYOFYn4gBUb5YsS
	caDIJDey2nSfMUxL2AOap3+morEaGMoFZX7aAFFG/zL6wRp4MK9+GdPYvssHaAwbpHYryvzY+mjch
	CzrE3205Ka9cgrXykMzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlDnn-0002lW-D0; Tue, 16 Jun 2020 15:47:07 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlDnk-0002jz-8w
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 15:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592322423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=djkgmBs6vxKrnF2svfHTCwO6iJZv0MD8YpKSjFl2MGs=;
 b=WrdyVPoTClN+2yZfrSiDUNggJTUXJQ9CL2nSWb6qNsQUgMKxAttIcwSgtOBsjn6KwsD/Mr
 hYD32HVrthxQfFQe1Deqfgq0i4a7WcNBubT0A6+N2MGGZs1FcF86ixoDIToQ5atcyASzTI
 JK8o/alnvqPFlCsEBrZ+Pl3UTttnXeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-nWeeH7oNN9eY6skcHYs3nQ-1; Tue, 16 Jun 2020 11:46:56 -0400
X-MC-Unique: nWeeH7oNN9eY6skcHYs3nQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B3678DEEE2;
 Tue, 16 Jun 2020 15:46:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC3B60C05;
 Tue, 16 Jun 2020 15:46:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <56c2304c-73cc-8f48-d8d0-5dd6c39f33f3@redhat.com>
References: <56c2304c-73cc-8f48-d8d0-5dd6c39f33f3@redhat.com>
 <20200616015718.7812-1-longman@redhat.com>
 <20200616015718.7812-2-longman@redhat.com>
 <20200616033035.GB902@sol.localdomain>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 1/3] mm/slab: Use memzero_explicit() in kzfree()
MIME-Version: 1.0
Content-ID: <879078.1592322400.1@warthog.procyon.org.uk>
Date: Tue, 16 Jun 2020 16:46:40 +0100
Message-ID: <879079.1592322400@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_084704_387252_F5656D05 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, ebiggers@kernel.org,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-integrity@vger.kernel.org, linux-nfs@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Waiman Long <longman@redhat.com> wrote:

> The kzfree() function is normally used to clear some sensitive
> information, like encryption keys, in the buffer before freeing it back
> to the pool. Memset()

"memset()" is all lowercase.

> is currently used for buffer clearing. However unlikely, there is still a
> non-zero probability

I'd say "a possibility".

> that

and I'd move "in [the] future" here.

> the compiler may choose to optimize away the
> memory clearing especially if LTO is being used in the future. To make sure
> that this optimization will never happen

"in these cases"

> , memzero_explicit(), which is introduced in v3.18, is now used in

"instead of"?

> kzfree() to future-proof it.

Davod


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
