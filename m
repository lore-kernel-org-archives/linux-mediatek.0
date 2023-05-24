Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4631C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4kbf7t2pjWoddD/1MgzGcuAxsDnlYNa6SWc1ur855+0=; b=vCAuAvs5MYDfwVUV42eUojAySQ
	pk0/sGL5w17uflP/OmjT/urALg63B73PxTGBDxAOZeqCz73GtmNWVIlefCSBk7ipNSqjbt2hfELJa
	RG7/Uutg9f7p3y3QWyXf+oX1LS8MQaiY8CrKBCycX+yvSu6Vl0kvUUUnMaTsV/PmLYUDoi7UeavlG
	XP7W/0TyM1aRevjj+bFYP+8dNUyKTJr2Tu3JRU91aZenFsx5SfeSGkayJPWVekVb7/KTixav5/cg9
	KrVdVPlO9Tz6+gJZq/XvVuUsK6H7Wg/fS//3kyt4WW6z3Okf6P9Rsou+bnz84N4biXE5Rei1ZxwrM
	jSS93F8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qyN-00DwyB-1L;
	Wed, 24 May 2023 16:04:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qyL-00Dwwa-02
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 16:04:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510dabb39aeso2152687a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684944257; x=1687536257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kbf7t2pjWoddD/1MgzGcuAxsDnlYNa6SWc1ur855+0=;
        b=XhD7ZTwRg5hQpPojq8rOyf59MuJ/qo/orICMJ3Gdy+ebzPL5HfD/EeN1LUufBJvXqx
         F3NqMSNuN0EwBtInPwkaUoRzafUTIdptWNJBahQd4rmuhMcAKtiO5iyxhyFcfC/lt0tT
         XXVq3PCg7Buu2pp4JU3L70aThvmQgYfQALjY5hw+Qg2NClu2m/eb5OrmFKMJNyCW1WQw
         8qNacPvJPV7juEugKy4L94KIil10lr5Wv1tEu4PPOFZdG89NO0F9kOD2V7ZM/lcoHfR5
         bp6pJXf20ZKBe7tk7whf2Dwq8FOmr6LHDfFECTrHuzg5uHxDyrXQla5c1cEBcxvTw4AJ
         IHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684944257; x=1687536257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kbf7t2pjWoddD/1MgzGcuAxsDnlYNa6SWc1ur855+0=;
        b=caYoC44RGKfdzXMNOuNDjI2VeWtYMN6gSrEn7bvi44gsqlWxs9eNA8AMZAYFA7qWjL
         IHgj9uq+IH/ER0sHhB5WPWJK1NFAjVAeH2YoRc3XK4jtq46JLCTSCP4xuTLsgNNfSj67
         wrJHyE4fKlh9bx0kdww5U9xtOs//6LNMfrUy1G46/AqnU9W7FOTce95Ze19hVIOOxku3
         whZ1I1AMt6kZs+N9A31ZUVicLuk4QELh/DMYQDwmUqGscciMzDK+u4oxukG/nNDmbhjA
         JmCyULY7IeXjuhlsMlB2XJyDwP2hLzKlw8S9axmmvyheFEqHDRw7DCr3YrZgzrx2oVab
         zTvw==
X-Gm-Message-State: AC+VfDy2IHTKXWZzKKFgBnawgstvXwpiwc/WJiNzQMugajbF8VjgMq+Y
	XFekJW8/13Wd6YCoc8VLHOovZb9e+xQQSw==
X-Google-Smtp-Source: ACHHUZ6C8yNw/UxyHTDYSjn75RxO0AsCVtDKdsK2VfVhCxqyB/r7LKc43zomLnbMqbzBCGTWywoXqA==
X-Received: by 2002:a17:906:eecd:b0:94a:74c9:3611 with SMTP id wu13-20020a170906eecd00b0094a74c93611mr18129346ejb.35.1684944256346;
        Wed, 24 May 2023 09:04:16 -0700 (PDT)
Received: from Osmten.. ([103.84.150.66])
        by smtp.gmail.com with ESMTPSA id gw17-20020a170906f15100b0096f78953b77sm6025576ejb.147.2023.05.24.09.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 09:04:16 -0700 (PDT)
From: Osama Muhammad <osmtendev@gmail.com>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	lorenzo@kernel.org,
	shayne.chen@mediatek.com,
	davem@davemloft.net
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Osama Muhammad <osmtendev@gmail.com>
Subject: [PATCH] debugfs.c: Fix error checking for debugfs_create_dir
Date: Wed, 24 May 2023 21:03:52 +0500
Message-Id: <20230524160352.19704-1-osmtendev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_090421_045948_8A1A122F 
X-CRM114-Status: UNSURE (   9.92  )
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

This patch fixes the error checking in debugfs.c in
debugfs_create_dir. The correct way to check if an error occurred
is using 'IS_ERR' inline function.

Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/wireless/mediatek/mt76/debugfs.c
index 57fbcc83e074..d9ba700131fd 100644
--- a/drivers/net/wireless/mediatek/mt76/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
@@ -109,7 +109,7 @@ mt76_register_debugfs_fops(struct mt76_phy *phy,
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("mt76", phy->hw->wiphy->debugfsdir);
-	if (!dir)
+	if (IS_ERR(dir))
 		return NULL;
 
 	debugfs_create_u8("led_pin", 0600, dir, &phy->leds.pin);
-- 
2.34.1


