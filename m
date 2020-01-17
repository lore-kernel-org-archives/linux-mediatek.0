Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73CFC33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 16:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6E32072B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 16:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJQ0ysGc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNwidGHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6E32072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCvqw3Z9XdBGzfFSWXWPWEp1w3UTLtQrcIMErO8QBMA=; b=rJQ0ysGcQGt1Y0
	D6RbAyErTppEhVXsjnY/WssEZf/lyVifMxOX1t2VwkWNNnSNCB7+e2QrOxVRLY+rLWsY9OENXZoqj
	rB8Uxa0o/659uaPZHEZSm4P5vcmV85NAHVAyc9y5r72e4GjLhnR0DTbFle12+b7NuRxNVyGXq1pq9
	RVigshaN7c+6m1goeXEQEVsV09CEj9vMkNexVaSltoW3YKHAyHXabRvLWZj68+ZturLy9NAp0Cwu5
	bQpeeV99dr2SqssYjuhyIFgGzotDr6m7cLXHkjrwhOJsGOKP10qlQCqy53XhBJcsnj8XiVFyxTeKM
	7MP0Fij77+Unwcw856gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isUy9-0004Nc-CX; Fri, 17 Jan 2020 16:59:37 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isUxu-0004Dt-HV; Fri, 17 Jan 2020 16:59:27 +0000
Received: by mail-qk1-x741.google.com with SMTP id c17so23307409qkg.7;
 Fri, 17 Jan 2020 08:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=zUnqRXYQtoyEF5UfPwWmYzCrDBoI5jZ6BUT1W4OJSHA=;
 b=dNwidGHTaO65iLrmuRFYsedrAORZcj1dlBJc6RMBU146ZCPVPbdo76G9xqEUHi/4Pt
 EOjOovq0mE5jq+flTugwLRNLMe/HfRwsgkV8518vOU7/DmxMI7XRE8vFRc/XRTgb/ICe
 rDke18QDeVAgygvYrcv/rpZui2Gx8OXVHY42jmMcwi2MkfLMXzY2zcHKratTxPYePE5C
 6/+6UJTgCLdF/6Q0CmUKGsNVRYhdpnM89yIl1USuXStY8jSq35oPPXc0UDZcFon7c8E7
 I38FBOrLF5KnNZx0uQLQ11UdW+T1YiVS3L6zDZSMoGQuQQo1a/NONcwN9ay/gtbQB1Jz
 70Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=zUnqRXYQtoyEF5UfPwWmYzCrDBoI5jZ6BUT1W4OJSHA=;
 b=tB3dE02vEeRZ9f34WzlV3v5qEPs5S0POTHHTxGbXb+P9EyNSt+izx/zdG5pjJSxsjj
 +uslg8S44HlhUMwMw3UtQXpJ9Dmy513LumVirvB0mrYOWBcGTPr0ReFubmosfKOrEF6V
 Zr1ywEz8zMlj/ps+liUQ4G4oxtzvX3DlY0yt7G55IYT9zIq04FA8PoX8pivlnn7SGNzI
 PiqWHk1aBWZ2LWPwIrs084EBrzsaRTIB1BelBU/hh8pq61J6aO9Nk40fWatuadqCwX5W
 K3FkIlo8vUigbgJo4rznRweSMrii3+CZrXLADGZiBQXcYDye8zNMYP6Gw3iAcRJ9CFjX
 lllw==
X-Gm-Message-State: APjAAAUODukK3vJfhELqBDnvT/XaEwpkNB88Ayb+boKjEqkubAw93occ
 ixIHHp8RcNgcXY26FYCI3YQ=
X-Google-Smtp-Source: APXvYqxftns8R04Lq7DlRW0QHAR4L0VpzrsayZtZp6bJXTKdCVV6PA2/eZmoZzleZqMOolzPC/QbPA==
X-Received: by 2002:a37:7005:: with SMTP id l5mr37840890qkc.334.1579280361177; 
 Fri, 17 Jan 2020 08:59:21 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::1:7d10])
 by smtp.gmail.com with ESMTPSA id g18sm12021690qki.13.2020.01.17.08.59.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jan 2020 08:59:20 -0800 (PST)
Date: Fri, 17 Jan 2020 08:59:18 -0800
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: Re: [PATCH 1/3] cgroup: Unify css_set task lists
Message-ID: <20200117165918.GJ2677547@devbig004.ftw2.facebook.com>
References: <20200116043612.52782-1-surenb@google.com>
 <20200117151533.12381-1-mkoutny@suse.com>
 <20200117151533.12381-2-mkoutny@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117151533.12381-2-mkoutny@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_085922_584685_DB4996E4 
X-CRM114-Status: UNSURE (   9.55  )
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

On Fri, Jan 17, 2020 at 04:15:31PM +0100, Michal Koutn=FD wrote:
> We track tasks of css_set in three different lists. The iterators
> unnecessarily process each list specially.
> Use an array of lists and simplify the iterator code. This is
> refactoring with no intended functional change.
> =

> Signed-off-by: Michal Koutn=FD <mkoutny@suse.com>
> ---
>  include/linux/cgroup-defs.h | 15 ++++---
>  include/linux/cgroup.h      |  4 +-
>  kernel/cgroup/cgroup.c      | 81 +++++++++++++++++++------------------
>  kernel/cgroup/debug.c       | 16 ++++----
>  4 files changed, 60 insertions(+), 56 deletions(-)

So, I get the urge to move the lists into an array and thought about
doing that while adding the third list for sure.  However, it does
make code paths which don't walk all lists wordier and the code path
is already tricky like hell.  Given that there aren't that many places
which loop over the lists, if you really wanna clean it up, maybe add
an interator over the lists so that both parts of code can look lean?

Thanks.

-- =

tejun

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
