Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6F0C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJ4eKElwcXuAb6zZfl+qVzBQVUqclnD1hUAJWdjMu78=; b=OOmHN4ieD/q8xemTtuyAZcBYUZ
	neuI/+vxxfksPlhYBgDV+shNT9j3uokQYUwaU9/7GS1629Mn0VX0c+cpqzclBRwaN9fLqfXbvSC4A
	JLEgOaatWaHFEqqzL23uQlc6AjMb1kZnC8x9IzZrIDQ9W/EZggikTQKsYs+Y6X+bbHNV/jT18Ospi
	imlEuShBxvu500Yv/d6jpx2Kl2vqsbS43HN0TCZvXv1bpV06UgdbMa9x8V9sHhE7UntbY2zi088d2
	Kl6hITJn6cTi/toPwiUETgO5y5f6+ZKmp1Huvsa51UnDopC1NVcYOzwu/t2zkcGcyWQJGJTy+BqE5
	8+Pqf04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppofx-00AgUh-1d;
	Fri, 21 Apr 2023 11:11:37 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppoft-00AgTx-07
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 11:11:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b4bf2d74aso1762581b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682075491; x=1684667491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ4eKElwcXuAb6zZfl+qVzBQVUqclnD1hUAJWdjMu78=;
        b=l9Cq+zu1tu3PWplXH9Uj+nBZKyq3Rnk2OdYC4CsMxNwxy1eLaZNZQXRZalzD/SaNF8
         O7qI0bCblAILe+N6lNiuhXsyfK46Q6dt3FcSeKctUFp+66jAkg7b5tvMvDUUJPYAEeUX
         EWp/H37UdqKNTDzMK0c7LEh0zDkZlLmhDVjjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682075491; x=1684667491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ4eKElwcXuAb6zZfl+qVzBQVUqclnD1hUAJWdjMu78=;
        b=FeFynpY40wxtPHK+F04bsTNTqnG9hglNGK5kW+HPIMuQ9DOkS0rT7lZpxcw1TfryXW
         nEMhNCNKw1i0owwxfP6ifW2B839sZnlKjSzQa6XgLqFhmLtYlqZfQ7O0Co/7vYJ/0Udj
         MLTfV0+m42lSeQk9hC6m/nkx0hjrpePSIHcJnF8llh+975urrKthHfwh32IbGnZ88Ijf
         N30GVjVRMhOFAHJi2YkGW4APRU0GTDimBWNbsZWuXKADQthfEnqu3ePsyXO2KRbKFMWu
         QSKllPiUFmsHNNkbFMR42otJLPI22vdtKSRjyYn2uhZ8Bw7tCcnEuXos9HN46GkesSh8
         DBLQ==
X-Gm-Message-State: AAQBX9dG1jvGR7AxD1INEJtBJ4p3g6TFEVuPJ7EjQ5Cqf7d8yJY34FF3
	VY00feB/p/zHQXeUsBkfEr7w+w==
X-Google-Smtp-Source: AKy350YjnNhyz/5DJTFMIFsnSfoBoVKhugxroxKYawrehd6/D9CSJXkJCdAySnCEcB05FVhuF+9sqg==
X-Received: by 2002:a05:6a00:15ce:b0:63d:3411:f9e3 with SMTP id o14-20020a056a0015ce00b0063d3411f9e3mr6904730pfu.19.1682075491514;
        Fri, 21 Apr 2023 04:11:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:47fa:fa8d:a971:f6ac])
        by smtp.gmail.com with ESMTPSA id x4-20020a628604000000b00639fc7124c2sm2840983pfd.148.2023.04.21.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 04:11:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: mediatek: Enable all MT8192 clocks by default
Date: Fri, 21 Apr 2023 19:11:25 +0800
Message-ID: <20230421111125.2397368-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_041133_119320_95F92F3A 
X-CRM114-Status: UNSURE (   9.31  )
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

Currently the base MT8192 clock drivers are enabled by default, but all
the other clock drivers need to be enabled by hand. This is extremely
confusing and inconvenient for end users. For the MT8192 platform to be
useful, most if not all the clock drivers driving the hardware blocks
need to be enabled.

Enable them by default whenever MT8192 base clock driver is enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 99e67c07e638..48b42d11111c 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -781,72 +781,84 @@ config COMMON_CLK_MT8192
 config COMMON_CLK_MT8192_AUDSYS
 	tristate "Clock driver for MediaTek MT8192 audsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 audsys clocks.
 
 config COMMON_CLK_MT8192_CAMSYS
 	tristate "Clock driver for MediaTek MT8192 camsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
 
 config COMMON_CLK_MT8192_IMGSYS
 	tristate "Clock driver for MediaTek MT8192 imgsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
 
 config COMMON_CLK_MT8192_IMP_IIC_WRAP
 	tristate "Clock driver for MediaTek MT8192 imp_iic_wrap"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 imp_iic_wrap clocks.
 
 config COMMON_CLK_MT8192_IPESYS
 	tristate "Clock driver for MediaTek MT8192 ipesys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 ipesys clocks.
 
 config COMMON_CLK_MT8192_MDPSYS
 	tristate "Clock driver for MediaTek MT8192 mdpsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mdpsys clocks.
 
 config COMMON_CLK_MT8192_MFGCFG
 	tristate "Clock driver for MediaTek MT8192 mfgcfg"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mfgcfg clocks.
 
 config COMMON_CLK_MT8192_MMSYS
 	tristate "Clock driver for MediaTek MT8192 mmsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mmsys clocks.
 
 config COMMON_CLK_MT8192_MSDC
 	tristate "Clock driver for MediaTek MT8192 msdc"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 msdc and msdc_top clocks.
 
 config COMMON_CLK_MT8192_SCP_ADSP
 	tristate "Clock driver for MediaTek MT8192 scp_adsp"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 scp_adsp clocks.
 
 config COMMON_CLK_MT8192_VDECSYS
 	tristate "Clock driver for MediaTek MT8192 vdecsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 vdecsys and vdecsys_soc clocks.
 
 config COMMON_CLK_MT8192_VENCSYS
 	tristate "Clock driver for MediaTek MT8192 vencsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 vencsys clocks.
 
-- 
2.40.0.634.g4ca3ef3211-goog


