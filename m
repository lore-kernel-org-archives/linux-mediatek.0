Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F13C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y6qfhPAy8G5zOKXkzHRwmclNoof4w9jm+4E/34Uladc=; b=qxn0lb8GBjRWIHKYd9+63cBJGY
	WE9BZhKCxS3+tDOn/+6SMW9C+Id0qJJqF4C7OJpJdibo5/x0P8eZ4PaYH5GU0UTpTYaELRTrwZBaD
	sUohgdrjszMPtpeq+w9Lk7T1lqIoYlvBoxuA5Oy6c2nAox446p5TVArIvrXSp++hCUtsUL1gejqXa
	Z1JW7slx0C5R7TTJNIoJCrqVLDZD8065Pky1/Ka9YY5XyURrxUZIDo1pv2hZI8EkS21wx16fkqbES
	NvNeemJ5Lv4Ep5VDZ57HvvnRPDz1A00W+K/luuOcUXD16tCBrCNUo0u1Hh61FnDial74lZzB+5BT7
	+MqOt2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oElUa-000Afu-AF; Fri, 22 Jul 2022 05:46:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oElUP-000AdU-GC; Fri, 22 Jul 2022 05:46:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id x1so1981305plb.3;
        Thu, 21 Jul 2022 22:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6qfhPAy8G5zOKXkzHRwmclNoof4w9jm+4E/34Uladc=;
        b=cHB4LGemLVKSmj7vIqudOT4rb8eK3hifxuVpyTKQObGe1B1OAgzyplRwS9TXdWrrb8
         /PXXHZiWEwPcQyLAxeK5hAmzBDqN319dRuRRvT2ivBEgUZiFoEz9ochiZ7peaHdWUUuw
         weeECXcbp4Nu5QJ5U0VZa+mtSJtS3TjmB4NDTrGEaOYlbc0u4gM6VvsXGAtDyGRsgMkP
         5q6KDvVXJ4nVgat+EkamuciEgFy9rcHlHRe3shVv94oh1D+7F3NjTgL7WPWZt+rYiNJs
         qh3cKNOKFbkwmzZS3M6w4sz1elm/Mk+yWNXRydLELVxlNdzRB/gaNKrbxp/SoVo6+BrU
         mcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6qfhPAy8G5zOKXkzHRwmclNoof4w9jm+4E/34Uladc=;
        b=T0RvmhQJBk5CAnSxY49vTFhgnr4gH+3vu8wdwkuMC4n3RNOLtTwfxeKGl5o3ZjkkfN
         m+Z1PQAgBXPnJ607Dzo9/PpiddYmTChvyCJT3E6vV+CQARrRv8Y8Jm0M38Xk1sxiObh3
         Cjx7SnShMIQzUG99Tc4K60eFGaZjAURhwIrH8hYyfJsz8cN/JG15XxnD7MiNb4l26wf0
         aQmOe/dRzwUDPmWtZm/deDTyrRr2l+FmrFpwanLxXx0s2IX3bXgAyy9uanujg88skBOb
         jCoaUddYhQzg9jsuaW9lGgSDwFdkFif7b++NyGaT94b/6nJu17u7LpPo78mlTjfGXzIZ
         B5mg==
X-Gm-Message-State: AJIora9ZDGmXZtwRi2TPw8HwIV14zvaGLe3jn4hNZiFQsQIj/MhNjTgb
	SbFcwWKDAHgPZj+Fa/YSevE=
X-Google-Smtp-Source: AGRyM1vLyGOb7NwDZ9WM8jk8/cs6v6fEQDmS9jj8M4ss/nc1OZ6VmQuOmkHyzvm2Fl8j85gUE9lVPQ==
X-Received: by 2002:a17:90a:7a8b:b0:1f0:80db:129c with SMTP id q11-20020a17090a7a8b00b001f080db129cmr2232441pjf.209.1658468775865;
        Thu, 21 Jul 2022 22:46:15 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id r5-20020a635145000000b0040dd052ab11sm2532555pgl.58.2022.07.21.22.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 22:46:15 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: [PATCH linux-next] soc: mediatek:fix the compile warning which about svs_resume() and svs_suspend() When the static function are not be used,there gonna be a WARNNING for it. Ignore these  will make the compile to sucess and should not effect any other thing.
Date: Fri, 22 Jul 2022 05:46:09 +0000
Message-Id: <20220722054609.1501177-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_224617_582357_BF5BBA50 
X-CRM114-Status: GOOD (  11.38  )
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Reported-by: Zeal Robot<ye.xingchen@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/soc/mediatek/mtk-svs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index dee8664a12fd..f411fcda8c6d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1478,7 +1478,7 @@ static int svs_start(struct svs_platform *svsp)
 	return 0;
 }
 
-static int svs_suspend(struct device *dev)
+__maybe_unused static int svs_suspend(struct device *dev)
 {
 	struct svs_platform *svsp = dev_get_drvdata(dev);
 	struct svs_bank *svsb;
@@ -1512,7 +1512,7 @@ static int svs_suspend(struct device *dev)
 	return 0;
 }
 
-static int svs_resume(struct device *dev)
+__maybe_unused static int svs_resume(struct device *dev)
 {
 	struct svs_platform *svsp = dev_get_drvdata(dev);
 	int ret;
-- 
2.25.1

