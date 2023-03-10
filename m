Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA299C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIaJ3CNzZzvLZoER+JbEXfRFWn2Y0AmXfJ1n98/Pih8=; b=UZ9oqFexj7pwR5AlzQVcayT6wX
	w4dimLzco08RM4xZg1ZW6zYDBNsmIjrSRH3XQ3FTN+zf/HDHaHASFpzwjjvQ7ysI3XDonZkdmAz74
	ATjrjrrzndrwAjld6d9zitpIYiAMCXvoKpmvdlk9n3bWMyqzzi83wfgkh6bKIbj0TuDVs8B5Nc60W
	u1p2yPrideKPjtvX/VKFxfa94F6LW+yAsCmGdzvG3ndVPNtrHaj4p1gFfRBESMDSqkaLl+uec8Xet
	B1DHclwj5P4npbMcbnKVGs3TAR4Xtbs7qSmm5T8b1GJOiyHCS52y3au50ptTdvZ/HdNtRLqc6F1Tb
	9I2MXeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamGY-00GfCg-JG; Fri, 10 Mar 2023 23:35:14 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEj-00GNgg-2c
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id j11so26472729edq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIaJ3CNzZzvLZoER+JbEXfRFWn2Y0AmXfJ1n98/Pih8=;
        b=fb1NJ83RjyRvSKj0rXB4LrfAGEIsxmSjejZNxPWkM53UJeQEzoPANpAkGjEWOssWNr
         cG8jEKufjok4zpc1P6XdyVx3QaRYE94wyiKjaPDo1STMngh6goWGRQgqTNJFuGRL8o+5
         dosIz0grQHvWJ0qC+Mg5QtyJ9+7JmX4qqgUjvLi6gByOTaDTzKcJoaZCnrt8c/JUl6ae
         oMaPC7T23+IoKlugxJTFWl9dEDgMuAMv7zWHIf32Ky7j9j/+DCTTTzJL+gyTAPENFePG
         yMGr9hnSbko6tWLPskVscE2ZO9vSFofD1V1rjQkrp2iQL55A/d/IUHnCnq+xGpAJ7o7u
         rwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIaJ3CNzZzvLZoER+JbEXfRFWn2Y0AmXfJ1n98/Pih8=;
        b=39ibJgIbZgmH9rHx25ZuZc8jeuPZ6BYH0dQLj6WjXn811Oyp8RMF1jI2Y1DSAtZMk2
         ZWU398EiADwBgLmuC/UmXN/1MOidU3pgKyO7ma9Svp+b1Hi+/OG6rWoS0yfASDp1hq2y
         cwEU1qGPco6w/dvNxAslWNdpbsznne5eeS+GeEabMhMgNb8nCsyWT1aifIX66ZtBHaZb
         crUTBTLq5Z8dGkxfTrFhZG8PeNTm/sJYqIK23x6wwvrEoQa2nBsFVxssuYVt2xNBrPk9
         /Zshw45XQerRt5GkEW9YAINzfmKehcKy0ztMixZS8NtpEEfjhH/q3lnjLylLGnNFwPFA
         6Dkg==
X-Gm-Message-State: AO0yUKXhe6Sqp3WfnBPacnQEL6cClnAAjdpqoux23BHJ5rTbuVHzOzPA
	xoCeWIsRyXqoXXsKED7BlVK//w==
X-Google-Smtp-Source: AK7set9oOs+ouUsV12VicHtBBZ+mnisQzcWRj4a6R7IcGKs+Ki++e/B2Xo1UC0guT3zbocHXFlq8Rg==
X-Received: by 2002:aa7:dcc8:0:b0:4fa:57bf:141a with SMTP id w8-20020aa7dcc8000000b004fa57bf141amr213950edu.32.1678487356567;
        Fri, 10 Mar 2023 14:29:16 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:16 -0800 (PST)
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
Subject: [PATCH 13/16] spi: bcm-qspi: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:54 +0100
Message-Id: <20230310222857.315629-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142917_128655_F82F4F62 
X-CRM114-Status: GOOD (  13.16  )
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

  drivers/spi/spi-bcm-qspi.c:1460:34: error: ‘bcm_qspi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-bcm-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
index 0eee574d3e1f..1de1b669fc96 100644
--- a/drivers/spi/spi-bcm-qspi.c
+++ b/drivers/spi/spi-bcm-qspi.c
@@ -1457,7 +1457,7 @@ static const struct bcm_qspi_data bcm_qspi_spcr3_data = {
 	.has_spcr3_sysclk = true,
 };
 
-static const struct of_device_id bcm_qspi_of_match[] = {
+static const struct of_device_id bcm_qspi_of_match[] __maybe_unused = {
 	{
 		.compatible = "brcm,spi-bcm7445-qspi",
 		.data = &bcm_qspi_rev_data,
-- 
2.34.1


