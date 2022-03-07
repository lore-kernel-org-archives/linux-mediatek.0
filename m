Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2iGOX3IwP162r6Svost1lSwOAPfKt2n5UKj9GUd4jf0=; b=1x8m9zUqWVucS4
	zz9BLoFaysd/J1xaeiZ6q8RbD+FPSI4oTA2tWIsylX9Vxz6OJL1flXcTVRwwovVdmfOEYfVaNXph5
	nDzsJXNCw+HAUMGGyT2/BaJuimz/abwa71+P7Z3xud3sxMPAZxmnni5BRq7MlNzKiXVPcZhUUbxt+
	pMYgf2M9eNUwksLa+lG0Joh3X3UT+ZKrOhTlYtSuPMqnfyB0+Egx9vhaq7FZUOoQMTp0gmFHmUWzS
	Jai3ZJjwtjj1O/eRj5JHcgghiEA2Ml4MixJIKbwV6GvB5EDbJZzQBdYBcIEe384u4OiUNsZjAHWW1
	lvf0W71vvKOdCOTydzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRBdu-00HK2D-1o; Mon, 07 Mar 2022 11:35:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRBdW-00HJto-5D; Mon, 07 Mar 2022 11:34:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id g19so1932085pfc.9;
 Mon, 07 Mar 2022 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=o2TUOqL7Gj4mlejca+dXKhqX+S5Wl6c+nk3MzcmnOGU=;
 b=UKARoSukGsSQA8t8WZtHWUTlKTCrxkNh5fCDeTQ6DDqzOk+Bt0BCvIzdh8g0siSdH3
 0jVoyD/2BcWpvUeyduyX0TmdrIlsGxOCXLNboiGcXybpBl0hDDy1/S0xEL/bOQ6jDbRD
 UtDR07ypIbHutUZg3amRq38Rx/wRrQWiGx0SHbzKKV381/7xR4oU58tlF3fn3vFowwmY
 /5My+QqLOnTx/R54m7bPzpZAsL3Ezco0GajmD7ZMTnwyS2fHDu1ScDYjpaWoTuBNmR1o
 r0KcZ207pO1lpoxKreNxna/CQ7SUmOLdoFkVAOw+QEhpozDKz1yOQl0gH8Z6vOVm2JOk
 qZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o2TUOqL7Gj4mlejca+dXKhqX+S5Wl6c+nk3MzcmnOGU=;
 b=tk1fOjf42m8SC6b5cz/kNPkzQPqOeijzKBYLEkp89ejuTry9V2hDvIeqyeQBNSd4w7
 0fOE3XHSKqoCuaUqvLq+q5R25SO77+OT4/sUo6J5EnwV+96PNLOUov/4YRxuTjg6hpD7
 bgO68RVkf2lAZV/5UEH8ZqDEBCGdknOfXn1ALzuxU6tCmJsrRJeuHwvyu8elqO2z1OMe
 4Ub4x6l8wjRG++EjZGQt5e9xzLp85eKI7V2S44hEK8JAZ+SR2czxd05TC+I5h3jI72gm
 RSpPnYxa+WyaUDRgZ4YDocV5KQCMQ1OLMMw+vK8I2XsDq5tL24d/008NVYZUMp2Mqsfp
 mBRw==
X-Gm-Message-State: AOAM5300DKIn7N0J1n2S2X1mHlKvZkgl59xH5D0jonh3WkyrCW1swFPT
 1phfSk1BBZ5S5GAv7CknVeQ=
X-Google-Smtp-Source: ABdhPJwRHD21H7N+UUvk56LAoC2esABvsT2VtSSXPkhLlpf/fO3yhYxj12yO58zjYMhjnjOHdr8NYw==
X-Received: by 2002:a65:5bce:0:b0:372:cada:865d with SMTP id
 o14-20020a655bce000000b00372cada865dmr9263748pgr.199.1646652885036; 
 Mon, 07 Mar 2022 03:34:45 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 q12-20020a17090a178c00b001bd036e11fdsm18522965pja.42.2022.03.07.03.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 03:34:44 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Henry Yen <henry.yen@mediatek.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] thermal: mediatek: Fix some leaks in mtk_thermal_probe
Date: Mon,  7 Mar 2022 11:34:38 +0000
Message-Id: <20220307113438.21338-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_033446_387496_589E15C8 
X-CRM114-Status: GOOD (  12.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If an error occurs after a successful 'of_iomap()' call, it must be undone
by a corresponding 'iounmap()' call

Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/thermal/mtk_thermal.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..9d7461a5c2c1 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -1035,13 +1035,15 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	if (auxadc_phys_base == OF_BAD_ADDR) {
 		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_umap_auxadc;
 	}
 
 	apmixedsys = of_parse_phandle(np, "mediatek,apmixedsys", 0);
 	if (!apmixedsys) {
 		dev_err(&pdev->dev, "missing apmixedsys node\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_umap_auxadc;
 	}
 
 	apmixed_base = of_iomap(apmixedsys, 0);
@@ -1051,17 +1053,18 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	if (apmixed_phys_base == OF_BAD_ADDR) {
 		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto  err_umap_apmixed;
 	}
 
 	ret = device_reset_optional(&pdev->dev);
 	if (ret)
-		return ret;
+		goto err_umap_apmixed;
 
 	ret = clk_prepare_enable(mt->clk_auxadc);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
-		return ret;
+		goto err_umap_apmixed;
 	}
 
 	ret = clk_prepare_enable(mt->clk_peri_therm);
@@ -1099,6 +1102,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	clk_disable_unprepare(mt->clk_peri_therm);
 err_disable_clk_auxadc:
 	clk_disable_unprepare(mt->clk_auxadc);
+err_umap_apmixed:
+	iounmap(apmixed_base);
+err_umap_auxadc:
+	iounmap(auxadc_base);
 
 	return ret;
 }
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
