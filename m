Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0878DC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lT7KU5u76ZaOabr9iIs8mD/MfFalpxr1uqwCWT7GsWE=; b=j9qS/A5ifGX4vPhVAH02E04qdA
	2zHVhn4mhJVk3Yrp80gCjHstvve4V9en17jI9BHF1ypylhXkLCK0PQqtnI6SX2bOobkd+rh7tAc/0
	6MPq7dWJ/3Ur51v+53R9j6W371ZFG7f4b6i/dbqN0AAVTCstd4uQ3k1HbmZfy2KvBMIJEmEdFm08B
	8ciWpvKDlBB//vxgbMc4Zw5gJm0NkCnXJXl4KkN38Eaotun73dnxpdgL9U9EDWBdznaFxRLMKyP/2
	yCoYJ3wUuDYd+Gnln2rWkPvN3fnKW9nTGGl0uRNye3EFR7VWJgaGR4huXFYC3qfM20cLZtY/q6gCO
	NVZte73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQye-007c8V-Im; Tue, 21 Feb 2023 11:38:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQyT-007c3e-Cg; Tue, 21 Feb 2023 11:38:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id b20so3000915pfo.6;
        Tue, 21 Feb 2023 03:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lT7KU5u76ZaOabr9iIs8mD/MfFalpxr1uqwCWT7GsWE=;
        b=DtOruHx3pwisbupRIpkcPOrfCZ0HJk0zQFJami8KqDQdWt6QGmW32vbL8zks+tgH+j
         rIH7qXFbdb9xKCvxTRj59+GcZE34yBDEKTr5oUNyUNGOC7mcQ5npCjrKWi9h94AFKboq
         i/Ki9bRUvScPtdDUh7RO92kkywdGWtTn+UtuwKXFgf0Nl4Sdiax9dopyp0woXR0a9lqQ
         P5T4Pk827cmfgFwRVcuBLkaZSHjaE0DuQo79KhwDWag7UZtIaaj6N6xsW0Df8ionCT2O
         aS/TY/UHRHvI5qp1Y7ljznLiR3b/kp3G+7b4CWHenVQ8ou0cQz/OeV1QvFaeQc8xP4NS
         S8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lT7KU5u76ZaOabr9iIs8mD/MfFalpxr1uqwCWT7GsWE=;
        b=VM++wM/J3qCmcy91EX24zOIQnnUcKqnZ2El8uXH0hnUyEO7TiS/bNVAr1uB10o/LuX
         MSwUZRjjkx+L22lmNXHG2TmtAmo8fHmYL1bkS+QUa9OtpxhC2UPQhqQroKwNQR2QzdPV
         gUCGJ2St8jq335jrCy0GIBkvbmshKl+D46TeeXzfVqqXgpqZbnlRSeyZdz+LSxClwSks
         AodT8XtTMRL3CxofB7n4bHyPqYSuMLmVUL3l+wJNkIYkRspavUKlajElFij+M12Ybnqd
         AsEzulQ9JoYZ46CmSR8bQ93SBOEV6pzjLqFed/QrtWaFcvW98JgwX5lvBfPSX2qFseJ/
         NIVg==
X-Gm-Message-State: AO0yUKUC6fzkDrpyG+1FOr8qylSrm+srTyCavum70J3p/p9J+HXs/dGo
	koQrMDbV6lLEmKG+l/6His0=
X-Google-Smtp-Source: AK7set8p7ToYqsJam5Lf7cxvXqufRwjHDrXEX/ApOQ9jClAkopI136jo6KH9h7VVVtIbZIFjrozQjw==
X-Received: by 2002:a62:5290:0:b0:596:15de:ea1e with SMTP id g138-20020a625290000000b0059615deea1emr4845938pfb.9.1676979497577;
        Tue, 21 Feb 2023 03:38:17 -0800 (PST)
Received: from localhost.localdomain ([2407:cdc0:ace7:f724:6709:5adc:1970:16fc])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b005825b8e0540sm9357758pff.204.2023.02.21.03.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:38:17 -0800 (PST)
From: Stephen Zhang <starzhangzsd@gmail.com>
X-Google-Original-From: Stephen Zhang <zhangshida@kylinos.cn>
To: stanley.chu@mediatek.com,
	martin.petersen@oracle.com,
	jejb@linux.ibm.com,
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
	k2ci <kernel-bot@kylinos.cn>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v3] scsi: ufs: mediatek: Guard runtime PM functions
Date: Tue, 21 Feb 2023 19:38:08 +0800
Message-Id: <20230221113808.1050790-1-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_033821_450516_CA6533BF 
X-CRM114-Status: GOOD (  11.73  )
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

Fix these errors by guarding the runtime PM functions with CONFIG_PM.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changes in v3
  Reword the subject and the commit message.
Changes in v2:
  Guard these functions with CONFIG_PM instead of selecting it.

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
2.25.1


