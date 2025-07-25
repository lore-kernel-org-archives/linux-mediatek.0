Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C39C87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpMv/YidPhET2ZnB4avevT5/yZnoFF98t+d9v4dctnU=; b=G4dgdeAfP7FtWt1TkGoXYivDne
	TU2qtZXFnG3r55wTYgzxQ+gwGhedvUhFzYlzrKXklEkQstryQc+gHLWBxKQnAQXdcDlcmkMWRj1qy
	tRcajPUeCJI0mbf23VXIgcJ4bg/1EIH4GHiq5K6++m5KjVJc0E/JvFPQS6k8lZ3+f7XrqmI3fDmu9
	9v6baMI3UUJlAz64NQXPLORjSywuTKeSJO5ZCkSWOTPTK9uUUVjXXSk9gVCu4HXFNTAUT11tgYbmB
	v1mzR3f/wlTXZcDrEzNGmY4lyPEMyVnR72qeJY//R4bAF/qHj13WU8QoutvUvyC15mfIml9HfQAsu
	XoONsYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKp9-0000000AAEl-0V2q;
	Fri, 25 Jul 2025 15:59:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcE-0000000A8Vs-3ZxZ
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b45edf2303so2005910f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458345; x=1754063145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpMv/YidPhET2ZnB4avevT5/yZnoFF98t+d9v4dctnU=;
        b=izckWfKibwAv0DKXtTKSnNj08JEZzSr4PyzhjluPA1sg0lOm+8KUpyer1Hjy+5RTtj
         7aD+5byujOaPgpv9hb7MNOlNmBkKK2ZNfKw6EM5WubkYwzpTqqVbVAt9h1wVpzMiBbCn
         /JFEknkf54tURw7Zg1Aeu1Rd5k9N2WAc+5xFgw3Y4/PeEzt3jocFsMIAQu1vrSomp/4R
         JdYW6kw7CMMvN9ZbwaUi4hnznU1ZXexzM7E5QL/6JSgF3ICXGWEHOzrGnTJTKHVAeIdx
         7SL6PePkVmO4CMbztrvGWurzz3IEtEM1O6+BgjGac5aVfv3jKalM7oxpKPycUbFqhviH
         HL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458345; x=1754063145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpMv/YidPhET2ZnB4avevT5/yZnoFF98t+d9v4dctnU=;
        b=O0cLp0rh/giUzeDnmyQwuy+99SR0e4IDmpmR3zW53jcon3fQrQwUOgIR91A12dE5vH
         AK7KyTKTy38O0QA4vFvvLFRcPpWduXwTTeE9DuEQDvW/mfjlRzOWgvBP2urYdYOjlSBX
         7cOa2IBNTWpJ7Cj0cB78qjMDFd6YgMbaK6QXrV7+d+dvl9gJ4a78nUJruSuhUsxBCPD6
         eZd+72QtprtvfgMiCL9BG2kEdDykyxAr5bi+rwD7ME6LDQk7wQnVAlVCK8DstRqN6dws
         +DBGpeOi5lJwFgZTOeG5QV/L0XU95rXasaBXgVJWipi4nP6NIVMaE67+xMkCIbIvo3Op
         7aJw==
X-Forwarded-Encrypted: i=1; AJvYcCXFQOxAZF/mYxA530WwSXC/PE4eXb15QYwhSsd3keB3nz11kq1VvXm6hi3rqQ4TBTIzR1GIF/SC2m5KzKsGOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziZATyCjX70dAb27QEjaeSwVZt56cd+L+FqTVMDCnlZxw0LDI2
	4UEay89iHNGSvwEazF4kmB8be8H3YCFjGjur5DVqpwD1KBa9az89NSTQxv6S2R8/J61CxB7T/v+
	3i/jr
X-Gm-Gg: ASbGncuZQFiOhuOtz/PWG0bj3jSwUvF+sJaad17B9t33H2T0HbieDn258fwm/N/3dNv
	GJisbk6UTZkgx7HqzJGTxgXa/GtdgbPFC/yeChgGgi6LHHDgJRdLVDvxXzWzKluKg2tJgcs3lzm
	rSpSkXhdimwb39Otrejk/MZOMYdypXEBE/AbFW+SkJsn0Q9QuDAI5EW0IkHPKymNr3IS9/0piS/
	Nvj/zxf4CEV2/7tGRilS2dAubnAMdZx2a0Vy779fBBjuIHJo5ytFt+XbX1Ky1Un1hUI9ojbwqDC
	3HpWoBA6BYaYZeJh5pk+t3mnaIvvERQi+qQFjIFl7Eu0xXhds3BxPsNDYX69yE69h55i3WyRa/r
	y/ggL5NbY7izYOojJAAYlz+bgQ8x+zCvjJ/Ea0kEtyWbDw9Qi4mAHM5VIxucC0oFY
X-Google-Smtp-Source: AGHT+IGCVEfrJiPwphHDH1kVjEgnoFgj+gabfrl3qoD7SE6yk6VjRY5CANy9aiWHLYWruZAR8hkG9g==
X-Received: by 2002:a05:6000:1448:b0:3b3:9c56:49bf with SMTP id ffacd0b85a97d-3b77668f23emr2158022f8f.56.1753458345142;
        Fri, 25 Jul 2025 08:45:45 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4587abc273asm1440555e9.4.2025.07.25.08.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/8] pwm: mediatek: Initialize clks when the hardware is enabled at probe time
Date: Fri, 25 Jul 2025 17:45:08 +0200
Message-ID: <20250725154506.2610172-14-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=h4C6mJ+6piC2VWvbn8TbcJZ1IdLRPgjUr4EY1wWAjGg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aOq0zddg0lRZ8kq4jJ4TGS7WGa6Vop+MNSf zuzJ7uKUSeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmjgAKCRCPgPtYfRL+ Tk02B/9cdR2DsEiX1JpyqyVLI+PAHhGbf1/6BAPibHuJh7ncfqBV5Fy3KKtoV1ToHfCAKPZ8p95 uFZ8f60PEMgdNCQTvao4q5Pt5FQQtM6bnVdew5sgp3ywAa/FGTWtFIKNd4Fo1ECx8PMNeiSSbdC tt3KjRdJK71C9ZD4exwVBR1ZxkfFYpkN+to+QytRWrhVQkkeJpHNuYrijK7yWGAPkLsu+taI8IH laxCH0Nsa3N/zioCxU/EL5mNyFZMbW8Co9I7VQjQTd6Mvw8vLGKimQZzONDC+YCBtE1p+1lRZ4J Z5zs9y27kMvoVA19HLBRnVgij8VYHokLHjrblLXNH+1uz/3t
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084546_884412_BA37510B 
X-CRM114-Status: GOOD (  14.13  )
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

When a PWM is already configured by the bootloader (e.g. to power a
backlight), the clk enable count must be increased to keep clock usage
balanced. So check which PWMs are enabled during probe and enable the
respective clocks.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 16ea42be4c18..7d0a6f41d671 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -235,6 +235,49 @@ static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
 };
 
+static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
+{
+	const struct pwm_mediatek_of_data *soc = pc->soc;
+	unsigned int hwpwm;
+	u32 enabled, handled = 0;
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_top);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(pc->clk_main);
+	if (ret)
+		goto err_enable_main;
+
+	enabled = readl(pc->regs) & GENMASK(soc->num_pwms - 1, 0);
+
+	while (enabled & ~handled) {
+		hwpwm = ilog2(enabled & ~handled);
+
+		ret = pwm_mediatek_clk_enable(pc, hwpwm);
+		if (ret) {
+			while (handled) {
+				hwpwm = ilog2(handled);
+
+				pwm_mediatek_clk_disable(pc, hwpwm);
+				handled &= ~BIT(hwpwm);
+			}
+
+			break;
+		}
+
+		handled |= BIT(hwpwm);
+	}
+
+	clk_disable_unprepare(pc->clk_main);
+err_enable_main:
+
+	clk_disable_unprepare(pc->clk_top);
+
+	return ret;
+}
+
 static int pwm_mediatek_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
@@ -282,6 +325,10 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 					     "Failed to get %s clock\n", name);
 	}
 
+	ret = pwm_mediatek_init_used_clks(pc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to initialize used clocks\n");
+
 	chip->ops = &pwm_mediatek_ops;
 
 	ret = devm_pwmchip_add(&pdev->dev, chip);
-- 
2.50.0


