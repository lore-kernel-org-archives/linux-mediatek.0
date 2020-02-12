Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361FDC352A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 22:03:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098D020848
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 22:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pQJtdM/N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfgfpDft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098D020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=misUtbgIYUcIrwJgdjwrmAqXLS0K0pI0vUKqFxIVXFk=; b=pQJtdM/NUvxlBG
	mpt6jrKIvANXarKGH2qMuIgEqOWJQa6B7rZP9KKT0DbvojlPeAFtqkPDoOfn2MN9loVcaXhViTdsc
	i58RhHndHiQ8PC+56fRsyRhKw4mwi750a6XMrHjsMLW5WdnrwENV/cT3DNEqM9URedSx0pDuAIkZB
	xa3vVCHTlaRofw8PnkQm57urns/Zlg6MgIfCZmNdHZMLvH5oHN8oBxYAzTTl94iMNopym7TiM5DLh
	yPIhMPGmti+uSM0z5qa9sMMTty9WoEBqSdc7DxZ1rMQh6K+XA3UkIlNWA2p+RZVPlIvqqDeBDnVfR
	TuEvkqisuNa8d6bJmSgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j206J-0002qt-Fb; Wed, 12 Feb 2020 22:03:19 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2069-0002hV-ME; Wed, 12 Feb 2020 22:03:10 +0000
Received: by mail-qk1-x743.google.com with SMTP id b7so3697183qkl.7;
 Wed, 12 Feb 2020 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vktZgdwHT9wecNxCGbvMxpCvSL0TwzAxN3Sq+MPR+iE=;
 b=nfgfpDftMtMJpWLxiSSs1X2OYcR9WlCI1amDpodmsLKxPgHkq8bnF4qf1qtxMLl199
 uWMc6cYmIs/jgWcwFKkmA1JHNWG82eW/IKsMlZpt3mUHo1pedk+LHU2F5vGJTvd7qkuE
 fNGTvtRWPXIit3HMzALvF1UOg3gvWURxXh51WA1HcgiQsiQD6P2hroKRk0XCvfHR6Dzc
 dUViLRXSEg/GOVAWO3L349vTzL+TvRhuWrvH/RL4CyOMUBipTQvLtVcjhMg5rGBxSPCP
 gHaie3hPJkpPL/U0oSQ8fkXX54m7zGqVd3HOJjXK3WbYxhlGgnFofw7ctLXn1muu7S9S
 mjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=vktZgdwHT9wecNxCGbvMxpCvSL0TwzAxN3Sq+MPR+iE=;
 b=sKqv1uCFxY6hDTFXr2Kdf7F9OI2+q6gSjQKnAfk1Vc3saTEm3TQT/J7FXE0kwgIxI1
 fJBJBzDwseBo1Mc9K8QkCmYTytLRjd//ehAs1+1lYwlraK/vxqjtzYB2ERj4NtZhmJM1
 8XWJpj1Bk6KCUDW3ngODT9klX5lnWelE4uXY6BX6lhNZyGodSUJ+hFD1fy1mrz4RQSs4
 3LvOOfFUMv1UrJZdhWNhe1+uBzreWe94cZaWquFsSi+3RCARllzHAqLz46+UK9AWJ/hN
 9gy6hn1F7Gghf1cRRHkHkkNOcFqg53Bc1vKKTLL6HYalqCEGnKQyQD0CtrZkKvYkMDwu
 e0XQ==
X-Gm-Message-State: APjAAAVNfb3ARlrdSS+A6ezPkGfcb6H1bQ3j3y84RqHc1ZP/5JagqyN1
 gzgMB8ZpnGiFfqSQCknBdxk=
X-Google-Smtp-Source: APXvYqzT+6mBAxj1e5FLwLyZnqWru8muuUku/e/rxOQlawFETlZgZCjz3d0Bvp6LGi4KM4HKO8a+DA==
X-Received: by 2002:a37:7a83:: with SMTP id v125mr13061546qkc.22.1581544987943; 
 Wed, 12 Feb 2020 14:03:07 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::1:985a])
 by smtp.gmail.com with ESMTPSA id z5sm335513qta.7.2020.02.12.14.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 14:03:07 -0800 (PST)
Date: Wed, 12 Feb 2020 17:03:06 -0500
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: Re: [PATCH v2 1/3] cgroup: Iterate tasks that did not finish do_exit()
Message-ID: <20200212220306.GH80993@mtj.thefacebook.com>
References: <20200120145635.GA30904@blackbody.suse.cz>
 <20200124114017.8363-1-mkoutny@suse.com>
 <20200124114017.8363-2-mkoutny@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124114017.8363-2-mkoutny@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_140309_751970_1E2821AF 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: linger.lee@mediatek.com, tomcherry@google.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, surenb@google.com, lizefan@huawei.com,
 linux-mediatek@lists.infradead.org, linux-kselftest@vger.kernel.org,
 hannes@cmpxchg.org, matthias.bgg@gmail.com, cgroups@vger.kernel.org,
 alex.shi@linux.alibaba.com, kernel-team@android.com, guro@fb.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 24, 2020 at 12:40:15PM +0100, Michal Koutn=FD wrote:
> PF_EXITING is set earlier than actual removal from css_set when a task
> is exitting. This can confuse cgroup.procs readers who see no PF_EXITING
> tasks, however, rmdir is checking against css_set membership so it can
> transitionally fail with EBUSY.
> =

> Fix this by listing tasks that weren't unlinked from css_set active
> lists.
> It may happen that other users of the task iterator (without
> CSS_TASK_ITER_PROCS) spot a PF_EXITING task before cgroup_exit(). This
> is equal to the state before commit c03cd7738a83 ("cgroup: Include dying
> leaders with live threads in PROCS iterations") but it may be reviewed
> later.
> =

> Reported-by: Suren Baghdasaryan <surenb@google.com>
> Fixes: c03cd7738a83 ("cgroup: Include dying leaders with live threads in =
PROCS iterations")
> Signed-off-by: Michal Koutn=FD <mkoutny@suse.com>

Applied to cgroup/for-5.6-fixes.

Thanks.

-- =

tejun

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
