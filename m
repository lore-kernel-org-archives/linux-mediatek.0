Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D44C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 17:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2A4206E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 17:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJiPgZp3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbHiqO+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2A4206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdW0DDHPYqX5qhf+yvWo1+427Lbq1oJ1b/oxwO97LTA=; b=rJiPgZp3av2Q/K
	uEPkahRjLg+kFL+p4ZYg69qrFgXZU1uPkrVm9zZ1h4aDfmx5OyPE2noVo8oZtk3lkpyzDZmMWleig
	VcDZBH8w+H6UjvgEnx7V42RXrO+tqMm2qFLIJNImW0MVCwxKJdX1bskqoWaWdQIEF82eQHnBtA1Eg
	PIl8zjVpKG8ppAXc+hEUf0P26e714kKKYhhQeEAcux6qT4vLwH2IP9MyvikKYj3Nf5wbxFjE0ajqJ
	BpD6Cx3p1JWXW1ya/YOEmfpaV8gypa3sqJwLzM2m3ZsdPb4B/UAX1uawlO14kvNzXEDTT6JPhj8Jl
	94w4Z/O1Gbd6OMaSmr1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isVPw-0007c1-G0; Fri, 17 Jan 2020 17:28:20 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isVPn-0007UC-RD; Fri, 17 Jan 2020 17:28:13 +0000
Received: by mail-qt1-x841.google.com with SMTP id i13so22352213qtr.3;
 Fri, 17 Jan 2020 09:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=YJBe+PR1JTzkbV6VdX/ClFM8UuTfYuVGKNcb10Up+LM=;
 b=DbHiqO+e6kYuR6bMRUFqkRzJXzREnc/t8WeVUwNtwBq0US0ALqFtfBS3k8Ar5PzFae
 jpbiR7Ax+NvFzgNUZfzP6b4KBWdJJ8us7/sDH5Tiro8mnHYZM1bos9P/GDhAcxVHXG4b
 +CqRW+gbtb40Tq4JQ9+XfDuAtGc8xx7XWoPbLCDa9sXO0xSMc54OuWYlMPO3hMfg3xGs
 R6SRfw70eNBH9z1vinkvQf3Pkmv//DOGZzpDO/JeaaQZKfMlTJoC34/zqw6bnCacSApd
 hf6+skAgQQBrKH5W5od7c18HNBincCZTYsXdKlpO3ehhcjXZitzgNqPGCAFsoZlAoM4q
 MvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=YJBe+PR1JTzkbV6VdX/ClFM8UuTfYuVGKNcb10Up+LM=;
 b=OWymrAHYj6KgH4ABUmnAiA9NifrbUZsha/lQpVebFvHqU0nOu+ihpauO26wQ0K/huK
 gcwB+xt2nL22yi1SDdHvR92pdn4T0wpPcelvJHxjBYbBuLt2uz3Fq4HdYW3DKJbh9t8K
 G5t9JgNblbrW+vahVlhi3IAOPmFp2eJmDVRl+u2864v4qDolMcZJdJfWtHvULsCEBBjI
 lqQ4DzfxLLu95Cxjjs45XL+eKI3N3G3RbwXm+dkRb6cVO977+NhaCJPef0a9kVT4Nk/i
 0VCkxdLw27dKoi/3OFES5bhyXtJjcBpLjiC6dAvxfxIVwocZY2g+ZulJhk/S2Qu58zIj
 s+Qw==
X-Gm-Message-State: APjAAAUuzIyUoTgJm1nzIrlF0Y/vLZ+rbUf7JCrqx8H6YpZKuWgWAHeE
 Rl9Nzk9hP6sY/gwvtHEfLEA=
X-Google-Smtp-Source: APXvYqz2O/xFh6ygdxVfF7TRwAgb6tMQGsH1goOEKwF730KRP0mdEDko+yi0ag0UIHTaUnjOw9qRYQ==
X-Received: by 2002:aed:2150:: with SMTP id 74mr8430727qtc.323.1579282089045; 
 Fri, 17 Jan 2020 09:28:09 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::1:7d10])
 by smtp.gmail.com with ESMTPSA id r37sm13251937qtj.44.2020.01.17.09.28.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jan 2020 09:28:08 -0800 (PST)
Date: Fri, 17 Jan 2020 09:28:06 -0800
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: Re: [PATCH 2/3] cgroup: Iterate tasks that did not finish do_exit()
Message-ID: <20200117172806.GK2677547@devbig004.ftw2.facebook.com>
References: <20200116043612.52782-1-surenb@google.com>
 <20200117151533.12381-1-mkoutny@suse.com>
 <20200117151533.12381-3-mkoutny@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117151533.12381-3-mkoutny@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_092811_883227_703D9FD0 
X-CRM114-Status: UNSURE (   9.77  )
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
 linux-kernel@vger.kernel.org, Li Zefan <lizefan@huawei.com>,
 linux-mediatek@lists.infradead.org, linux-kselftest@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, matthias.bgg@gmail.com,
 cgroups@vger.kernel.org, alex.shi@linux.alibaba.com, kernel-team@android.com,
 guro@fb.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 17, 2020 at 04:15:32PM +0100, Michal Koutn=FD wrote:
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

Yeah, this looks fine to me.  Any chance you can order this before the
clean up so that we can mark it for -stable.

Thanks.

-- =

tejun

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
