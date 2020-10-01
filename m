Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253A2C4727F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:25:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7DB207FB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RuJitPOQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7DB207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eOhfMbPTsAMzKqHMBV1oDP0d9OLlTuBbWW9R1PAuKJM=; b=RuJitPOQgwpjcnIHruhdL2Zsgu
	j1AEthefnMULp6sBBOhXYIrXYZMgXzRI9OIr6NW2eTW6CwaWAM5Zp5ZfTiH5uk8ZMWia6noWg791m
	BmSJ0Fj8Ivck4DcKduhY//bn8oe+8iWQtqiDDdVDrQLLChT4vVnUFjMEHBSet5uyW0mc/6rJGI1Vk
	w/z3JKnv+Bc1ScIkZ6u1yoh9T+AjyhlACzIUKHDK7rMhrtH+ujd8VshwaEGGXZ0BwJq0ByMhpSsk7
	HrodUmG1MfxsA4J4GocmHrg/4hlP+P3MdaOjam4ayGjY9rLQ60i8kPXRxAenGKkXXcdzSqiDnxGZo
	UmdXmyGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzWU-00066H-H3; Thu, 01 Oct 2020 14:25:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzWJ-00060C-7C; Thu, 01 Oct 2020 14:25:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2F6D429CDB8
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: mediatek: Free eint data on failure
Date: Thu,  1 Oct 2020 16:25:11 +0200
Message-Id: <20201001142511.3560143-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_102519_476934_2DE30191 
X-CRM114-Status: GOOD (  18.65  )
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
Cc: drinkcat@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The pinctrl driver can work without the EINT resource, but, if it is
expected to have this resource but the mtk_build_eint() function fails
after allocating their data (because can't get the resource or can't map
the irq), the data is not freed and you end with a NULL pointer
dereference. Fix this by freeing the data if mtk_build_eint() fails, so
pinctrl still works and doesn't hang.

This is noticeable after commit f97dbf48ca43 ("irqchip/mtk-sysirq: Convert
to a platform driver") on MT8183 because, due this commit, the pinctrl driver
fails to map the irq and spots the following bug:

[    1.947597] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000004
[    1.956404] Mem abort info:
[    1.959203]   ESR = 0x96000004
[    1.962259]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.967565]   SET = 0, FnV = 0
[    1.970613]   EA = 0, S1PTW = 0
[    1.973747] Data abort info:
[    1.976619]   ISV = 0, ISS = 0x00000004
[    1.980447]   CM = 0, WnR = 0
[    1.983410] [0000000000000004] user address but active_mm is swapper
[    1.989759] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    1.995322] Modules linked in:
[    1.998371] CPU: 7 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc1+ #44
[    2.004715] Hardware name: MediaTek krane sku176 board (DT)
[    2.010280] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[    2.015850] pc : mtk_eint_set_debounce+0x48/0x1b8
[    2.020546] lr : mtk_eint_set_debounce+0x34/0x1b8
[    2.025239] sp : ffff80001008baa0
[    2.028544] x29: ffff80001008baa0 x28: ffff0000ff7ff790
[    2.033847] x27: ffff0000f9ec34b0 x26: ffff0000f9ec3480
[    2.039150] x25: ffff0000fa576410 x24: ffff0000fa502800
[    2.044453] x23: 0000000000001388 x22: ffff0000fa635f80
[    2.049755] x21: 0000000000000008 x20: 0000000000000000
[    2.055058] x19: 0000000000000071 x18: 0000000000000001
[    2.060360] x17: 0000000000000000 x16: 0000000000000000
[    2.065662] x15: ffff0000facc8470 x14: ffffffffffffffff
[    2.070965] x13: 0000000000000001 x12: 00000000000000c0
[    2.076267] x11: 0000000000000040 x10: 0000000000000070
[    2.081569] x9 : ffffaec0063d24d8 x8 : ffff0000fa800270
[    2.086872] x7 : 0000000000000000 x6 : 0000000000000011
[    2.092174] x5 : ffff0000fa800248 x4 : ffff0000fa800270
[    2.097476] x3 : ffff8000100c5000 x2 : 0000000000000000
[    2.102778] x1 : 0000000000000000 x0 : 0000000000000000
[    2.108081] Call trace:
[    2.110520]  mtk_eint_set_debounce+0x48/0x1b8
[    2.114870]  mtk_gpio_set_config+0x5c/0x78
[    2.118958]  gpiod_set_config+0x5c/0x78
[    2.122786]  gpiod_set_debounce+0x18/0x28
[    2.126789]  gpio_keys_probe+0x50c/0x910
[    2.130705]  platform_drv_probe+0x54/0xa8
[    2.134705]  really_probe+0xe4/0x3b0
[    2.138271]  driver_probe_device+0x58/0xb8
[    2.142358]  device_driver_attach+0x74/0x80
[    2.146532]  __driver_attach+0x58/0xe0
[    2.150274]  bus_for_each_dev+0x70/0xc0
[    2.154100]  driver_attach+0x24/0x30
[    2.157666]  bus_add_driver+0x14c/0x1f0
[    2.161493]  driver_register+0x64/0x120
[    2.165319]  __platform_driver_register+0x48/0x58
[    2.170017]  gpio_keys_init+0x1c/0x28
[    2.173672]  do_one_initcall+0x54/0x1b4
[    2.177499]  kernel_init_freeable+0x1d0/0x238
[    2.181848]  kernel_init+0x14/0x118
[    2.185328]  ret_from_fork+0x10/0x34
[    2.188899] Code: a9438ac1 12001266 f94006c3 121e766a (b9400421)
[    2.194991] ---[ end trace 168cf7b3324b6570 ]---
[    2.199611] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    2.207260] SMP: stopping secondary CPUs
[    2.211294] Kernel Offset: 0x2ebff4800000 from 0xffff800010000000
[    2.217377] PHYS_OFFSET: 0xffffb50500000000
[    2.221551] CPU features: 0x0240002,2188200c
[    2.225811] Memory Limit: none
[    2.228860] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fixes: 89132dd8ffd2 ("pinctrl: mediatek: extend eint build to pinctrl-mtk-common-v2.c")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3:
- Really release the resource when needed. For some reason the change
  was not reflected in patch v2.

Changes in v2:
- Free the resource when needed (Sean Wang)

 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2f3dfb56c3fa..31724b80f133 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -355,6 +355,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
@@ -369,19 +370,26 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
 	if (!res) {
 		dev_err(&pdev->dev, "Unable to get eint resource\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_free_eint;
 	}
 
 	hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(hw->eint->base))
-		return PTR_ERR(hw->eint->base);
+	if (IS_ERR(hw->eint->base)) {
+		ret = PTR_ERR(hw->eint->base);
+		goto err_free_eint;
+	}
 
 	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq)
-		return -EINVAL;
+	if (!hw->eint->irq) {
+		ret = -EINVAL;
+		goto err_release_resource;
+	}
 
-	if (!hw->soc->eint_hw)
-		return -ENODEV;
+	if (!hw->soc->eint_hw) {
+		ret = -ENODEV;
+		goto err_release_resource;
+	}
 
 	hw->eint->dev = &pdev->dev;
 	hw->eint->hw = hw->soc->eint_hw;
@@ -389,6 +397,13 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
 	return mtk_eint_do_init(hw->eint);
+
+err_release_resource:
+	devm_ioremap_release(&pdev->dev, res);
+err_free_eint:
+	devm_kfree(hw->dev, hw->eint);
+	hw->eint = NULL;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtk_build_eint);
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
