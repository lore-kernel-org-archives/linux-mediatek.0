Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A12C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ci7BHkTK1iOIEG1KH5AhFPZm3PHh1Xr8+22AEHjA27s=; b=uq8cnrFD5kbamB
	byUf8xAbJomSVKz8IOo829QuRb4ZSBBy5Zlv02tdlCmJ9crsrBF4KqaUgrdU2BGq3qimmSc4pnnVg
	kFg6s3vKbrNju8u5JY/NCFF09amlFWrlAPERny5PHEWQVoGgPnL472YvpuMAlKmCiv/st/w3OMaku
	MBgMCwZHcWwe/da9z5AvCxwUWbFlSglwgLHgawE0wd0W1vFv6PJtLPFeWb7uBhSlHAE+w2tlepMTB
	iRuxTXxJ2IM+llJ5TdWdl8KgfESecwNTnPLfnF0qo5tp8x4qcY60Oir1U8DxsEGNreqZSgP2VGqaH
	qviI1VVF7hmLYKfi3WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCfq-000000029Rx-02Lo;
	Thu, 21 Mar 2024 07:17:14 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCfn-000000029R6-27Hj
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 07:17:13 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-60a046c5262so5232647b3.2
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Mar 2024 00:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711005429; x=1711610229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ci7BHkTK1iOIEG1KH5AhFPZm3PHh1Xr8+22AEHjA27s=;
        b=mppMa/3KfFyaK19HowIUB8dVU0w5ZYQ3Ii3tJ8wHxCwoofF0D0K6CiM9vEBIWNvlku
         vz2AmFFOdbRDb0++cGkq3jq09cVOBNbGe32TrRnIJClkt9i6G/Fm45rwNUJvVO7cFdLQ
         Jyh70dCexBSSbXfHp1L5rjU2jF9c+be8uTKWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711005429; x=1711610229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ci7BHkTK1iOIEG1KH5AhFPZm3PHh1Xr8+22AEHjA27s=;
        b=g8GP+Q02R1oWnMfp0E54JvCjTqB+VHi5QC0qOVz1dkLlm3VVttZHRYzfYnM4Hsykoe
         W5mUpQVBA0Ea4cDx1wLv7omnOJ2GLhHZInDvXhRcT1uf4k/I31O2PJBWTiaH5lN+SbHN
         z2jSQrA+wrKTiC42SligL6uHNu2l4ruF+hHjq30OrtmDJ+h6G0x7CRqFAK2TyU1qkr49
         oHByCQsH7KxGJmw6JDWB0/yjlxGd7icPDIN17sWompST795Hc9L85oXz9NDHZWZoVeNw
         7aP237HT7m1WdoYaA2hejABJwgOeNkrNFp36Ly/BZx7C5a4feaeQ9UrpAYkvIMx/zwLH
         NoMg==
X-Forwarded-Encrypted: i=1; AJvYcCWsd2MsKXS3iglxSMdEj5Wip/R+lmHEvhAScqk2vwTMO32Y6OXp8v4EYcI+/0mdRqPNWMGoFX2K2YYsfBQOdCk+ZewB/ziD4+EdT8hYMnZHBaqP
X-Gm-Message-State: AOJu0YymYnd5EaIh+245IsCThk8OKBIqXXTB3ahJ0UVAHeEOukP65uYZ
	+Aj3b951KiMYA4wJ8h5z8jlesNQjrSvUn6z0Tq0gB+2zARvLkb29fNhiXPTua9oOt1nw0jGEbat
	dVw==
X-Google-Smtp-Source: AGHT+IEjYPnHZWGzrzuctWTDZl3/WbtAl14yb32XRq028RUvicCO/g54v3a+VeurCXvyrMfQTJ0ZCw==
X-Received: by 2002:a05:6a20:6716:b0:1a3:6378:1e8f with SMTP id q22-20020a056a20671600b001a363781e8fmr7149948pzh.32.1711004990595;
        Thu, 21 Mar 2024 00:09:50 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:c1ff:a4cf:ac35:8df6])
        by smtp.gmail.com with ESMTPSA id o1-20020a170902d4c100b001dbcfb4766csm8705582plg.226.2024.03.21.00.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 00:09:50 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
Date: Thu, 21 Mar 2024 15:08:57 +0800
Message-ID: <20240321070942.1587146-2-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240321070942.1587146-1-fshao@chromium.org>
References: <20240321070942.1587146-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_001711_590787_0FCDA8B6 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The TX buffer in spi_transfer can be a NULL pointer, so the interrupt
handler may end up writing to the invalid memory and cause crashes.

Add a check to trans->tx_buf before using it.

Fixes: 1ce24864bff4 ("spi: mediatek: Only do dma for 4-byte aligned buffers")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Restore a missing curly brace being dropped during rebase
- Fix a typo in commit message (trans, not xfer)

 drivers/spi/spi-mt65xx.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8d4633b353ee..e4cb22fe0075 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -788,17 +788,19 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 		mdata->xfer_len = min(MTK_SPI_MAX_FIFO_SIZE, len);
 		mtk_spi_setup_packet(host);
 
-		cnt = mdata->xfer_len / 4;
-		iowrite32_rep(mdata->base + SPI_TX_DATA_REG,
-				trans->tx_buf + mdata->num_xfered, cnt);
+		if (trans->tx_buf) {
+			cnt = mdata->xfer_len / 4;
+			iowrite32_rep(mdata->base + SPI_TX_DATA_REG,
+					trans->tx_buf + mdata->num_xfered, cnt);
 
-		remainder = mdata->xfer_len % 4;
-		if (remainder > 0) {
-			reg_val = 0;
-			memcpy(&reg_val,
-				trans->tx_buf + (cnt * 4) + mdata->num_xfered,
-				remainder);
-			writel(reg_val, mdata->base + SPI_TX_DATA_REG);
+			remainder = mdata->xfer_len % 4;
+			if (remainder > 0) {
+				reg_val = 0;
+				memcpy(&reg_val,
+					trans->tx_buf + (cnt * 4) + mdata->num_xfered,
+					remainder);
+				writel(reg_val, mdata->base + SPI_TX_DATA_REG);
+			}
 		}
 
 		mtk_spi_enable_transfer(host);
-- 
2.44.0.396.g6e790dbe36-goog


