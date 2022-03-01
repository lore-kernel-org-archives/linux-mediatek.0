Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A92C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6QccH2Puq6nNL2Bt/5CWOWZu9qbs1WYz/J/U3EAj0s=; b=SumwrUEXJrM8sG
	vMRS/1b+9Bwib5AdHO8oYL5rO/fw9UsZ4L5KFhkzhLq+EAX0y79bIMRsz4njqkCiRsgr1ZINGP295
	2IrOsZLLMnaRWP2sCEFjXh1oeyQcieCdSoaE71x4K15hNmPpsRZV+Syi8I9vy/NzroiXt9JFDGVBQ
	KsyDjKJYHedfhw/q7l0gw+c+xKatC34pKxzWUQq6LGanvoew24CNVkkeKhO9RL8/RcrcsjMu4R2UC
	qmoolex0hvhC2S/CjmALMbMJEASdc0v6vcY/piOyWFab8FlWPBLUngoWXRS6cuv0kzGNt5sClqm2q
	VIZ6mytbUnaLTmSmJirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP77p-000Ade-24; Tue, 01 Mar 2022 18:21:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP77l-000Ac6-SM
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 18:21:27 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso2953369pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fds8Vu27HO3VizdZYZX37G2L0kdPjlGJwjydpAC62lk=;
 b=kbDptrdu0f26KgjbD0o2z38w3lkKGDPgX1iTHeFHCTnyp8GdCq5qMftyKUSBh6duUj
 WfNj/A6u5i3SYTvNHtilrjGbJ7XPB9BN5cThiWBPQtUhCrDH1721OqL04qTC03fUauzy
 3YHA9gzqSMuaks5H7GdDPribo7C8kJL0W2A2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fds8Vu27HO3VizdZYZX37G2L0kdPjlGJwjydpAC62lk=;
 b=TnoAQNqCGI0a1Kwxof/YhMO0CPvRx+D9W4AqBYchLyRAPyECRRTltq2acp0kGN02Gh
 1YHVVLnYGl+zRzkH6SDwuPpXLPQL9Z3AYMee7J+x2bt3YxR9L2Y5I4pJdw3zU1/JKwUQ
 gTGJusdCZaEVv5PitRWzzolOcqhfCd0Giwq0tXZ/Mr+byWS+2rjCRM1yeWPXDd15N5C/
 oEI8N+G0zqLz0yUPT/+X8RBHasxcqiWvHhjWdWdeDi1dBGZge0OrXgjzrz6uYpvNgE4g
 3fUpKSIX9fW2pMM4HwKceZI7MkvVkuTvDWMPY9epJ4+khfB8r8RJ+Suvpcf6Vg4ZAcUV
 AXuw==
X-Gm-Message-State: AOAM5306+RtSeBrURCUvO/7tQeqbJUMyqzK3vQT6029x6o3sK8FW6EnP
 wwfkMIXGX8rFsl4L9d6gRhXEPQ==
X-Google-Smtp-Source: ABdhPJxFvMPIFzTXAIIVPlg/eGuYakalp78L+LNg6VrEL06CzJLvdAz6UlqMRKRHGibjFN8E9JB6yg==
X-Received: by 2002:a17:90b:4d86:b0:1bd:223f:6cb5 with SMTP id
 oj6-20020a17090b4d8600b001bd223f6cb5mr16669777pjb.151.1646158885116; 
 Tue, 01 Mar 2022 10:21:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 oa2-20020a17090b1bc200b001bcff056f09sm2678996pjb.13.2022.03.01.10.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:21:24 -0800 (PST)
Date: Tue, 1 Mar 2022 10:21:24 -0800
From: Kees Cook <keescook@chromium.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <202203011016.48A181EE50@keescook>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_102125_954023_30D320F0 
X-CRM114-Status: GOOD (  13.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
> Based on the coccinelle script there are ~480 cases that need fixing
> in total. I'll now finish all of them and then split them by
> submodules as Greg suggested and repost a patch set per submodule.
> Sounds good?

To help with this splitting, see:
https://github.com/kees/kernel-tools/blob/trunk/split-on-maintainer

It's not perfect, but it'll get you really close. For example, if you
had a single big tree-wide patch applied to your tree:

$ rm 0*.patch
$ git format-patch -1 HEAD
$ mv 0*.patch treewide.patch
$ split-on-maintainer treewide.patch
$ ls 0*.patch

If you have a build log before the patch that spits out warnings, the
--build-log argument can extract those warnings on a per-file basis, too
(though this can be fragile).

-- 
Kees Cook

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
