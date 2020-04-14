Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA3FC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 08:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04FF206D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 08:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRYDxKPE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sx6IKJIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04FF206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IZW0d6NKqKYtgeCjz8vwCux7DPmTkTrC6wTAcBYJQRQ=; b=uRYDxKPECthsDfGB5nuZ0c6Da
	mLh5zm0SWuDw0ndqoLo5GmGhvtLofEhf+OBRmr5qMQCeSBs1r7KCYas2YOYrU7QQRfwhkwWSawkQG
	kqLkh9AvAFIO/yCugfOhtFRKV1QJMJfNoRIT40hig4kOF9G/6sws1Tm2TO5qqQNeoQo/Hcivzf75C
	ecLV1MvQoWUd3K7xdB2TaKEeClyDiPRbhf8QJUcHzP159ZV7pw+0X1k7H9BV7XW94gUG7AkovEe0v
	dcNZStvbxqD2YSiN7EwHT0uIwxrVF19tZ3odqhN64F9EnvMEH5hCMmLOsIOU9oM/hk0B32f+NueIx
	W7XCMdNOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOGzT-0001f9-82; Tue, 14 Apr 2020 08:32:19 +0000
Received: from mail.zx2c4.com ([192.95.5.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOGzL-0001Yx-P0; Tue, 14 Apr 2020 08:32:13 +0000
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d220a78;
 Tue, 14 Apr 2020 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to:cc
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=Bn42dUX94nPZ
 VI2aresTt2verm4=; b=sx6IKJIxzuEOA3MDWmGK5eH/64R8mpMYlG8WURWdfzRD
 XFeah0rjLnpfJ/wNxDNPuLqvGkOXg2tTc6/J9yxFJV/B/IyVASTm/xV1AWFh8sOT
 E+Zkl2VUcl4Y0wf6Mu5iapMmn3g8Ztyi36JLXdlWN66PEuOJynjCGScQFzOu0tep
 4+h/FZal3et8UceGQF9vqtL2mbwwUOtzAFh6NniwZkygh5iiMorXd4zwhnYD2AoL
 UBjxDBvR+PqwgLJDDNN43HRxAe1Ka1ICHvrV5FNQIfjCNS9xZTJzxiJXAqnsHyrN
 w3BT8jw4OmracAotC1L9+6WCZMUQn8YWdWOjpIB/Jw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4f42b92
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 14 Apr 2020 08:22:18 +0000 (UTC)
Subject: Re: [PATCH 1/2] mm, treewide: Rename kzfree() to kfree_sensitive()
To: Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches
 <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-2-longman@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <4babf834-c531-50ba-53f6-e88410b15ce3@zx2c4.com>
Date: Tue, 14 Apr 2020 02:32:03 -0600
MIME-Version: 1.0
In-Reply-To: <20200413211550.8307-2-longman@redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_013211_975356_E4BB287C 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/13/20 3:15 PM, Waiman Long wrote:
> As said by Linus:
> 
>    A symmetric naming is only helpful if it implies symmetries in use.
>    Otherwise it's actively misleading.
> 
>    In "kzalloc()", the z is meaningful and an important part of what the
>    caller wants.
> 
>    In "kzfree()", the z is actively detrimental, because maybe in the
>    future we really _might_ want to use that "memfill(0xdeadbeef)" or
>    something. The "zero" part of the interface isn't even _relevant_.
> 
> The main reason that kzfree() exists is to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects.
> 
> Rename kzfree() to kfree_sensitive() to follow the example of the
> recently added kvfree_sensitive() and make the intention of the API
> more explicit. 

Seems reasonable to me. One bikeshed, that you can safely discard and 
ignore as a mere bikeshed: kfree_memzero or kfree_scrub or 
kfree_{someverb} seems like a better function name, as it describes what 
the function does, rather than "_sensitive" that suggests something 
about the data maybe but who knows what that entails. If you disagree, 
not a big deal either way.

 > In addition, memzero_explicit() is used to clear the
 > memory to make sure that it won't get optimized away by the compiler.

This had occurred to me momentarily a number of years ago, but I was 
under the impression that the kernel presumes extern function calls to 
always imply a compiler barrier, making it difficult for the compiler to 
reason about what happens in/after kfree, in order to be able to 
optimize out the preceding memset. With LTO, that rule obviously 
changes. I guess new code should be written with cross-object 
optimizations in mind now a days? [Meanwhile, it would be sort of 
interesting to teach gcc about kfree to enable additional scary 
optimizations...]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
