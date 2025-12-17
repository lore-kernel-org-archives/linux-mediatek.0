Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FA3D6554E
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTcwQN3kMfRwn0MOtZPrgw4H2EwbAELatd4tH4NVBgE=; b=IBwBhydol1AlI2qaXKm40u7XbM
	yMTSrlgpT1gitNO0Ncjsz8IPk8HdwxQun6ZFqv7as5qtdhJLs8BjmN6jyGr2v1q1pFvmugyxSDC2c
	2IQo3Yopiiy8d0ioSrB41YmuN+aQP9hvVtUF4nzgZtKK97polX3Ma5OoVhh/5lrj7b+p0G+R/HbbG
	4iGUw48TGzJXhOOh3glM9eZBOHf/g4sMkE7DZtyyZZJfY9MGCx/Ky5JwnNTPhzMDmlnTExJ45VjDC
	uyf007afQAU1mxNfmE+ZplL7VgSoA1Nj8A97mCebwRArAczTV2wkhDruK4TmRPGPgxahD1+zktb32
	J1xw87HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpaS-00000006hsk-0fyn;
	Wed, 17 Dec 2025 11:20:56 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpaP-00000006hrY-3tTo
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Dec 2025 11:20:55 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b735487129fso976463366b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Dec 2025 03:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765970452; x=1766575252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTcwQN3kMfRwn0MOtZPrgw4H2EwbAELatd4tH4NVBgE=;
        b=CtinEczlO+EUrxgDA6ELEh4/zPvkkv7rRZE0dxCv5HYoIcBwFIon+qnKW/DNDDvZHe
         AU0g1k+YHyOqZDcyxaGxOG3M7m3eCnKvs2qKCAOG+DXYp1DBVkhOkFTupIix5kbuU91X
         /KANWGA6QjNiwIaDBrmuGK/fSFJAfeY8D6BspaamrtfU2kzkx72lir2u8b9zmgyUNGXr
         9bd1ijiH3VdWlsNTGxJOuSehp9YFomodlJdawwNZRUe8muPtMJDnzYCHuhK+1OeDhutN
         y+7flIk5y6pIGSKhF84U0P+5KpN6JKLW47Kf5agaKdVeaEFiQqt5JrMSYgBdXe4yyI5B
         KN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970452; x=1766575252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTcwQN3kMfRwn0MOtZPrgw4H2EwbAELatd4tH4NVBgE=;
        b=dqKsp/YtjJ3NqJtGpe+oeulILKjl28yZxchczTemdC71mVdZ2FFMynCTbyY2++I8uR
         z5OHimlZ9553WKcZAhlxfTvwsYLx/L5WThLYCDTyTN7Bnn8HS/WiUraveOtPlM1i23i1
         6ByVp7HfhnsqpIjjF8CehTQp22kBBU68IgJSy9dkIW3o/wfqlxNT8/nptjjy+D8TyRq7
         Pj9VibdEGK4/1EWduXrW1gE921SclV5bUC7ouTtP/yjRdrS/Z8kBNUA72Vh/P8OG+C1u
         BQ8c5DmL91CRznM7HSqLpOuP7iVxB2pTqVZxI7AHcDzVnF2oC7cqkkcy7j+V/FblEdW+
         ibSA==
X-Forwarded-Encrypted: i=1; AJvYcCXKL0Yt3kgXyP1s8JxmZhe2+18l+t7vSzW4gLAgEAWY5f6Fh304HdR2wyIxogLxsqgIQNsg/7DYx3nTuN1DZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpp/Yu7Ucegki9A4SiNrLLRivRmnGxSBsY0MwaJBFXWQwtXjsl
	G4vEsjDYx5//fUD4DaSZukwEHwY+y2mdD5Mxt3mj5xdfdtlb6PzH9LXN7mdi37EeOoA=
X-Gm-Gg: AY/fxX5abNQAZyxPMRiOv895qarjqB1kMcuUDAypnlXn03U6NQAOuL/0PvSF+8ECmVf
	J2ADjhpqMptUrQWlnVywJaSlFNLTbeZLFU1cyrv+TaoyP71nBz98IExkZ72OXYO5VzCjyBQpIGM
	1LAFUhE9yDxQuFnrcZObAziA0a39PskcFRUM8cskmS86emt+FPpO8mMEO3pixmVdQ4JNMJ/rR3l
	uepD3/WMDVboGEEJFtN02acLMyPaWqHDOMSVvmM7OheCKE9bL8/24rW/tbyRrk4pidLTTTwg12Y
	hLM/vGiDLU5Im499d5sYT6VNqNheSRMFM5YWg+jLJMY3RzxJKZcJ1qHjUoy+1wUNoyQVT0+o6Ae
	+Ad5oZVeDiyCM4/Dkohfm1a4ZTw4xRVBevbnWbpvNc7Wh5yZISKxQuaV+0xIVtEMo84d8Sm6z/L
	mSZlrAEVPzXURFVUUdvKE9iu+sTds=
X-Google-Smtp-Source: AGHT+IEagpbs4HyNCpsx7OlTFhT0q9uoh62JevUfquHGVnwzeKSmc61VVn5TagHQj0mzzpbxTuoklg==
X-Received: by 2002:a17:907:bb49:b0:b7f:eb45:f572 with SMTP id a640c23a62f3a-b7feb45f993mr603953966b.55.1765970452008;
        Wed, 17 Dec 2025 03:20:52 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7ff725efd8sm417291266b.27.2025.12.17.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:20:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtksdio: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Wed, 17 Dec 2025 12:20:33 +0100
Message-ID: <20251217112033.3309281-3-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ip0toTFqPEpK+4s0Rx5RGWhl8GI5wCxXBuwM4DUFaEw=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGlCkgGiATO5RL0sh3KYGWs49kKJWdWd4V/InvAHNjCL/KJfD okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpQpIBAAoJEI+A+1h9Ev5O0cUH/Aoc wZfGf5D7k2Y3xp+Eq2OKaDjC4SdZdn1wPRyKoxuxJ6Tw777evLx2xaxOJa8gtNq3XXkl1d5ytJb wVedpUMeon8lBhvLxJIQnb5LneH9ERGhyVon+g65nMM/ncWgUyT+mQx9vl3gF/6wa1uz9rJUB8E iio65wqGEYu8Q7cWuo2o8sf62CaSimzLrnFiwIbD5k156AgQJIbnBB6+bahGKu1Cmebl6ZtC6CQ 1a3CoPsf+je0wTNPMlCc3Ze1MxMrEJ2spZdTy/SbYZQIG8OuMf/BsLcjij9wWnmYSQ8fcKxhOhU V130qUndlr9XefXvOApYyIOHzdPIUJjQkSphjic=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_032053_979630_B798D8AE 
X-CRM114-Status: GOOD (  12.61  )
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

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I found the patch opportunity while looking in this driver for a different
reason.

Best regards
Uwe

 drivers/bluetooth/btmtksdio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index fba3ab6d30a5..e986e5af51ae 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1472,7 +1472,6 @@ static void btmtksdio_remove(struct sdio_func *func)
 	hci_free_dev(hdev);
 }
 
-#ifdef CONFIG_PM
 static int btmtksdio_runtime_suspend(struct device *dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
@@ -1542,18 +1541,13 @@ static const struct dev_pm_ops btmtksdio_pm_ops = {
 	RUNTIME_PM_OPS(btmtksdio_runtime_suspend, btmtksdio_runtime_resume, NULL)
 };
 
-#define BTMTKSDIO_PM_OPS (&btmtksdio_pm_ops)
-#else	/* CONFIG_PM */
-#define BTMTKSDIO_PM_OPS NULL
-#endif	/* CONFIG_PM */
-
 static struct sdio_driver btmtksdio_driver = {
 	.name		= "btmtksdio",
 	.probe		= btmtksdio_probe,
 	.remove		= btmtksdio_remove,
 	.id_table	= btmtksdio_table,
 	.drv = {
-		.pm = BTMTKSDIO_PM_OPS,
+		.pm = pm_ptr(&btmtksdio_pm_ops),
 	}
 };
 

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


