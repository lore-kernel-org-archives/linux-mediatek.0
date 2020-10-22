Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC9C388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:18:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB4C2245F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2YumHbf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SDvkG+yE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB4C2245F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ur9hhY6ma9obMMXLs02bvu6KAkFqqF1hCeefd6DnAn4=; b=p2YumHbfsCS8esedMXC8+FGYO
	ZPf1hWOKAnHTgP3yFi79evtGZEqciHJ/fXAT6E2af6SIVGicBbYcNnkJ/2ZAe59RWdzY2EH7WNCkT
	H6d2soozjdC6jYVa4l/JhoSMVoQCiwz8zYvtfalMB0IvqW8Jy37lpJLJv4OeykutThF5kAbccKXUb
	7qLMUdzTxt82QzZHoyXkJ4eXJP8RG3D5gqrgssiXbWhEh9yUXrgXzIaEYZdm4/vgwvNW2Tnxjsf2r
	yfDfLjC9AH2txJ9TuJohGibslJiDESaBFspIooicu1qr9LbS5dk8f2SU84RkYKJ1xq+NFtZrbT2eB
	OlwtKrpNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVTve-000629-SJ; Thu, 22 Oct 2020 06:18:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVTvc-00060p-Ba; Thu, 22 Oct 2020 06:18:25 +0000
X-UUID: cd5172fe75e24da1bb97045e95e2a0ce-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/vJ1k/CvUjLCTTWs6xEGCY+dakvbAFTCMIhNiUr7NTo=; 
 b=SDvkG+yEmdWAXQuTQPGcxBlenMnAEjrGKN2jpDwlfEFiqOn3UDEv1dE3iavCxUbJT8kpBEPH9JZdTZJwoHEMMX27dvV8lpyv3R/1PkwAedjDpGAICKwNLXWjG3ewdpv512JnJRG4CC212O5rBeVoh7lJe8AVP7mguiLVhJ24cxA=;
X-UUID: cd5172fe75e24da1bb97045e95e2a0ce-20201021
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1171200259; Wed, 21 Oct 2020 22:18:16 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 23:18:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 14:18:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 14:18:13 +0800
From: Claude Yen <claude.yen@mediatek.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, 
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] PM / s2idle: Export s2idle_set_ops
Date: Thu, 22 Oct 2020 14:17:48 +0800
Message-ID: <20201022061748.13730-2-claude.yen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201022061748.13730-1-claude.yen@mediatek.com>
References: <20201022061748.13730-1-claude.yen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_021824_515689_D8A24A88 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 claude.yen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As suspend_set_ops is exported in commit a5e4fd8783a2
("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
exporting s2idle_set_ops to make kernel module setup s2idle ops too.

In this way, kernel module can hook platform suspend
functions regardless of Suspend-to-Ram(S2R) or
Suspend-to-Idle(S2I)

Signed-off-by: Claude Yen <claude.yen@mediatek.com>
---
 kernel/power/suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 8b1bb5ee7e5d..0dc3e8344318 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -79,6 +79,7 @@ void s2idle_set_ops(const struct platform_s2idle_ops *ops)
 	s2idle_ops = ops;
 	unlock_system_sleep();
 }
+EXPORT_SYMBOL_GPL(s2idle_set_ops);
 
 static void s2idle_begin(void)
 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
