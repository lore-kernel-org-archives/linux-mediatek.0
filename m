Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0D4C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bvMeTVYjDyKEP8ZQMTHGrWbs6rZELtxOvEXtr+caOtg=; b=CEnvPGnpdoIfwIP2i9dLFAPhLl
	kzh4N4s3zQvanb4xR6hA9SGdzUum3aSmv5mboTYEG3rrL60lvFn3tz07WMuHvYFnECDy3CX5pdp7p
	cXrIxFDpUR/ikAJvABDI7WzPjKezKGaBeVX0dQ2b/Tldw2IXuydjogFLWiDEKSXwszjPJpIF2AAky
	rpp/SxJC91N4qjDmo7UOjstTM+sYhztnzn7FlbSbUugTNc/KQscAXMCBE9sCPdPebPIpqKluruX2Z
	zfGtgXvYVFR6l8JG4012qyURUSg9sJl0OqmNYpsvsZ6uDqEakElW1fei+HY5nEfmokTRbwzwwTcHI
	6t5zNphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhbh-009Wak-2U;
	Fri, 07 Apr 2023 08:38:05 +0000
Received: from m12.mail.163.com ([220.181.12.198])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhbc-009WZN-1A;
	Fri, 07 Apr 2023 08:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bvMeT
	VYjDyKEP8ZQMTHGrWbs6rZELtxOvEXtr+caOtg=; b=Y48temyT0/21qJteKk2rk
	s1ByLfixQXhq8XSvWsoiN7b3/nmJdRfFjA2EczXHyZ68Iz1ihOin55DaQWJC+WG4
	BoMA96tUeD1WHi60zS8ZuBgtBqDLVKw+dpgTJVyy5fbfCDWZzL4r3Hj2+ooM7akC
	fSEjcmv8P/KyzKvgV24lq0=
Received: from ubuntu.localdomain (unknown [115.156.140.143])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wCnrdpS1i9kggMuAw--.20049S4;
	Fri, 07 Apr 2023 16:37:39 +0800 (CST)
From: Xinyi Hou <Y_Ashley@163.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Xinyi Hou <Y_Ashley@163.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt7986-infracfg: delete the code related to 'base'
Date: Fri,  7 Apr 2023 16:37:28 +0800
Message-Id: <20230407083729.31498-1-Y_Ashley@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnrdpS1i9kggMuAw--.20049S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF47Wry3uw48Zw48Xr4xWFg_yoWkWFX_Zr
	s5ur97Zr17KF4kGr47Wwn2vF9rtFs3Zr97Z3WYywn8JFyxKa1rJr1vqa95Aw47Ww4Svry5
	Jrn7Kry7CF4rZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRLF4EPUUUUU==
X-Originating-IP: [115.156.140.143]
X-CM-SenderInfo: p1bd2xxoh1qiywtou0bp/1tbiShRKxGI0XrQwOgAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_013801_019251_D818D1C8 
X-CRM114-Status: UNSURE (   8.75  )
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

In clk_mt7986_infracfg_probe(), 'base' is allocated but never used,
either not released on both success failure path.

Fix this by deleting 'base' and the code related to it.

Signed-off-by: Xinyi Hou <Y_Ashley@163.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---

 drivers/clk/mediatek/clk-mt7986-infracfg.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index e80c92167c8f..76b32f3a16b2 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -174,16 +174,9 @@ static int clk_mt7986_infracfg_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 	int r;
-	void __iomem *base;
 	int nr = ARRAY_SIZE(infra_divs) + ARRAY_SIZE(infra_muxes) +
 		 ARRAY_SIZE(infra_clks);
 
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return -ENOMEM;
-	}
-
 	clk_data = mtk_alloc_clk_data(nr);
 
 	if (!clk_data)
-- 
2.25.1


