Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCD7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8oeEF/AzQvtVXNpB84yj5TovVGMv/c0ViZXuwoTaQY=; b=eZ9iCajSdliMAbK7NwdJ/B6YTh
	k9DkxcwZqQST/rmq+sdNixlkP+woiVmfGjhn10Sl9uIaRGILsmiOb/2YrqeXNdZ0sjxyM1xMUw1EI
	L/jEHveTg38EuSzB7xChv0gWWEH5pihaGd+8Cm3fWoM5xQBe2UOIW08y4bwTqq26M3++n+7sqA8zr
	Al2d5IzRCmIsXYEMosl4pPZ/g20T4fLpvX+EB8m44u85ARDADWr5KfF+5HWQDM/p9cXDY2G9Ebq4i
	EuBnBNE3OtHqZGOb5iYWGG9FTNKKih/uCtcHTK/pvBTA32avi6w9w6mu5pAK/Q+X9O7Ii5Bj5HCF3
	6FDQ0wAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxKS-000Jiw-K8; Sat, 11 Mar 2023 11:24:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxDk-000GZu-Pk
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:17:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id y4so1285458edo.2
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8oeEF/AzQvtVXNpB84yj5TovVGMv/c0ViZXuwoTaQY=;
        b=COAYxq8AT0uqrQbCHXbkj/g3Qs5hDhVsuLTBYQ2bJxruNac6vrplyfs/UEmjVMq0dg
         xkvGkHlKUlM/BiBesQ4flwUDD8euDmOnvLogGgeauHDXcRaKY7MKeGsDSZ/GrGNU4qIz
         tH7FNf6A8uxdhY7kF2QOEiB+UsCAtS2q9xCNIlHIYYUMZYCJTNhi0tyWQu0fTSiQa/w6
         rYdfiaalgA17snDR6+upjrCTTZb3oCrv+sFohA/UpdFo/7hzrimPTydZ8Gpzxk01kvnY
         4hpevlULBOtb7zoQlhFr9SkubsB3XM05CAhGDqHeJjeUpRZPfeVhc/hLoUeRYM5krq4H
         2EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8oeEF/AzQvtVXNpB84yj5TovVGMv/c0ViZXuwoTaQY=;
        b=ImJRQCreh7b9qpVh75APQUpJyGbR9oaDX2+0IrplhLxledOKBfGAVOQXjHklog990F
         aPTHaQQ00A+c0dkgRubplPMENM5yUpdUdlUnt9C29W7huoLFPErZUmU+zAaHKjcjX9af
         sPr1BLG226Wt9r/ELXmaWU97pdPbO+zlqb//7a/txf6Wi/jclZeaY9wGTM7QV6XA/JcW
         P4TiZWlcpjunmCa+Uudoy1Dddo2LLbn09TgKSTpJIoPRVXrugoYE15KEY9yXst9iNBs8
         TZh7E7+0YoUZKian5Popj6Cp4KfdpJS6aUH8MqsapcwpSYRLr2KAkOEmcAZPWCCNWK2a
         y4Og==
X-Gm-Message-State: AO0yUKWMzPVvOx7y8ZdkvOotgNLjDWG61nXTT960RPJ1/bioYDlNB/QI
	99gMqE2lXSkcJc1uEgZcRN1xbg==
X-Google-Smtp-Source: AK7set+7reM6pcFdrkUari419jtBHFEUXuCxP/FHHAYCrdORM+/x//6YsjthlED3+SIQ+yWdonig6Q==
X-Received: by 2002:a17:906:9f21:b0:884:3707:bd83 with SMTP id fy33-20020a1709069f2100b008843707bd83mr3376069ejc.69.1678533424385;
        Sat, 11 Mar 2023 03:17:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:04 -0800 (PST)
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
Subject: [PATCH 4/5] i2c: cros-ec-tunnel: Mark ACPI and OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:16:57 +0100
Message-Id: <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031704_879512_E4F77608 
X-CRM114-Status: GOOD (  12.40  )
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

The driver can be compile tested with !CONFIG_OF or !CONFIG_ACPI making
certain data unused:

  drivers/i2c/busses/i2c-cros-ec-tunnel.c:295:34: error: ‘cros_ec_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 4e787dc709f9..8b3ff5bb14d8 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -292,13 +292,13 @@ static int ec_i2c_remove(struct platform_device *dev)
 	return 0;
 }
 
-static const struct of_device_id cros_ec_i2c_of_match[] = {
+static const struct of_device_id cros_ec_i2c_of_match[] __maybe_unused = {
 	{ .compatible = "google,cros-ec-i2c-tunnel" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
 
-static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
+static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] __maybe_unused = {
 	{ "GOOG0012", 0 },
 	{ }
 };
-- 
2.34.1


