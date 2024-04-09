Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB03C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 20:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i43Qoe3uynySrUsRFuf2GYuYz97ru+fsThJj/fZfzpk=; b=Je5JgkYUkSqv2mlmQr4/9idK3j
	bxGSyVtjpWMoSdVj5ftllU7ax7uy2BB4mWNcIkx55pzMoLMaxcR3Llhdd8P1TxFjCPC02NHChMj6M
	cN2Nyt7gVj3ROKSl6EaIU/ZMUV23dl2KgeE7+OmUCgyCNx7Xk7ZYdBl/keSuXihd6/ZSuu5o3yUsX
	SeJTa20FGD2bMVC6qNxqsv8vJS3lp+ycpO1nSODUjU6gDZlLznXvXHQtMzhdT2NirlNfc02g9FUGe
	FkJ6pl7KH+6XTy1DCKLfbr/C6sNyU7aA6Rwjq9EPAPpp071MBPsbTXZi5tSZ11Cl907K9r16gG09b
	JnuByGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruIMK-00000003mtS-0XXx;
	Tue, 09 Apr 2024 20:46:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruIMG-00000003mru-4Ahj
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 20:46:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4168a5d7564so13550755e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712695578; x=1713300378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i43Qoe3uynySrUsRFuf2GYuYz97ru+fsThJj/fZfzpk=;
        b=qauenqAlbnL2eOxaYuAD8e/RTfg+8bltz+NToYsceoSBpmcf55b/ToL8NcGpLH7Ib6
         XwiKQskrfkZcuK7brLwfvFRJubwZCzhszed85o6osgBJ/QnwVdMGvd7IsstAsDJvMm5V
         UafBUk1eSlg2vtJlgtH4H/FVsVEDW+zAW2lJEXp3r447QTKBKQ0sRd2F0w+sNL86s/0V
         OcQyzh3apShgfWul2gtMaAjxMdvQHAcx3/+6IOEknTpPEcJzzBLQpfyWLrINQUpkz39R
         kQHL8koV9C2hau3ejlOVdZGybyQsr+Ht0kDJZbgEhG5VknyzY+SFei//pDmAetUSjXPU
         a9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712695578; x=1713300378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i43Qoe3uynySrUsRFuf2GYuYz97ru+fsThJj/fZfzpk=;
        b=GZsUQSCDz7NSHRpkFAd7JoL1SAYBJGhVAhQd2mzUXEX6zFPtvwcLEVKmX6aXWQ0Jps
         4MQrnj3f7r8r6r5jl3L3Z5vE9q7U8FRwNgXtSs/it2XEHXGfMIUFxDBuGVoBzPIKUarz
         0/Khd4qAHYyZdo3XbeY2Xl/OlBkOBloYMaHNi18x8ZrRPkHXuHzs9JTaFcAE7hjCnFT6
         /scSb0wL8q/hLqL4XEVQOBlahSCaVujYSRTUCKSxF13PxWeNbR5qx6LDWYSMP9dV4qI9
         vJVyIZgNfzOx3laxHFlMAmrceqAykYR+pjKGZy4zS8ukW4itH8POutFSdyDro22wExZR
         ctxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5+p8F6o3mM8wB1Lg9yykpR9SzjSpysLbCTn8BUAh8wRhnMnHBrP7EyoPwilFEBJ7jdpw5cQWO8GVlWdNlCJZqtW0IEn3qgxOqsDZSGnYaD+Te
X-Gm-Message-State: AOJu0YyqYPUnzW+zUwv/oZl5n/05z9P9AD2hLsIzCGcOHDpiYdZzX0Kr
	magfdvTh0wzvFTCwGcc+bLkxiOGvy7impN6Brzzp/rXh6d9YKtWCL82bjjpol/Ey4csq/YJwrCC
	p
X-Google-Smtp-Source: AGHT+IEVjpkHhTrvTCwgAGLWn5pfP5EWuqX0zQ5BVYZj6xofDz5oktA9j+XSpVN8O/GHhTwaZy3q+Q==
X-Received: by 2002:a05:600c:1c8d:b0:414:8e7:cd60 with SMTP id k13-20020a05600c1c8d00b0041408e7cd60mr507040wms.8.1712695578080;
        Tue, 09 Apr 2024 13:46:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b004163ee3922csm43467wms.38.2024.04.09.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:46:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] memory: mtk-smi: fix module autoloading
Date: Tue,  9 Apr 2024 22:46:15 +0200
Message-Id: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_134621_081664_F298A876 
X-CRM114-Status: UNSURE (   9.61  )
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

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/mtk-smi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 572c7fbdcfd3..fbe52ecc0eca 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -450,6 +450,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_smi_larb_of_ids);
 
 static int mtk_smi_larb_sleep_ctrl_enable(struct mtk_smi_larb *larb)
 {
@@ -735,6 +736,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8365-smi-common", .data = &mtk_smi_common_mt8365},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_smi_common_of_ids);
 
 static int mtk_smi_common_probe(struct platform_device *pdev)
 {
-- 
2.34.1


