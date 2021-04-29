Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA9BC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 14:39:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB3F61447
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 14:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB3F61447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YxYH5ytj7ZPr6cexbFE8aRX/nvOS1Kstxpu7F//o0Kw=; b=hVxDen7uPI/YnSV6Fy04jxILYQ
	j5bm6WitFkYebYYvjvoA7rgJhMBSSjmGHj/dGN4AI5Ic10e0JtHZojHxYf+/hBivwuEllPAveDXsz
	Ta8MPKabu1DFUfkyDo3zUHlQa5pq3o4qo+NugjOto+zTguQVWGIhIq2o44p6RORJXiAO6sTfNUp80
	BWkXEO17JogJJQV5L7t0eW6OlCFTAiU0Bdgr/u+Q9XeCErrfuJZqDivzWxwIPG3G2flGdYTyRcFF1
	b9f4x4ynonhGCbrAncP4Lruc60dencV5TKbKiEM3LIsj37emWB2nwHFh9ZPY2gBXaz9m3/A0pjFEB
	CwEDs9sQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc7oa-005qHb-Ng; Thu, 29 Apr 2021 14:38:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7oF-005qDb-AG
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 14:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=nvlXRyFYaeeyIwO6szvQsWjtbPP+qdyXO2BDXR8A9/8=; b=VTAgI3j3z8BiA1UTjsnyUgT+7/
 NQ1BdXrKKvnJfsyAlW8guZiLGiGd0/etUNm2qMceCfsqBIpA8DB2lKagLPrcYhA9FJ9V8I9Y93UH5
 5tENpUY7Z+IK6pw0oHCu2pktNopzLKeyFqFcbp5EN2ws42SNTKEv4jqSrvK+nbT8S4UvI19Z60Xmu
 BQQ3ze3+4yaV4DsNH6feuComEj38hpFEC62ur9u1gtAseWzPCx0oooCxRPcCx/x+qJOMtnTcfpCuM
 MK+lb8PpvIWH+dBlaxqMbxRM52XHxpHCxkJLMRmdD60o2m7nJ8n8iqgc9fzWKvcmsUHZKCNY14hu5
 VVz05AfQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7oB-000hCI-KN
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 14:38:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso286138wmh.0
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvlXRyFYaeeyIwO6szvQsWjtbPP+qdyXO2BDXR8A9/8=;
 b=CTBsw0zEqYpNO1IjM8aFVM6MLCxN6LQLNQXkIC9OsaOSGWnb/RbFJWycx2If4u4pdM
 u7LCQbFVd358Tit6j/gy93z3Qq2H3nkjMYVtUDTiucVPFLSM1GPHdmnAAR8tjADSYJne
 r/xyB13RGDKYOdcVVDk5mQzKqGjOMy34nohurpBYaFkfy+resbSItmJDq0bNQ563skf0
 LCOSIMYI1sTQFYkKbiN8k73UIDX2K2jI5PnzbpPHTAghIZHDE10/Udrpz7Jrna/ah1XD
 fKAJ74nYjd41jnqYfFuuhbY25ymEPco0zQp7FGON2zNjTO6qhP5AQV6oR8qJDxQMnywP
 Nf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvlXRyFYaeeyIwO6szvQsWjtbPP+qdyXO2BDXR8A9/8=;
 b=rpu0rGIf9SIJ9xsCxXcVs53hYdYEqgohFj0s0o5PKsTXhEjMSi+iR012IDLOQFQDyl
 wA1LrEleBo2pT/vTfryv1FakGy0Tsn68Y4LZlUel7EumDVjjjvSygxBsbD4U6eO5liOZ
 hik/6zIBl7AyBSKttJMKVVweso6yfmVs80AYB4NxEBcFgmrPyQq/qosWJzGei8T88cfu
 cdtoSNgvA2jNizULwYq5sHRILOHUB4tUViEFw0qkSI6Wn+jZtocWuO1kHS9dtaSCaPG6
 wr/TMoFWMiXVkaTyKQso05fV0CTJMAq1AHXNuIaSRrYxmq5XBX3UcvfoQQQErTYbtJMz
 pE+Q==
X-Gm-Message-State: AOAM531+UzCMZSLSrH0I28qQyDvJ9n4IHoZ4a9OQzia2S+AKp3tTnFvO
 o0GJPY0pyYNJ4PHLJAHJl5SBKQ==
X-Google-Smtp-Source: ABdhPJzxai37BCFbsjEPDgcJce53BzDsodpZRG2jq6v0LEhp4mkGCjah3cYW3LSkNzEjW74rnZwnZQ==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr398838wmc.60.1619707105655;
 Thu, 29 Apr 2021 07:38:25 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:f37e:9091:b397:6f48])
 by smtp.gmail.com with ESMTPSA id d6sm5025602wrr.77.2021.04.29.07.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 07:38:25 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>
Cc: fparent@baylibre.com, dmitry.torokhov@gmail.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: mt6397: rename mtk-pmic-keys cells to avoid OOPS
Date: Thu, 29 Apr 2021 16:38:11 +0200
Message-Id: <20210429143811.2030717-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_073827_749897_2BE58F76 
X-CRM114-Status: GOOD (  18.24  )
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

When booting with CONFIG_KEYBOARD_MTK_PMIC=y, we have the following oops:

[    0.384359] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c0
[    0.385471] Mem abort info:
[    0.385826]   ESR = 0x96000004
[    0.386214]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.386886]   SET = 0, FnV = 0
[    0.387282]   EA = 0, S1PTW = 0
[    0.387681] Data abort info:
[    0.388047]   ISV = 0, ISS = 0x00000004
[    0.388533]   CM = 0, WnR = 0
[    0.388910] [00000000000000c0] user address but active_mm is swapper
[    0.389712] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.390419] Modules linked in:
[    0.390812] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.12.0-mtk-04316-g7f74036c9b47 #58
[    0.391835] Hardware name: Pumpkin MT8183 (DT)
[    0.392399] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[    0.393160] pc : mtk_pmic_keys_probe+0x8c/0x57c
[    0.393744] lr : mtk_pmic_keys_probe+0x70/0x57c
[    0.394318] sp : ffff80001008bb10
[    0.394738] x29: ffff80001008bb10 x28: 0000000000000000
[    0.395414] x27: ffff8000117f04b0 x26: ffff80001121aa88
[    0.396089] x25: ffff0000031ea400 x24: ffff0000031ea410
[    0.396763] x23: 0000000000000000 x22: ffff00000342ad80
[    0.397438] x21: ffff000003589780 x20: 0000000000000000
[    0.398112] x19: ffff80001129d0d0 x18: 0000000000003ca8
[    0.398786] x17: ffff800010bad620 x16: ffff800010bacc44
[    0.399460] x15: 0000000000000040 x14: ffffffffffffffff
[    0.400134] x13: ffff800011df2728 x12: 0000000000000030
[    0.400808] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
[    0.401482] x9 : 0000000000000000 x8 : ffff000003589800
[    0.402155] x7 : 0000000000000000 x6 : 000000000000003f
[    0.402829] x5 : 0000000000000040 x4 : ffff0000031ea610
[    0.403503] x3 : ffff0000031ea6b8 x2 : 0000000000000000
[    0.404176] x1 : ffff000002d8d800 x0 : ffff0000031ea410
[    0.404850] Call trace:
[    0.405162]  mtk_pmic_keys_probe+0x8c/0x57c
[    0.405694]  platform_probe+0x68/0xe0
[    0.406162]  really_probe+0x1c0/0x480
[    0.406631]  driver_probe_device.part.0+0xd8/0x118
[    0.407239]  device_driver_attach+0xcc/0xd4
[    0.407773]  __driver_attach+0x60/0x12c
[    0.408261]  bus_for_each_dev+0x70/0xc4
[    0.408749]  driver_attach+0x24/0x30
[    0.409204]  bus_add_driver+0x118/0x200
[    0.409692]  driver_register+0x78/0x130
[    0.410180]  __platform_driver_register+0x28/0x34
[    0.410779]  pmic_keys_pdrv_init+0x1c/0x28
[    0.411301]  do_one_initcall+0x54/0x1c0
[    0.411791]  kernel_init_freeable+0x1d4/0x23c
[    0.412347]  kernel_init+0x14/0x118
[    0.412792]  ret_from_fork+0x10/0x34
[    0.413251] Code: aa1803e0 f90006b8 f94006c1 f9000aa1 (f9406281)
[    0.414032] ---[ end trace ad605d8d1790625c ]---
[    0.414630] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.415600] SMP: stopping secondary CPUs
[    0.416103] Kernel Offset: 0x80000 from 0xffff800010000000
[    0.416796] PHYS_OFFSET: 0x40000000
[    0.417238] CPU features: 0x00240002,2188200c
[    0.417791] Memory Limit: none
[    0.418181] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

This happens when we don't have a matching device-tree entry
(such as mediatek,mt6323-keys) for the driver.
In that case, we dereference of_id->data with of_id == NULL

The mfd core warns us about this:
   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]

mtk_pmic_keys gets probed() anyways because its mfd_cell->name:
    }, {
            .name = "mtk-pmic-keys",
            .num_resources = ARRAY_SIZE(mt6323_keys_resources),
            .resources = mt6323_keys_resources,
            .of_compatible = "mediatek,mt6323-keys"
    }, {

.name is used by mfd_add_device() and becomes the name of the platform
device:

    pdev = platform_device_alloc(cell->name, platform_id);

Later, in initcall, we do:

[    0.296114] calling  pmic_keys_pdrv_init+0x0/0x28 @ 1
[    0.296142] bus: 'platform': add driver mtk-pmic-keys

Then, to check if we should call mtk_pmic_keys_probe(), we call

      platform_match(drv, dev)

which will return true since drv->name and pdev->name match.

Since both the platform device is named mtk-pmic-keys and the driver is
called mtk-pmic-keys, we call probe(), which triggers the oops.

Fix it by renaming the mtk-pmic-key subdevices to right side of
their compatible.

This way, probe() will only be called when we have a valid dts entry for
mtk-pmic-keys.

Note: this is also more consistent naming with the other subdevices
such as mt6397-rtc and mt6397-codec.

Fixes: 55d1d1547ab5 ("mfd: mt6397: Add PMIC keys support to MT6397 driver")
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---

This is a replacement for:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210428164219.1115537-2-mkorpershoek@baylibre.com/

 drivers/mfd/mt6397-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7518d74c3b4c..a83fbc486d26 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -72,7 +72,7 @@ static const struct mfd_cell mt6323_devs[] = {
 		.name = "mt6323-led",
 		.of_compatible = "mediatek,mt6323-led"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6323-keys",
 		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
 		.resources = mt6323_keys_resources,
 		.of_compatible = "mediatek,mt6323-keys"
@@ -118,7 +118,7 @@ static const struct mfd_cell mt6397_devs[] = {
 		.name = "mt6397-pinctrl",
 		.of_compatible = "mediatek,mt6397-pinctrl",
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6397-keys",
 		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
 		.resources = mt6397_keys_resources,
 		.of_compatible = "mediatek,mt6397-keys"

base-commit: 4a0225c3d208cfa6e4550f2210ffd9114a952a81
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
