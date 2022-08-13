Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05756C25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGEs78t61pwV6z3o8igEPiG1BYLAhumLfK2vsVLOvIA=; b=I2Yjt+KUVU0fiXJGZDMyUSRPtC
	Kix81VKmA0jaZUPeCTedYbNEScaGDzF1QI0+Ymot6hJ3Yv+zjxC8Mr6SusPusEmr+4Ek8XUueXEEL
	qb4TRl+sCL0VA9SZECTIsLokq6sTYq9FtmfGBqzeWtDHSCs5vPQzkYh+Zg5jrGxoaJUT+sHmWFtEV
	tAu3Bin6HPHosNKYQmw5ekiGbCU4v0SwyUNRkxMzFK9vaf1sWsMhWVWaLYXBQoueh30HVhrIqTQ39
	1JqCNQRAEwEkB8pQoTE6WZbF+P2l0flWI3b30UW1cs1HHSyINdMvl9ctv2NlfZ3n4tImoSQxg6SZt
	dchs/QGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMmaL-00DQ9h-Qs; Sat, 13 Aug 2022 08:33:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMma9-00DQ8H-FM; Sat, 13 Aug 2022 08:33:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id n4so3391841wrp.10;
        Sat, 13 Aug 2022 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=XGEs78t61pwV6z3o8igEPiG1BYLAhumLfK2vsVLOvIA=;
        b=Au8c358uhsjusyM1DYBsBAk6XpkgxHtNdF0Mo4H7rpPFZfeua78wPKIT82gnkdWiL6
         3pcRhBfcMF1EjOoaW6sWed78nJ/oAnJuGfRo6uERH7iy5aWvlnBcOJ9G/1ElexJh5D8M
         V7wmotx1ITh6LXVnlaOtjwst/hdEPtkonvzrZGxBJE4R2x8tYYSicvB/J6/Kbq+amqbk
         6Z4W8yBc17YQI6igVOrqHojnX2e0n0ESqtIQUpQURHrNycd8v1eagV0D0sWx0YF+7rl7
         jbs62XVPFg8XSqpxXXCcw7dbTQg6Lxp4I07099QSA09x8DSbGmhaPE0IYGV7HraLV8Ag
         Pj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=XGEs78t61pwV6z3o8igEPiG1BYLAhumLfK2vsVLOvIA=;
        b=5BLbGLA4DpBRBgB/AgqHLgWy95VK8NSRp08UIHzB5NkHxKMobXkrmNklIgyVNzmkha
         Qgi/jjuBozWqkZjrEtsRq6Jc8At4+upFgX+fioJpMecoQxO3vx1a7l0+eX0gQ9N7Xsrh
         7GgHuKRW4C9SLVBGVGK74W4K3Tay8RO+xpMzxXyL6rMP7sHOkNeArJCLeuikdOgA8zYJ
         VwEXXaD+5Y5GtkJhBT8n3SSDloZM8v5Cf9cl+LYRXzz640b8n29qVILPOW+8IW3eijjD
         OmMYiWK611FIQFn4ZAnRlWkeeTumWVFkOYgnj5RtgI9sccIu0vfJpPDTIwCtGXebafiD
         rxHw==
X-Gm-Message-State: ACgBeo0F9WxzjYZIOepqyrlwBN6ba9jy6nZCFdaj6I+A7b0uLSSVrLt7
	uDw17g1SG8niGQ89p00rj0I=
X-Google-Smtp-Source: AA6agR5/Uen48okuYlyJMikWEFJDJ47YA4XkvLJ/qnLoWqk+4jNv47jTLJHr3RNKjp+insaSa9wJcg==
X-Received: by 2002:adf:e542:0:b0:21e:c148:3ef2 with SMTP id z2-20020adfe542000000b0021ec1483ef2mr3912848wrm.533.1660379593822;
        Sat, 13 Aug 2022 01:33:13 -0700 (PDT)
Received: from localhost.localdomain ([105.235.129.49])
        by smtp.gmail.com with ESMTPSA id a3-20020a05600c224300b003a54109a6a0sm2142267wmm.3.2022.08.13.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 01:33:13 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
Date: Sat, 13 Aug 2022 09:32:49 +0100
Message-Id: <20220813083249.45427-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_013321_554890_6EFFF8D2 
X-CRM114-Status: GOOD (  10.25  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

This allows it to be used in drivers built as modules.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch was originally part of a series, and is sent alone now since
it doesn't depend on the rest of it and can be applied directly:
https://lore.kernel.org/linux-clk/20220519134728.456643-1-y.oudjana@protonmail.com/

 drivers/clk/mediatek/clk-gate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 421806236228..0c867136e49d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
 
 int mtk_clk_register_gates(struct device_node *node,
 			   const struct mtk_gate *clks, int num,
-- 
2.37.1


