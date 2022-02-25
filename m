Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF503C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pf8xL7qR3w+YQAeMEfrMEyod+0oTeSerETVv3Zsvuts=; b=U+3USUPaF1gK51
	ybKRdnV6/w+LvcgvfTL4i5rm4Kk6qfOilJzMHvzrSe+5SUqhPfjHgbmi+IQEvWGWuaIwNdir+yaYp
	E6KbTI4/XjesRo41a4cpVPqu67XoP/agnkWMxQz3hWTT7wfsXd8vrh5F5rjZUa6MIgG77gEZenvzP
	vhvFZ3jQL+sGqCheFuLqDviVKKeZSrxxXsgeNmogaf5GeV+ZGfHHUZly+3H+zU+tADBDZGIaRlgTT
	vgmVJKfsJV45KnYM5Nh6lX9eBBI2Ffu0kDADaGaQVLZuByiBx3ZpL/olrawWYJmzYAXzVphMws/sb
	bggfucWdZiO7Rxvx6uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNa0L-004uNG-5K; Fri, 25 Feb 2022 12:47:25 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNa06-004uJm-RH; Fri, 25 Feb 2022 12:47:12 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 48D251F388;
 Fri, 25 Feb 2022 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1645793229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0Jgkj0o/pjaVvIXmGdmCJrgzQNnkwWbTVpY8Ut4X+M=;
 b=muFGoS6TT6rdJ2IFCGCdcuFdbPk38xM7txkn4titYeG/gqFxYZRiyYGXdVJMfPySgUP3/J
 qRNzeiYXTmqCKB9BEdYNPSN/G8uurZTRdL6Rwhd1W4zCKA+8sTwb7YLd4Z93N1s/BcnnLa
 CbdHB13kv1/BQ6sk/ovB5zy+NWEywvk=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9A369A3B83;
 Fri, 25 Feb 2022 12:47:08 +0000 (UTC)
Date: Fri, 25 Feb 2022 13:47:04 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 davem@davemloft.net, Matthias Brugger <matthias.bgg@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>,
 Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wang Qing <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Xiaoming Ni <nixiaoming@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-mediatek@lists.infradead.org, sumit.garg@linaro.org,
 kernelfans@gmail.com, yj.chiang@mediatek.com
Subject: Re: [PATCH 1/5] kernel/watchdog: remove WATCHDOG_DEFAULT
Message-ID: <YhjPyCl7Rjh6acQN@alley>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
 <20220212104349.14266-2-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220212104349.14266-2-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044711_047949_2259496E 
X-CRM114-Status: GOOD (  11.50  )
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

On Sat 2022-02-12 18:43:45, Lecopzer Chen wrote:
> No reference to WATCHDOG_DEFAULT, remove it.

It would be enough to mention the link to the previous
version in the cover letter.

> this commit reworks from [1].
> 
> [1] https://lore.kernel.org/lkml/20211014024155.15253-2-kernelfans@gmail.com/
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
