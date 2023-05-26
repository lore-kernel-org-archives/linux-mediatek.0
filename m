Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC71C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bKWBdp4Kjo2s7gwqdnwE3qAnKBZlQrDQ7Bhod2F0iec=; b=exbuUev/4hepPqKTrHpMvimJb4
	W8F31sGIYKfNY0nX/0nOshcyqDa3/LEShNNMDRg2GFpaliGaQ0b+2vpx5HYQBSR8PQc39qPzFiLaU
	9XC/G6k7J4/+k6vc59NvaxlJXbDgMj0n7ARZwkbEN3tyA0rY3dacNVRnKK1yDubcylwT6nzvRpwxK
	WC2NqXsTOwG7UCAegdaxhiH6v07Ne2sYZUzG8l2wnKkquw/NFXWFhNMfQO9TjQJAlYNk4TRIhHywI
	wgaMiHzGjDaA/orWuHiPi38pcEhJp1dlR3AjAhDCD0gaAsvX7dPZN9gusdmE/ETTXDdrVRfe+b9Xq
	G9wbhTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RzN-001SDm-0G;
	Fri, 26 May 2023 07:35:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RzK-001SCP-1T
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 07:35:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ae40dcdc18so3088885ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685086548; x=1687678548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKWBdp4Kjo2s7gwqdnwE3qAnKBZlQrDQ7Bhod2F0iec=;
        b=gq7rzjt3t/xc/7eKsys5HW5xi/ugBh+XpYqENlPCR35jv7yZFm4s7ACeAfsR8ZgZ75
         cREmmzeZlILrUfAxYs5br/wSOosq5qXbbv3FnLu+3Gl8HlgaO7BYPhDaYuiXQvxosJuq
         w2UHiHQlSkVqtn9VBIu8kKzw3hhA0oituZDRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685086548; x=1687678548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKWBdp4Kjo2s7gwqdnwE3qAnKBZlQrDQ7Bhod2F0iec=;
        b=KAWDfS+ufRVyggjXeFXD0VhfiZm/GezqxDGcAjCCAcGAbKm1uXgYAvM7iWXaVPTooa
         QBYOCxXAnGkiO1o8k73uyuTZj7BeSJyQ1jJTncJxj2ZDugDBbDctYf4XeHYwxUMDOsoP
         C9QmLdnf3hiGk519zHbyL8nSMgvdGWUANgOeTAZWUiCgDCOMWkwB9Rifyu6vbPVNnstz
         avMUFBWYATLHkUo7xd/4Lbn+kzIWPfWotrXslUBL2YPru7d8YDH8Hkpe1hCi8/D5KI/A
         tMLktJ9kw6W/7ZXOIfjEZofcJdRAKYzCYw/z5LuqP0QBpS4JPeF3Tv/Ndbs0yyxIHwO1
         L77w==
X-Gm-Message-State: AC+VfDzZ6knTzezazJmqaXKBbQ8TH7DQ5PR38nBStsVWRu0YjRogV0z6
	d7ftymtQlwvNT+4Wt5XBjbqfew==
X-Google-Smtp-Source: ACHHUZ6XkkD79ZkO3r3SorwEcsePA+9D5knmrdE/cFs1f7idnHafQ1XWj/0tGGrGQ1suvVau5lting==
X-Received: by 2002:a17:903:228a:b0:1a2:3108:5cc9 with SMTP id b10-20020a170903228a00b001a231085cc9mr1674737plh.40.1685086548637;
        Fri, 26 May 2023 00:35:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:17b9:e0b5:a956:4510])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902eb0900b001ac78ac2cafsm2573408plb.239.2023.05.26.00.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 00:35:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH] notifier: Initialize new struct srcu_usage field
Date: Fri, 26 May 2023 15:35:37 +0800
Message-ID: <20230526073539.339203-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_003550_492087_CA511329 
X-CRM114-Status: GOOD (  10.15  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In commit 95433f726301 ("srcu: Begin offloading srcu_struct fields to
srcu_update"), a new struct srcu_usage field was added, but was not
properly initialized. This led to a "spinlock bad magic" BUG when
the SRCU notifier was ever used. This was observed in the MediaTek
CCI devfreq driver on next-20230525. Trimmed stack trace as follows:

    BUG: spinlock bad magic on CPU#4, swapper/0/1
     lock: 0xffffff80ff529ac0, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
    Call trace:
     spin_bug+0xa4/0xe8
     do_raw_spin_lock+0xec/0x120
     _raw_spin_lock_irqsave+0x78/0xb8
     synchronize_srcu+0x3c/0x168
     srcu_notifier_chain_unregister+0x5c/0xa0
     cpufreq_unregister_notifier+0x94/0xe0
     devfreq_passive_event_handler+0x7c/0x3e0
     devfreq_remove_device+0x48/0xe8

Add __SRCU_USAGE_INIT() to SRCU_NOTIFIER_INIT() so that srcu_usage gets
initialized properly.

Fixes: 95433f726301 ("srcu: Begin offloading srcu_struct fields to srcu_update")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

Also, the original patch subject said "srcu_update", however the data
structure ended up as "srcu_usage". Maybe that could be updated?

 include/linux/notifier.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 2aba75145144..86544707236a 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -106,12 +106,22 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 #define RAW_NOTIFIER_INIT(name)	{				\
 		.head = NULL }
 
+#ifdef CONFIG_TREE_SRCU
 #define SRCU_NOTIFIER_INIT(name, pcpu)				\
 	{							\
 		.mutex = __MUTEX_INITIALIZER(name.mutex),	\
 		.head = NULL,					\
+		.srcuu = __SRCU_USAGE_INIT(name.srcuu),		\
 		.srcu = __SRCU_STRUCT_INIT(name.srcu, name.srcuu, pcpu), \
 	}
+#else
+#define SRCU_NOTIFIER_INIT(name, pcpu)				\
+	{							\
+		.mutex = __MUTEX_INITIALIZER(name.mutex),	\
+		.head = NULL,					\
+		.srcu = __SRCU_STRUCT_INIT(name.srcu, name.srcuu, pcpu), \
+	}
+#endif
 
 #define ATOMIC_NOTIFIER_HEAD(name)				\
 	struct atomic_notifier_head name =			\
-- 
2.41.0.rc0.172.g3f132b7071-goog


