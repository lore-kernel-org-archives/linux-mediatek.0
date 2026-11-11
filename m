Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA20606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wLSvJ8OA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwf/B9YH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=; b=wLSvJ8OAxH03Tl529Wa7TOfveR
	DYzfgXRK+pBs4TpeiD23BYasyj5w7ZB5NI0R4GOQaequRaSqAbc15L4LelWZPsf/bctliV2bd4DNx
	4b7lDM4MjqE8tvzpalZTzZAOOCAcHQ0eaJ4B5lVg+lFwfDmxRF4IIRhuAl0z4dt+Z0yX0xwfJWSpd
	pfT7N75r2pX7SMem7q+mnMW6jsjT2Avj/QN+GTaSZy1WfY8FTtl7W7E6T11+O0iMA1jN0ahtPWRiP
	91aW60VMliSexGmQEZ8eNwBGTjI7sfCb3hrqUSbH9D1sP+4TTKg2C6Vf9j4sn3pdOUMjU957BjIQT
	qT2drMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzB0-00000005Z8y-2nFa;
	Wed, 11 Nov 2026 03:39:10 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzAy-00000005Z8J-0xGc
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 03:39:09 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4f66bb2ab57so839935b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 19:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368347; cv=none;
        d=google.com; s=arc-20260327;
        b=b89oR44sc6fiB8e893VmRU21FsSyvOQFPMVgWZS6/olBELZrb7pk8aLBb22zWMszKA
         Bj6sQPUKl10RS/In+KjT/9fwlpx/sDHNZ5BX8Hv85Olt3YtCU4A+w9XvGtRQL0mEbnPf
         EWHvmhb0NKfb5UuVtVuTX/enVdfy/WQC88ox2wJP+fVSBUvqEOXDrOJAEPXGCjrRzDbI
         ZutR1yw6ksDeZF9VXJ3IRXnxJoolxSxHkbPqKSkjDEyXC+Ax13XD6CxmiYmMaUtlXpGD
         CBYqYpxh2G68LmmL5Rr8x0wJbyN9kxHjdA1AiqH3350QWcQTT5sDLZm/kSfbgE0s1w5o
         aSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
        fh=UmPBN7Y2DB7sThiH9bPvMxGEk/1+Sx60H6WEI+jQWeE=;
        b=ifOmfqZdqeJvNL98lzSTw02t7bFARuRQQS8FVPK5vnV9SKaCphYMHNT411Vo3ZLNnZ
         Wm20v/EOh2KHBcuMARlzGQdbZ7JBzR0rXe8oe0m7VMMzn2M567FCcIZnuwQOACwucLVq
         X3/18MQCPF8q9VPWbiU324SJnFW7KrKu2feElK2bx03s2mG1keIjqvSIakECL/eTmx9x
         BFM+R4/JUQEuMN9kijIvNYXg7PAMOXAii/E3+XOB6VoWlcr0yK9FJc86udUdR05WxXRp
         eVsbx8pYjqkEm65gWGvA1sbSM6uHxbKuknXGhhJrfWx5TSs2tal9bArCN/wfdiyjwHgH
         w5JA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368347; x=1794973147; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
        b=Mwf/B9YHVTpAearCKMBxn1ifaNzaebw3yqP4Ygj7m2q77tlgPrin0v864Q9aENBGK8
         jY1Ldfx8BJf/Wb7ZQXyLdd6VhBhjnHXCyMI4ihpfA3iShNzr7D0Hfwa7Hvm+COj8XvAU
         QzZKlh+fEOzt+zsQxvWgB3QpwNdSVdx7T0s4cMl1GICr2Te73FB9w/SSI4fioXVkp1vy
         Sb2UV21StVpXl2uN4/P32AvPfQkvHeokD1qTEGpLj7S55zv4JTc9n5KVA18frklAHtkY
         Xu5n+8KTr2xxUavDWm2htd5M8yYjP7X9zUN0h5PK/3Lpcm+hZdcrC1vZSK/AsxIH660o
         U83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368347; x=1794973147;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
        b=aOkD4CL9s9tYHYfCSIt3P7NcTB29zQZmm8Oo4Jn9noq+C8BwQ9jFCEJgwb9UNZAWkJ
         0UzJypxg0nJZP/DBxldwuzqyjBdp7LR2dm+WGs29k+Hpi9hFAeCPzMG7/lyBBqN1gbdC
         TRUya9f1+WiqKUJDzv4UEXaWCQbLo962jAztWuVbcIZJ5TlOtS+jtruUGTGck0fuMVVT
         Kpxwd1+Y8NTrH/0s4PwDPc0byhBEp+agYvbQSDoDx2jZ96rsbYPVzDNpb+miI3+or9Zk
         7Ax1FPuA0MzocXjRVZe1sVEMzIpZlj/YsJITXp6YYBnutybE8xvtiChj0dxXR22uN2ue
         x0YA==
X-Forwarded-Encrypted: i=1; AL+hErEqhsOQJNsD+J224z/+JbwTfRBBeK42hjiFNWOnvF7e8GH3Y+wFNpKioGNuomAn+CG7YQ9eVUSu1JBNaSHzZg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8dssuQa3kN3ltuGrrCco2PUIjvKjv2ZB5tG/QT7JsTmlnTDOBd
	LBgSmkTaKpo4OSr+KxYoW/qlXojn8XGYWtiz9/XRcrBt6TBZbKmWeEtaXQKWVw7xqGyKJIlEvut
	EOT50G/59KGyjMdnOd/XzXgCA6KnLSy4=
X-Gm-Gg: AYBFou0M/pLVHbU4BnsvRV4z3ozN02oHxcEMMJiSUwvBK22THk0DK7TqYMHCtlbo11k
	755o//w8zyO2kT+vw3Wd5iCfjtvM5JJVnQs1lTyUL8970bWyqLgZ0IF+uoBoLMf05/I4lZONPQ+
	q2xxlHqPB/MDfGTJ9OhQRYLTxabRMZK3Jmk7E9i7Z3U+0tNnf25g6RGbIgh3o/ErD3FKUCEtrQ6
	gBMCKV1eMO4A558yoV6TcWcKwpabkmT997P5b9GivO5X/lsGf5cHxQoxcib3IEJlxB9/a+L7G40
	WpLHhJhCOlAKsFe5CnxtUFfslKPUYjjKPvE9KyiO9QMlZC/16fFTUgGZfvp/BzvzM5QY1RwI9Zn
	7QOnio8UhnxlqKz6cm3sDvRbwx3tkIU4r1jU3uOVdYNpdEIqJaF76QCBd3IyeH7OlAlB2+WBzFK
	UB3bvErhH/Ftc=
X-Received: by 2002:a05:6808:11cb:b0:4b5:5bfb:f25d with SMTP id
 5614622812f47-56b968c6cfamr1072165b6e.20.1794368346890; Tue, 10 Nov 2026
 19:39:06 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 04:39:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Wed, 11 Nov 2026 04:39:06 +0100
X-Gm-Features: AclHuK_nBfLd4AwlFZDeXlHPJK6CbTuIvbFXdfuEBye_wtDsEX-osUjZ1YebQoM
Message-ID: <CA+m4KrCAtrxGcy74ieBOibgsGwWW=+gQzUUJVcdY0H2xcqGMvg@mail.gmail.com>
Subject: [RFC PATCH] media: mediatek: mdp: Keep component suppliers powered
 while streaming
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, 
	andrew-ct.chen@mediatek.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_193908_300757_737BB1C1 
X-CRM114-Status: GOOD (  27.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Following up on my earlier report ("MT8173 legacy MDP: PROCESS_ACK
status 0 but CAPTURE remains unchanged"), I dug into the runtime-PM
dependencies on an MT8173 Elm Chromebook.

The legacy MDP driver manages the clocks for its sibling blocks
directly from the RDMA0 master, but it does not establish runtime-PM
dependencies from the master to those devices. As a result, their
suppliers are not all kept active during processing. In particular,
LARB4 stays suspended.

In the failing case, the firmware reports success and both buffers
complete, yet the CAPTURE planes remain untouched, matching the
pre-queue canary. Keeping LARB4 active before the first job changes
the output to a byte-exact copy.

The proposed fix binds the sibling blocks as components and adds
runtime-PM device links from the master to them. Their existing
IOMMU/LARB supplier links then propagate the required PM references.
Engine clock handling stays in the master, and the M2M device is
registered only after all required components have bound. The existing
fallback path for legacy child-node DTs is retained.

I also reproduced an IOMMU read fault on LARB4 port 4 (MDP_RDMA1)
after closing a failed job and unmapping its buffers. Tracing
associated the reported fault page with that job's input Y allocation.
No second PROCESS command was submitted before the fault was reported
during the subsequent LARB4 reactivation sequence.

The patch fixes the missing PM dependencies. All ten conversion tests
passed with pixel-exact output and no IOMMU faults, without manually
forcing LARB4 on.

Tested on Elm (next-20261105-based kernel, VPU firmware v1.2.0):

- Seven NV12M 640x360 copy jobs produced byte-exact Y/UV output.
- Three saved MT21C 640x384 to YUV420M 640x360 conversions matched the
software-decoded reference across all visible Y/U/V samples.
- Testing covered both temporary module loading and loading the
candidate during boot.
- LARB4 remained under the "auto" PM policy, became active during
streaming, and suspended again after streaming stopped.
- Three STREAMON-without-buffers checks returned the expected EINVAL,
with no additional PROCESS commands or observed PM cleanup failures.
- The PM changes apply and build cleanly against next-20261105 without
the diagnostic instrumentation.

The diff below is based on current linux-next (793807ca13bf). Compared
with the tested next-20261105 files, the only intervening changes in
these files are two devm_kzalloc_obj() substitutions. Those upstream
changes are retained; the proposed PM changes are unchanged.

System suspend/resume, other boards, legacy child-node DTs, and
probe/allocation error-injection paths have not been tested.

Does this look like the right way to model the runtime-PM dependencies
for the legacy MDP components? I'd especially appreciate feedback on
the device-link lifetime and component bind/unbind ordering.

I have the userspace reproducer, deterministic test pattern generator,
and ftrace logs available if useful.

Thanks,
Youngjoon Lee

Signed-off-by: Youngjoon Lee <getfeus@gmail.com>
---
 drivers/media/platform/mediatek/mdp/Makefile       |  1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h |  1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 91 +++++++++++++++++++---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.h |  2 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c   | 81 +++++++++++++++++++
 5 files changed, 165 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/Makefile
b/drivers/media/platform/mediatek/mdp/Makefile
index b7c16eb..c3f3a74 100644
--- a/drivers/media/platform/mediatek/mdp/Makefile
+++ b/drivers/media/platform/mediatek/mdp/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 mtk-mdp-y += mtk_mdp_core.o
+mtk-mdp-y += mtk_mdp_pm.o
 mtk-mdp-y += mtk_mdp_comp.o
 mtk-mdp-y += mtk_mdp_m2m.o
 mtk-mdp-y += mtk_mdp_regs.o
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
index ae41dd3..c9098d8 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
@@ -42,5 +42,6 @@ void mtk_mdp_comp_deinit(struct device *dev, struct
mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);

+extern struct platform_driver mtk_mdp_pm_component_driver;

 #endif /* __MTK_MDP_COMP_H__ */
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index c065cde..23bcaa8 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -6,6 +6,7 @@
  */

 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -102,12 +103,50 @@ void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
 	list_del(&comp->node);
 }

+static int mtk_mdp_compare_component(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static void mtk_mdp_release_component(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static int mtk_mdp_master_bind(struct device *dev)
+{
+	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = component_bind_all(dev, mdp);
+	if (ret)
+		return ret;
+	ret = mtk_mdp_register_m2m_device(mdp);
+	if (ret)
+		component_unbind_all(dev, mdp);
+	return ret;
+}
+
+static void mtk_mdp_master_unbind(struct device *dev)
+{
+	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+
+	mtk_mdp_unregister_m2m_device(mdp);
+	component_unbind_all(dev, mdp);
+}
+
+static const struct component_master_ops mtk_mdp_master_ops = {
+	.bind = mtk_mdp_master_bind,
+	.unbind = mtk_mdp_master_unbind,
+};
+
 static int mtk_mdp_probe(struct platform_device *pdev)
 {
 	struct mtk_mdp_dev *mdp;
 	struct device *dev = &pdev->dev;
 	struct device_node *node, *parent;
 	struct mtk_mdp_comp *comp, *comp_temp;
+	struct component_match *match = NULL;
 	int ret = 0;

 	mdp = devm_kzalloc_obj(dev, *mdp);
@@ -132,6 +171,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		parent = dev->of_node->parent;
 	}

+	mdp->use_components = parent != dev->of_node;
+
 	/* Iterate over sibling MDP function blocks */
 	for_each_child_of_node(parent, node) {
 		const struct of_device_id *of_id;
@@ -163,6 +204,11 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		}

 		mtk_mdp_register_component(mdp, comp);
+		if (mdp->use_components && node != dev->of_node)
+			component_match_add_release(dev, &match,
+						    mtk_mdp_release_component,
+						    mtk_mdp_compare_component,
+						    of_node_get(node));
 	}

 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
@@ -187,12 +233,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		goto err_dev_register;
 	}

-	ret = mtk_mdp_register_m2m_device(mdp);
-	if (ret) {
-		v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
-		goto err_m2m_register;
-	}
-
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
 	if (!mdp->vpu_dev) {
 		dev_err(&pdev->dev, "Failed to get vpu device\n");
@@ -216,17 +256,25 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}

 	pm_runtime_enable(dev);
+	if (mdp->use_components)
+		ret = component_master_add_with_match(dev, &mtk_mdp_master_ops,
+						      match);
+	else
+		ret = mtk_mdp_register_m2m_device(mdp);
+	if (ret)
+		goto err_register_components;
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);

 	return 0;

+err_register_components:
+	pm_runtime_disable(dev);
+	vb2_dma_contig_clear_max_seg_size(dev);
+
 err_reg_handler:
 	platform_device_put(mdp->vpu_dev);

 err_vpu_get_dev:
-	mtk_mdp_unregister_m2m_device(mdp);
-
-err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);

 err_dev_register:
@@ -252,10 +300,13 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 	struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
 	struct mtk_mdp_comp *comp, *comp_temp;

+	if (mdp->use_components)
+		component_master_del(&pdev->dev, &mtk_mdp_master_ops);
+	else
+		mtk_mdp_unregister_m2m_device(mdp);
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 	platform_device_put(mdp->vpu_dev);
-	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);

 	destroy_workqueue(mdp->wdt_wq);
@@ -319,7 +370,25 @@ static struct platform_driver mtk_mdp_driver = {
 	}
 };

-module_platform_driver(mtk_mdp_driver);
+static struct platform_driver * const mtk_mdp_drivers[] = {
+	&mtk_mdp_pm_component_driver,
+	&mtk_mdp_driver,
+};
+
+static int __init mtk_mdp_init(void)
+{
+	return platform_register_drivers(mtk_mdp_drivers,
+					 ARRAY_SIZE(mtk_mdp_drivers));
+}
+
+static void __exit mtk_mdp_exit(void)
+{
+	platform_unregister_drivers(mtk_mdp_drivers,
+				    ARRAY_SIZE(mtk_mdp_drivers));
+}
+
+module_init(mtk_mdp_init);
+module_exit(mtk_mdp_exit);

 MODULE_AUTHOR("Houlong Wei <houlong.wei@mediatek.com>");
 MODULE_DESCRIPTION("Mediatek image processor driver");
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
index a6e6dc3..c9004e4 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
@@ -133,6 +133,7 @@ struct mtk_mdp_variant {
  * struct mtk_mdp_dev - abstraction for image processor entity
  * @lock:	the mutex protecting this data structure
  * @vpulock:	the mutex protecting the communication with VPU
+ * @use_components: use sibling component PM supplier links
  * @pdev:	pointer to the image processor platform device
  * @variant:	the IP variant information
  * @id:		image processor device index (0..MTK_MDP_MAX_DEVS)
@@ -152,6 +153,7 @@ struct mtk_mdp_dev {
 	struct mutex			lock;
 	struct mutex			vpulock;
 	struct platform_device		*pdev;
+	bool				use_components;
 	struct mtk_mdp_variant		*variant;
 	u16				id;
 	struct list_head		comp_list;
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
b/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
new file mode 100644
index 0000000..a984f23
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Keep the DMA component suppliers powered for the master runtime lifetime. */
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+struct mtk_mdp_pm_component {
+	struct device_link *link;
+};
+
+static int mtk_mdp_pm_bind(struct device *dev, struct device *master,
void *data)
+{
+	struct mtk_mdp_pm_component *comp = dev_get_drvdata(dev);
+
+	/* The component already has its IOMMU/LARB runtime-PM supplier link. */
+	comp->link = device_link_add(master, dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	return comp->link ? 0 : -ENOMEM;
+}
+
+static void mtk_mdp_pm_unbind(struct device *dev, struct device *master,
+			      void *data)
+{
+	struct mtk_mdp_pm_component *comp = dev_get_drvdata(dev);
+
+	device_link_del(comp->link);
+	comp->link = NULL;
+}
+
+static const struct component_ops mtk_mdp_pm_component_ops = {
+	.bind = mtk_mdp_pm_bind,
+	.unbind = mtk_mdp_pm_unbind,
+};
+
+static int mtk_mdp_pm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_mdp_pm_component *comp;
+	int ret;
+
+	/* RDMA0 is the master; it must not become its own supplier. */
+	if (of_property_present(dev->of_node, "mediatek,vpu"))
+		return -ENODEV;
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, comp);
+	pm_runtime_enable(dev);
+	ret = component_add(dev, &mtk_mdp_pm_component_ops);
+	if (ret)
+		pm_runtime_disable(dev);
+	return ret;
+}
+
+static void mtk_mdp_pm_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_mdp_pm_component_ops);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id mtk_mdp_pm_of_match[] = {
+	{ .compatible = "mediatek,mt8173-mdp-rdma" },
+	{ .compatible = "mediatek,mt8173-mdp-rsz" },
+	{ .compatible = "mediatek,mt8173-mdp-wdma" },
+	{ .compatible = "mediatek,mt8173-mdp-wrot" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mtk_mdp_pm_of_match);
+
+struct platform_driver mtk_mdp_pm_component_driver = {
+	.probe = mtk_mdp_pm_probe,
+	.remove = mtk_mdp_pm_remove,
+	.driver = {
+		.name = "mtk-mdp-pm-component",
+		.of_match_table = mtk_mdp_pm_of_match,
+	},
+};

