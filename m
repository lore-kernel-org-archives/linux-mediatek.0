Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFv4iJV8YzBc+vTOj4SmxpIx7jMyls0d4nfR9RPj2p0=; b=I/SaT891vAsf8p
	WOwLBd6JEkHcyiRXT6o5eMSZ9jAxrFqWfBH9Si6LHIYdtzSfewW2FSmrq902cgTGxZeOWmVUOQAWe
	7ypA/W9yEu1pRr3UIjyY/Ad6UXCXcoUxqKc5i1yxekwC4WJyVylw+RLJDDbN739mlcSg03yfGh6vp
	Q0n8oUNuS1tKeEZktDcaJ4GGMDD1h0S2Zp0ilzDLU+Wvf1QL6nE4e2teV0wzeRFip2sBPNN71Kfi+
	JWge/aEXdAQPUQEfl4Y1HpG09q35b10UmmyiBbsLUxmd833hx6L1/KkSekFRGUEmLHNsfTAOJ3Jxl
	acuZxqM8WOQWMWWupXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLfS-00En5E-1Y; Tue, 26 Apr 2022 13:55:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdE-00EluC-MS
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 129so1552306wmz.0
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7C9NN9G3/VfFHK1hDC66w+I6RP44XESXFga9fGsvyQ=;
 b=tvheqM8129dHvRZRBu7eeqqeRCM5zcWIoyp0MYoLVisR2OMbV/2v283zxjT66rouye
 5avtcvaH1yVKGh15dLNfmXNusMYxJ7mg1wJP9YPUjf/JBKol92NH0gKtznk9VC7U0EHQ
 ZUpIsqQ87rA04mqnsXj8oO+DUAZUDlBBS+5C3dE7K5ecyOVx1gztKy9lZnCuTQ+3Ycrr
 +mWdc13Bo1NsQmPmH26x6IYKM9ttZJNOfWy6g2/rl1nwE7flvbB37anBZuwswHt/9ILT
 XRrcN27MzUu8wcjBCBiEEwA5B6dmJiRDEO+L+x0rvKESJVNUzyDSTjS3XG9eQ1Ut+i50
 2kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7C9NN9G3/VfFHK1hDC66w+I6RP44XESXFga9fGsvyQ=;
 b=Wf/HRkUvdOZGUP9DVLUO00hH2Q/vIte7GY2FzBpUnLVJFpr6FNX6FkkUb10FeNMGan
 +so5fJJ57i6k+18rfIaYRQ+ucmGuex7IQz1JRUqgT1kjpi3DG9RKHRR1RlAb92aiCV4q
 bUNO1mNkreo6JbRkIEmAn4VDVq0CnZmXPAzSWzK+j1sWUb476SfavlZFYfH2qjan92xR
 0yKs7e938KQT4EV5CQEQiobHj6k9P2pQpcpvKyWWdun5HfNcxRQXH9WmqrT7yEOKp31Y
 2zGSHkIsWwPQ8uJZizjBNWXmyXX/P3qVOBYVMElnKuu5eNaJt9kpjgp1Khw+7uupuk7n
 S9jw==
X-Gm-Message-State: AOAM533Qnz9YG20Blh4GUeMyWRlXvJc2GZ9Yu/yNlethJUDwIXaNVh13
 VSPrGWOcajKIbUfzLn3fxX/k8w==
X-Google-Smtp-Source: ABdhPJw0ZGVy+y/bwlTwEjpHrS4+Dbi7BbtJsqhdkSs7+FHhkoD0AQ/BVfojKRZ5IKflw2xirTOtSg==
X-Received: by 2002:a7b:c84f:0:b0:393:e729:e670 with SMTP id
 c15-20020a7bc84f000000b00393e729e670mr13275808wml.153.1650981209590; 
 Tue, 26 Apr 2022 06:53:29 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:29 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] mfd: add missing defines necessary for mtk-pmic-keys
 support
Date: Tue, 26 Apr 2022 15:53:07 +0200
Message-Id: <20220426135313.245466-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065332_775780_92241000 
X-CRM114-Status: GOOD (  10.13  )
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

Add 2 missing MT6359 registers that are needed to implement
the keyboard driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 include/linux/mfd/mt6359/registers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/mt6359/registers.h b/include/linux/mfd/mt6359/registers.h
index 2135c9695918..2a4394a27b1c 100644
--- a/include/linux/mfd/mt6359/registers.h
+++ b/include/linux/mfd/mt6359/registers.h
@@ -8,6 +8,8 @@
 
 /* PMIC Registers */
 #define MT6359_SWCID                         0xa
+#define MT6359_TOPSTATUS                     0x2a
+#define MT6359_TOP_RST_MISC                  0x14c
 #define MT6359_MISC_TOP_INT_CON0             0x188
 #define MT6359_MISC_TOP_INT_STATUS0          0x194
 #define MT6359_TOP_INT_STATUS0               0x19e
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
