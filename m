Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FADF8A175
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2026 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=17r2Zj41sTJHtEDMLkRaAXUCQQ2ej07SXH4WFnjsKcE=; b=JxakLe1TsL1PFXcMgxOmeyMhPm
	Ep8flU792r9X+opVuyfoosLxxEOVzvowGCvtgxcQX9Ew+ez42ULvrtdrqqQF20/nVMxOwET+8p4wC
	CeyNSBCaIXL46XwT1/PdpSOOCo2mcMgGAUmdWUDDJ7AhWXbm0T0Ar6iFsinPm5WhK+cv0rqpqErc/
	LV+oVfsJJRu0FUNMg7pq0oTWRwElRcBVwM/zIdWw45rsNr2593TNXygI4BkM10300/moZOVS9koCE
	o74RXO/YjrK1nBM5ggR8gXny/1ZMufkoSi9DZCjUVElvd8e6iB0k6bX0i0VrvkBDL1Ia1dwj3GhCu
	AXdfI4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMKM-00000002Srh-2qOZ;
	Thu, 16 Apr 2026 13:00:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMKK-00000002SqT-23Xf
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Apr 2026 13:00:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82f37c09352so455294b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2026 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344411; x=1776949211; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17r2Zj41sTJHtEDMLkRaAXUCQQ2ej07SXH4WFnjsKcE=;
        b=WLpkf8mpvhsFHzqnIkB7GtpwdlOdm1yhzYO5ERbq/SCSBD88Cc932LhIs90dF2dOX7
         glguBmhYjAuPvsXOT5/PDX2BvRPtfXz+ciCBXCHL2HW7NvQrswYWXhUrMe0IAiaQDUHU
         9u1zhyEJXdGjGGhNfzo0/xJErjAO4zLh/xfg1EltbJ9wh/CFK6XQ1WhFAFFsC8Vq+g0l
         /WvjkyB4LvbXJ5tKFTAG6MSjwMaastII5HOEPldOHztB0X6hknsrYu9wddcsFNd5dkV5
         UU3MoOAwmntJiSD6+7HbxS/xMoBX2gORg3Qii5IxSi/4CaaljDsMlZ0U++/qUxbsqvjZ
         DK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344411; x=1776949211;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17r2Zj41sTJHtEDMLkRaAXUCQQ2ej07SXH4WFnjsKcE=;
        b=dqPrMFRG85OMcY+wJrPhxD6JJwXmMsrp2WibJx/YrsX+tsJr2Y882tnFfV5TGoTXBz
         wZlJ7Fp9SiQfSSSin4yRoJaUdhwisRFreQP1+BKjfr6nLYOTTWVL45dB0uA3PdvOR+dd
         C4Rh0Ti16TbYRlhMvr5+qQERp6fw7Xcm9uIQ8/k44ljL3b6tkHJpRuGD61vYPo9VllDR
         8DiRD+0tyUEhOA83081ijCloAttfN/m5Rp11+es3rm9kkxPk6BMVru4VRLgIULFjzUzO
         xT4UYERl/HK05RdKsvB57puGI0jKQO+46i4doVtqIT4Lh7tB1+kqI/+IUt/+YrPm8wQk
         WClQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eTBgqhvapOUBat6iAsZhqhAPvz3UPTgMv6JgHR7blxiH+0rDFiX70xoAWXwMAOI6jezhw3InzD64YLo9h8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/I/NtzeP1T+vBRdvqBHIrceMqTitQGYPBeGWTKiFcHhGqLyPG
	dJqqBhGwLazYPfsM0H30mTNQiPMaU0ncrqjRClrESaSr1mrdWJjYXiH8
X-Gm-Gg: AeBDiesgupnF7dusOUoOetJKd6y4Sca+2QholiLca7MTZXd9HE/8tambbh3T3XtOMTS
	RF6eU4krX8CUIUNLIicc5IH9Ph1wtch+UVfjZNWoyarS20wgGS/gCWkExllYqVsr9hWL0ou0nGP
	wZ6+3D4zfugHvVTMeCIWYkEKQ19Y+wHSQQ1JSuIMOh7SHTvQilgEUQyyaP/1d6/5vISrK7Ku4OF
	huav4Lbn6o3I1GXGizXL7pUX5n65WRHNBdkEkpPqu6ylGUiSWdOENT+j7Dpm3ZdkNC3YMehvFxc
	RdQSTJb1o1332xyu+thT2Q+KZrMwmr2v9t9sTlUm092e8VkmuKYiyeole6Ho27yZkcyHtUVSgBO
	LU5bOhaDP2MhQPbW6k39dBVK9lqYQpQwBYbLMPPZg0k1IubK7SLdB+MNdiJaNT1tS2oIG1ZiNQ8
	9A3d0ij7hKC6dY1y2blx1UeANVAFI+15ap0wquEYyXEk1lSYWdj06hTOk+BP27krBTSLXqXNkmc
	M0OO4mdQSM5ABkqXwZs5UzvmYR560g+FR0x0sH6qA==
X-Received: by 2002:a05:6a00:4b4f:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-82f7edb955emr1537377b3a.6.1776344411297;
        Thu, 16 Apr 2026 06:00:11 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744c923sm5260199b3a.52.2026.04.16.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:00:10 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 16 Apr 2026 21:00:08 +0800
Subject: [PATCH v2] spi: mtk-snfi: fix memory leak in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-mtk-snfi-v2-1-3f487689dacb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFfd4GkC/0XMQQrDIBCF4auEWdeikojpqvcoWVjjJEOrCRqkJ
 Xj32kDp8n88vh2Si+QSXJodosuUaAk15KkBO5swOUZjbZBcKt6KjvntwVJAYqoTptct5/JuoN7
 X6JBeB3Ubas+UtiW+DzmL7/pD1B/JggmGBq3FUWqN/XXyhp5nu3gYSikfnCK+3aAAAAA=
X-Change-ID: 20260415-mtk-snfi-651a984002ba
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776344408; l=1691;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XkYW2/z4LPsF75ss8CCVDNVzt3DbKPrtELWOw2qUNpY=;
 b=hvqwwc8rcn4/DHqZxkGuqafbHwwzm216tkjP8vosgvZYpH2kNLzP/08UlMoon7Cbdmk3csCV9
 2O2P1E4mabXD2roZXFjRAoh6MQB/XqRSgyNA6jP0ZBdKRjQIYEwkB0X
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_060012_757357_0F8F90CC 
X-CRM114-Status: GOOD (  11.93  )
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

ms->buf is allocated in mtk_snand_setup_pagefmt() but was not freed on
the following error paths.

Fixes: 2b1e19811a8e ("spi: mtk-snfi: Change default page format to setup default setting")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Mark's comment.
- Link to v1: https://lore.kernel.org/r/20260416-mtk-snfi-v1-1-fafccfd288f9@gmail.com
---
 drivers/spi/spi-mtk-snfi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 73fa84475f0e..e616e6800e92 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1447,14 +1447,14 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = nand_ecc_register_on_host_hw_engine(&ms->ecc_eng);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ecc engine.\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	ret = devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
 				       &ms->ecc_eng);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "failed to add ECC unregister action\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	ctlr->num_chipselect = 1;
@@ -1465,10 +1465,12 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_controller failed.\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	return 0;
+free_buf:
+	kfree(ms->buf);
 release_ecc:
 	mtk_ecc_release(ms->ecc);
 	return ret;

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-mtk-snfi-651a984002ba

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


