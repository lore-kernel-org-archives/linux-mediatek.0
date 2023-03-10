Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD14AC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=; b=E2hL/YT3j7a5AkgNDZKh1SpeRH
	LuODZpC+IQAR8C5moFQqt3OqRcVTuROqaKiXEuIGigURJ/5beEgiQhABS8YFNIZkC6R2AbFKrjNMN
	zOC5TyeOvdoN1N+RT5I4FPPCkYAc0BxC3FfKMdhRVgsyqojh05bPwu10tUHLHRUMj1Df5XKj7w+3S
	ITk1c3IVfdvBqvVEKOL9SPFmvmwBU72jz4xVaeiQdE+yArgBwXku0H5rhxc/IUnJzgZWV3spPibmp
	PlEl6KSWZaVPvn+MsGqwkjwyUovKCo7ZdMrkGnn58q3ccNj7cKkv+2Eu42/uqMY/dq0fAHjMDCn3F
	QLqRMWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamDF-00Gcln-Hl; Fri, 10 Mar 2023 23:31:49 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEY-00GNgg-BW
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id j11so26470990edq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=;
        b=YErFPXDcruuSCyquGlOEihSnf5WEX5TfRFUNUpk794YqO+3d2tGrz+SAukBB6cHeeY
         6f+NU1SAcvVQh206gJNQOLThJ1SeBSThVgv4zR1bXtJdov0FTIYm4pigzFzvKgXKFaCM
         O7ycG+h5VlOwwhKy3GFtQqV/qtNb0b1AcXMZV0wUHhPD7Basl1eKhl+JCDJqKZPWCnPT
         eiAullbhW79U2YRzArw66eDxZ8lqWSfLdRvprB+5f0RyrMcAqDsKHRdrQj5P5AgRZ/Kl
         lwTOuZL3qbuXuP2Vo/rSeZNkzRlTRJvk32snxMw8+KJAOonVRC+QO+iD6crmCf0gb4de
         Lk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=;
        b=DyJDnq8VH5nybB08NrkKJMDtzrzgt9Cu2F6q8UHZZAJgkzPvu3FdiIB2WuVCyYycoy
         IyXFEn6vmhRKaNEXzhmjIHNEsYjoIk3i7bO4Xp558jCmbG+f+DFQZNRwMPbqL51vehmc
         Odo/n9L7tWOZ3xSlhK1BGcWezpvbtamAmhfrxo+wTqyzfmJDLw36Ai5BveWW64T72LwQ
         O0kWyn3JbTyCDs3wT9xyM4Foq88ignDBTrFo88iz1j+ao2/yUADjTmYE/uh2R7Yu80vx
         9z4zCs51VxicEP17i386o184EiIu7l5vYvzbNxjjs9CIBOcYyvpXnlQsgSlpCacYGM+Y
         8d9w==
X-Gm-Message-State: AO0yUKXurQWcXFwoge7dEugstRLdj4VYsapOAZVxBTWDpX+DBE0msG7U
	e7DyUgkuPqFzQ15lHVuzqIO7ZA==
X-Google-Smtp-Source: AK7set/MN1PmYbla+81mnyLbnX24dl5dsGO4HTEAGHBQdx8CwTY3seLWUkHX5GZDY+FpxIzcnKNvFg==
X-Received: by 2002:a05:6402:1804:b0:4fa:315a:cb55 with SMTP id g4-20020a056402180400b004fa315acb55mr597332edy.21.1678487341960;
        Fri, 10 Mar 2023 14:29:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:43 +0100
Message-Id: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142906_410910_B656AD01 
X-CRM114-Status: GOOD (  15.33  )
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
matching via PRP0001, even though it is not relevant here).

  drivers/spmi/spmi-mtk-pmif.c:517:34: error: ‘mtk_spmi_match_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spmi/spmi-mtk-pmif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index ad511f2c3324..b8583917fa11 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -530,7 +530,7 @@ MODULE_DEVICE_TABLE(of, mtk_spmi_match_table);
 static struct platform_driver mtk_spmi_driver = {
 	.driver		= {
 		.name	= "spmi-mtk",
-		.of_match_table = of_match_ptr(mtk_spmi_match_table),
+		.of_match_table = mtk_spmi_match_table,
 	},
 	.probe		= mtk_spmi_probe,
 	.remove		= mtk_spmi_remove,
-- 
2.34.1


