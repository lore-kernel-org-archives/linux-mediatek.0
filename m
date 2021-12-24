Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EpqLynaBPxxWGLkSXlw36khs9+XHhf2bFkmRteE6LeM=; b=nEJJKA0Pj/6m+b
	x09RidteOZ+LBKpPcuPf7q+6RpHo48kg5q2CfWxu637Y/8zDZX6r4jczq1wX/k6wjx63JDkDQlENt
	QIDuy6TxA9cbfU/eejDxV/Wm4hdih0FsYBZnlVlAdbEz/7hpZzuxZW6mDDnJ7uQyX/0H4H4+ifhgE
	Eycxwi4FkWwaz71yfh9Rs0imgtM16xDtVt5NDpOPAbymn/paMePSBKTXiU45XcD7C8r94SZEUSRt1
	GBICMK6L07siSunLXm/er38bkoAl1hoLOTMEACUF2NYXbQvdLrvV5nY3mEYDLAEA993RSZ2ivW3zQ
	2foZvuUZJORxHjc6IJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0fpB-00Dv9R-9j; Fri, 24 Dec 2021 08:21:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0fp8-00Dv90-Lw; Fri, 24 Dec 2021 08:21:11 +0000
Received: by mail-pf1-x42b.google.com with SMTP id b22so7267995pfb.5;
 Fri, 24 Dec 2021 00:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=a8eS3YXB3+KjJDuEPWQLcX+HJOufYQaI4qZVeMqQu9o=;
 b=gVjzFGHhAzx0/FUF5skx3OxxeTTS/L9yKIQQQDnqhIZGkFRxiGa2wyabresrry4kWd
 CtI69HZxWPmRaSHjtcwKk6Q6EKwjGrBTWXcEBu7c+OD7pypxBMyH2FkmQJKmxZCnOSuj
 eK7RW2qAdPtabB5ZdSMiFKaEcqG/oWTd8+JvDszUPszMDGWYQA6OAytx6VjAFNeBaXxz
 PD2oQBN9J3LadXx+/u64o+X6GN3J4URkZvhWk6TnncvA4t2MCcJ4FceeY6M+6MhalsIN
 H6LP6F423xptsq7JxCfcXYRXeZSbg7NbKnnzeEIoi2K6Ccaoj53kqriC3g++RDnH0AhF
 yH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=a8eS3YXB3+KjJDuEPWQLcX+HJOufYQaI4qZVeMqQu9o=;
 b=NlDiX1R2tau6e42Av4vE8L0YpZAy5zeG3wZBdtTllPFu9G23Ve88/oOnAUuNdZrUvn
 oWXtp9by/aNe5Kc8oubnCngdmzUofwrsgfb8R8QiN/Ks6Ms/zmbg61id7MRoHSdD9J+z
 ZS+fbQO67CkfK7Ium4MVMVRzrABY2HLOl6lbg06bcHU48Rd6LQrKaUes0LY5vQ8WN9cL
 o6JmUiLnOTGsCuq8Tj5Lg9swNz3RHP8AJLhkP7/SQpjwLo4OS6JS0hqtqndfP9KvPx86
 RT0XxUMtoK+cl0sjhEkzrxvXJFhxK9yjEr5Vt01/8blm8v9qhSlf98sc9E+poVXNwWhj
 RojQ==
X-Gm-Message-State: AOAM533YCpx4e8fa4phDlSMeHKi9AU5bjFsl5eTtBa3U6NBycmmvU6UZ
 qA12uTjHoN0pIKjWx/48erc=
X-Google-Smtp-Source: ABdhPJwk6yXFazpg9bTL+8Bh6befkkI7lDWa9g9PRfY4jgrlEDehk1AK7OvGeVwPxLtA85dPiIStRA==
X-Received: by 2002:a63:920b:: with SMTP id o11mr5316856pgd.314.1640334069362; 
 Fri, 24 Dec 2021 00:21:09 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id a11sm6587453pgd.87.2021.12.24.00.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 00:21:09 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
Date: Fri, 24 Dec 2021 08:21:03 +0000
Message-Id: <20211224082103.7658-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_002110_744419_4DF58368 
X-CRM114-Status: UNSURE (   8.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The of_device_get_match_data() function may return NULL.
Add check to prevent potential null dereference.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 28ad9403c441..67b005d5b9e3 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mipi_tx->driver_data = of_device_get_match_data(dev);
+	if (!mipi_tx->driver_data)
+		return -ENODEV;
 
 	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mipi_tx->regs))
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
