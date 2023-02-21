Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29694C636D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TtGcBjSMD0TPpnUy4pzgFNIJ5eKnUntLrojcStRDYvY=; b=jB/MHttgOP4WFqd2C6fjkGnmrA
	/CIgJFyHKqBfzeORXTrsGXpR/6LRUeyOvbJIiSuSwDpdjJzCzVX0KIb+In/LGLvkilIpxmefobTRi
	sNlVoxengezwGkmA8oiI7kL5FYe4bYGU7rR1w7V6ARXdlEqMWA+KeqXfKdNji5bcXYE44R4SAvySx
	+YzwaR0WK7+d5gNyBPxf5iAMuelTLlrVrzBdK4lqMFiF8ReCijzw3ajaa5xUOo7HDbgzGrUqd6+Cv
	+UxedFmQ3JF8vhJv8Ghwn71KhnzbFcLs4YANawmUbtW+evFvstmUj40inv5QmG4Z8J7wFfP1BJub5
	x5+HRcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIkS-006NBB-OJ; Tue, 21 Feb 2023 02:51:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIkI-006NA7-CC; Tue, 21 Feb 2023 02:51:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id x24so1674730pfn.7;
        Mon, 20 Feb 2023 18:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtGcBjSMD0TPpnUy4pzgFNIJ5eKnUntLrojcStRDYvY=;
        b=TISNllblHWF13weS2bgeSF1ImCiREcvaXpiF/CreaEjt0LoXeoVQI0oV+1LALsnTMv
         4wduhGF2Jo4vqYZbUPq97QLzuL6OLTPET8UzQiCzqdkuI1TK3LhExuFufxKFLSFxiR+N
         ThCXAgT68zYCVbKn1grxyUPK4rQBV5HvP+yhKP86Tj0Sjwb3hB0s/h+JaxOY2qyZ5MDc
         5vRdcIDFJLN4lnqakNRvCz4oRteJ0lsbuojFn7n/xCixggNN48+ux9uEuzAZfJePKv9U
         uHVhXZlGHvE/z8NhvJCad44OEvTsNRW6MDCYqHJazhZM9ZtbwCYMCW9zD+AbwG/QeKlq
         3xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtGcBjSMD0TPpnUy4pzgFNIJ5eKnUntLrojcStRDYvY=;
        b=WYRVx+xkAwsQkR+53FWOufvzU0uuyBNJsAm1kh/xMoX+eqKZ2t2DWzItrwbMtuaaYz
         KZWzEL1lPMryY2WRwH4SQ2TR29jpnAC3felrWJyYBm+hDqLunwFNNXjgj37S2kmgHsQJ
         Jq/6jslrTZBMiilsdrmFpQngq3SPeWnsljNCFv1KobaFJC+cX9DpX+H10OawOKDZU1Wm
         R4dO4930HLwKbdoizgbZCQGfaRjZUBSQmG58rt0z7Iy93eJ7rRJUaE3TF40f1JVfLGNi
         iwIf//92AsECpyB6ItttD8cCiJ9O1aeZK/BHH9dV0AjjcAIUaTKtwgpGiIrgY48IH9i3
         r/HQ==
X-Gm-Message-State: AO0yUKUSAt4PDb/W/Sy7bAoIvy1dHUqDMt8c+DO5Ajh6XD+J6zfgLKUj
	vXlbqs0Zmw9qvHbpmRIxZOA=
X-Google-Smtp-Source: AK7set8+e5eaqDbJ9WaXabjF/wktK7ZqA2lJP1Q1QeyCNfHcTThHtXLt0gc8UdQC0C9xGffblwQhrg==
X-Received: by 2002:a05:6a00:2ea8:b0:5a8:9858:750a with SMTP id fd40-20020a056a002ea800b005a89858750amr4423750pfb.13.1676947863789;
        Mon, 20 Feb 2023 18:51:03 -0800 (PST)
Received: from localhost.localdomain ([2407:cdc0:a091:5a10:3275:3446:a72b:eccd])
        by smtp.gmail.com with ESMTPSA id s4-20020a62e704000000b0059442ec49a2sm8603427pfh.146.2023.02.20.18.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 18:51:03 -0800 (PST)
From: Stephen Zhang <starzhangzsd@gmail.com>
X-Google-Original-From: Stephen Zhang <zhangshida@kylinos.cn>
To: jejb@linux.ibm.com,
	artin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	beanhuo@micron.com,
	bvanassche@acm.org,
	avri.altman@wdc.com,
	yoshihiro.shimoda.uh@renesas.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH v2] scsi: ufs: Guard the ufs_mtk_runtime_suspend and ufs_mtk_runtime_resume with CONFIG_PM
Date: Tue, 21 Feb 2023 10:50:55 +0800
Message-Id: <20230221025055.1031342-1-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_185110_472896_25DC98D9 
X-CRM114-Status: GOOD (  11.86  )
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

From: Shida Zhang <zhangshida@kylinos.cn>

In a configuration with CONFIG_SCSI_UFS_MEDIATEK set to 'm' and
CONFIG_PM set to 'n', errors occur at compile time:

====
../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_suspend’:
../drivers/ufs/host/ufs-mediatek.c:1621:8: error: implicit declaration of function ‘ufshcd_runtime_suspend’; did you mean ‘ufs_mtk_runtime_suspend’? [-Werror=implicit-function-declaration]
../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_resume’:
../drivers/ufs/host/ufs-mediatek.c:1636:9: error: implicit declaration of function ‘ufshcd_runtime_resume’; did you mean ‘ufs_mtk_runtime_resume’? [-Werror=implicit-function-declaration]
====

This patch fixes these by guarding these functions with CONFIG_PM.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
Changes in v2:
  Guarding these functions with CONFIG_PM instead of selecting the config.

 drivers/ufs/host/ufs-mediatek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 21d9b047539f..73e217260390 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1613,6 +1613,7 @@ static int ufs_mtk_system_resume(struct device *dev)
 }
 #endif
 
+#ifdef CONFIG_PM
 static int ufs_mtk_runtime_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
@@ -1635,6 +1636,7 @@ static int ufs_mtk_runtime_resume(struct device *dev)
 
 	return ufshcd_runtime_resume(dev);
 }
+#endif
 
 static const struct dev_pm_ops ufs_mtk_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,
-- 
2.27.0


