Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E57CDB479
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=; b=QrW0zdPBqwmMLibWZNRyEQyNB0
	+FuM3t+mtTDmg5d/DyYVXWabv9yYMrH2nPUlpgx0s1ZvFBastUPA4RUmASmKGe1o+uwDFXpz+zB0g
	j8iFWS+NvB46wcQtJpBZJ/Ih2fNQV3fbk1EB+0Ta0DDyxMgJQ/bhBsJBsMnlzi2muYLviMKA0+BF4
	a84SoQXdDBkAtXGYHxinAcjMNq2mmpgL2mniuRk0ul/qwB4y8uRHqkRT0sCUgETqJNVIuH6Z2xV1y
	hev9x0OJJQZEfy2wz9OPWtJuJTaT8tqwuggHLamMH8u8wkGnEygBtuXIsmY4jy2WYCskapq6Xs/7l
	KzzNRKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH27-00000007Dz9-0DTh;
	Wed, 24 Jun 2026 06:24:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH22-00000007DyG-2CqP
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 06:24:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c69921bd15so2750315ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282257; x=1782887057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=;
        b=Ry02xBx3x7/tnpXBe2byvYaGMNUKd0DsMSeZ8TZYQGHU3cQuauCl38DncOdD+NGAPi
         t5/cV3Nt8xiSKg+P+3uvf1u+Nb0klIHqVXXeOBiTSePSfD9VvCy5pupsu0e3H1NwZ8hi
         xWx8IdXdVI5KcWwiy+DW93EpjHEFIb5avQwEWwn7QImr7JjXCzlq0CSEyFHEYjau9h0o
         UARuMN2VuEPyRlWIJ484CQE2owav9RjsI2CTNp4AFBCg4mKkgNPi67Lm63RH8yVoG8Qe
         QApD5I+0USJn7VcPWQ+NvrQUq/v9hlT1Ru84ua0Lb5UiA20ihLxabh7/InyrC12+CunQ
         TeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282257; x=1782887057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=;
        b=LJ4ALQV0xuMyo3iQ1JRrtgwqUDrzHUs37YKK+s0AInma/lQBPJOp8crrdE1H6GdPST
         GBSaUJQK7Xdw0jwXvwjFUz/FLHaVC+Q5W1+oshVsIxr8W37QeGpTxluak58NgCPQ3U5r
         Uw0RT4ppYvxjbIGDssI7KZwNFfS5ws8Ch+gCTDUbNfqF82MgxGJpThdhi7l70qMQs7aU
         XxTgvRYbMLpNuSR+Zq0fYkmAlW6EdIhPER4EZDrrHE10RfixtqlTIaWK7jpx9tt1ovSw
         a4dOcwbV9SvWvOkSDDNKm3vtybPw7VONVrC0xBXzLo7ckIFFlD02IVy0kj9okFmd+9DN
         Otyg==
X-Forwarded-Encrypted: i=1; AHgh+RoMyK9LxCpUr6FkuhDonFmqmlAtUAamL0L/7ZbGpE44pXPEAqV/MrJEVRYAYDlGrJ2ReTORCmth+UhmXti8RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL0u+nwvyPrYlPDCk1L4ZvWDsPTcJySYURvofvi4Ddm8U+e6T1
	HmLwu98efPr8usxL7M0+Wkmsk2DXKF/NvkJS4E7pAFPp4smPmZFzCrM=
X-Gm-Gg: AfdE7clY6yM/JOsNRD4K2BMOk4LNlHtxfKvMBQTFNIKwFopf/cX+8Kji/aKgtWC2p11
	TakIgFnrMP/tJE+4q8oanqkSdIAjDebgGoI5KEaAeZ9Riud47pP+dvK/kgMlLcgYPmLGe7nX96Q
	n8SH0IUIZDr93B0HV/adNr+kAJJCZDfdFDd710Iq1lqONea31TO4OGMe7ovfpBWXfRl2/S3HdZU
	Gr1nkJjeZaDDYmKBIkF5OJz3dxEMYUQDqV20UHjSYwYP/gv+rUiunw236tz5oIJ2oKTrJIEszNZ
	sJOyE11GgZ5wtczJaKrX9sUqx0KqriuNjd4Cf4ajsNoZK1NA1XlwjGwj5tWEgPmLfIha1JHTVy4
	Kf+hqU+wllBGxUIP8FK7FU/rUnXp/6TaElNqMbx6dJWJNC8o/OHC7en2DjDUWmiHJcsxsheHaQu
	yUgbrK1cjHr7lTrLIq1MgggrlaOWOdgFGklOebh22+qmYLeE+01PGqjr4soKCbKSbS
X-Received: by 2002:a17:902:cf10:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c7e157bf30mr22540055ad.24.1782282257477;
        Tue, 23 Jun 2026 23:24:17 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af54dsm126042875ad.11.2026.06.23.23.24.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 23:24:16 -0700 (PDT)
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
Subject: [PATCH v2] clk: mediatek: mt6735: Unregister PLLs on probe failure
Date: Wed, 24 Jun 2026 15:23:55 +0900
Message-ID: <20260624062409.45678-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_232419_598401_64FFA1B5 
X-CRM114-Status: GOOD (  13.84  )
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

Unregister the PLLs in that failure branch before returning the error.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Unregister PLLs directly in the provider-registration failure branch.
- Wrap the commit message line flagged by checkpatch.

 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a2..69d9ce1210 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -102,9 +102,12 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 					  clk_data);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to register clock provider: %d\n", ret);
+		mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
+					clk_data);
+	}
 
 	return ret;
 }
-- 
2.47.1

