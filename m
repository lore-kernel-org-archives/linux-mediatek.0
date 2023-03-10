Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0778BC6FD1E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4C8ul8r4FTTSiZJ472TZ7PsXvPEhmFf5+M7zLcSIw8=; b=RpxJ/dE+BkT6aRFuQb5yM25gUn
	vFZYLxDlog5++/s3UIOeHcazOhxaCWOfFR5I9ysF5lt2VUzlChuOcgB+a2C/rEglxlDfzDpgTDlN1
	YiqDJTfd8PndvJ0Xb9orYwFWiVCgTm1+uObLOANRXMLicxmHDAJFK0c1i7Cc2pXTB2faOQV7IZVPl
	HF7JnD04eTW/1LF1DQJr9FVyT9tP4HNQcrDNep/vIlFtPnlSfIYSeSeKJUpKoKH7KVM6vLPLlpxog
	SlCC+xaLKccWseIwKHvKnF6tNZep9i8DKytO5CUfzmH4HTcV5zBhV6HLEKRnmpYaL/ILAIRcMQHRz
	OrOLQfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamHI-00GfhD-LS; Fri, 10 Mar 2023 23:36:00 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEn-00GNlj-1u
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:22 +0000
Received: by mail-ed1-f46.google.com with SMTP id o12so26455748edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4C8ul8r4FTTSiZJ472TZ7PsXvPEhmFf5+M7zLcSIw8=;
        b=rrEwy1/EkKM2hXYDjXm39vr4v4A3eFp0vxvvErw0JyGtOLyGzIPJjSe+i9/9yBHwBo
         ggaHhX0ARMHrz05m76okNh3eCxxkXswhGfFQlh8eLEaz5q4totxmsxrVKzzBcVPBlD/r
         43Om/8th0/4GENyp64/VX1I0z8locQldE8GoKn//2LSXEUixCVdNQJcwBsfbBKvRF4Nw
         1L0+7vFPvhd6M4ExGtj4xFecNGFGuBJbBwpaN5Ez6o4kPkYXI5CclN4jOfC5FSg96/K5
         A3HVNgymCz5jus/z1ws+Kq28D+AiPQyBaTjxTt2vechjWxkcXHoPWEnZqCMB8j+ZvSaF
         TWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4C8ul8r4FTTSiZJ472TZ7PsXvPEhmFf5+M7zLcSIw8=;
        b=UOzNCclkupnkBNAzsY3GJRz86nYIytsMSDd4crMO40XUqctXBG2fWBYfYoVQflPah8
         4y4uuEdi+Hgz0i4ra1cmlLdMkpalklCpq2XiJsQABGvzuV9g8gtE4DAa8tMAhrt2Wdqq
         vQwq69T4XQ0GJTUiwXZrUrRGbUze0Rqo/Oy6Ep2+JgRwr6grYi/nDOheVKEus+0EbNDw
         PQMpU6m4YLR4VqYawMgYQVk2eISaDZwn3rCoPmfi/uLuqHe0rmcmo3oqWo9t2nw16uur
         k60HFRXcFaeFopyeIPcKIUyLZ9W2lrhc0twmS94Vvbrcz5Pr9z1xJhYbpy5ylWrncG0h
         IzFQ==
X-Gm-Message-State: AO0yUKUyuVoEREL6qEFsbXoaBhB1PdKDtUK/K0sdCtsrmkbsz+zuq05g
	E5QrZOq5dHj/2a01kV9T1WvJ4A==
X-Google-Smtp-Source: AK7set9Dxapp5m7YmqmEU473go9gZsJAewh+nBqHr15xGDvrxDQqScmrTjf4oppgDcLOYI+pKl+ozg==
X-Received: by 2002:a17:906:3002:b0:8b2:fb3d:9f22 with SMTP id 2-20020a170906300200b008b2fb3d9f22mr25973054ejz.33.1678487360596;
        Fri, 10 Mar 2023 14:29:20 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:20 -0800 (PST)
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
Subject: [PATCH 16/16] spi: rspi: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:57 +0100
Message-Id: <20230310222857.315629-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142921_133850_C94B1867 
X-CRM114-Status: GOOD (  12.76  )
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

Driver can match via ID or OF ID table, thus several OF-related methods
will be unused.  Mark the OF structures as __maybe_unused so compiler
can drop them:

  drivers/spi/spi-rspi.c:1203:29: error: ‘qspi_ops’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-rspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index f494c86bafea..4724854e6726 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -1190,7 +1190,7 @@ static const struct spi_ops rspi_ops = {
 	.num_hw_ss =		2,
 };
 
-static const struct spi_ops rspi_rz_ops = {
+static const struct spi_ops rspi_rz_ops __maybe_unused = {
 	.set_config_register =	rspi_rz_set_config_register,
 	.transfer_one =		rspi_rz_transfer_one,
 	.min_div =		2,
@@ -1200,7 +1200,7 @@ static const struct spi_ops rspi_rz_ops = {
 	.num_hw_ss =		1,
 };
 
-static const struct spi_ops qspi_ops = {
+static const struct spi_ops qspi_ops __maybe_unused = {
 	.set_config_register =	qspi_set_config_register,
 	.transfer_one =		qspi_transfer_one,
 	.extra_mode_bits =	SPI_TX_DUAL | SPI_TX_QUAD |
@@ -1212,8 +1212,7 @@ static const struct spi_ops qspi_ops = {
 	.num_hw_ss =		1,
 };
 
-#ifdef CONFIG_OF
-static const struct of_device_id rspi_of_match[] = {
+static const struct of_device_id rspi_of_match[] __maybe_unused = {
 	/* RSPI on legacy SH */
 	{ .compatible = "renesas,rspi", .data = &rspi_ops },
 	/* RSPI on RZ/A1H */
@@ -1225,6 +1224,7 @@ static const struct of_device_id rspi_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, rspi_of_match);
 
+#ifdef CONFIG_OF
 static void rspi_reset_control_assert(void *data)
 {
 	reset_control_assert(data);
-- 
2.34.1


