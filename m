Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E96DC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=; b=QtGmkRNFNS8lzkl+mXhaHUkUb+
	PhscqJ6UduW+uLty8+jBiDgujozh8a267/WkxpJE/+mpk4/hOasHVw1OfCoZ75dKOTzXlz15EfOIO
	MWxy4egoRWmx4h1jb4pS8R50jVpAYfzIT6sHpzt1shzns6LZLhTSf/j/XHuvFmwAUJGLtcpnal1jt
	xv3WiZfvana6g9nPfvJ7XjIpjXU2q9Fz2Jiw5eLqgPJPjNOE9sZ0ZCeSiKY4sOBKUHRfkOk5ZQoup
	5kaXabJExR6Ert1QnumeZxeJCNCotSAhJvWZbg0JW1Xxh9JhVa3z5RU3mrgddK6BJYMCRcg2M7Aw+
	v2fNWNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxJX-000JIF-0f; Sat, 11 Mar 2023 11:23:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxDi-000GK5-KX
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:17:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id er25so2611304edb.5
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=;
        b=ghNsLS5SpFOkMhJwbC4XS8uoD5BFbmT7NzIgtfULzPzTvyI6QOO4HG8pFT6C5UGUat
         mPQjoT0+sT0CMzL6ME0C9Y7HgaZfd5r5Xw4O7S9SIWwXUXfVZTxxRURXoBMwbLdb9gGa
         HDdJT2S0B0Au5ZAlepE+GieSNxYU1miaru7gYjFtSzq0r4EAOOeYmyvSqOnuvYq3AZ+P
         cDsUDnxd/3IbWY4dvOjVfnM5uW1UsHGO4HjnbrWw78+Q4BG/Mgpam7LHpxHdbtD4Qg0u
         6gMJzi0QokME5X3W0CknQVOhtzGKD1hmJ+bkvWUYiErUyxxO33PDCAakK4egTqj6Vg1i
         5RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=;
        b=RSZx+krkIxxuBRBTzO+Op2FY43DLgeXPLk8EbIkGztnujQI4FMWtUwYiOVxa7MDZjT
         hqgwx/9Fi2kVnfA3+kL7tDIqq79LGyMWyKFp+ZkU/ErGzkUfar8i0gYP/VCiLbX3xstN
         RaOTiBwp8GcEi35jKH0o8AzSiCvqZolPzbrm50kRnPIxEpmjjrrV6g6Ppy9/9e5nvP/3
         22MmZU8sfqH5Cj5jtwiata9XiyxChFs2TdusXc1FGmCUXff2H9IuogC3oLfyVuxI4TYB
         YNXRwM7rJy5+PS1W1ZOH/4AND5ryBwKPoIJ2skcZz2INVFSDSO5lBA1whpk6P4H0Vapo
         0OVw==
X-Gm-Message-State: AO0yUKXuqL8lMQrtT9T92vN9F89dyoV3KUhFp70ty+EZZaQSgP3cnTmk
	2HyOiSwXYNvAyNLU4CayH+0o3Q==
X-Google-Smtp-Source: AK7set9fN9lhkzsTcd/hCm+YqcO1tpXtDV/ErKyu7Dxn7TQH6PWFP0BxhlriXHSFNitMA1yqiFIQRQ==
X-Received: by 2002:a17:906:1ed1:b0:8e9:6f9f:7c2d with SMTP id m17-20020a1709061ed100b008e96f9f7c2dmr4914227ejj.35.1678533422221;
        Sat, 11 Mar 2023 03:17:02 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:01 -0800 (PST)
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
Subject: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:16:55 +0100
Message-Id: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031702_725393_BCF7DEC6 
X-CRM114-Status: GOOD (  14.20  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/i2c/busses/i2c-owl.c:510:34: error: ‘owl_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-owl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 98882fe4e965..99ddd8894964 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -519,7 +519,7 @@ static struct platform_driver owl_i2c_driver = {
 	.probe		= owl_i2c_probe,
 	.driver		= {
 		.name	= "owl-i2c",
-		.of_match_table = of_match_ptr(owl_i2c_of_match),
+		.of_match_table = owl_i2c_of_match,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-- 
2.34.1


