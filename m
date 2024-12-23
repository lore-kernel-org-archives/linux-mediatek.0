Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FCDE7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKJMfhcCNoXTKKqxRI259jRf70U4iL4YiCuA5Aw9wgs=; b=ie4Yk4w+Owq/glDdZ5QIuHADLg
	6LI2o/IaX/BRcBEAFCJbqtdBf509VdlH6VrI4O2Fn5qSVMEXJ3Y3xMzwy5MR8sXghtzk/7rko1pVX
	w88GttpVxry4MEizfb2Ftcb6Ar+h1rDO+hSMsROF2fbN8B9cuDlIx8ATzRmo5QrrgdKymAjSGg49k
	Cc6IpsLJaqtjFeyma9rY1ftw7yn9vDGMPSAHAo31ayJO8mXu71+yrAaNlstIvj5TKlwOLk4GyFXgG
	XdIjf8927QiD5bDooGmKQVqnq8HmbQ5IIs//3Je+F24auM8hOpUYGOeRemkByY3vsYmFX4GPctC3R
	VldmdgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfMJ-00000009lIf-0WDg;
	Mon, 23 Dec 2024 10:08:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfKv-00000009lAM-2fUd
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 10:06:54 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-728f1e66418so3222749b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Dec 2024 02:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948412; x=1735553212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKJMfhcCNoXTKKqxRI259jRf70U4iL4YiCuA5Aw9wgs=;
        b=QpvBwFJYSyyVQvuPxkXYPgq8kGxGk63L6CObSiJ7SsBHOY42kv19XStaPXYmmREon7
         MZdV7ZYRVxGRlXf09J9Z/3GEnrdgh0jG1nwnBlJqqYKIqwgSERhbxb+dp3k/eK/rRC55
         gDjNtOn89081W8Uv1g+1ChPLpM/BSdgKAXe+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948412; x=1735553212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKJMfhcCNoXTKKqxRI259jRf70U4iL4YiCuA5Aw9wgs=;
        b=dFWH/SZMivDcpSU04R8/6/uNVucCstbvtelhZjHtFZWgbXPhv3KkqCCY2jGMcbKvuC
         mdbtqg0mY+y8cNJNR1Cet2JK/0uo2cltQGrzpA/KsJEWvolAu2YvHfVvlP298K9yr85k
         C7dgZk+WbLHa7ahqh/N2GCMCMGiUXqy2uGMpnlI7ZnTHAEz82/Dos5MONNRj6sf1om6/
         33jGXe/k/gDwxzOIAq6OYS71eFwfMRjrPPf+nn1xzJfJlNi1/lrJJv+Ojj83INkVj2jC
         23bu74nabyigWaZ/F1Nw7qY6lNWbulPESFoPfTsMsEsse5zw55zh9Iy7NB/5rdz+poVw
         wFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxIn0FqmY82ZrDRU/Z30jQCm3bAjMrL67BE0EpjHYt8fYTay84Z6GXg4D5qr9QhHNY29BHdP70uZ9W4UgBaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyor4Nu8oGcN7ynNBy3kMvloSJYSN6A3HEmgYzZoY/DHwzqNJBp
	xX4p1PUttJxVb68Ii8uSd4enxES8mB8DBV8ly9qunn0wvf7uBszMiZBOyOCwuQ==
X-Gm-Gg: ASbGnctEbAuVNYbjXSE5spPIifhTcj0iFhH8qdl591QAvbFlcv7oWTzGsOstX81MZXa
	2aEBLPiEwlKIK4untzFGOR99dkHalD4ehON5lHaCG0UO4IfFu5efBJkeSeDNMu418NW7sNdoep0
	HVUZM84AfUMj8mt2qZnHc8zfSHBFfxIfCHz4HbyYdYOB4CXrFP1ip8M1OUyZvOYC8FcwPiiabxA
	c8kEWjuUt3uvyQamFtq6EIWfc/x0uNyWj2VcN/pb+YTwkKcoGVJuIo/blOdcqzIcgizRO6uraQ=
X-Google-Smtp-Source: AGHT+IEC6g3dUwbOwegr0/4cBA+q8wZywCWC8uKKvs5wuQPerkiACHzmCx3kFeGTvXXS9OP5fvFOwQ==
X-Received: by 2002:a05:6a20:e68e:b0:1e1:becc:1c81 with SMTP id adf61e73a8af0-1e5e0801191mr22582243637.32.1734948412492;
        Mon, 23 Dec 2024 02:06:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4fc4:9ee5:ceb8:cb2e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72e61sm6939475a12.3.2024.12.23.02.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:06:52 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing for MT8188
Date: Mon, 23 Dec 2024 18:06:47 +0800
Message-ID: <20241223100648.2166754-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_020653_700981_D35AF216 
X-CRM114-Status: GOOD (  10.01  )
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

Like the MT8186, the MT8188 stores GPU speed binning data in its efuse.
The data needs post-processing into a format that the OPP framework can
use.

Add a compatible match for MT8188 efuse with post-processing enabled.

Cc: <stable@vger.kernel.org>
Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

I'm not exactly sure about pointing to the dt bindings commit for the
fixes tag.
---
 drivers/nvmem/mtk-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index af953e1d9230..e8409e1e7fac 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 static const struct of_device_id mtk_efuse_of_match[] = {
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
+	{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
 	{/* sentinel */},
 };
-- 
2.47.1.613.gc27f4b7a9f-goog


