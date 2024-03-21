Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0497C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBiGSHa0oimyE1MM5zUN6LTK3eAVLs8v7Z76nGxN0a8=; b=Q1QO/r1IWfjQ1g
	uvGUJnMUlxYmHxawjeYWA2a0FmX7cgcEFCNIvkd83HsrOJmXG+PtWH8vsjv1udcYhlsmhxIZHQqEg
	BrG3fX+MC02enMSvtye7IYfTL5VgCdMDaW/a6ecVC5CDhz8g0jis3eOsyLnUb2OIg1ne7rPvA4P2g
	YoDsK7QM2WFBjVtmcrhsKwrE3tHPAwfjH/T9zG9seFni7tPiAgsjiuOr4xVziCZwD1ih9bLupqhzv
	E4Tm9ufVEULyOIwAvqm6MPy6MJmO/0hjiEILOwNegiI1EQH7tTGxj3TOEVcx2RK52F0+NeQbhajla
	wkG/cUql8DpnUWWJcCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCFV-000000025GK-1Izh;
	Thu, 21 Mar 2024 06:50:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCFS-000000025Fg-2geJ
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 06:50:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1dfff641d10so3758155ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Mar 2024 23:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711003797; x=1711608597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBiGSHa0oimyE1MM5zUN6LTK3eAVLs8v7Z76nGxN0a8=;
        b=PryZqI8Xl5LlyahUUJhHGSFzBwwWdxpRlHqV20zLLf5qFWKnsGo5csxkCbm6753xtS
         nPEZXLBJmE/t44y2+E6czb5ZHRIt4FibYCe2z/hlDKar/wd7prWPAikhqkygGls0nmC+
         BhHZw/GTzqQeSLjVwQxqclFcyi6yyy1/9DKMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711003797; x=1711608597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBiGSHa0oimyE1MM5zUN6LTK3eAVLs8v7Z76nGxN0a8=;
        b=TdkMhALJOsfvQCmy+LmrkvgvoILl5pgH+WQLREd+4y3vJw+5oHYRazNXt4R0Tb+XA0
         D/U7R8kUT1+nIV+jRHAT49V5aifXFUEJ7lIl61WdJpqt3ngOHWW5LhlSl//6lJBbGsCs
         05KnxcUuCNSlUVYL/6SbQkyM9JWKX9roupkvw4luaP6Ok3qa3e+nrzOtDUkHe2zJxb9x
         gLBilvKNHqeAH21CcxKk6dgrD2Y4cwZscNT1/OWzwcCAx6eCcIIdeE8j/JBT9usZG+KA
         8t7Tp6E/lnSe7ZtNsFjPAk3g7D6k+AwMMaXYInZPKr4HM2FthX1h1wzkHupsYic7UhGZ
         FAug==
X-Forwarded-Encrypted: i=1; AJvYcCWHJ6ZHg1oIx6tTlRePUdzffzxUDrcfYGcsOIMKcCnzk3L22D4VGNvcMcMPnVnd+KgR1o1roq+dIlkD7yu8cIkckFbNQ1teTEhBM1x2pfyloY+/
X-Gm-Message-State: AOJu0Ywuhg9gq4Y0dqNdTmsDAwcQERhCyRd5xNntYmwTN2hc7IIKyi5/
	xYmseYhLtTGJbh/iQVXKv+l0j3gMrvem8RbVP6tuDYBN/PbhzR1RyYr1wIx3FcyN/I/oYQ9Dh4M
	=
X-Google-Smtp-Source: AGHT+IEEEIHKCYtjOYJVfRhVwN68KX9lfipwtZ2TMyYDdaLt1ht07nRcowYnTodrhLwxJsrplM2RyQ==
X-Received: by 2002:a05:6a21:a586:b0:1a3:6a4c:80a9 with SMTP id gd6-20020a056a21a58600b001a36a4c80a9mr11624698pzc.1.1711003409539;
        Wed, 20 Mar 2024 23:43:29 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:c1ff:a4cf:ac35:8df6])
        by smtp.gmail.com with ESMTPSA id lb3-20020a056a004f0300b006e664031f10sm12874938pfb.51.2024.03.20.23.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 23:43:29 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
Date: Thu, 21 Mar 2024 14:41:01 +0800
Message-ID: <20240321064313.1385316-2-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240321064313.1385316-1-fshao@chromium.org>
References: <20240321064313.1385316-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_234958_706479_AD138002 
X-CRM114-Status: GOOD (  12.57  )
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

Add a check to xfer->tx_buf before using it.

Fixes: 1ce24864bff4 ("spi: mediatek: Only do dma for 4-byte aligned buffers")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spi/spi-mt65xx.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8d4633b353ee..86ea822c942b 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -788,17 +788,18 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
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
 		}
 
 		mtk_spi_enable_transfer(host);
-- 
2.44.0.396.g6e790dbe36-goog


