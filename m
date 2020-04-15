Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F30C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 05:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA2820656
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 05:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F9vJ38Pq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cmpxchg-org.20150623.gappssmtp.com header.i=@cmpxchg-org.20150623.gappssmtp.com header.b="Tcxzc6xC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA2820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tklF2z67NdBmmVF5jcUJRS3a6H88HovaZbhOg1PwvAc=; b=F9vJ38PqXA22Ph
	jVyj4P2i7zekLtlwoueKByW2tiUM1aM9Ffu4tdnQG+B2HtGOCz5CfcVr9Kh7AfDguwcnkfUbKjkfp
	o0i54vZAoNdVoosAn8WY4t1QcAL2b0MUO1YzWlbSbIZL0dLUtzBYkuerKdkvenQfGeT6XufgZLBWm
	fz6sDAx1+SxXuUb/+l0o7v+BOCM++9g4s7FJx9zaABt1JCsJhA2b2lPXcJKXmpTckNlGFw7gJ1boR
	3TWDsex1FmHLSsyZTC2sry7Tj8u9Lgpyu7HA5thk5FYNQcrzKAGxURi9/F1kdPGaQGnQEcqIMgHsr
	iNBfsBv+V9NzwbZn1dIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOaAi-00058q-NH; Wed, 15 Apr 2020 05:01:12 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOaAg-00057e-5Z
 for linux-mediatek@lists.infradead.org; Wed, 15 Apr 2020 05:01:12 +0000
Received: by mail-qv1-xf43.google.com with SMTP id di6so1080622qvb.10
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Apr 2020 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ef3HLI/XX5ogd42JRuoGnEbb/Ln3ZxgvuLj5jaeUWkI=;
 b=Tcxzc6xC3iVTZShTUf3CIv3N8B5ZyCbru12fLV5+tpVooL5/Bo3MM2R4w1+y/qKNnw
 9lu0zJBRs+VK1Bc14YzwiZC+K/efs95VT8GzxaoJoz3t2WhfDZxWX+BgsMNU20r8wRPv
 WS98QN/V8NZIzymtO0juNqdA9Tg6/2OTyjU7Zm1KL9ejebzf7wo1d0uOEsRrlg17M8fg
 qYmffi6H6MwGLJe4epZjwPPvjWIdIXS0xtejpuhYYUqQSrz2GfoywvJh6tC6sCJVyKe7
 xzOQhWdIv/o82YQJCk9DtMPUw2B8iLWuNwugd4l1OepDEbLixuOHRPHRALsrInJO+Rsn
 o1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ef3HLI/XX5ogd42JRuoGnEbb/Ln3ZxgvuLj5jaeUWkI=;
 b=IEuXVIlBDuKiTelcl5XdjOVCkmnAQe0eub7u5XD0JIb8ESZgv2tbzmKQdGLwUNc0AX
 /2z7nFjFIdUCEe3ty0l1YpV9HeD4pGORW6Yo91eIeLY2HRPyhwdAjNOZUXaTrNY1s2p0
 DwArFs80QrCB69mRF5p/5Q2Pvikx0y5+PdWzqTxQiQROfCEilafUUCpfVb4q3ORGp4N3
 aBniuvG6RQaOqU6aBocTyGEvHk1Vxt3scXWdpNrrKjXFvP8MCZYcUq7rHARUM7FSJ7C5
 ds/PWOc4g2yT2Oqbp9pPugrF97IORD3LRa70DDibPRRrhClO/yvLqig7YM75SNT0q8XL
 EE/g==
X-Gm-Message-State: AGi0PuZC/pE6q3LP7ipF1Hjm/3qawsUd6O681YuZsCMLDql0AqkBVT/B
 WymAqbUyByjKI27DYEFkThAs4A==
X-Google-Smtp-Source: APiQypJRjg+PyUSZjrIkjpxdMfgyPb9bMEWnffTFRMxoE1aQMUITXzNurR0P/0BN6q0H0W5xTyhSBA==
X-Received: by 2002:a0c:e88d:: with SMTP id b13mr3243342qvo.245.1586926868219; 
 Tue, 14 Apr 2020 22:01:08 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e623])
 by smtp.gmail.com with ESMTPSA id 10sm6168833qtp.4.2020.04.14.22.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 22:01:07 -0700 (PDT)
Date: Wed, 15 Apr 2020 01:01:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 1/2] mm, treewide: Rename kzfree() to kfree_sensitive()
Message-ID: <20200415050106.GA154671@cmpxchg.org>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-2-longman@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413211550.8307-2-longman@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_220110_215960_2FF8AF97 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, samba-technical@lists.samba.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-integrity@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 13, 2020 at 05:15:49PM -0400, Waiman Long wrote:
> As said by Linus:
> 
>   A symmetric naming is only helpful if it implies symmetries in use.
>   Otherwise it's actively misleading.

As the btrfs example proves - people can be tempted by this false
symmetry to pair kzalloc with kzfree, which isn't what we wanted.

>   In "kzalloc()", the z is meaningful and an important part of what the
>   caller wants.
> 
>   In "kzfree()", the z is actively detrimental, because maybe in the
>   future we really _might_ want to use that "memfill(0xdeadbeef)" or
>   something. The "zero" part of the interface isn't even _relevant_.
> 
> The main reason that kzfree() exists is to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects.
> 
> Rename kzfree() to kfree_sensitive() to follow the example of the
> recently added kvfree_sensitive() and make the intention of the API
> more explicit. In addition, memzero_explicit() is used to clear the
> memory to make sure that it won't get optimized away by the compiler.
> 
> The renaming is done by using the command sequence:
> 
>   git grep -w --name-only kzfree |\
>   xargs sed -i 's/\bkzfree\b/kfree_sensitive/'
> 
> followed by some editing of the kfree_sensitive() kerneldoc and the
> use of memzero_explicit() instead of memset().
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

Looks good to me. Thanks for fixing this very old mistake.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
