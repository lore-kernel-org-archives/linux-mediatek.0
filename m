Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2ADC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeJqWZmIWIQYf/vyLenHeQ0JsQ8pjtOGtaM4WzEFmbc=; b=PCJIa327yItGA4yG2xUq9/h3aZ
	AhBSJs5CZMDi4sIsIFM350TW+v4zgPrpRIt2tGzlc+jDh8uotd6HgqETWcSycSyx8FCXVg7gkSGTS
	4G4bQWbzlkUnin0bM7T08AjYDc/+ym4c+5oP9ng4vb6P8ujnIEip6ZEdu2hFmYQSEt1SPSNoq8Vli
	r6o0XMXLzw4b5PCd8awNOeEoPOZkTz0B4KE33EfETL7dw3UMdvkcPYwYKgcalmX0T9Q08a6NiCmAa
	C5VqtLDWl8QCmUrmrJ9QeqqJ4/3Ht5/Sd+gOl7hk6qYoy3WUD/AvCS5oerp227R9dJ3FHUmjIC5Ef
	1+plVC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxJZ-000JJk-5W; Sat, 11 Mar 2023 11:23:05 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxDk-000Gc0-IC
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:17:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cy23so30640824edb.12
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeJqWZmIWIQYf/vyLenHeQ0JsQ8pjtOGtaM4WzEFmbc=;
        b=K4PlKgk6vphG7B8A+tKgwgLYu/eve2VtLYCEGfkUgVLwaOgCPb7AYrJKKgc58vohjO
         rzTftPa2ZxcY1mI64stQAL5MZ+JQPxTaEr1Y9AxaQYrbXROSwSQp5n05Z9wTPZYRFpmx
         Bx3zHVIcTIzCEjsajZ9GXEVo76iXFDZjOIW2qT5m5hbGmWcJdF+q6Sc+llFTkWrO6/9V
         duhkPfdmrunbmk+l25R3ueAi1TwDW72GfXGvCgamBE9c2PG9Rg1A0BPHsQOdMTqKJ21u
         X5qwUSuCcnDZb4uy/0MbHeF50kr+hbPu17toFAd8eu2Mm/u8Rj3Fbv+gwMYWmhA/wgTN
         7xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeJqWZmIWIQYf/vyLenHeQ0JsQ8pjtOGtaM4WzEFmbc=;
        b=AxrhQANHebFP+htME4t705sMM2JHzLKX6XyDH2tfgHzRyp0LdSBt7QZugbYBobqNJe
         7F8h78NoJZsq/wi6ejgz8+Bu2nTlvzpkItjnwkE5swncYx6oZmayqAY3dPuaIBGxM/jZ
         dZrtXYAVLP7ywG3e6IBswiVGiDDp1xU0059G1u/nlgotyVg0lGkK+YJNiwEK85Bm+rN6
         N/jJ3zmM0AtVVmnqaUMKQ2wCzXEH03lduHOAJJJRLmysCkVz4FNyeDgbp+cG2xRnoBCY
         Jwx/lmSIi89CETjPiX87aiFHeBt7A5TtwGYCY7D/xQFDf9NNtWpGGGcu3GrLZv/4FH7Z
         pKfw==
X-Gm-Message-State: AO0yUKWYd3cH84H2Bk+fhRpbMMjXgGGupMg2kIaZ3fTAn9YtoAoJjsoy
	We4z/ZOxKnUuUHKhH0b2cX7PMA==
X-Google-Smtp-Source: AK7set9OSxnoFK3vtZqGbIpUURfI1SqkV0jUsrsq7RgkKMadcVINTomgv4XfMX5TfGl07OS2xYV+hA==
X-Received: by 2002:a17:906:b88c:b0:8cf:fda0:5b9b with SMTP id hb12-20020a170906b88c00b008cffda05b9bmr5146168ejb.22.1678533423260;
        Sat, 11 Mar 2023 03:17:03 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:02 -0800 (PST)
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
Subject: [PATCH 3/5] i2c: xiic: hide OF related data for COMPILE_TEST
Date: Sat, 11 Mar 2023 12:16:56 +0100
Message-Id: <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031704_716629_3440E000 
X-CRM114-Status: GOOD (  11.67  )
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

  drivers/i2c/busses/i2c-xiic.c:1202:39: error: ‘xiic_2_00’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index dbb792fc197e..806b447055fb 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1199,11 +1199,11 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
+#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 = {
 	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
 	{ .compatible = "xlnx,axi-iic-2.1", },
-- 
2.34.1


