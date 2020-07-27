Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F36C433E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 19:18:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930EB20719
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 19:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icv8zCvZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="u4QYjAZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930EB20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qv79Jfudv3Tw383Evs8pGg1jvQA/zZe45DWnS1ClIqU=; b=icv8zCvZCSd/vpwGeO2w01opTD
	et286TiozyV+9kmovkMAXHwd35F39sQvKWef/2Ug6+ahtg43ho7PvXrT2EvImTzh622uH0sab/SJu
	Vva9EW50Bk1oumKkCOnUl3juZVMilVAxx+wlezqiPu/sUG5CCDUeFK9N25XNoa2JvF+D+j8J2eCMr
	Cf28erUxZIApmCBl0OqJ04Bb1Xisgr31N4AqlM7z9d+40yGSDcG1PJyenelY6aU6O431SdoDS/RGj
	NnbsO46V11ufWLEL1UTSdVIZ82gXawZ7sqpM7gtsbsnogkaVJmKqsPQ77ugtZpqlUNYcpyhzhwmh/
	RYmA45Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k08dI-0004PJ-HQ; Mon, 27 Jul 2020 19:17:56 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k08dF-0004Or-Rj
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 19:17:54 +0000
Received: by mail-qt1-x84a.google.com with SMTP id q19so2574486qtp.0
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 12:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=IuAjz4vWP+fsmZ6TnPVAPxVEm1W+CToccHqyQuZwo7Q=;
 b=u4QYjAZkNActz3iV9FwwwZWe9IIgE0NWGDYYvwYHjniyikO57M1sL1w0GI0Vnl7fuU
 WMntdEWj7xLCxrtltDxnlyCiL3CeLZkTMX4qVwvu+0ln8jmKdcJ5cYKQUvhY89JXvQXS
 awBJ53QodvWSmyrdtnUQM68cEA/SoVu+9haP5fOioaNvGrvzTQ6pkEspKIxYUyHIKnqq
 T3asTHK6Aj+VttHnh7fHQ33kcP3Ll33R6/fRsQ36P/wkAyeWIk9Up8DbZ5p+dUn5LYAe
 6x1mPRdsxXFj4fgMYU08dziW5kjP2yNfcgPqmswqDGnnA5dba757LBr6+ax7vxLB/oTD
 mOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=IuAjz4vWP+fsmZ6TnPVAPxVEm1W+CToccHqyQuZwo7Q=;
 b=Hjurew/KRIcgdeoEK3lChj/GCR44KoJZTPFq+6731JKnc8y0ivInBF3gcxTUYyXkpM
 BQ8IDbLAjszY283Xxtxw0TZj2TGMfKvPvVKw+uP0/pgCo8NmdooUHK5rn3B79Nh1NXk2
 W+cJHmBDqjthgwBYuSLgwHh9nRCcXMV+T6IHdjpuajwUs6s38VMdMbHzYAh4JB5bPrae
 dZCKHPE2+c8NyJL4yOm85dmRFKuM9+OXcz1V5w4LyspJEwfYYKFuuZL4ZVhmG75BIXek
 1+pi1EJBkiv6tYZUFB0we3gfc2oSHOCBhZOik3NHa3rFE8Qxdy5HWZVSJFPPI98H1vEa
 6+cA==
X-Gm-Message-State: AOAM531MLNJFrMQ2Duf5YwRfvlQY6u9w2FvWbNf/TnujndW3eP01hdNf
 vDuOtEhPL1kYMENuKibHoSR9X2fjRps6XJRvPQ8=
X-Google-Smtp-Source: ABdhPJwTR4mDzUGuFSFBwloxnvoyPOIeoARs8eCAQ4uf558Ox+DkBx6RXqhein/9pGIMSx7AwnY92Pv0odO+EzKX5so=
X-Received: by 2002:a0c:bf4f:: with SMTP id b15mr22352173qvj.224.1595877467520; 
 Mon, 27 Jul 2020 12:17:47 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:17:45 -0700
Message-Id: <20200727191746.3644844-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [PATCH 4.14.y] mm/page_owner.c: remove drain_all_pages from
 init_early_allocated_pages
From: Nick Desaulniers <ndesaulniers@google.com>
To: stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_151753_933707_AEF1E9A0 
X-CRM114-Status: GOOD (  13.05  )
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
 Nick Desaulniers <ndesaulniers@google.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Oscar Salvador <osalvador@techadventures.net>

commit u6bec6ad77fac3d29aed0d8e0b7526daedc964970 upstream.

When setting page_owner = on, the following warning can be seen in the
boot log:

  WARNING: CPU: 0 PID: 0 at mm/page_alloc.c:2537 drain_all_pages+0x171/0x1a0
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.15.0-rc7-next-20180109-1-default+ #7
  Hardware name: Dell Inc. Latitude E7470/0T6HHJ, BIOS 1.11.3 11/09/2016
  RIP: 0010:drain_all_pages+0x171/0x1a0
  Call Trace:
    init_page_owner+0x4e/0x260
    start_kernel+0x3e6/0x4a6
    ? set_init_arg+0x55/0x55
    secondary_startup_64+0xa5/0xb0
  Code: c5 ed ff 89 df 48 c7 c6 20 3b 71 82 e8 f9 4b 52 00 3b 05 d7 0b f8 00 89 c3 72 d5 5b 5d 41 5

This warning is shown because we are calling drain_all_pages() in
init_early_allocated_pages(), but mm_percpu_wq is not up yet, it is being
set up later on in kernel_init_freeable() -> init_mm_internals().

Link: http://lkml.kernel.org/r/20180109153921.GA13070@techadventures.net
Signed-off-by: Oscar Salvador <osalvador@techadventures.net>
Acked-by: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Ayush Mittal <ayush.m@samsung.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Fixes an easliy reproduced WARN_ON_ONCE observed with
CONFIG_PAGE_OWNER=y and page_owner=on boot param.  Looks like this
landed in v4.15-rc9 but hasn't been backported yet. Thanks to
Miles Chen <miles.chen@mediatek.com> for the report.

 mm/page_owner.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index 6ac05a6ff2d1..4753b317ef7b 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -617,7 +617,6 @@ static void init_early_allocated_pages(void)
 {
 	pg_data_t *pgdat;
 
-	drain_all_pages(NULL);
 	for_each_online_pgdat(pgdat)
 		init_zones_in_node(pgdat);
 }
-- 
2.28.0.rc0.142.g3c755180ce-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
