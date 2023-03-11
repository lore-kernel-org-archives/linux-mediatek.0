Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4497C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=; b=Q3LfcIcy6vRJlxhLKE4KsAtNV4
	Y/YEc26K9QpfdfuP5YHZ/PWGY2DvTCK+29REeMSZRItEEJb9PC8Hufjw5u+OvrvDM1viYHy1SI0HN
	FihgYL2l04DO+GXzxCCL0NGHDuB5tZAYhhJwOjVtE46vCzMs9nKa5eXDufxt9DGVsA4DxgnqMpP/q
	KPaQwgLEAtJkhurlLfJo5qZoxJ5nGkiJAn2xmRMzinoiw1XeVZ4kqzOvQYDrPMxJHgKGJ7R6qiPVs
	w+NwFCPpkvMJEWOpH2q6cnYU7dxQUgnE1Bi1aaJNob//OhnXmXiigFVLbKiynSZlFOmnAmvNhpIuR
	qqQhjrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxKV-000JkW-T6; Sat, 11 Mar 2023 11:24:03 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxDl-000GK4-Nz
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:17:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id k10so30652605edk.13
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=;
        b=lKEQi5BZGiIsVpqyS3XtNgZoaI8gioPoWmR53UPyduIVkHVeBEbmWQaXemsy7pgoPS
         UnT7c+7ZyvKkk0HWLGJmgAwsttuT4HVispzrnMPyJqS5Np8eI3GRYyaG414K6oVMRNUm
         QVqgb3m4l83Le3oN3ft7CuJLwMHw+hjFZgSFgWC2j9v5by9CxRRgC5nDXDsaxyZluBqk
         IBiUAyVvuUjg9DW9Kn9dcYeNjBhKM6POvPlVnUnZ/vXpWzeI2pXo9U2pZhSrlCZILBwz
         d44tevPSOVgUvRM+45bqyA8UKyptBc/JrFkZ7kGJ3iXRmTNNXy16orqGNh57sQxmaXAQ
         wENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=;
        b=cxEQxCTn9HBtMSSFgjS6QVtI0SU7nz0sjzANwxFoSoXl2ZW0dgs+xhcadZsViV6MA+
         L36Isv71xK4EGn2K5CvYdYU00DO+A7DoShv3sinnAMRcCBy7y43gt1yASTn6g8Cf4KGd
         lNq3j3Q/R88O+Y+dFHmKQCoE0TVyzwmeBXoBwpWuNp3eFHwk0oWGrtXBnjykcKh2+SbP
         EDSE0b1eFxrg8NemDZvRlCd9pKNAyxQD0huK/UUFUbsvgGtSOtm65RGnfS29t/9ZMlGT
         w5rnAFNhh/NS04AkD/Pqe6kWtZRGw8nqzrC4mgxxIvLnggINVKnFOXg4/m7D7KcB98Ig
         fJxg==
X-Gm-Message-State: AO0yUKXUUJMnu1eYuIhBMHYO0OG56ZcafNFJ3uObr/Z3HdkbK5P6xRbx
	0fmDO+geSisgpz2uDbycOcFasA==
X-Google-Smtp-Source: AK7set90Rqx3sRtuOK2S/VP6FZHdkiLyZ5wFXMpa2VaqCReSCM1nTUR53MQaNMHyzGhGC7lvJVRG7Q==
X-Received: by 2002:a17:906:e118:b0:8f5:2965:49f2 with SMTP id gj24-20020a170906e11800b008f5296549f2mr5109281ejb.23.1678533425339;
        Sat, 11 Mar 2023 03:17:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:16:58 +0100
Message-Id: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031705_874753_D1C71834 
X-CRM114-Status: GOOD (  12.55  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/i2c/busses/i2c-synquacer.c:632:34: error: ‘synquacer_i2c_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-synquacer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index e4026c5416b1..50d19cf99a03 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -629,7 +629,7 @@ static int synquacer_i2c_remove(struct platform_device *pdev)
 	return 0;
 };
 
-static const struct of_device_id synquacer_i2c_dt_ids[] = {
+static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused = {
 	{ .compatible = "socionext,synquacer-i2c" },
 	{ /* sentinel */ }
 };
-- 
2.34.1


