Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA13C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYQ2ILu/dkHrJLJLHpeBmvNPFxUF4l+gUenZ6qeoBkA=; b=W/r5o8lB3SKZQ6
	lVne9+kcfNI9nT4WxLS5IYtVPl50n2M/a+//pgeqf5yDvsIqy/UD6LRrjQiDgiVCtF8W7FnUrLkO3
	a9QCc6uarmnEBUTI+ejqrOdGpp8Rx6SduD9bDKBpvHwTM0tj4jBcqyVricxj0VDg14q0GbeJNuiO1
	FLBZM2+ZAPckZt9a17AC6w2FyulUAEfhsXU1Or/7LlpVjx5bIMwedvQXLsVlEKeesdkqVRfYbHGCl
	JCf/qHaa9J/eJhqkR0iX5mwQJtZSP1hpzUGtsJ49x8ox+0fmCVqvF4oK/ycYsl22JKgc5aMmVhSbr
	72tKCctG1CvP81ptqevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhYb-007d9Y-7t; Thu, 19 May 2022 14:55:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgXE-0078b4-Ml; Thu, 19 May 2022 13:49:50 +0000
Received: by mail-qt1-x82e.google.com with SMTP id x7so1599646qta.6;
 Thu, 19 May 2022 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPQSto0N+lNtNNPY9TQEtm6CehsZLQib25ZHkbMOJIA=;
 b=adkuYIA2mXgko5wthuK/XjjYRyngB+DETgkoIBQDD3HMWAj9jfOOH/RCTedqah5QZ7
 bW8+W5vvpka6zCqHPWKMoAQz/YznRj0OaI2TS8ny4pIX+qNeHxSN+XX83GWkOaM2NGrB
 Gs66YMt0zhFgyL5O4wKbfjvEHY3qa9YUrhEgiGvrbUX7oieTqFuBOXXpdy6DToMR/rDz
 NsV17sJmk2u6ZU+FHtdO+hs69UKVVLIUS1eNemCHvpMPtUAV718m4dQBopAJ0HsXsQy4
 taKSoA9cQlV8VdG8NAKdXkF+pJTgNU3zRBf8Xxm/1X7CfJk99n3ic3vuFl334U6RYV0v
 5JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPQSto0N+lNtNNPY9TQEtm6CehsZLQib25ZHkbMOJIA=;
 b=Q+7VLSANiX/D63mhRQK4PNkigMPNhPiGh0g/rJOC9KDECm13C73C9GGjF1HjLFupCM
 b+48nBikkZ0piCZYmOCPGh2L4BF80An4pn6kApdo5BSSi+UYAD+A56bMtOPZYcBO822g
 V+0EcRPo6icdTZ3BypCX6kA0DStH6AqwUem8hV+BQNkSlVtSXH8pWJmi20KWIhAcuidR
 aVO5sKYoOGOqNai0PTMqS9O4xC+byWtaxKTopoXwvei3SHOjKi63QUQ33PINY70vFW25
 IAT+H633CKcuD1Xkkx1TBCM7w4ZlcDuzNkDOsQH6rh6SlQQWsWNjuv/lduUFIfkkqqwX
 Skig==
X-Gm-Message-State: AOAM531Qj5jufM924h27vy8yZbbOR+yZOq9+iUziDdVNJ/8J/loed4RC
 U7ibSBNaq235b6DW6vzh1DQ=
X-Google-Smtp-Source: ABdhPJy2Mn4bJ/OGia0z2jO+j7RXe7CmgUJKP8L5VG0CbG61g4fYIWUGIMHMBGJozxeEppfkByZ6hQ==
X-Received: by 2002:ac8:7d8e:0:b0:2f9:1176:c24b with SMTP id
 c14-20020ac87d8e000000b002f91176c24bmr2139993qtd.500.1652968186128; 
 Thu, 19 May 2022 06:49:46 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:49:45 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 4/6] clk: mediatek: reset: Implement
 mtk_unregister_reset_controller() API
Date: Thu, 19 May 2022 17:47:26 +0400
Message-Id: <20220519134728.456643-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_064948_815203_D3704295 
X-CRM114-Status: GOOD (  11.46  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a function to unregister a reset controller previously
registered with mtk_register_reset_controller() or
mtk_register_reset_controller_with_dev(), and do the
necessary cleanup.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

 drivers/clk/mediatek/reset.c | 7 +++++++
 drivers/clk/mediatek/reset.h | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 09862baf1d57..c1ab8c87ec27 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -232,4 +232,11 @@ struct mtk_clk_rst_data
 }
 EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
 
+void mtk_unregister_reset_controller(struct mtk_clk_rst_data *data)
+{
+	reset_controller_unregister(&data->rcdev);
+	kfree(data);
+}
+EXPORT_SYMBOL_GPL(mtk_unregister_reset_controller);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 7418dd0d046f..0feaea4115a8 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -81,4 +81,10 @@ struct mtk_clk_rst_data
 *mtk_register_reset_controller_with_dev(struct device *dev,
 					const struct mtk_clk_rst_desc *desc);
 
+/**
+ * mtk_unregister_reset_controller - Unregister mediatek clock reset controller
+ * @data: Pointer to previously registered struct mtk_clk_rst_data.
+ */
+void mtk_unregister_reset_controller(struct mtk_clk_rst_data *data);
+
 #endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
