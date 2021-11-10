Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87799C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:51:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1096113E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C1096113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O72NscS5Q3pCyYEu4iD4EOcw3Cbje2+79apu7OWUz8=; b=nk3FPbik5UJIXF
	2EaAlYQWpNpa7XYA+xB7LzvD1zwHn+9WBfdwbf+Xz1d8Rgr1Wcntu9VAdtrDU7AZ2gX5FMk24Uowg
	mfzIEpoo2p+sDN1ltkz2F298SNiZGgSYS7VO9Y5VugFiVp1H4l9P2SJAsTBwSHXDPApnyRsDy9OtY
	kcbwSKu+2lxkHNBtjpfIU6Gwnv2d6Xa6BGCCp4ed/qCF/1gtcAwP8StoJX0hmcq588qNepSfQ06R1
	VT0T1KPPJaR7HkAJZWTArb+nfkyLihthh1vfoCRl8rS9QYcYMw+n3bw11hUth+TmG7s7o0eH4Q4cQ
	OMsmaO4jjk8cqvVD7mYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktdA-006DVJ-9B; Wed, 10 Nov 2021 19:51:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktbv-006Csq-2i
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:50:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so4803021wmb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9v/p3H16Q1aF+/gSoivdZVyJ3IG44fQPKhtZ36YoWUc=;
 b=VjKbv2Zpc6bphwYBa6CnzuQ3EBlY7cT8fnqQxmtxi5dfMNOmVdkC6ZVNssGO9IbeeH
 FuPTyHp2SsTUWNCXoX+EjvpCyIUJb4Ctn4OZ4ezvBPsOUl0PViSncqzsGEiwnekHBLZw
 bcwcXhZp2JjtoOuP/UjB9JFcE4FVXaygmhzj/RJLR2/YjpFsFF7j36RKtN1LeKtEf+d+
 WtjmbgCehRd5LQUwErc0V9by2F30IkDUsnBgi5Hawi4Pt9v/mETFuDa9iVx4egfygdmx
 9Esz9+Ozc3BI9trSnkX9bDfduBlSEu6KRIkL6joNzj07/fxY7TUZfdIGrulE0dYOKOQQ
 nK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9v/p3H16Q1aF+/gSoivdZVyJ3IG44fQPKhtZ36YoWUc=;
 b=4juh72SnzfLGKsPjNKmj02vy0HfiTJDEaujSvz5YDVb7yhi0xtqp4jX7Tyh7guXoZ+
 vjbxvEa5ixnxZJJW18n8s5GutVp3grXnYuMuc0OQwQDC+/FnCQtC4Vq6+k3b4Yo5GRfs
 +uE9W39f9iJQBVdHT6NshGAn7oFZa167g5OVsJjt1F/fogUY078QwV2dRZMmC+ROKf61
 FcjEWCzF/b16fvnFV5ha9y0HLoyJ6tlvA6LOqfGiFz87RQ+mkzlxiJTgMh6SqqVsqXlA
 qNWQWJijmcT87sGf2uoWP1Iuhuwr1espx613BYFyDzkXdOUlpAFAhoHwl2Tg4Zil4v+d
 7Nfw==
X-Gm-Message-State: AOAM532Ry0jkg0jn4cACKDqk3f25bfswHoV+ojFxY2x/13wmIWSTIcUH
 nd++JpzEUSR9rAeYZumDZvqx8g==
X-Google-Smtp-Source: ABdhPJwSPWVHGUSXAVFDBKRAJSOPw7HbTj6ZnnxeadITSc2hD6wRJTXTJzEv97AJwaIDDHZMAUsYmA==
X-Received: by 2002:a05:600c:4f8a:: with SMTP id
 n10mr1937772wmq.54.1636573817648; 
 Wed, 10 Nov 2021 11:50:17 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k15sm750935wrx.53.2021.11.10.11.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:50:17 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] i2c: i2c-mt65xx: add MT8365 SoC support
Date: Wed, 10 Nov 2021 20:49:58 +0100
Message-Id: <20211110194959.20611-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110194959.20611-1-fparent@baylibre.com>
References: <20211110194959.20611-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115019_148884_72243A20 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for I2C on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v3: rebased
v2: No change

 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 9ea427f53083..a0249ebe7c7a 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -411,6 +411,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8365_compat = {
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.apdma_sync = 0,
+	.max_dma_support = 33,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
@@ -419,6 +432,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
+	{ .compatible = "mediatek,mt8365-i2c", .data = &mt8365_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
