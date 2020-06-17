Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED52AC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 11:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2FB420CC7
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 11:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOsBsgcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2FB420CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5suaR0mQhVE8xKQ7ODAOq5wO9bSLuDdlLEoF2CI+5Ps=; b=sOsBsgcAa3oq1U
	Dc9KvSeVtNb2D1KxqlmHEWavYeBBoqTvrwcBcRkhQRjKaAVUeA/1L1t2/R3k6EniHaWSe++ql62Qg
	oCLQ6jJgzfHnwIanPWVpIOiNwkVXcNPCE44qaXc9u3S9x7zjrI/+DXILUDzjgzJtNO39m0yGTK19W
	qLATaCvRFKXkUh1OU7h/dJBNY+8P6xxNHLvKKMxyjNFLnt8PG8DqT1pdubjLD6H2CL0nksAVpoSjx
	N9EvkiHjX0WlL9U4K2VYwCFC7ewegTOWqiNktjP6sNHPEW0PWHSr+JRaYx4aoAdVPwg9mHuev5Tz6
	W4vpSmWzpCKMObKvJvXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlWIW-0006WA-Fx; Wed, 17 Jun 2020 11:32:04 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlWIT-0006Uu-QA; Wed, 17 Jun 2020 11:32:03 +0000
Received: by mail-ed1-f67.google.com with SMTP id w7so1689439edt.1;
 Wed, 17 Jun 2020 04:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FYdkGKfQbhF4PHnRrzgzko0Pu9PmmGSrtwLwQw3bXCE=;
 b=pVl5rpCQE8eNtuwrYD3NJIPxAyAoqv5WjV0mJDwjBO84PngqlRPLCoffL7G7JTJHZL
 x5GTu+6cmYuZEWUI94xzJilZwTrPqzRbeYXkN8l1mt8fOGW+WqjkZ6x2hbz+TMP8mFdk
 eQ1ctEsk7rmm1bkOPy6ka9qQKwHwFMlZkmjug9Ys30Lq4isG7OKXxTaQBWYzR8lSqZne
 SRlDI9ga9yolHHogkoNZL5fvsGY1K6ycVEuLNTh0I1cp8fXKAB7LyS9X5x4dW1xG2Zsy
 em9ivP+Dk5+k3F6DHw7hVPrG2qHdHltNT9AWwsDP/P3GceGtnLc92k0GzcaeyT7ZsV28
 rItQ==
X-Gm-Message-State: AOAM5334lmQJPita+y9GtLEaWgpkH0WlhqZ6weXZ0xylBf+MyTOz4Ini
 dTjo2JuZ3QYiKVyGd+k1cmQ=
X-Google-Smtp-Source: ABdhPJzbijHiPBJ8QWNf9hQXsnh9CB5HA28VxqbN6FIY1pPr6HYmH8EGA0XHv2KQOLuy+zTeoR016w==
X-Received: by 2002:a05:6402:3106:: with SMTP id
 dc6mr6587998edb.375.1592393520398; 
 Wed, 17 Jun 2020 04:32:00 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id y62sm12010608edy.61.2020.06.17.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 04:31:59 -0700 (PDT)
Date: Wed, 17 Jun 2020 13:31:57 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
Message-ID: <20200617113157.GM9499@dhcp22.suse.cz>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
 <20200617071212.GJ9499@dhcp22.suse.cz>
 <20200617110820.GG8681@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617110820.GG8681@bombadil.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_043201_846243_BB33E7A1 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, dsterba@suse.cz,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 17-06-20 04:08:20, Matthew Wilcox wrote:
> On Wed, Jun 17, 2020 at 09:12:12AM +0200, Michal Hocko wrote:
> > On Tue 16-06-20 17:37:11, Matthew Wilcox wrote:
> > > Not just performance critical, but correctness critical.  Since kvfree()
> > > may allocate from the vmalloc allocator, I really think that kvfree()
> > > should assert that it's !in_atomic().  Otherwise we can get into trouble
> > > if we end up calling vfree() and have to take the mutex.
> > 
> > FWIW __vfree already checks for atomic context and put the work into a
> > deferred context. So this should be safe. It should be used as a last
> > resort, though.
> 
> Actually, it only checks for in_interrupt().

You are right. I have misremembered. You have made me look (thanks) ...

> If you call vfree() under
> a spinlock, you're in trouble.  in_atomic() only knows if we hold a
> spinlock for CONFIG_PREEMPT, so it's not safe to check for in_atomic()
> in __vfree().  So we need the warning in order that preempt people can
> tell those without that there is a bug here.

... Unless I am missing something in_interrupt depends on preempt_count() as
well so neither of the two is reliable without PREEMPT_COUNT configured.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
