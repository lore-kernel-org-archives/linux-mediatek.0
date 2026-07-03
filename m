Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687B0C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 22:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=; b=m4f+3dsIcrG7QLPjHt9d07SMAF
	/dAplZ3Wm9++SkMfELGwXcE1klwXxRUiz6Ko2Q6ekPQh7XWYAqfAF04Qoa/c04MBko2hVwfPomRBz
	4YsTwG6iKUXBFb04NfHIQIz/vlgPgHsC7sZmqOykpbl8sdSMkCJcEGSf4snLGYDANLY7d2XMh7YCv
	rNBUU0CkpB4pPp0V3fSjyya2ANbNNTnkwysDK/2OIo8iJjMZ7sZ+BUr467D/+9n8st1mj5Q01NK/M
	4T3rpW3G//9RRsNWgaBKS7U07dj7mmMBDvX4GsnmAtJCfmDAWYFkLzDWeRJmnWuHfbrkF/3xOl/Lb
	2+WQpMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflzP-00000007xP1-2Zef;
	Fri, 03 Jul 2026 22:04:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflzN-00000007xOY-1Sce
	for linux-mediatek@bombadil.infradead.org;
	Fri, 03 Jul 2026 22:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=; b=AWDTJrZKQYKyglcYikjim16XFF
	HKv/DMXLBnYU5BtJrfuOtek53J0jTfjOBJgHghSIIDSR4wCueiwz3dk+XAFQIOZ5jiJvWssbQcWsN
	Fpisr8pZj2fl++hCLW8XF8i67qYjAHe3j6nhIGtaC7V0cPiU2/HJg8pms7z7NmVT3LP2T6azmlzV7
	NzyyTd5BbrIyVp8tku4mgJlgQnpdguRyO2HcV96prgh6Ke0CWDhqXCoIzW5H8ig2OFmgqxbL2jUVt
	NjvhSEgpIt7AocFel3InsgNZwI1p5H/POM8spr7u+vFBlcEPrU0MHdS7uhRRgtc2QIMu/TA9oXxVt
	xJEGN/eg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflyb-00000005Ax3-2OsF
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 22:03:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ca11143dbbso7171135ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 15:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783116191; x=1783720991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=;
        b=PaeDU40MrcEetNJL9Ul/Dp4axA0w9tR6HCFjaD4l2yYPwpKfTr+3QV4jUMh+R6oyhT
         RzeL9gIwL+iTB/zFJtr1oAvfrMDhdcF9ERWGcuA3WJHGCa1A78OYCOJrmvuJNSmQ5ba7
         u2VhC8o6Wc6IUoWJ3lk+f9aCzyTo0eEVvFYV1NiPXrZPb1lMkdzQBypLvbluJqOhzqLB
         wwHJ290uZD7l4w+b8uJeZo9Z4eIMrbSv3gDi2JRdFed1V5kHEoFZA5sO72a7zKVXJA8m
         Xk5HlXgNh3q3fPU4CXcZ8hn539rYgGzTH941a6aizKNvs72dvkhYYACGgR6Fbq0IwMT4
         fFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783116191; x=1783720991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=;
        b=TGEHulRmwvzQq0GeLJ02/cFle7sFz1vZUk+jRsM229xAUVspZGt3j4Fx7VrYtdHWOD
         DJMJG43oEag9vnmKcGcZtuwlwzvNcPG1FC8C79RySmfIbsHPh8OaSCfDwZ4NhSPojqT6
         J0JfItIeCswKPwam6kqzTukTe8lAUqxV24WjvYznpuY/SmzVU3OT8NwWFyl3+ey+OapU
         6yIiwspwD5ytW1tEOEcvFxFxQ5FQKUNEDJOfv7555cIn6Ldbx4Y/LG9PrD75Q0aNBkPO
         XzCJKW4lumo+9ZSfkQxUx4OcF73qID/UkjGGNezM/Q0DFTrW4VOos9yJ4LeGSmWXFLnX
         x9Tw==
X-Forwarded-Encrypted: i=1; AHgh+Rqgw5Yz1KBOQrA9xwL1npSI0npKW7EpGbgl07QQay3Vn3tMK1ipKND4vPgYyLw05jV6s02Pwwquuq8UmzjUgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLCScni6pwxS9zFvMz4fAs1eHga9ZgoW7lmkfr+kx2mcZ4IAs2
	Koa6ob2d+th+1PtHfnTNHFljGpie8osW9EQcl4q4NMxOHVPhEuxeLjJy
X-Gm-Gg: AfdE7cmdFt9ur6lX/AJy0h2Lx17CSYn9wI04iz0uw5E6P8rPY9qZbhKmY6aAIf1Vzpu
	o0Cq9r3J5cCd93fnrXQoVucSfH7zoSwVrHDpKdKkCjsM5Z7KOmtLQo2zm5U/Rc8NVttg2GALLL6
	77/aULDWMqkwveAD4ky1tvAkuq0ychLcDWtj+AeKcuIHvEPUvTfsdzZ76eJGv1fa0vNsg6zTaQg
	/XI+prmSNdBjT7JBcD80/9j87T4wjhwcsCU9jGBafA08+j4Z12bGGCqCVOdF7YqHzBTUppyZMfF
	M4Ug4hancum3pxdYoBPhma/3U7csVCe/4kHBNkzLQwLIgAHUKttNelxvupY9di2w2obUXhuEWJb
	XX8DznBqCgJ6Mc44FSLzcSZfV04zuejajAvz/bkGbUGW7nzz6OmOk3Y/MAy4TiXbVcwflUlnb4P
	DO9UOrP5hHn8mbxoCAAl6Goagu7Z0+hyE0HBRmV7QnKF3doq7vumJsjAoLA8qXi3pW5pUv0oAsl
	R93tPIKQg==
X-Received: by 2002:a17:903:3bcb:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cbb9ec70a6mr8823645ad.35.1783116190489;
        Fri, 03 Jul 2026 15:03:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77657cbsm14598455ad.47.2026.07.03.15.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 15:03:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] usb: mtu3: allocate phys with ssusb
Date: Fri,  3 Jul 2026 15:03:08 -0700
Message-ID: <20260703220308.294247-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_230353_215255_9E972882 
X-CRM114-Status: GOOD (  14.10  )
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

Use a flexible array member to combine allocations. Slightly more
efficient to have a single allocation like this.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add max() call to prevent negative values.
 drivers/usb/mtu3/mtu3.h      |  2 +-
 drivers/usb/mtu3/mtu3_plat.c | 19 +++++++------------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..d71849388602 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -252,7 +252,6 @@ struct ssusb_mtk {
 	struct mtu3 *u3d;
 	void __iomem *mac_base;
 	void __iomem *ippc_base;
-	struct phy **phys;
 	int num_phys;
 	int wakeup_irq;
 	/* common power & clock */
@@ -272,6 +271,7 @@ struct ssusb_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+	struct phy *phys[] __counted_by(num_phys);
 };
 
 /**
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..afb01b76e1d7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -240,17 +240,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	if (ret)
 		return ret;
 
-	ssusb->num_phys = of_count_phandle_with_args(node,
-			"phys", "#phy-cells");
-	if (ssusb->num_phys > 0) {
-		ssusb->phys = devm_kcalloc(dev, ssusb->num_phys,
-					sizeof(*ssusb->phys), GFP_KERNEL);
-		if (!ssusb->phys)
-			return -ENOMEM;
-	} else {
-		ssusb->num_phys = 0;
-	}
-
 	for (i = 0; i < ssusb->num_phys; i++) {
 		ssusb->phys[i] = devm_of_phy_get_by_index(dev, node, i);
 		if (IS_ERR(ssusb->phys[i])) {
@@ -330,12 +319,18 @@ static int mtu3_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ssusb_mtk *ssusb;
 	int ret = -ENOMEM;
+	int num_phys;
 
+	num_phys = of_count_phandle_with_args(dev->of_node,
+			"phys", "#phy-cells");
+	num_phys = max(0, num_phys);
 	/* all elements are set to ZERO as default value */
-	ssusb = devm_kzalloc(dev, sizeof(*ssusb), GFP_KERNEL);
+	ssusb = devm_kzalloc(dev, struct_size(ssusb, phys, num_phys), GFP_KERNEL);
 	if (!ssusb)
 		return -ENOMEM;
 
+	ssusb->num_phys = num_phys;
+
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "No suitable DMA config available\n");
-- 
2.55.0


