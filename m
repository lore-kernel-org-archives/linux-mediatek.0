Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531DEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128F460EC0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 128F460EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yNOpOd/i3iex2LPQ4sLcl4Bl9ois66gcypm0fHNJQCQ=; b=2mVMtkuyySlWJv
	9o8ENWRFgn0J3K5HXbOtRBsom6TBhkvuYJ9jmswrRGVmL4A4KMhm9XpLsgDPx1noVc4Jm/SVb6U4G
	IuuLBfzxNGAa1VVKrLH6W+2dFN0pjSORrqxPl//O1qGVTWr6CJgOgirv/f4Ivp64Hd0GoYp/mOays
	vbXa+9n910YNhwrip0KBuMecL+yBuo6i13yKSWuCvPn161a3cX2XDOb6k8XdCMjLsDWEKx9rE5FYu
	ulKaxnFLdW5gR0FVdngV8gyuSJiEitsjS9JR0GkSp97ZCeZkteuIoL59Lv8K/skEhcu5HN/OFY2VX
	3UUksTZuPTvjTYPoa4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAOCC-00EkTE-2m; Mon, 02 Aug 2021 03:00:52 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAOBx-00EkPT-VP; Mon, 02 Aug 2021 03:00:39 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so16259317ott.9; 
 Sun, 01 Aug 2021 20:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l3jwA3sv7LfeA88bUhgOgpW0zu8BYSUhLdnLV59eV+k=;
 b=nN+LqWCqdJi31kINH3VCdWbNQxabUcc6kCWZM/JDlZGdJS3mNFTdb5GfvIgONTNa0Z
 O6jGoRTIdJGUOfTBi0Fev2GSzQq9XD2Hxd2bVFvGctcmz0bMext+57L+gJyk6PyYW8p7
 PVZOhhANlRCccizrYkr1uBsM4Sj5+mIT0x6yNEf/Lk1u8mTyByJOsJRtQtY+m/OtlU5z
 qvNcIO1MX0VPp29isyXQu8ZstXCqBpTWcR45/Lwkkkh8hcsytZ/vZuL15og1wIlbRlgh
 zV5bgBigCb4Wz6Z+OjO/mOJwT6Ws11MUXhhb2q3LZq3fpA/tRZCYqjrrQFq4i/s+Kg1c
 ryZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=l3jwA3sv7LfeA88bUhgOgpW0zu8BYSUhLdnLV59eV+k=;
 b=Z7PweaY69LRiT0y3PoVjwGH3ELfCKxJHWbeqM1d8/7Z+yyj01B7weFNzPAYu0VayPT
 5NpXfj5Q5wTDBbNrNIK7GWLYUlydxhS+RGS3MR+BnQcbuqUh2tSfbx7/5ZGW8ijItiQ4
 0aIfo79DNsFtoBXbuQ4Ap7HZwq7flV7N0w+/tPWC8xe4OmwbGgMxLguGx4D8QpMH4SU7
 jdaPpYZHSuf+urJ9Wpi2e7D4SR3aXcDf45CX0c+w92e6J1rKuuv2Q07q9ykFn1GKM2n1
 una112Gwn6YC5y24/16iPVwG7dL+EXhRCeqv77pfY65wJ933qxpTdZ1sERUJt6v5ck6A
 gReg==
X-Gm-Message-State: AOAM531eVt8U4t99aNYrpB/B8x+y2q063RulS2tZ9s/FvdlnOX7DczKq
 NtOeUo9M9x11R8OoOK+SUVg=
X-Google-Smtp-Source: ABdhPJzuuKDnVe+pBy7XiqDsOeM4T7BN4LlDQWdk+BDgTjDdIAj9y5QYr6zeVZxiH9PNnZNAcQFH7A==
X-Received: by 2002:a05:6830:2696:: with SMTP id
 l22mr10773429otu.286.1627873226329; 
 Sun, 01 Aug 2021 20:00:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m35sm40242ooi.38.2021.08.01.20.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 20:00:25 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Peter Hess <peter.hess@ph-home.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Tzung-Bi Shih <tzungbi@google.com>, Hsin-Yi Wang <hsinyi@google.com>
Subject: [PATCH] spi: mediatek: Fix fifo transfer
Date: Sun,  1 Aug 2021 20:00:23 -0700
Message-Id: <20210802030023.1748777-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_200038_055552_762C52F6 
X-CRM114-Status: GOOD (  13.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode") claims that
fifo RX mode was never handled, and adds the presumably missing code
to the FIFO transfer function. However, the claim that receive data
was not handled is incorrect. It was handled as part of interrupt
handling after the transfer was complete. The code added with the above
mentioned commit reads data from the receive FIFO before the transfer
is started, which is wrong. This results in an actual transfer error
on a Hayato Chromebook.

Remove the code trying to handle receive data before the transfer is
started to fix the problem.

Fixes: 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode")
Cc: Peter Hess <peter.hess@ph-home.de>
Cc: Frank Wunderlich <frank-w@public-files.de>
Cc: Tzung-Bi Shih <tzungbi@google.com>
Cc: Hsin-Yi Wang <hsinyi@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/spi/spi-mt65xx.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 68dca8ceb3ad..7914255521c3 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -426,24 +426,15 @@ static int mtk_spi_fifo_transfer(struct spi_master *master,
 	mtk_spi_prepare_transfer(master, xfer);
 	mtk_spi_setup_packet(master);
 
-	cnt = xfer->len / 4;
-	if (xfer->tx_buf)
+	if (xfer->tx_buf) {
+		cnt = xfer->len / 4;
 		iowrite32_rep(mdata->base + SPI_TX_DATA_REG, xfer->tx_buf, cnt);
-
-	if (xfer->rx_buf)
-		ioread32_rep(mdata->base + SPI_RX_DATA_REG, xfer->rx_buf, cnt);
-
-	remainder = xfer->len % 4;
-	if (remainder > 0) {
-		reg_val = 0;
-		if (xfer->tx_buf) {
+		remainder = xfer->len % 4;
+		if (remainder > 0) {
+			reg_val = 0;
 			memcpy(&reg_val, xfer->tx_buf + (cnt * 4), remainder);
 			writel(reg_val, mdata->base + SPI_TX_DATA_REG);
 		}
-		if (xfer->rx_buf) {
-			reg_val = readl(mdata->base + SPI_RX_DATA_REG);
-			memcpy(xfer->rx_buf + (cnt * 4), &reg_val, remainder);
-		}
 	}
 
 	mtk_spi_enable_transfer(master);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
