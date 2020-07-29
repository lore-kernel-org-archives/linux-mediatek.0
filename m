Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BF1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 17:26:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F73E207F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 17:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="npRqgRLL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fly0eTKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F73E207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CfEraBTXSjZ8Tdjxs07GFyyNd+UxW8fqQwFzSwXVpMU=; b=npRqgRLL/M/TOsI16eTl5CoOy
	n3ijSSDmW9q5cEGR7QbhklZjpnkXYL43dFv3R6bMIvjnJtn4lmUmzoaoihnoBfXzJJqdTiyVlKm8/
	VLtcYiwCbGQMjCuxnHxyXR84adNTw3tVu2LrFGDHsN5xg2F7j6uD7VVnPyoIpjE//wU5uMW3Ab1aP
	vp7bEDkx1VMMgT6ybfvZD5DuZyrN12ZvQh86c2klrKyMvf2aKZt4ZrXdYe4rXWjjQTHIJU9zL7c3K
	5bB/gZIx3jAGuuMZ63oRVwk0vORHFT0/Uru1wK8wxskO1LImdxmg+801bw/Vdjzg7TbAPmD5h8sPi
	++WoSQ+sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0pqA-0008BV-Pb; Wed, 29 Jul 2020 17:26:06 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0pq8-0008Ag-CS
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 17:26:05 +0000
Received: by mail-pj1-x1043.google.com with SMTP id lx9so2364981pjb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2020 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNp6kZKANI3pBR6i8y+/XdO7n8ax8rlSmErac042k/Y=;
 b=fly0eTKEM/EKGjP16uHCq+pssRpnG1oc9UoD42sQ+DjGaEGgDyCjJVmdsBehGVFJAt
 tDNAzjNWyi+KKho1FdNdW0k2Jcj995U+FXNERWEzMPKtWBQK2ClbuGt9rZHOMZNBJArP
 mMJu/xJZIGQE7SLkiym0nS1ZReiINiIbRfdJtUtmmpKJ8uVAZlZspIxXpVKx1k/6BwI2
 02z/r47siNSpiw+r3aRWjPJ/9coKNnamUgcvWA5cRB1aenxCHis13DRTQYYS7Lr+KWV2
 kaE/I4emqVM3JfncrYgEFOLqJsW1mmYMKIrUMGhBvDeW2SYcpLzYbOsX83egBqqrOxut
 VerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNp6kZKANI3pBR6i8y+/XdO7n8ax8rlSmErac042k/Y=;
 b=loyTxzo22KEv18fuBljYoMRP1nBD1L3qXJQMDu8i2V57hp6NibfyNPKQkd8mEIwWbB
 XC5/gW0+lVRO5JxU1nwrdf5AX2j7F0K7OrbrT5mmYurSqmIU25oGXNkcwBa9myFKDX1V
 M2Rizh07lD/NcoT7YxiH74VCSC1Pu7bLw86vKUFWvJ8NnT9lw/ZQlY1KMz1MG9ZWj0jM
 xUdggZW+GrFdScHf/xodgjmk5HdvM6kn6sF1yKaZj2MSn+Cbmuta/AD4Q99m5Nr0Pv19
 KkuvjlP1ESlQ0D57fy7GmmtNfH6t5pF/nqF3QQYekUm/K+At0EWUK5Q1C0zew1+g+wt7
 GIKw==
X-Gm-Message-State: AOAM5317AEQ2TOy2uRzPhG1mDHh+pg0FcUk1vrTq7uGUsUVa1MRtAVQC
 ioLdcqruWh/lkZ4ydcJTUJ4o3xL5P/joJrXdvV6MBw==
X-Google-Smtp-Source: ABdhPJxDXD5VZFMahV5bPRMyliowl8obs4+5jq1SXRL4nu282PjxCmsVHe9zoAoUJK2Ok2mSTg9oXhoTHKsmOrWerxU=
X-Received: by 2002:a17:90a:d306:: with SMTP id
 p6mr10153051pju.25.1596043560274; 
 Wed, 29 Jul 2020 10:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200727191746.3644844-1-ndesaulniers@google.com>
 <20200729115155.GC2674635@kroah.com>
In-Reply-To: <20200729115155.GC2674635@kroah.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Jul 2020 10:25:48 -0700
Message-ID: <CAKwvOd=cNoP7nVQUDwbVDGu4EQXa87aTvjiCdrcXK74jJyggig@mail.gmail.com>
Subject: Re: [PATCH 4.14.y] mm/page_owner.c: remove drain_all_pages from
 init_early_allocated_pages
To: Greg KH <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_132604_452057_FF6BB8F5 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: Oscar Salvador <osalvador@techadventures.net>,
 "# 3.4.x" <stable@vger.kernel.org>, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2020 at 4:52 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 27, 2020 at 12:17:45PM -0700, Nick Desaulniers wrote:
> > From: Oscar Salvador <osalvador@techadventures.net>
> >
> > commit u6bec6ad77fac3d29aed0d8e0b7526daedc964970 upstream.
>
> This is not a valid git id :(

Prepended a `u`. As a git user, I must have `u`ndid something.
Surprisingly it wasn't a `:wq` that was added.  Thanks for fixing that
up for me and applying.

-- 
Thanks,
~Nick Desaulniers

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
