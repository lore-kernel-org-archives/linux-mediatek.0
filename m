Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E0DC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 10:34:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5114E206B6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 10:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C9ZKc8uT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5114E206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPi73XK+TDoe5zdyQwWkUo3bOCdrZmucW1AWH8e9zQs=; b=C9ZKc8uTRleNdDJu29Ez4Me44I
	pxLh67DrlLrRm14d/2p4JmbicR56lkgvaGH10kGZCSlTq6Rh3LWSwFydVSazWfw7iDnO0M49ZVUcQ
	FQ0gy45wP8TyHH3N0vOf/9aPZKcGpx+xZ0cqviiZtXhqKiCqkqaZsmiydCUHiL00MifSuQCtFJ7l1
	kzIOi5v1sEuWRdNju9jLbOFEiNdH041MOTvqGaqodHhzYMVH9Y0VW6m+49emg9hCZjvsI8ayWNzMs
	kHP3Dlzau5H2Q+uNL/ilqDxVN9f1fX2/pcGXwkS7Ak1Qe8gF/EdWA72d6t8DmLKTENbw2GbyI7CAU
	ZtdOhuxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jskvl-0004gg-ST; Tue, 07 Jul 2020 10:34:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jskvf-0004bm-Ni; Tue, 07 Jul 2020 10:34:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id B0C812A0718
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "thermal: mediatek: fix register index error"
Date: Tue,  7 Jul 2020 12:34:12 +0200
Message-Id: <20200707103412.1010823-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_063423_975696_EE62A5E7 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: Amit Kucheria <amit.kucheria@verdurent.com>, drinkcat@chromium.org,
 linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Kao <michael.kao@mediatek.com>, Eduardo Valentin <edubezval@gmail.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Zhang Rui <rui.zhang@intel.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit eb9aecd90d1a39601e91cd08b90d5fee51d321a6

The above patch is supposed to fix a register index error on mt2701. It
is not clear if the problem solved is a hang or just an invalid value
returned, my guess is the second. The patch introduces, though, a new
hang on MT8173 device making them unusable. So, seems reasonable, revert
the patch because introduces a worst issue.

The reason I send a revert instead of trying to fix the issue for MT8173
is because the information needed to fix the issue is in the datasheet
and is not public. So I am not really able to fix it.

Fixes the following bug when CONFIG_MTK_THERMAL is set on MT8173
devices.

[    2.222488] Unable to handle kernel paging request at virtual address ffff8000125f5001
[    2.230421] Mem abort info:
[    2.233207]   ESR = 0x96000021
[    2.236261]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.241571]   SET = 0, FnV = 0
[    2.244623]   EA = 0, S1PTW = 0
[    2.247762] Data abort info:
[    2.250640]   ISV = 0, ISS = 0x00000021
[    2.254473]   CM = 0, WnR = 0
[    2.257544] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041850000
[    2.264251] [ffff8000125f5001] pgd=000000013ffff003, pud=000000013fffe003, pmd=000000013fff9003, pte=006800001100b707
[    2.274867] Internal error: Oops: 96000021 [#1] PREEMPT SMP
[    2.280432] Modules linked in:
[    2.283483] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc6+ #162
[    2.289914] Hardware name: Google Elm (DT)
[    2.294003] pstate: 20000005 (nzCv daif -PAN -UAO)
[    2.298792] pc : mtk_read_temp+0xb8/0x1c8
[    2.302793] lr : mtk_read_temp+0x7c/0x1c8
[    2.306794] sp : ffff80001003b930
[    2.310100] x29: ffff80001003b930 x28: 0000000000000000
[    2.315404] x27: 0000000000000002 x26: ffff0000f9550b10
[    2.320709] x25: ffff0000f9550a80 x24: 0000000000000090
[    2.326014] x23: ffff80001003ba24 x22: 00000000610344c0
[    2.331318] x21: 0000000000002710 x20: 00000000000001f4
[    2.336622] x19: 0000000000030d40 x18: ffff800011742ec0
[    2.341926] x17: 0000000000000001 x16: 0000000000000001
[    2.347230] x15: ffffffffffffffff x14: ffffff0000000000
[    2.352535] x13: ffffffffffffffff x12: 0000000000000028
[    2.357839] x11: 0000000000000003 x10: ffff800011295ec8
[    2.363143] x9 : 000000000000291b x8 : 0000000000000002
[    2.368447] x7 : 00000000000000a8 x6 : 0000000000000004
[    2.373751] x5 : 0000000000000000 x4 : ffff800011295cb0
[    2.379055] x3 : 0000000000000002 x2 : ffff8000125f5001
[    2.384359] x1 : 0000000000000001 x0 : ffff0000f9550a80
[    2.389665] Call trace:
[    2.392105]  mtk_read_temp+0xb8/0x1c8
[    2.395760]  of_thermal_get_temp+0x2c/0x40
[    2.399849]  thermal_zone_get_temp+0x78/0x160
[    2.404198]  thermal_zone_device_update.part.0+0x3c/0x1f8
[    2.409589]  thermal_zone_device_update+0x34/0x48
[    2.414286]  of_thermal_set_mode+0x58/0x88
[    2.418375]  thermal_zone_of_sensor_register+0x1a8/0x1d8
[    2.423679]  devm_thermal_zone_of_sensor_register+0x64/0xb0
[    2.429242]  mtk_thermal_probe+0x690/0x7d0
[    2.433333]  platform_drv_probe+0x5c/0xb0
[    2.437335]  really_probe+0xe4/0x448
[    2.440901]  driver_probe_device+0xe8/0x140
[    2.445077]  device_driver_attach+0x7c/0x88
[    2.449252]  __driver_attach+0xac/0x178
[    2.453082]  bus_for_each_dev+0x78/0xc8
[    2.456909]  driver_attach+0x2c/0x38
[    2.460476]  bus_add_driver+0x14c/0x230
[    2.464304]  driver_register+0x6c/0x128
[    2.468131]  __platform_driver_register+0x50/0x60
[    2.472831]  mtk_thermal_driver_init+0x24/0x30
[    2.477268]  do_one_initcall+0x50/0x298
[    2.481098]  kernel_init_freeable+0x1ec/0x264
[    2.485450]  kernel_init+0x1c/0x110
[    2.488931]  ret_from_fork+0x10/0x1c
[    2.492502] Code: f9401081 f9400402 b8a67821 8b010042 (b9400042)
[    2.498599] ---[ end trace e43e3105ed27dc99 ]---
[    2.503367] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    2.511020] SMP: stopping secondary CPUs
[    2.514941] Kernel Offset: disabled
[    2.518421] CPU features: 0x090002,25006005
[    2.522595] Memory Limit: none
[    2.525644] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]--

Cc: Michael Kao <michael.kao@mediatek.com>
Fixes: eb9aecd90d1a ("thermal: mediatek: fix register index error")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/thermal/mtk_thermal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 6b7ef1993d7e..42c9cd0e5f77 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -594,8 +594,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	u32 raw;
 
 	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
-		raw = readl(mt->thermal_base +
-			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
+		raw = readl(mt->thermal_base + conf->msr[i]);
 
 		temp = raw_to_mcelsius(mt,
 				       conf->bank_data[bank->id].sensors[i],
@@ -736,8 +735,7 @@ static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 
 	for (i = 0; i < conf->bank_data[num].num_sensors; i++)
 		writel(conf->sensor_mux_values[conf->bank_data[num].sensors[i]],
-		       mt->thermal_base +
-		       conf->adcpnp[conf->bank_data[num].sensors[i]]);
+		       mt->thermal_base + conf->adcpnp[i]);
 
 	writel((1 << conf->bank_data[num].num_sensors) - 1,
 	       controller_base + TEMP_MONCTL0);
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
