Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F4C197A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=27pW7hTiWecL2f2LbiVXnCeF3dvp7e3AsOLYkKstg8A=; b=ICm4up32WqTIXMUCtt4qi4+Mjs
	y82l3UbWuECyktbHKDhqS0uzbtn1t5Z0WLqe7rMDcYZ1bPu6Xp6dF88jFodG/ZW2GD7nJsnD4A9hM
	e4TryJarQMbzxSUpZJqAc+EagwtrJMB9P1wFfBbG+mg74Tw49rglK7yK0IPId2QQnrvSJNG1gLhtY
	lupLebHAM0GAG5AEysjjQD4yARSafmBJvSsGul+G10B8DurEr3h9o6OeGp6Iu7DZut0xmkB4hLoIu
	DKN7g2G8xI1djqj1wfZi5O7dVsPvuAPl0O7cjON6bbeJ4/ip8rG09txxpe2rCnxgMrvYXe57vmU/P
	e0JKdOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wEx-006EaE-0E;
	Fri, 17 Nov 2023 10:38:23 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wEs-006EZI-3A;
	Fri, 17 Nov 2023 10:38:20 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so1881055b3a.2;
        Fri, 17 Nov 2023 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700217496; x=1700822296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27pW7hTiWecL2f2LbiVXnCeF3dvp7e3AsOLYkKstg8A=;
        b=AlBxN0JPtgE6Ov0KS+5byqtl29jvuv+hmGFsD7njVTfJJ/Oo0OA0glMTXnArPPBA7a
         2G/mLb1DhTIzFeP8xoRRhN/oYTLQ3OI0p5BLiTrPpW80xmYY1nAylzyC1P7sjl0x/M9C
         ea5aHebyllKYuvNQUd+bQJ1WTaL8C8emDfxB34evXXUYsh1ciQQvbqVDu+ikrLMOme1l
         8dLJdJMySM7yaQ4QPtBDm23+N9uQzakTCl9beyTiT58h3LI9kNzCxTJWjJ80fV7bhh/o
         fOG33S2aOy5xJ9awzDg+bjSkqhgKNwpp+XGDIYlRNddOmtpT35zDQPhMGfbPd0Aep9O5
         jDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217496; x=1700822296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27pW7hTiWecL2f2LbiVXnCeF3dvp7e3AsOLYkKstg8A=;
        b=HSlZ5N1hnweoQeBphc5cPFftrw97Z1JmD8YGFhjBFF6f6hHI79HKwP66bIP9w0ys8I
         lmLRyUmfhzk7iGleI5n303sFf9Ji64C4lpALrDHdIsPwbXY590HQzkOdFBNJJB97VU4k
         PhnrASCqaBgLexdjF40GdOimG3lwyT5nOxj2NAppuNatQozWVS71LCwwK+E5zrXJbNm6
         Pb0GvgnfoMgS3PVsTvi3nlmKPPOCBrnpwkBKvAQkl8HTD+5j4bebxEixPrpm9pvi7K9v
         ngG2VAK/71rg3wLkeWeqmmwym4N6hUD007Y8RQibM33OtkEVFV+q/lWJ9x+qHVjfaufB
         ojLQ==
X-Gm-Message-State: AOJu0Yw1WX2f/Khouq3OM9lznVFpDOU7MLqbyHeCxMP8Yc1Jecv5P1Wf
	xWPcMNv1qYhqnsYMedqd5Q==
X-Google-Smtp-Source: AGHT+IFTBmIJu1gybMvQTbWLwZedY741zRxIHs/g0gYPyRdNG/HkvTy0Wif4joQ7l8KQepIajWCEuQ==
X-Received: by 2002:a05:6a00:6c96:b0:6bd:d884:df00 with SMTP id jc22-20020a056a006c9600b006bdd884df00mr20642946pfb.9.1700217496218;
        Fri, 17 Nov 2023 02:38:16 -0800 (PST)
Received: from localhost.localdomain (111-243-26-65.dynamic-ip.hinet.net. [111.243.26.65])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78445000000b006b76cb6523dsm1148062pfn.165.2023.11.17.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 02:38:15 -0800 (PST)
From: Stanley Jhu <chu.stanley@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chu.stanley@gmail.com,
	Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH v3] scsi: ufs: mediatek: Change the maintainer for MediaTek UFS hooks
Date: Fri, 17 Nov 2023 18:38:10 +0800
Message-Id: <20231117103810.527-1-chu.stanley@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_023819_044047_79548C30 
X-CRM114-Status: GOOD (  10.44  )
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

Change the maintainer of MediaTek UFS hooks to Peter Wang.
In the meantime, Stanley has been assigned as the reviewer.

The original maintainer, Stanley Chu, who can be reached at
stanley.chu@mediatek.com, has left MediaTek,
so please update the email address accordingly.

Cc: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Stanley Jhu <chu.stanley@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be1cbc6c2059..4f6fb3357947 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22102,7 +22102,8 @@ S:	Maintained
 F:	drivers/ufs/host/ufs-exynos*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER MEDIATEK HOOKS
-M:	Stanley Chu <stanley.chu@mediatek.com>
+M:	Peter Wang <peter.wang@mediatek.com>
+R:	Stanley Jhu <chu.stanley@gmail.com>
 L:	linux-scsi@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.34.1


