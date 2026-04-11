Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58D8F45A12
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2026 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwxR3TEzggrqwnYhCtbksF3x2HjY5X8G0vLpnWNk5pY=; b=28/u8/dLS5u/ZojyBoQxN1KwQ1
	KHXpb4fMbNc/b2GMGqtjOT1PO8hzV/vg1RdHRpqiZXg8sVQPZ5D2QdaxcqBAlQ3iAJJaZ26q98fbF
	44LFhUxfX6tlCmRfTo3UAGBeuzRQwWlWWXF0tamZkXpoa09sRNG+H042cLNOZ+mqCiBDC+n7wzCFD
	x5cHEnsgOKYT8amQQOaDDBy37N5/UUylVqO68/qPmHC4oAbEkPf+UMwfAsAhl7IZIBMUBiGS4mw9c
	8kaHmvCiuU7WnuzUbiUMXCmW9j9wOpsvJoeHG3KKt7XAaoOz7Jww967GqDG14L6IpHy9pImNMpZlq
	XOjDpEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBPTl-0000000D77b-29nS;
	Sat, 11 Apr 2026 03:57:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBPTj-0000000D76x-1e16
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Apr 2026 03:57:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f22f6b0feso54471b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 20:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775879870; x=1776484670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwxR3TEzggrqwnYhCtbksF3x2HjY5X8G0vLpnWNk5pY=;
        b=A7dOWKtPZzoD9fgmyfbQ7ZaGUfX+7OkOikfvhSCFboJl/+qlMEddVo31cXnMAVZ4ij
         T6d85TdbpQg/+nugHqbF1fn5baqCnaqtJrF472gvokGOIOmYHlwd0h69lcFa68KSiZ/6
         hodw3JPMvup3GXyW0VvlYgNYFEsSw8tSQrfWMZmj1FPbJlSWxmenU9bNe86tTD9qa2HK
         tZnFBsi7bKYso0SFkAXxEQz+nQY48RZIDMe5gzxZPcdeKsd5mzdib68VnClWG9cnheon
         5RTTFMwMgLdZjRC0uPvOCiUDstQLUmN0aecRcG/e2ppOwRumkJ3rJULlJZaEHgBOP39d
         oNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775879870; x=1776484670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwxR3TEzggrqwnYhCtbksF3x2HjY5X8G0vLpnWNk5pY=;
        b=MPawIcEmN92zvKyQk4R69SSa++gaFxqisUcuRgPpxVpPHog1ZcD9BvQAuKY+2fWz3q
         3mfUOI3LYMEDU7yDLTbft6fSz6zcqo4HGG51SJ/slHvKwcjhCrXfnmuNlc8x1vML/B+P
         vQ2aGtH4acJsv8RF1uU1Z871SO6Ma3wcVt3w8ADitkff8S8D6i9gkqN2XVG1b4oJtLyE
         0g4SWMSd5Sg4G1dG7Gawy10NhfdhZ7KkrkldCCN2zmgXwY0w8EBt+1EsIGFHtafPKi2d
         BY1hn7qQwwOfUlorCWuupZiE7NZLRfHH7eHszBtolQQD2tpbnIei8hPjA2o9W4fZn94w
         70uA==
X-Forwarded-Encrypted: i=1; AJvYcCX+tG7+NqJeGhF7RfmCBqnDZCvfnYYmylALwPObhWb412ELopZbAoXeGKdnfe0il02bMz7YpdYOQccXPjTJpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+IWu2xjwEjvH+7pVDUUTugweNH0nxV9Eoj4U3rQqrkxDDsWGZ
	6T1yhio8f5aXsDU+RLs0leLzMFkFi1jiIZkGoQV2cQwJgOs8k6wXd+qF
X-Gm-Gg: AeBDievZi12glPQKkz4r6FROTVb5vqO4fDy/cNwLD5T56kuHlsMVWqeHtpMjRNmV+sb
	lnImlbLn1dskQm1xBxxKSSYwo+4Q9vrUyTYtEDk5s0N+Cck9KUUANjazqBJBXIa4D+GHcNe7BvJ
	ZkraAqKnQo16H7O13y9BC4p+z3XSMT3D/HZ5fUjkRlbQ5Q+vW2JGODe401Oj1OT7FbL9spt1Jy1
	LVSgYersg43ZiWORHQYeh/g3hg5e5lkSA/Gybtq2TP2n0YzIg1bpC9TcIEzHDiUiE8932qIiXL4
	EslyN7XYh5xQ69Gcf5sYl6G54F/b69iKGLXVHdZHZAPLwONh99ZQGyPP6tQ7kNvptky8rIwbrw3
	dhwha8QC4kZEuoe25y8ogG+iX0Jqg67T0h2QayaDixQpeL0PHL5g0zcWlVbLRCvDyk7EbJ8Sa9Z
	TetEy5NgpebNEnWpHexf9FDSW9+PIQpPgNhRIgMilClfKDHQpMg3wUqik=
X-Received: by 2002:a05:6a20:3d12:b0:39c:bf48:11db with SMTP id adf61e73a8af0-39fe3f3d83cmr6340981637.38.1775879869733;
        Fri, 10 Apr 2026 20:57:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216fff97sm3986596a12.7.2026.04.10.20.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 20:57:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: mtu3: allocate phys with ssusb
Date: Fri, 10 Apr 2026 20:57:31 -0700
Message-ID: <20260411035731.163580-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_205751_440947_4107FD52 
X-CRM114-Status: GOOD (  14.13  )
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

Use a flexible array member to combine allocations. Allows removal of a
pointless branch. A size of 0 means phys are not allocated.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      |  2 +-
 drivers/usb/mtu3/mtu3_plat.c | 18 ++++++------------
 2 files changed, 7 insertions(+), 13 deletions(-)

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
index cc8a864dbd63..11a919fc3d47 100644
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
@@ -330,12 +319,17 @@ static int mtu3_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ssusb_mtk *ssusb;
 	int ret = -ENOMEM;
+	int num_phys;
 
+	num_phys = of_count_phandle_with_args(dev->of_node,
+			"phys", "#phy-cells");
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
2.53.0


