Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE64FA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIOCfVMQhu6G9ENJOqDHIKDLMubngYMP9+O2JUUOSo0=; b=ujVtpOXz8jeBIkvKg/6/4OAlcJ
	MG3QFvMH90XCsLE+KNqh0jyiPF1dlgGArw4OI2OG72bDDqx0TsNnZ5GW8gDEA2rgy89Nyt1opAmwt
	J334+rD++3A58y/4DHmSIni3NL+yZ0mEXWvOyFZvw2FDPPjuTYTJQnQHAtIFMnxcp3cKgEhHt9t9+
	DQrgI18InfgjSOzGWnVwZdfm4fZmNByzfDbibPw/m4AkDJUTn3Y8YTD1xEFr/Q6LAs2EilooEU4b1
	znZ53CmEbt3h32g5Sx4jJfajzsJk0jovnqid3QU7v035Tl5dEBqFxtRJhLQ5MbkrYPIKiBs2/0Tv8
	HY6aM2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRBm-00AAjd-5v; Mon, 31 Oct 2022 09:34:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRBX-00AAWa-3g
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 09:34:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id h9so15150328wrt.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIOCfVMQhu6G9ENJOqDHIKDLMubngYMP9+O2JUUOSo0=;
        b=zFXkxtX1PFkSjJelo7kyZc/Zq+XsOPZRH2RbVLitW3lM+AzsMjRLK32yQpgYQEJhbU
         mSPbA2fFm48bLL6Xl0/C+HO8q04EJLWrORrFVCkgADHxq7FAXWLtZVuMFoOfSGmSdwQ2
         5sQPEt7d9F2biobOm5RSqIB9tfFzaIkFoVq9WcvY+LBWYdLyDKsLQDNBwUc7xUESxhJ6
         m1BeT6H6mWqP6LjFb5T2LlhVzwfKtSfPDyexYKk6vYauObhiW1dm0/cDFwVsjGKCl1/s
         OZoOhR6tMagY2e+6LQP29qPSkUohw8V8x6hqQZ0wj9PlR6RR81p8v5HZPoT4HWk0+wsK
         mZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIOCfVMQhu6G9ENJOqDHIKDLMubngYMP9+O2JUUOSo0=;
        b=soK8ttaah+EemFMauONyipb05kqJ4fkPnp/IN3Y5smqWeioYTQj1fCnq7OAdXvo6lK
         uylXeA0MNx7SFjtkxGkYHDEwKhrT9IPg9h0zCT277+sdwrq0G4zUmxugcC+eHXCqz4X1
         0fIR3NoAg0XoVhObZKFdHufSK3pB/oM0W4Lilf9xBxvXGcotWU16Yg9WUgh0Dqz0l2VQ
         rpS3G5LVyiTzwkYHmqbbvrHDSEBu2FSCkYXmg1mqhYOIUyLokAn4qPvD+L0Glq84Uewx
         czuGIgn/q6AIj+G6tKiR/qPpTo9ltYzP8io+S01rtONGnLjsiUxDlQMokxEzX/6GjJe6
         ao9g==
X-Gm-Message-State: ACrzQf2WACyQgMqqyK+vLAoyzFuAmt0RsShV7TKGbKMw1LDXNhqOUyhU
	0uYslwQUicPYt84/8OXdP+bO7Q==
X-Google-Smtp-Source: AMsMyM7tkQKYDQjctrHNYNq3vnQkCiYI/lOahkZoAzSGPvKC6fMPx4CkMjAjTgXl+jOuHxq4Yl2aUA==
X-Received: by 2002:a5d:6901:0:b0:22f:b097:7de6 with SMTP id t1-20020a5d6901000000b0022fb0977de6mr7625253wru.373.1667208861911;
        Mon, 31 Oct 2022 02:34:21 -0700 (PDT)
Received: from fadwachiby.lan ([2001:861:3104:1980:6db3:63f:b30d:9361])
        by smtp.gmail.com with ESMTPSA id t16-20020adff610000000b0023538fb27c1sm6547566wrp.85.2022.10.31.02.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:34:21 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Fadwa CHIBY <fchiby@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
Date: Mon, 31 Oct 2022 10:33:56 +0100
Message-Id: <20221031093401.22916-2-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031093401.22916-1-fchiby@baylibre.com>
References: <20221031093401.22916-1-fchiby@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_023423_495605_F64B41BF 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

From: Fabien Parent <fparent@baylibre.com>

Add pwrap binding documentation for

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fadwa CHIBY <fchiby@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index d24e2bc444be..12e4b4260b40 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -30,6 +30,7 @@ Required properties in pwrap device node.
 	"mediatek,mt8186-pwrap" for MT8186 SoCs
 	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
 	"mediatek,mt8195-pwrap" for MT8195 SoCs
+	"mediatek,mt8365-pwrap" for MT8365 SoCs
 	"mediatek,mt8516-pwrap" for MT8516 SoCs
 - interrupts: IRQ for pwrap in SOC
 - reg-names: "pwrap" is required; "pwrap-bridge" is optional.
@@ -39,6 +40,8 @@ Required properties in pwrap device node.
 - clock-names: Must include the following entries:
   "spi": SPI bus clock
   "wrap": Main module clock
+  "sys": Optional system module clock
+  "tmr": Optional timer module clock
 - clocks: Must contain an entry for each entry in clock-names.
 
 Optional properities:
-- 
2.25.1


