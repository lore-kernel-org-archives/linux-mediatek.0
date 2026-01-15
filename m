Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B898AD3CCB2
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Vky4xlT/KdK6YWVitpVisDdHQI89YOi/CFwhM/gHQU=; b=csb4i7RJxr6RZiEHphumASXtVo
	qzT7iQThWcHlx7G+RRSvPBXA9WZyDUiwEmp8pwYPOXcVdusN/Ozue2CsRoQ/S6m5JlLH3FWiQzlCb
	jZV8lP4tkLCjFbH9Cfpx2SgHgLyGzPJ8/n8iyb49/6VygjaOcQeOTECdVHHNym26i3kQdjto3dxiF
	BaL0eSIYaALWHGkEAPwL5H4d3CYIYBTDd8Sg81pAn0Xn/Z8Km9MIF948jR/FpIY6HbVU1JBwqQYve
	gWSMSH+ZBSuwXVRiXzcPThrOgqpyj5s6uDSu3BHJJXBtDHtxRbVuoPv560KA6szb6ouZXRsjxrZP0
	YI37BnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH2Q-0000000Brmf-48XJ;
	Thu, 15 Jan 2026 06:40:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH2O-0000000Brm2-1l1V
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 06:40:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29f30233d8aso4165385ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 22:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768459255; x=1769064055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vky4xlT/KdK6YWVitpVisDdHQI89YOi/CFwhM/gHQU=;
        b=ZiHTN4SeeY06IxJOLXQ+mSq1p3+BSynKL8uVFZDZQNz8Cf88zWQm0QsPtN0s7v1ds1
         /6eiGE/6aOKMzu9utbQOw5iidxeqZR6n6m6ylDnKUt9g9CyLVRR4KeXsQY5GwAB9oxhD
         HO33bLWvN+7Du6F197iM5ckZwM1Xhu5LSJi/UiLXP5kHqm88HPYAdn6WLu0OlCzmixNF
         ImtTnsfrQSuH1EWXIoyFKCi6YAiK2aHAlkx2yJy9xkJLjvQePCDp+vzNUs0/wq+QJy6L
         rWUp/2GK6bhOW8sFbzG/26w4jHiBnRglRelhEpTgPHSh4RhMCk+EUvZzAr8MAWiZbgkr
         +/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459255; x=1769064055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vky4xlT/KdK6YWVitpVisDdHQI89YOi/CFwhM/gHQU=;
        b=JsV0thhzlteUCo5WPqfIDDuC4Qnv/YckOFEo+TjEUBgepbLt28wadQVZnbVfwFd65y
         iEJNKxa/F+wAUJs//zJXDquMBRlFD61wBAXjbBadOgzcQX2hRvu/6IP88IY8PIAMwDk7
         BsylmG5WHwm6m6Z2uBBizFnvRMckTRnfC1DgfkziHlGRZKC3lUrooq5D78Mv/BzGHlHE
         5fJnkSqFEA0y88RgoNW+0HhRvEOS5yVexM2GIU9ixwZwW6lpsxM54ssA/Ej5vBjhtQRp
         +/80TS/Zhd/EjivFDiwjlZofahpvUf421TzTebrwHixGbOj7svl5PVquc523oMgq49z/
         H82w==
X-Forwarded-Encrypted: i=1; AJvYcCUl39MiVFrgPVPG2c0thc8JYHn1CS2SDwgx87bY4JXE8+59QO9mWtuORpDqZJTn8QkS2NztPOXkAYT5H0083Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo4SQL4NVVQiO8jo6kq2KkBxmXoQ2qH+eSNaZa5U5qjzULLejZ
	CHDINzL9WQxs/lpd0dzDDtIaoqvuuQUfzku8fiCd3whkR+S4QzkKQDdD
X-Gm-Gg: AY/fxX7oCTq18FUWJ30b+65PVTYmt/yC2NhDlEEUVDQXjIAHMC7YrgK5Qa4NgYJ5yL2
	vePCQRrUEgUk9/2Q1k9GYDrMntK6R7fwPtvQNMbfgZg67OP2C2bCadI3Q9DxVGOwhFzSwEJv43x
	RZonA3NbZ/0mdg7cyqUVpcX/XXhyLoUna3QbZCSJtLDjB546kZib3hTv7gRRCzB0415qFBR5onm
	ORAOOSzza1UrLqdPhGrnIyp0x3PWe1QW0XDgn43aW4PzO/TcD0T0DNl4P8elUzKmgpyIS3giyVq
	lZPkQSGYXsY4EqQwI4kdZqhoW3cH0N9ycWMFTS+hPgayyqux0TzCBRmVtTx/HJKqEFxUGzDqNXc
	2hMCdy6p3MK/XcMdxHidOlisd2jjiXfXq32Hs4xkDALloiAmaIZoWBJ0S0Z6d+D8ZNPU8pvAh+F
	ZRxyq96qXTc9FNcB8btYBr
X-Received: by 2002:a17:90b:5211:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3510913ea6dmr4852462a91.31.1768459255024;
        Wed, 14 Jan 2026 22:40:55 -0800 (PST)
Received: from nbai25050028.lan ([2409:4090:807d:4601:85d:6566:6475:3c1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc9e7e824sm24129855a12.30.2026.01.14.22.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:40:54 -0800 (PST)
From: Sayantan Nandy <sayantann11@gmail.com>
To: lorenzo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	sayantan.nandy@airoha.com,
	bread.hsu@airoha.com,
	kuldeep.malik@airoha.com,
	aniket.negi@airoha.com,
	Sayantan Nandy <sayantann11@gmail.com>
Subject: [PATCH] net: airoha_eth: increase max MTU to 9220 for DSA jumbo frame support the industry standard for jumbo frame MTU is 9216 bytes. When using DSA sub-system, an extra 4 byte tag is added to each frame. To allow users to set the standard 9216-byte MTU via ifconfig ,increase AIROHA_MAX_MTU to 9220 bytes (9216+4).
Date: Thu, 15 Jan 2026 12:10:43 +0530
Message-ID: <20260115064043.45589-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_224056_459152_13EBCBF9 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

This change ensures compatibility with common network equipment and jumbo frame configurations.

Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbbc58133364..20e602d61e61 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -21,7 +21,7 @@
 #define AIROHA_MAX_NUM_IRQ_BANKS	4
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
-#define AIROHA_MAX_MTU			9216
+#define AIROHA_MAX_MTU			9220
 #define AIROHA_MAX_PACKET_SIZE		2048
 #define AIROHA_NUM_QOS_CHANNELS		4
 #define AIROHA_NUM_QOS_QUEUES		8
-- 
2.43.0


