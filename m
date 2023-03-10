Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D8C6FD1E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TH+2UFUJbKaymij+b3WrxcVf44nTpYHKEBIPAlM6LWE=; b=qDsRu7DbMYhcs9uVpgyclbiVVj
	KTLDIXJ0i3MiRSMowyidnsbPssMcpYQbHn1eHekAvxCXPlCqfjPsBjKOf0zYW1qpkuzfMhqgMP/T/
	eMomy4AxojYcCHFrinosTTxSJP+wbaTc89OFF+ByCznjOsOeXMY+8VIH+dzvg/jZkKfgWsjPtEtfK
	xfwsiAdU4GFhOFXTfQkE3bQ6t+SrQJ8vl1us2BoCQAkTNGY21VaUf0JUJDFd9cBCIB1uUxDiOgkfA
	p3QWm8gC5y7GBqbi92hgLvu8TAVqq1e6uQmZ4mV7L0SgxbSi2liaVx6ImjbQNuJxC8UDXQG5nOwH5
	MbQK7KaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamEV-00Gdnu-AL; Fri, 10 Mar 2023 23:33:07 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEc-00GNgj-GM
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s11so26457776edy.8
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH+2UFUJbKaymij+b3WrxcVf44nTpYHKEBIPAlM6LWE=;
        b=TavnzZF5kaPHm0mujD/3h+51xHQx7ZCx8G31x/bxMt3RbfzsnQrtXpv04b4bbdXXS2
         T3YKb7NeqFFdymYQG+jvv9I0fUbqvS2izxLVgYfVePxlIpQGz/thUXh2BQxKLm8MCNAz
         sqBFEdjft3Z9ikX2JNWpwOMLLRq6YTg/BjHv6LDnqrvnSszc5MkiEHODmrYWeiqZDifx
         E4IflVpvfeyGhsWS7EafD2stGzcVrnCIPRNo7Jmd2BmAfOfGDaBZKuAbkZGVdpLJ3WYV
         /KflYWU3yCTEX4qTuYr+a/+Gk0rNerW/kEfQveIZw3hp2m88bpisRoINfGmCaE4q49A7
         f2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH+2UFUJbKaymij+b3WrxcVf44nTpYHKEBIPAlM6LWE=;
        b=X/QgOoEHHwKukKpKEBykZ0KBXKmPy7TpF7ypgrz2x9Jy8gVSxbKhkPsrL+7oLCRMyq
         ZeTr8xs7p4fg2zGTmkv2rVN0k3/TXmrA1Rkl9+CUXY58XQiuqm7KOYpzwichuBLIFd2K
         I7HTIKg/1wLuMJyw4quFsSSUBxE1XWRK5VxSQSpiZ7e+6TBa2Mhr7x2gE5W0i7jLFgor
         C0Bj90VY15zygAl/eqGUMhfdiqTtZ+AtzfYdWARe8JbPmfKlzqpo4WMOt4cnfn21af8U
         aT9tz50ncltPYB9R38Az33paCMiUhyZ+MFYhxVB3g0rzkDKTVwW4/cJi8Pa43bLvThqx
         66CQ==
X-Gm-Message-State: AO0yUKURj2H3Ew40a/KCRjhMiPaH3d4NDRXo65xTSy1/7AF8Ldvax+vG
	nXtVunzmRyx0VxJy/Cv4QR1hnA==
X-Google-Smtp-Source: AK7set9cWJOlJkNbsIRY/kVw1cHXOuGBRabzfO/YisfOBi6mPLmqHO4D5ZvGGrVNRhOqaiOFRt27aA==
X-Received: by 2002:aa7:da49:0:b0:4bf:3cdb:fb42 with SMTP id w9-20020aa7da49000000b004bf3cdbfb42mr25096957eds.6.1678487350030;
        Fri, 10 Mar 2023 14:29:10 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:09 -0800 (PST)
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
Subject: [PATCH 08/16] spi: img-spfi: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:49 +0100
Message-Id: <20230310222857.315629-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142910_599310_C58F1548 
X-CRM114-Status: GOOD (  15.62  )
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

  drivers/spi/spi-img-spfi.c:746:34: error: ‘img_spfi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-img-spfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
index c64e4fd3fdf0..bc360e779933 100644
--- a/drivers/spi/spi-img-spfi.c
+++ b/drivers/spi/spi-img-spfi.c
@@ -753,7 +753,7 @@ static struct platform_driver img_spfi_driver = {
 	.driver = {
 		.name = "img-spfi",
 		.pm = &img_spfi_pm_ops,
-		.of_match_table = of_match_ptr(img_spfi_of_match),
+		.of_match_table = img_spfi_of_match,
 	},
 	.probe = img_spfi_probe,
 	.remove_new = img_spfi_remove,
-- 
2.34.1


