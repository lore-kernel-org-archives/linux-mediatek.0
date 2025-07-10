Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203EAC83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=; b=nGyzktABsAN+LCZ04xx/NFkXVv
	4qhb1VlfMwwro1Iz0BFPIqcQtu+soSmd0KbAL6uFdchoiqenh1mnV64679Bbz6xi1yvlOOs/pm9N1
	iXwPE62YQexqHFxm66R+996oiboo0C85UpzzNT8LYWa1UqLn18otqxEwcYGO+02XgifcgEG9aCO3q
	HRiq5ncAX0L3wQ3B3Cz3GMPr8NunGgoLnvz8usXLYYaeq5fxrXyQ2IrdjKmfYHkAEa1cYzQmWq15b
	Pu1EcNj0JvcahI/Di4i7ErG+fdAvjmAkEy7tWvmcf4Chbhb7TDUw/S+rM7u0agnFnWNhOdDsVl3Si
	LcHUxeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw3e-0000000CiMA-3xgL;
	Thu, 10 Jul 2025 18:31:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtqQ-0000000CMhE-2Z6f
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
	b=WVfWDZsVYJinTfVjB5wOiPSoUoifM0ej1UblIAevhaPJITtXPb+IXu5P/KyH82tXK1Svzw
	q62NlNAywG8TiXbQxY5Y2iI4xY40Lura9B8mXR9KmBnGUtynpPcGD1nHqVDbHwefWjhKkj
	1EZjKWLi7IcmyhclSzn9B/QMa0xF5JE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-DGKp82hfNgSE-cYZMQXjZQ-1; Thu, 10 Jul 2025 12:08:32 -0400
X-MC-Unique: DGKp82hfNgSE-cYZMQXjZQ-1
X-Mimecast-MFC-AGG-ID: DGKp82hfNgSE-cYZMQXjZQ_1752163712
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7048ed0751fso24494646d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163711; x=1752768511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
        b=PPV8h2SZ5mf8amZuqAtQgPQwLKNHbmjPN6bvZ12ic1sksSiChOH3jhg+t+wqi06KLp
         fJuorTqpkk3ls6Kk7kDl8V4rdqhEtiUqUwgyIg5lgiwr/FZsWq4CqfVkz2LbYE2YyKt0
         eMBZ2iedLNkhnHBjfhEBUFVFD5EKB0DUVZh964pq+1yb8rMvtMaYMCM5NMK2JY1PhUZ+
         zXm6DgxnxoPI7AkJ1eKa50yfK+6v0brOT5+bKVqWXhhwjFE3JOB1vATEXebu8cGSs9nX
         N/FkwSe82wzu/mgC/cKYuMQU026FhKnfODEs3onT3XzldPZBWIjW5Hj9NjtUUjM1fLXv
         uUsw==
X-Forwarded-Encrypted: i=1; AJvYcCX5d5yeiMWJROXAQ7qw2hQA/lJVpQ/lJzttUxxGEmgluMZ1tQIu/YVjYoxs6s47HCLUwnPQ9tRp67Gw/q9cMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNxdJvvmyY1NsSEVGoPoh0qT/gVurFr+2wbA0yDMLt/3JF+vd+
	0vnpDrEfhgPRNADsBuJnGsBAMoqV5RKW3sZgezz10a/Z9Xv+6EfDgTUiB4WqY2J7JiLl8p4kCkj
	rvS1rE7ArJhXXphCgj/04LP+/y3vPsKEeR37OBJ+fZ3BD9EcgNA2/G6ZkRqjEQjvPmE+B81OGA4
	0ct1ApRA==
X-Gm-Gg: ASbGncuWPik8Ccg/JVrFv2o4f+MlYrgJdjGFSn/odxwSjCGcezICR1ZRCgQS3E+DRFh
	DKRQvcU2gcmTHA0sTNfUrXgC6bEHmjVVUt64Nmuq0hlMsIENcbfMcAWVk6U5QSGnL0LP9Jm+5OO
	dhNlq7z8Y8VbqbbsZ86DefYkxy5BfsxwpowX/pb0ehubPBj/CeBR2pIiJ2EdaxCkBKxEv7O+tZ6
	+sTXmSH4/IS+wCYVcWLAuSKFRix7e6ccY8WI4WPipe2bf9MxYh8mH0grIyh+D6uvIEofXsS5PdO
	iBd55SYtBJqA+uDB4iJgBUyCA1TdLTp49ZZSBXMrJHgF2nEJTfItDO2kHUVC
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id 6a1803df08f44-704981edb41mr38252276d6.33.1752163711101;
        Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlqOGrQN8krksQLxHGl7XCXnHCMvXuYKuTeyW1zhM5hweEhYitnN6UMrP83jETXzN/T64C2g==
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id 6a1803df08f44-704981edb41mr38251666d6.33.1752163710538;
        Thu, 10 Jul 2025 09:08:30 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:19 -0400
Subject: [PATCH 9/9] phy: ti: phy-j721e-wiz: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-9-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1629;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=pMJI6s5tTYu1BzJU7vvw5Y0iwaNTd3NH6yMHjsN8/cM=;
 b=0nPrE2c6cl5ohekNJUp1MPpsItdutqAcWnGrmBosgKM0YvNyBYPz4zo1bZfpAq6S3ivaSbkgi
 TWd7oICIP84Cvj784x11Hev/+JYsi8/Mx0kVOHPtXnwdacpkl9MVEHt
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C8XegGdJtTSPE4qcpjGCVsJU9Fn1tos2tq9if8m3_Bc_1752163712
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090958_721594_7DB71586 
X-CRM114-Status: GOOD (  11.64  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ab2a4f2c0a5bf3aa4b77045f4da8b0ddcc079f7a..12dafb2bd49bc33c13dd49246bc26df082e3dd40 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.50.0


