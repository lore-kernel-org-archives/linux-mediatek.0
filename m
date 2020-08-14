Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009E8C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 08:31:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE86B2074D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 08:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mdb2ssaT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="dnr4mLvl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE86B2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eA8mryN9uf1xph9TGA3wCZlSV2RxT8igs8f0RUZ5nMg=; b=Mdb2ssaTcW6S9E+HRvpFo9Wwz
	+EMRoo01UwS0lqJY23ett/zSYDg7yTXW5Kltd0HAB0lG6HIAxHKuvTjtZcpwoaX/bd/vLr2m4mlWa
	UT/k3oTvwdYb3Sh4IjkZbn5jSA1w83ZK2ctMRgf/Pr6bzHezs47q2WFsej57CtVtWmsv4EmHASN52
	mAwgZ+rKj8xE09Bs8skgwJwwg8MT+ih+ZbjKMp/7iev6lPQwb4lclZjOwqjBMh1OVsoAd3VLTvvr3
	4j22+VniioJ+RgSVqzW7Ds0Dk2mWKbzyxZfyTWP3pY1QRdQMNLM0Tk17C5GadzFPsgcKZnAR/CKna
	HFjsSeaeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6V74-0008Sg-LO; Fri, 14 Aug 2020 08:30:58 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6V70-0008Qn-EP
 for linux-mediatek@lists.infradead.org; Fri, 14 Aug 2020 08:30:55 +0000
Received: by mail-yb1-xb41.google.com with SMTP id i10so4773029ybt.11
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2020 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnDVAQh+31C0t6VNGwQb4SjTxgNgsH3VtTdOtKZQqwA=;
 b=dnr4mLvlqaTviMNIb+lJPY5U9aWlRKE8rBtF9/XEX9gNmzomc3qYCO99SFNJMqBShI
 ID7CBkceR981pX1/9kqesB9Bqrrq5f2cFzFhV/5G2tyTb89F0zUk7JSbKaSZOw3HbQxf
 Zhq0gHvWTQCikK3g4ur3M4TmpQw/a0u37kQEwnJw81wKmuuqaGmI6H+HbLINFx15X0H+
 hOIxcXOllEOoPSzsZ0DKha77TGNiwyDY0h2iYQVxky7dQScxW7AX4U4wH+U/RcYsDB4c
 4QTpivy51hJ8Xe0EnMzKIsjUXatzwM8w9PRIj3RFXCY7hXh0uWmamBOgCcOWMtRYHo/u
 l8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnDVAQh+31C0t6VNGwQb4SjTxgNgsH3VtTdOtKZQqwA=;
 b=eROE+QTV+LWf4QlxSzsxi9KPFhbFUit5jG/9WfhS0puFyG2kZk+IJyHKSM1E5AUtf6
 5NHJUflFf8FcoPX8e7qIMTSOJ6lkOI2L2vUgjDKW3g88cYOmkwJRFvEPTvONDJGxUXHw
 YThnknOmbskau6LP/xwKnoHjFC+29eJYSJdd4P59hdzZ3w6Z885UnxbajJYUB6k1NBL/
 Kyigu59TrK+AsqSqVn+MAyxOE8NrCkd+he/bOeq7U/ebaESvpK5NneIbUewKRJEUcxs/
 IGDwchjRowZEUF35il7d48EmvnuLqf6N55d2aqxUqi+OOpQ/cElALsydRnzFWwb4rUDi
 k4fg==
X-Gm-Message-State: AOAM530JKbGvnEbN/R7e7xcLDGv+dCDIVbZrfAAxOhdKsJbh8S/W4vTF
 lV9ErflV8skW/owRzu4vuw3YcPnbzK6pKBrjSI5cuQ==
X-Google-Smtp-Source: ABdhPJzFmN0idTb9mEjomYn0+86nKEa4RjZkPMilkwJ+OKxZWvgt6E6RuaAMSfAO02qLD8cIHXduF0Tu4Ob3gT084Vg=
X-Received: by 2002:a25:ab0f:: with SMTP id u15mr2246861ybi.7.1597393852250;
 Fri, 14 Aug 2020 01:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
 <1597284810-17454-2-git-send-email-chinwen.chang@mediatek.com>
In-Reply-To: <1597284810-17454-2-git-send-email-chinwen.chang@mediatek.com>
From: Michel Lespinasse <walken@google.com>
Date: Fri, 14 Aug 2020 01:30:39 -0700
Message-ID: <CANN689FtXN-6tGkyGc9ja7rrZTTUEoW5omfEJ=PmOaft4YkaaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmap locking API: add mmap_lock_is_contended()
To: Chinwen Chang <chinwen.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_043054_585820_3E85B7A4 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: linux-arm-kernel@lists.infradead.org, Song Liu <songliubraving@fb.com>,
 wsd_upstream@mediatek.com, Davidlohr Bueso <dbueso@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mediatek@lists.infradead.org, Jimmy Assarsson <jimmyassarsson@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 7:14 PM Chinwen Chang
<chinwen.chang@mediatek.com> wrote:
>
> Add new API to query if someone wants to acquire mmap_lock
> for write attempts.
>
> Using this instead of rwsem_is_contended makes it more tolerant
> of future changes to the lock type.
>
> Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>

Acked-by: Michel Lespinasse <walken@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
