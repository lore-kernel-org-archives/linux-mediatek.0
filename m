Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B712C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 01:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zlWnN+T/+P3jkauzsUZJNNYSjnJMbVVaTLVlrIVd5lQ=; b=sJD8yb0irngvirWfiBK2fNXTOe
	1Ng+idWP1WGLBud04AziQOns8lApvOXRKNcwFfLFPUpAc4c2X/k0BpCQOeWqi7F6gGAU+cK3/JU1J
	fJgr5HlEpVy1ZxNF9L6gy2LRhkSmDBANaeoqk/moQmWNqgbU8vibqwPS8ewjfIsH+ajQjW3iY8M0y
	gICLYhaQhoatYQvFBds9JLxQZJWhmn9KHLxhMSh45fh3LMT8ipU8dlbRyflQuA/DZpy6BEoPBNrt6
	ky8DBzSYPK67QmSgrYByAw8I7nWhmel8OHR3l9CpFfKjaeEYjUqh4FTMV40NINU86wnuToBBYUv2y
	+BEovC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNO5G-00E1rh-Gc; Thu, 02 Feb 2023 01:08:14 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNO54-00E1pS-1l; Thu, 02 Feb 2023 01:08:04 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VaiLLe-_1675300072;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VaiLLe-_1675300072)
          by smtp.aliyun-inc.com;
          Thu, 02 Feb 2023 09:07:52 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] clk: mediatek: clk-mtk: Remove unneeded semicolon
Date: Thu,  2 Feb 2023 09:07:50 +0800
Message-Id: <20230202010750.79515-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_170802_290793_D998C869 
X-CRM114-Status: UNSURE (   8.23  )
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

./drivers/clk/mediatek/clk-mtk.c:518:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3926
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index c90c0a6b501b..14e8b64a32a3 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -515,7 +515,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 					   mcd->clk_lock, clk_data);
 		if (r)
 			goto unregister_factors;
-	};
+	}
 
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
-- 
2.20.1.7.g153144c


