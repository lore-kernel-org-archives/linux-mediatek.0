Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019BCC072A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 03:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=svtH6nB/hE04ntCGkIVPHKITT9cDPQUxSxeC2R+EmoI=; b=cBmEZGT9g6z+VwZM4jblTMzV83
	OwBZNoL4GEPd5ea5crkfbAfGdobmQAtN2zlqa0UF9NarVBiFQt2wQr/zcEdkvWwtH9tGR4/uWFzU3
	lB2O0xLH4SpQ/le1jIF3eHywRrnMDaHYcSI23IbGQjciZtRNurfjVYvjh89u2nhS+Xk8ObywRy69j
	5chjHepD8dPcZeOUAyoC8WOZDeleTnPcHhgTtp4Nr5gJZ4BZcxokiE7aCVxPC2R1WeLfj23gf+1KP
	8WQ6eXPXIa1k7abq34P9tBPQDmH50oPjZw0QbuJbrJF4d/zMNGFApNRYHNh5rd2e2eb28tFGryWJ6
	GrEvmS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SdJ-002Hdd-2G;
	Thu, 16 Nov 2023 03:01:33 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SdG-002Hcu-1m;
	Thu, 16 Nov 2023 03:01:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so3373725ad.0;
        Wed, 15 Nov 2023 19:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700103690; x=1700708490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svtH6nB/hE04ntCGkIVPHKITT9cDPQUxSxeC2R+EmoI=;
        b=WPKs4W64EfyGaJD9ObqPDESLpy8IFPlPc4n40yP/ONqzjv3ZRKmeMjQfe1QcM9HRWS
         Cs7zSaltUdx5MtK07NKDO2CVzjFhuSUh5oamq0q3xruZS/YT+36saVZ3VSKp+oANIeLI
         rRizlR8JUjRzBXj1eRMU1QetLQL0nkXNZ4jRZLvde/QnxWwRdcgygjixFXXe7O7eRWaL
         92y6pgYwL62eUDZqo25zGy0k2ExPEvPruu/xFTh85RPB9rSXDb4MuqfGNfGXX0xGlQeV
         if7JlqQSqOJQJfTkEKVC9UkXp5HUhTQSPtwYJRPXtuUPPvl1WCPA8DMscmUMPsQm39+p
         +oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700103690; x=1700708490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svtH6nB/hE04ntCGkIVPHKITT9cDPQUxSxeC2R+EmoI=;
        b=nYepD00LmPP+Gbkw1B93DFrUXgvGmKT7HGi52446Zcu39HpR4k3hggbaHnWb+XHkXp
         lTltfzDXMDp1lMYVR5a6MCFrj2a0pFfdZHjI3hzYd/ohH9Rbi5GuvgKAkmLEg9IAWzCY
         eaUOChjnJzJSOgEB/Z6KqMdam7Q8CfyLCvFRMcMDK7nZ7dPrbWm19o3H1vLJCuJYWj6Z
         /bJAH3NpUZih/7Lxv+PywzD0Ctb87AhT92yZrmC/mDQl+ZibS/t1FvhEe+lKsRseEnah
         o+hlm/FwLXg9YCwY92C36U+zkT5jRW8ZKU6MC/QWfSOHo8q7twHuqL/huaKkcJqfXHRz
         QfTw==
X-Gm-Message-State: AOJu0Yy3cESKTjwyVaxQWToQrVcxt/WZYbImlgJFJPov68LV9eh5m8Ny
	XpHGAR9GoJ2qACqvJNuw2g==
X-Google-Smtp-Source: AGHT+IGA8rCm7EkqiGzRZiCcdTHu7i5Qme8uVH6OChuTUt3GWx2CHaOCiu13+3T6Uw/uUTdtNHCCXg==
X-Received: by 2002:a17:903:1cd:b0:1ca:abd:1c1a with SMTP id e13-20020a17090301cd00b001ca0abd1c1amr9110647plh.61.1700103689606;
        Wed, 15 Nov 2023 19:01:29 -0800 (PST)
Received: from localhost.localdomain (111-243-26-65.dynamic-ip.hinet.net. [111.243.26.65])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm8058322plx.281.2023.11.15.19.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 19:01:29 -0800 (PST)
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
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chu.stanley@gmail.com
Subject: [PATCH v2] scsi: ufs: mediatek: Change the maintainer for MediaTek UFS hooks
Date: Thu, 16 Nov 2023 11:01:23 +0800
Message-Id: <20231116030123.10820-1-chu.stanley@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_190130_616393_FCA4E526 
X-CRM114-Status: GOOD (  10.47  )
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


