Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD92C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROJ3uvwv+yV1sZCCULN3kk/HV2t/38e8iFHLqDjV2C0=; b=rzNPP4xr72fKyF
	pL/g7TDbzpQR7wWGqT6DtAsGhjU4Tg88yuis6T43bPDYp02bEH+/t/fIPqkRE8hwywvq14/1mCmXC
	73oObVb1NmqtoO0A4kcTOlJlaH7C4CkZqpOgV7wohTGBHsrY1A4FLPR9PyLrNuQAZIk9ubbQh0cmm
	9k+YctHQJoJDVCH3tCQMFCiwEUi67gpJw7nhe9seZRMQ1Rc45qClXlT/TmLfjw8bIDvLdfuXz9GcF
	+59kEQ6CgaY3e7bqqDumon46CiUWr5voh6LKnBoa4+FGl4vmReHH2MxN/2yHp0l2KJegKb4NA1h7I
	ldcieMEVcKNSYpAOrVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIpt2-009iWs-1r; Sat, 12 Feb 2022 10:44:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIpso-009iPD-8u; Sat, 12 Feb 2022 10:44:03 +0000
X-UUID: da14a5e9abec4996b416a32ed1b509f0-20220212
X-UUID: da14a5e9abec4996b416a32ed1b509f0-20220212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1904062302; Sat, 12 Feb 2022 03:43:54 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Feb 2022 02:43:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Feb 2022 18:43:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Feb 2022 18:43:51 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>, Kees Cook
 <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Wang Qing
 <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>, Xiaoming Ni
 <nixiaoming@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <sparclinux@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <sumit.garg@linaro.org>,
 <kernelfans@gmail.com>, <lecopzer.chen@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 1/5] kernel/watchdog: remove WATCHDOG_DEFAULT
Date: Sat, 12 Feb 2022 18:43:45 +0800
Message-ID: <20220212104349.14266-2-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_024402_348241_057998E2 
X-CRM114-Status: GOOD (  10.13  )
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

No reference to WATCHDOG_DEFAULT, remove it.

this commit reworks from [1].

[1] https://lore.kernel.org/lkml/20211014024155.15253-2-kernelfans@gmail.com/
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 kernel/watchdog.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 99afb88d2e85..db451e943a04 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -30,10 +30,8 @@
 static DEFINE_MUTEX(watchdog_mutex);
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
-# define WATCHDOG_DEFAULT	(SOFT_WATCHDOG_ENABLED | NMI_WATCHDOG_ENABLED)
 # define NMI_WATCHDOG_DEFAULT	1
 #else
-# define WATCHDOG_DEFAULT	(SOFT_WATCHDOG_ENABLED)
 # define NMI_WATCHDOG_DEFAULT	0
 #endif
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
