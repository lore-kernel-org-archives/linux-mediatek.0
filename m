Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA8DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:57:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A895020729
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A895020729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IrkwIreloj4ChS9yp8HyL4/PaikVYj5iHUMzRJy5Ozg=; b=png/9s3mTOPbo8oJ+AYb+7Foia
	AEyyF8sXx+ipgTkahYYhiei/hGT56K5Zrv3+cMhPP4qLuybq2TGXv+fonHPRPfemeGJtL9vcUC84I
	22pxYelG4rhMol6DpTRkHxbVHbGotbAs7nlLDH3or3A6cqLfaftWpd2c5ZKoPRWSXHvnoPlnPPOOD
	E/CUPU2TKnFJXkdkH6XOoiVmL0UfsjlLwNgKTrfTpxrFfxADdk2fjhJS1Rc6qHN7dtKGEA9tb5m6I
	rXWnUYJWG6D73fGzkR5sAqjUAh9QJFCwsDIfY8bp8j7CbaibIdwQHyGcy4pl/m4cWOFfY8f9DC2RB
	i0Q2FX9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krz17-0005Ok-53; Wed, 23 Dec 2020 07:57:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krz12-0005Mm-P3; Wed, 23 Dec 2020 07:57:02 +0000
X-UUID: 43f40658c9f04dbb8d534ac327a77d62-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9qWqQk43Yj2l9CKeCfDfBUgGI5LtbltgbQzM4u3b8sg=; 
 b=M475Hb7p1X8bGuZZBS5U9G3W0IxFKICylVhn/meI+jbd8r7Z1uIR2jffiHirlTbn5adBiMzNgWoKd0o00hSk95euJ50dN8I2mWiFuY3WRbTdNh0V43QYDgoB1KXvbmwTi1rGs4q2U0ilcVJzYQbpLMm0QIzxfsEHZ4f5rClS0o0=;
X-UUID: 43f40658c9f04dbb8d534ac327a77d62-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2119243205; Tue, 22 Dec 2020 23:51:40 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 23:48:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 15:48:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 15:48:49 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: <michael.kao@mediatek.com>, <fan.chen@mediatek.com>, Zhang Rui
 <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH] thermal: cpufreq_cooling: fix slab OOB issue
Date: Wed, 23 Dec 2020 15:48:49 +0800
Message-ID: <20201223074849.1989-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_025701_105938_DAA15304 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 brian-sy yang <brian-sy.yang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: brian-sy yang <brian-sy.yang@mediatek.com>

Slab OOB issue is scanned by KASAN in cpu_power_to_freq().
If power is limited below the power of OPP0 in EM table,
it will cause slab out-of-bound issue with negative array
index.

Return the lowest frequency if limited power cannot found
a suitable OPP in EM table to fix this issue.

Backtrace:
[<ffffffd02d2a37f0>] die+0x104/0x5ac
[<ffffffd02d2a5630>] bug_handler+0x64/0xd0
[<ffffffd02d288ce4>] brk_handler+0x160/0x258
[<ffffffd02d281e5c>] do_debug_exception+0x248/0x3f0
[<ffffffd02d284488>] el1_dbg+0x14/0xbc
[<ffffffd02d75d1d4>] __kasan_report+0x1dc/0x1e0
[<ffffffd02d75c2e0>] kasan_report+0x10/0x20
[<ffffffd02d75def8>] __asan_report_load8_noabort+0x18/0x28
[<ffffffd02e6fce5c>] cpufreq_power2state+0x180/0x43c
[<ffffffd02e6ead80>] power_actor_set_power+0x114/0x1d4
[<ffffffd02e6fac24>] allocate_power+0xaec/0xde0
[<ffffffd02e6f9f80>] power_allocator_throttle+0x3ec/0x5a4
[<ffffffd02e6ea888>] handle_thermal_trip+0x160/0x294
[<ffffffd02e6edd08>] thermal_zone_device_check+0xe4/0x154
[<ffffffd02d351cb4>] process_one_work+0x5e4/0xe28
[<ffffffd02d352f44>] worker_thread+0xa4c/0xfac
[<ffffffd02d360124>] kthread+0x33c/0x358
[<ffffffd02d289940>] ret_from_fork+0xc/0x18

Signed-off-by: brian-sy yang <brian-sy.yang@mediatek.com>
---
 drivers/thermal/cpufreq_cooling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index cc2959f22f01..fb33b3480a8f 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -123,7 +123,7 @@ static u32 cpu_power_to_freq(struct cpufreq_cooling_device *cpufreq_cdev,
 {
 	int i;
 
-	for (i = cpufreq_cdev->max_level; i >= 0; i--) {
+	for (i = cpufreq_cdev->max_level; i > 0; i--) {
 		if (power >= cpufreq_cdev->em->table[i].power)
 			break;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
