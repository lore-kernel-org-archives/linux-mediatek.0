Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7617CD4F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=; b=W9Zsl3Ni3fg8NSETAq8X3Gi6NZ
	ajmJI8VB7NW6COIB6omQutJi7RZ3DSA4q/Z92++0M0Wb7HtjEZ+saTmXBUmJjyt8TNhNXqv9Iutln
	wIPdJCQ2rA2KgsTemMMNIfGssvU3CDbdaPUBaZEgxAatxU8cZtDJyy74xxcZwbDe641OSY5PTimVc
	lhLQQrIbOg6SlKMBgPEjRuhhSmntGy7YEVtr7U6MmNUY+LaetSs4mWI3OSaAsT2KYCAD5lfD5CCdh
	SfsJIzOZCHiESj8HBknqkBojH4CMCJDqB2mpcZ46s51gGyJ8TV2Rhdrx9gfKPA+soknIK4ZqamTQ0
	wjxZU6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxdP-000000061kW-48tZ;
	Tue, 23 Jun 2026 09:41:36 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxdN-000000061jD-1i3L
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 09:41:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84592b55832so388182b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782207692; x=1782812492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=;
        b=AvCA0ISIaoR8TH0IcEXmjq9oYlLe2X2Rt2+dkYiFG0XN+QWvlE7OYXBGAKsZuk5RLl
         Cs+SISPrL2RLllNIiNjxdHhCgKH3xMnKbQ7WVs5wqgVWZnY0l05MpVHpiEpGL+FYQeW5
         g/7z7f+aMX5cT3RxLYoqacoZRjSgDFAvtL7VWfveTpK6xsOoYsWfKncQPDECPK1TVr+4
         tEbYn58pc2+Cicf5nZIqaeJNLp+jpCsej/n5GacsW/aHGYRm/EpfsOuOpdF1v9O//Tj6
         z1282zDsHc3TzVVIxj/HmYxFLcbrH6H5nsq/60CSN8XWEs6tfPFnVY96eEnOzhh+GiyJ
         k/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207692; x=1782812492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=;
        b=TpwC3v3hzbhXXJGRt4vM2xq37WTRVW9Qb31uHhUiFGlLtUBwbBxvWSY5wBEljrzN3X
         a6Xv1ATHf/RT72LYXVW44uIsO/GQcQY2U3Br0R7mBPTaoF71AeD1ZGnLZiSM3oyYCkwM
         zHe3kO+7gQj/CR68J3ql8Q2NLSxD2dntIUiBZr3+PMokYwlTNJKLmIHpeKhWyWTqMlAo
         zUI6Dd7JroO6jfurWVDJm02koBFwR+V/LhDfTM7kHbDVGS7JAImmpc0lNMIPtszAsxxc
         fwMIBS1KY/uORZ9IH4SY1FAb14qTGfVcDcuw9vOB0xHJDB4MTWafzJwqWeh/V/E/OR/k
         fqjg==
X-Forwarded-Encrypted: i=1; AFNElJ/NeZp4D6nlEBAy1ZGWTUDSeZOUKSABtFrtMLdjtcAtcEnKFCQ7ENiwuzcSKZTG8D3mIYMLxhgm+SUHEDweYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYkGalHk1oZr1jneeSu6h60I1kSSpLrr+8y6rACo/yg/ROvcEJ
	59rUL8YKHld7bQWI9myh5Tx5+td1Es+WhBC5mwMv/DtVTF2Vp3frVDw=
X-Gm-Gg: AfdE7clP9tsT4Hg19QwO6JeIIg4IcSq9m9zsqmEY1bJiKfwzWczI7XBCPuP/Cmcj5nt
	iZfhWGkriEtL/F1xrrsZuJr0v5H4ahiAhi3DY91HsWDYRe3nt2AuUwXe+3ScGuVYdHwoNN4aE6R
	ZR7TQ+czQx16mbXXYpS1f1OXylLMiiueGUY5KTkavITKfLjGCmx/EHXBBavYlZSEHPZ37LRXloI
	+TeRim1ed6Y4O56MT6Rxwhp5qh8s2IPUaqKvo+61YgWWjF03ZHLj1HV7fGVnlboWTDKzIa+2D2C
	MaYOzDpsEmILhg9T5bdce3u1V66Lel8ROIHoKD0mFFBROaS4e2Q2sdNcCLWEMJmj5PjXr43X4fO
	6TDfiJ3VLkgFunqcxmTGP3kPqmfEFOSDbcgFQocFqauiyxMtc6Zc1O8cG7ht4YHL8dygcVHTkh9
	PGw4njgtLnmoqHhcaaLOl67TDd6RnEKL8OlINyHAojU3BEBzdYYpx0xbjj3daQ+ZHn/PSUYQ9iu
	5k=
X-Received: by 2002:a05:6a00:2196:b0:842:4387:34c0 with SMTP id d2e1a72fcca58-8459524d475mr2570456b3a.5.1782207692530;
        Tue, 23 Jun 2026 02:41:32 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6bf73sm10180079b3a.5.2026.06.23.02.41.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 02:41:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
Date: Tue, 23 Jun 2026 18:41:11 +0900
Message-ID: <20260623094125.95791-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_024133_441409_8E4D352F 
X-CRM114-Status: GOOD (  12.91  )
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

mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
clk_mt6735_apmixed_remove() unregisters them on driver removal.

If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
probe returns the error directly and the remove callback is not run. This
leaves the registered PLL clocks behind on the probe failure path.

Add an unregister_plls error path so provider registration failures unwind the
PLLs before returning the error.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a2..04cf9665ec 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 					  clk_data);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to register clock provider: %d\n", ret);
+		goto unregister_plls;
+	}
+
+	return 0;
 
+unregister_plls:
+	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
+				clk_data);
 	return ret;
 }
 
-- 
2.47.1

