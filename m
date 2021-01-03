Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B8DC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 06:39:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E66562078D
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 06:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E66562078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zvs7UIHKxAOV/Y9ivkuy3QKlxnA4v3AdQoN+gASFJVI=; b=My+vP7+LOY9IH4td+Nqu50v/jS
	dXgXL8i6TKok5WsgPbICJN0C4wUMRQcL3kbES+pi11443v7Dc7AfasWsOYy00ErS9yVmJlS5Rs9wc
	tbetMq9sKeQMvfuWfX0ypMiHXGu2q2WsdfjLRt/AceLkixOChgIQleiIc5ZxFYmPhAKdZ1VB0fgLm
	g1OXy6b3GBzmqlP3zwQz7RddvMH9BnTDw7zbDBLerTkTyOdKimHeDjFCV3sdSQZ4aSyhFlwzqiq89
	exnTBW35pzR/xZGoHUz9CK0Y3HFZjVMbED5qgC8Qnt6zvJQlEzx5cRk1ZPLjWITDRNinpxdkM6dQL
	m+voNn3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvx30-0007uV-Sc; Sun, 03 Jan 2021 06:39:26 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvx2x-0007tn-SC
 for linux-mediatek@lists.infradead.org; Sun, 03 Jan 2021 06:39:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id r4so12743523pls.11
 for <linux-mediatek@lists.infradead.org>; Sat, 02 Jan 2021 22:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Y92qT875d3aESyjMGQPzSpXc2nldV50acl7AIHo37A=;
 b=aJfunVgtA594mdIlnY6+iNnEoN8EeUnwfZM2aPkYdnvOHH3TsUErBI7Jz/aEHkeKAg
 YDO24SvnsuqBYzWNWs/o4U1ECjAbxvGMehUJtorDvy66YtT6dn/1QpCHDIm7dYQyl0Gm
 kAFEWoKiLQQ33guOh+kaEgieAX3+hQtAlDZVVuGnxYueMxr5VYFOKMM8LKbOlkzvc4PT
 bTzVtJWh7+ZLEyR7HS2thgQPNaZzEV/FlqfNRV1dikf53koxYtgnx4kXyDObxjdQJM2N
 SDhi8evkkV/JdmzVSig6oB6Hk45tNP7VNaD5ac4/MEXgPOdNat+tMpNRHWzPrdJrQgws
 eePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Y92qT875d3aESyjMGQPzSpXc2nldV50acl7AIHo37A=;
 b=NdWyDKBdSA03FEYbi/QM5Eq7rEVE9y1wbcs6PBxd+eQ4Zc7+19smCU0/r9NJzwguz3
 v9b8MmYhg9jf2v1GuYaz2ZTFixJK6RYApuPDQ0KGvY2aFEux/tMvBaOkgzJC5PznsAo1
 S669cGOm74VS65G3VMz2iOQodqkwMk3Ru1Mg0/b7oyH4N9WaZb36SPFf0WmLg5dRAyw4
 TN4hm7KiAMI/fDbmaSmiZWg+CjCUjk+yJ4k/8+9BGLJABr3ZIGKwMC040lreicj9D53L
 +F2jm0z0kqCZZCqe+Zef8mloSa54DrRmSKXnThAwIYhakVFVpF8cqwr6fDdLAcdw2A1Z
 XNKw==
X-Gm-Message-State: AOAM53318XgHJaA9c4GRJPU2ruJGiAnNegZ8oo8Zp4Bg7HE1J8lfiu5E
 ybOUGQiF+ruqknup25O+NMY=
X-Google-Smtp-Source: ABdhPJzeGlVBHkODqjkK4saYepzEvXvy7uhk/R/nKknl9QnM1AvPAV/LHqngdTo1FSJyLwE8Wz/Stg==
X-Received: by 2002:a17:902:7086:b029:dc:8d:feab with SMTP id
 z6-20020a1709027086b02900dc008dfeabmr67602599plk.22.1609655960535; 
 Sat, 02 Jan 2021 22:39:20 -0800 (PST)
Received: from localhost.localdomain (61-230-37-4.dynamic-ip.hinet.net.
 [61.230.37.4])
 by smtp.gmail.com with ESMTPSA id 73sm45465993pga.26.2021.01.02.22.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 22:39:19 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: [PATCH] kasan: fix incorrect arguments passing in
 kasan_add_zero_shadow
Date: Sun,  3 Jan 2021 14:38:47 +0800
Message-Id: <20210103063847.5963-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_013923_948751_E7CDE5C9 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, Lecopzer Chen <lecopzer@gmail.com>,
 linux-mediatek@lists.infradead.org, aryabinin@virtuozzo.com,
 dan.j.williams@intel.com, akpm@linux-foundation.org, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

kasan_remove_zero_shadow() shall use original virtual address, start
and size, instead of shadow address.

Fixes: 0207df4fa1a86 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 mm/kasan/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index bc0ad208b3a7..67051cfae41c 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -481,7 +481,6 @@ int kasan_add_zero_shadow(void *start, unsigned long size)
 
 	ret = kasan_populate_early_shadow(shadow_start, shadow_end);
 	if (ret)
-		kasan_remove_zero_shadow(shadow_start,
-					size >> KASAN_SHADOW_SCALE_SHIFT);
+		kasan_remove_zero_shadow(start, size);
 	return ret;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
