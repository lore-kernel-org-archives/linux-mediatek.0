Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF49C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 03:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k9Ui2NwwGrhvccOt4uEhvW+bd99ZDt3pI3ujTBGkCJ0=; b=wXB8AG1ob+5CoK2ph/5/mGty2G
	UhSAxmYnWfyEg3v4ng5H3nrEFNoclSt/V/7R20pCW3w2etol2cj5dAVzo9cXd3X+7W2ioF6/giOId
	ZvMCB0jbC+24/9GKzbmkuiGznaYUQMqBEn/RYTWG6FnNy1csVhb0d7wI3WUslck+zbiIx/Gc7Mdd9
	r+d05HkFtAmjQPZbKglNS28GyB40SKLe1zPvr7w0J7g5Ftuqpkyo5zHu5RBcN61toBtz7/swutF4o
	XqyCgnmLDpz0PUdUjPQPT2ekRAoU9Wey/DAik6ia8nRDqfPQ83oRWrdst2gL+qpVjDP+8ZZTA5fOo
	WX9hxOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Any-006sVI-2v;
	Wed, 29 Nov 2023 03:00:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Anv-006sTl-1y
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Nov 2023 03:00:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cfbda041f3so30254185ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Nov 2023 18:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701226798; x=1701831598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9Ui2NwwGrhvccOt4uEhvW+bd99ZDt3pI3ujTBGkCJ0=;
        b=IlAUtK4/B4sIN42VWRr3DFkJITkeY2YiPigJuqTkaJPyeejbHrF9f0RIloGmDQjMIF
         221CeL5Sd8OIb38z1VjmlPfniDH+OqK0vok/u5qfIAreYGMU2Cz2TlueYNYJE6A6L6aM
         +OSJnLgjt2UrBwa+QYIedUllS6F1GCkhOMKxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701226798; x=1701831598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9Ui2NwwGrhvccOt4uEhvW+bd99ZDt3pI3ujTBGkCJ0=;
        b=VLNq+OOI954vVSpRN01XM4Rb3vbEhkBr/QmjCi9KawfvmGJd3IdCvSsSjWhzf61abi
         Xkfr2B6xmtbLDfvgZEUFHxXJpjxKV+M0OXzVho+UmG2cDuAhbmh6QEU5iszoOE3YVoQE
         kgLJ9Jy75cBYTBP9u9DLCOPdq+3QfQUeU12kpvQFQjI5XWo/PDo7bK0gvwyEeIsnqPA5
         u3b70r4/WbBTLQL5SbuEGygJTKSBQGqBQFMbuqOYLXgtZVHo0dd5U5R7N8Qxutw7fXL4
         AChvFuNFNKmPKIJmwVfozjz/C6MnOTwNKn4C7eyWbKrdd6rUaY3pbU0btARuqXcp2k9s
         W52g==
X-Gm-Message-State: AOJu0Yz6KCQrAeTkToBAyiThWxOsDRhlE17q9FMTg0BwBqlGv/Zy9Y4+
	MDWH1eAea9cW1C6lLhfYnOiPPA==
X-Google-Smtp-Source: AGHT+IG6dFGqtk4fZYge5QsDOksX0ByB2i5897VnFENUeZrCkriv/jmF9N0rsBrUdnOw+cS3d0Ze4A==
X-Received: by 2002:a17:903:41d1:b0:1d0:5be:7816 with SMTP id u17-20020a17090341d100b001d005be7816mr3133476ple.10.1701226797568;
        Tue, 28 Nov 2023 18:59:57 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:db5a:6bdb:74af:e72a])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001cfcd3a764esm4866623plb.77.2023.11.28.18.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 18:59:57 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ot_shunxi.zhang@mediatek.corp-partner.google.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2] mmc: mtk-sd: Increase the verbosity of msdc_track_cmd_data
Date: Wed, 29 Nov 2023 10:59:18 +0800
Message-ID: <20231129025950.1579981-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_185959_656659_616B1A8B 
X-CRM114-Status: GOOD (  10.34  )
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

This log message is necessary for debugging, so enable it by default to
debug issues that are hard to reproduce locally.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- Use dev_warn() instead of dev_err()

 drivers/mmc/host/mtk-sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 97f7c3d4be6e..907c13d746c1 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1150,8 +1150,8 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
 static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_command *cmd)
 {
 	if (host->error)
-		dev_dbg(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
-			__func__, cmd->opcode, cmd->arg, host->error);
+		dev_warn(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
+			 __func__, cmd->opcode, cmd->arg, host->error);
 }
 
 static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
-- 
2.43.0.rc1.413.gea7ed67945-goog


