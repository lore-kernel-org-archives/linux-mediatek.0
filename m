Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B51C3DA60
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68LWjL5/SKjz0tO65i0BltVGGa8T/WWLEoQAHGMQU/Q=; b=0XL7B0xk8fhpuC58uwUThg1tIg
	eVXP3/0zquNytE9eDS8CK20R1IYqHkhxjrnggyJsTAswVkTQiPNJ7o+/jef2YYpEGuWUcLcFZQ4lz
	DeHUtzKk8iFeeyiNgH/oHkEI85n2g3PNYlQ1VG6iUa3g4DBR9j+xj+ot/MJ5ugvFGTk6Hiac/ep2z
	6r0gmPJhby23N3qDK713zirRShnfx17vCqbiqPecpzaA0rdXMSV4BUUTqzjYiYCDxsEp7Ty7xvIRz
	CiUd/+bVvpPk8bRvkhXvJEY9zSgYX5d1X3g4lwLEtCICzAKyQao9wlM1sUx07AiWZsrUgtTYYF1xw
	ep/5fCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7wW-0000000EPmO-3IAy;
	Wed, 17 Jul 2024 16:55:52 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7wT-0000000EPkH-2PD8;
	Wed, 17 Jul 2024 16:55:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fbe6f83957so59020015ad.3;
        Wed, 17 Jul 2024 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721235348; x=1721840148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68LWjL5/SKjz0tO65i0BltVGGa8T/WWLEoQAHGMQU/Q=;
        b=LcoGslK6eeVL1f44sUTDd6qGU+Cs8SxXYvfAZTceWD4SrljzP21FIJ02wVA8VslJdR
         23KG7aYDq1hVJZuydPwQIj49sSK7jm6l/Ss02GPaM3Llyb/YAgjevQX0Ttlqb/U74cRt
         BYjGTe/F2isQg3q71dJ5lIa0JGEn8fAiEmzaNOtCcii86F9Qjjj/xrFD65V5p/OFgWG6
         APCzLymNc/apWZatcE1dkQG8CjH3m8lH2YdAoo2KReIsiYMR64R1GyOU/lXKFV0b3g6q
         sW/r6+7TCzjvId44OBp4ctT6p/d8RVrSgjGD2czRbrUDO8hSLYh9uhICqWyuKCN0vcv1
         qM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721235348; x=1721840148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68LWjL5/SKjz0tO65i0BltVGGa8T/WWLEoQAHGMQU/Q=;
        b=iqa1zH0iHEUOHOXgSIzqsXP8D8pAHtlD1UuEPzLOJ92PSRaXlM3loLVbZHbn14iPAi
         33u2vndEHKUL2YQBdgjgym2JI0Bp0ftWauT034hYQu1ZenrEsvKCQueHpib7B2VgAItT
         y93VAawjovsvDpRnsIeJk8JL5EBjbo2hXKKCV26tu1C/Z2IfHFTT8ZVG6bBp9lRu30Al
         yN3qUwBmdMc2c3F1ZshgJ9PRXxgDKrq+M6FuURKiUbSfZLSn/8yhYri9ZR/fjNdDct82
         u5E40u5SNqO/BWAQxAX1DKwiSuhRZR+gK2vcB1z9HUnr3yOwW1aN6vuhmydGEIRa+3iM
         7wQA==
X-Forwarded-Encrypted: i=1; AJvYcCWDh7FxMqkDd8wYH6JgsKcI07IDAXsKO6YB7lEMAxYFQcdgBr6ac6l0RKBt2hqfbpGFIIUit1UO8pFFpsrYDOGU3vdYt4z1VtovlC5Yw3POasvxkkhrM1NNQMBvj10ZzHj4dRcp5i+wHO+nhv1GIfzisslsvvABZoo=
X-Gm-Message-State: AOJu0YyT8pSrruHkxxiOygvGWZRdNbSV+fT41G/raeXm/cxkI71yNJpT
	lGJuyuwB6tP9Pc3tlWXxGzHYzeM4dfkjggif04oabNaS2kUo8Ru7
X-Google-Smtp-Source: AGHT+IEh/cgX/fwSr/Qf+rkCnE+FwhUG7QRMVZIlEKOXguTlAFPyDJHm9nWwN1jNvQkd90th0Ikb6Q==
X-Received: by 2002:a17:903:234d:b0:1fb:67ee:6de7 with SMTP id d9443c01a7336-1fc4e131d9fmr23895775ad.23.1721235348035;
        Wed, 17 Jul 2024 09:55:48 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc384ecsm77469445ad.208.2024.07.17.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 09:55:47 -0700 (PDT)
Date: Wed, 17 Jul 2024 06:55:46 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "boris@bur.io" <boris@bur.io>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat
 update
Message-ID: <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
 <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_095549_638701_61BC67DE 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Hello,

Does something like the following work for you?

Thanks.

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 37e6cc91d576..ec1d191f5c83 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -329,7 +329,6 @@ static struct blkcg_gq *blkg_alloc(struct blkcg *blkcg, struct gendisk *disk,
 	INIT_WORK(&blkg->async_bio_work, blkg_async_bio_workfn);
 #endif
 
-	u64_stats_init(&blkg->iostat.sync);
 	for_each_possible_cpu(cpu) {
 		u64_stats_init(&per_cpu_ptr(blkg->iostat_cpu, cpu)->sync);
 		per_cpu_ptr(blkg->iostat_cpu, cpu)->blkg = blkg;
@@ -632,24 +631,26 @@ static void blkg_iostat_set(struct blkg_iostat *dst, struct blkg_iostat *src)
 static void __blkg_clear_stat(struct blkg_iostat_set *bis)
 {
 	struct blkg_iostat cur = {0};
-	unsigned long flags;
 
-	flags = u64_stats_update_begin_irqsave(&bis->sync);
 	blkg_iostat_set(&bis->cur, &cur);
 	blkg_iostat_set(&bis->last, &cur);
-	u64_stats_update_end_irqrestore(&bis->sync, flags);
 }
 
 static void blkg_clear_stat(struct blkcg_gq *blkg)
 {
+	unsigned long flags;
 	int cpu;
 
+	raw_spin_lock_irqsave(&blkg_stat_lock, flags);
+
 	for_each_possible_cpu(cpu) {
 		struct blkg_iostat_set *s = per_cpu_ptr(blkg->iostat_cpu, cpu);
 
 		__blkg_clear_stat(s);
 	}
 	__blkg_clear_stat(&blkg->iostat);
+
+	raw_spin_unlock_irqrestore(&blkg_stat_lock, flags);
 }
 
 static int blkcg_reset_stats(struct cgroup_subsys_state *css,
@@ -998,12 +999,10 @@ static void blkcg_iostat_update(struct blkcg_gq *blkg, struct blkg_iostat *cur,
 	unsigned long flags;
 
 	/* propagate percpu delta to global */
-	flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
 	blkg_iostat_set(&delta, cur);
 	blkg_iostat_sub(&delta, last);
 	blkg_iostat_add(&blkg->iostat.cur, &delta);
 	blkg_iostat_add(last, &delta);
-	u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
 }
 
 static void __blkcg_rstat_flush(struct blkcg *blkcg, int cpu)
@@ -1134,9 +1133,9 @@ static void blkcg_fill_root_iostats(void)
 				cpu_dkstats->sectors[STAT_DISCARD] << 9;
 		}
 
-		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
+		raw_spin_lock_irqsave(&blkg_stat_lock, flags);
 		blkg_iostat_set(&blkg->iostat.cur, &tmp);
-		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
+		raw_spin_unlock_irqrestore(&blkg_stat_lock, flags);
 	}
 }
 
@@ -1145,7 +1144,6 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
 	struct blkg_iostat_set *bis = &blkg->iostat;
 	u64 rbytes, wbytes, rios, wios, dbytes, dios;
 	const char *dname;
-	unsigned seq;
 	int i;
 
 	if (!blkg->online)
@@ -1157,16 +1155,14 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
 
 	seq_printf(s, "%s ", dname);
 
-	do {
-		seq = u64_stats_fetch_begin(&bis->sync);
-
-		rbytes = bis->cur.bytes[BLKG_IOSTAT_READ];
-		wbytes = bis->cur.bytes[BLKG_IOSTAT_WRITE];
-		dbytes = bis->cur.bytes[BLKG_IOSTAT_DISCARD];
-		rios = bis->cur.ios[BLKG_IOSTAT_READ];
-		wios = bis->cur.ios[BLKG_IOSTAT_WRITE];
-		dios = bis->cur.ios[BLKG_IOSTAT_DISCARD];
-	} while (u64_stats_fetch_retry(&bis->sync, seq));
+	raw_spin_lock_irq(&blkg_stat_lock);
+	rbytes = bis->cur.bytes[BLKG_IOSTAT_READ];
+	wbytes = bis->cur.bytes[BLKG_IOSTAT_WRITE];
+	dbytes = bis->cur.bytes[BLKG_IOSTAT_DISCARD];
+	rios = bis->cur.ios[BLKG_IOSTAT_READ];
+	wios = bis->cur.ios[BLKG_IOSTAT_WRITE];
+	dios = bis->cur.ios[BLKG_IOSTAT_DISCARD];
+	raw_spin_unlock_irq(&blkg_stat_lock, flags);
 
 	if (rbytes || wbytes || rios || wios) {
 		seq_printf(s, "rbytes=%llu wbytes=%llu rios=%llu wios=%llu dbytes=%llu dios=%llu",

