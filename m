Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E175DC74A4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76/EJUTO15RzyW4Bq3aXjUUXSFzqS7eUnx+uuY+qlw4=; b=S7cL6L+Uox5bI7venWW64IeX6j
	83QX8lpscsOos2cyU41Bvt/f2m46SGeiwTpDOybp99oUJQChWUg205axmrEx0UqfsrQeeYl0guZ0r
	D0/bJ8yyOTnC4uVYe4jPHm5h4Vt826KCkNh1pJyfZWd+KNqjAGV0YnvENAMt8nhSyf6+zDns0kxqi
	/NR+nM/tPh/qZQChvJEQqc8LiHyT5SYRz5wjBmRJGOU8lNfPzGwlxPrc3xEkZppf6fbzJemfaeL5J
	tiYbwriGBp7c0DUFUk//WqgJCqaARDz74Bw8NBIG+2TPE8UQnMk45j9tO2rdFdKS+nzhmlnIQaAx8
	z2Ce4ybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamDE-00GclC-Mr; Fri, 10 Mar 2023 23:31:48 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEY-00GNiK-80
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:07 +0000
Received: by mail-ed1-f51.google.com with SMTP id g3so26537452eda.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76/EJUTO15RzyW4Bq3aXjUUXSFzqS7eUnx+uuY+qlw4=;
        b=QY+FHC9r4+RzAXwp4hRMO7dX5kmQsDXfU75lOdEZEw/5sR6fWA7KyEW89bZ4QaKtiA
         5nMcH4WM7F79MtlVuGFWbq4njYJHE3nin7z1x5/Y62sE1/FUd9ROnyj6/etq6mfce0GT
         UxU44MXgwq+ozgNLDyH6wRr5FmUGNNLw+fwUCP8Q1mITsJ2iI7TiO14GMnI+kmZQvO2b
         /b7APHAP+iaFIBAZnYZwOMDVAnlxbRZkxoOpLaGVakb3bbfVJBUjdnbU/ryWER1uX1My
         K7WeYQ3YEjmvpVGLlt61EcqGbwxZ69eWbT1wLS4zIXYURTaaJtMwwLqRjWPfF3WNdTDp
         ZZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76/EJUTO15RzyW4Bq3aXjUUXSFzqS7eUnx+uuY+qlw4=;
        b=kXAecMecnnovoBLT0Eq4wglm8lBvxlpfkJI0JAnwj1NeLeG8pu/lOE3fKGyaP3A3Bi
         /BrYQR1vfUjDoL7dvYkH0VWgAkArCMczXPTn8QpNschkFz6YvPLxfqvqzomqc8f6191z
         lIjRZPgy5RzLQlLpMNAHTvIc5Z+lxCnAu67xfSgs4nhyvmDblgq6IwITfT3NAHFilP2i
         lXk2xsq6Tzq1NiONQEB1/8labrCyCVx4lKsowcZ9PsLPX4KhVcCuMRFtDv8+WuSSDMu3
         hbTV5A+3Ivdlb/pa6nuKxKHYjj9nUqBABQGhAY9mM5jrIbZye/km29TiBeFOb/29F1Hf
         lWOA==
X-Gm-Message-State: AO0yUKVOY5gyjfoA8o/ZY3XTxJs0daUJ+3ya9cfNSHv89m86c4rqZrDl
	P8fWLsxZNE9OjrZvq84V6Aa0tg==
X-Google-Smtp-Source: AK7set9xqAwgrRfSWZTYjl4H4cCqoLWPjOPJyHkzao/CGH+3TLt7ijPQdvoiK9ldcAApOqBUnsuWUA==
X-Received: by 2002:a05:6402:3d2:b0:4ac:bde4:ff14 with SMTP id t18-20020a05640203d200b004acbde4ff14mr25348254edw.42.1678487343369;
        Fri, 10 Mar 2023 14:29:03 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:02 -0800 (PST)
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
Subject: [PATCH 03/16] spi: meson-spicc: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:44 +0100
Message-Id: <20230310222857.315629-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142906_305693_65054D7D 
X-CRM114-Status: GOOD (  15.56  )
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

  drivers/spi/spi-meson-spicc.c:949:34: error: ‘meson_spicc_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-meson-spicc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index b9f812837cd6..2e9cbc507e26 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -968,7 +968,7 @@ static struct platform_driver meson_spicc_driver = {
 	.remove_new = meson_spicc_remove,
 	.driver  = {
 		.name = "meson-spicc",
-		.of_match_table = of_match_ptr(meson_spicc_of_match),
+		.of_match_table = meson_spicc_of_match,
 	},
 };
 
-- 
2.34.1


