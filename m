Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A0FC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EMc4l7y/58xan7GJe/6NBJgIUEQeEH6NdAFiW8A4ij0=; b=aSR+0qnONjpMAyaHZkrmTjVkPE
	8beCfby1xtFa+32dpS1Hu/W9uQr+fiw3cJuTOXk8qMzQjZ3lmxM3/NJLtKwMR2splbGQSrNZhnCGu
	5fmHztWACczZkbwvYQ7zJWjx6CP916agOmMGNQuFbVD5RjUZEId+PtLJXSsFP/Dx71METMGnQU/nO
	u5gue15nCr9KfA5d68697p1YABsGFj4YoMZ8fyijicczRXTok3lKzwayIrjJxuTaEFSYlVWDRCBni
	w6k9qAC2TBIJ3K97muzitGV9JoxgvjG4ALvvBpeiHslQLsYg0csYcMf3mGpVe+atRH93cUC20fGC7
	7ANtHAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWVY-0000000Gpjx-0BjP;
	Tue, 30 Jun 2026 11:20:04 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWVV-0000000Gpis-2T2n
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 11:20:02 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so865903a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782818401; x=1783423201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMc4l7y/58xan7GJe/6NBJgIUEQeEH6NdAFiW8A4ij0=;
        b=hKonQR2LtkpyCI3zkCAra9HtYWW2RypA923es94jBLCuXdlN8fwOXPFw7+iEb/d77U
         o+4r/TsECDJ5N2x1Sfm6mxf3DsWkRNl3hqx64bd2j5ZVfSDk50OhjdQlS4PBFj3jv3Ol
         JgC0gSuknV/rnKrHdZvHLTSXp/KSKmxiKs8vSgPhbgfmNO8VVUpOFeSUTK7E5WpE+Brq
         EJ5z1DFSS/8EKL3xXx9rob0LMjnSRU8+k/txqTmQzqx2K14uz2VIHgLVTjqz7crmCIBR
         b2lGWsO80EGPyJRb+MzfzTMPBcYQbiUYxYvFOJJJQlVGo2gia3wcTm0mx4Q/iuaCzBtE
         Rf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818401; x=1783423201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMc4l7y/58xan7GJe/6NBJgIUEQeEH6NdAFiW8A4ij0=;
        b=FJMBoOl5fHFEe/b9mb+M64x3OvgPSEh/0MPM0BZU93cXymz+16adRIlON/TsNeobaD
         nVukIA2CDlVCN5+yqDmFoiERT0/OtlIL7IYy/l3mttX0FYygH6J9+3/JGPPAFLjo31EG
         WHzpRUpplGor4CreucjSql1i1R0e+qIMkKGxjbCWBgdT6n/QFUwSSkpk3LHKpWo0k8eI
         rfiq4gFd5+wrH/E/V5M/ULNNWq3vGggY+asNgPKzx0awrgTZmKi6zlrfzYr4LqjQxDu9
         yyHztqz8k//7SDLIDdESzO5XMx8/O3kpeo4sGUPXv/Ozu7h67FQAbKUjJWExjYJ0jijP
         Ly1g==
X-Forwarded-Encrypted: i=1; AFNElJ+s7CTGEk+qsH1ybYwWMXZqL5jt/RYs/pYhaQG60yEoxSQcEsg1aTYIcs5+d6rCOHvAM9ka27uJk7JToykPDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ka/Ie4mcnHce0J8uGuEXBNY5mC1WGGolw5w0GBMs9evPL/aj
	+dfMDglKsTRDXps7rVYolqToWqfBJ6YbThVgiGSMFTJUR9c1ZaJLI9a4
X-Gm-Gg: AfdE7ckjRzzqZPlNGNwYtbgNZR+737rwpSbs2HqFXRDTduJx4Dsjm7vpBeLN5wxC99G
	uEhk9M0avcIPEqSoFk5zBPJY7hq9qislNlqzcMsZEtAFTGhz0naHvmv+2RKsQKZfd2yULYGRam6
	0+vYIX0WOWzVcGewNKM+rcrw8BdReU/LFWj+H815jwcOVOXiEEoQ3WbRNkxDGx4JJkyNK3N1ci+
	6/5dLKUOGdTT/JtJ4GzBz2EUWsOtL5+RaPhqTrEcy6mTB+dc7Z+z5xNTzhNMQikLjl3BIgZ0XxT
	GNcY24u36BDbAMsV1gp5fi+36sxzx1niKwiczqPzBmrjPr+V5COAtZiA08XJJRznHT7C6ERL1Vv
	QRJKyC/GNyxd1Dsaqaqx10QrHhlRmnbTxYvP6yj7Uc/JwQDw4M+jdOF168SKuLXQTsvQiAnObHJ
	P2YwWcw3uWHHvHd5AVmZAU5O/lIYgJv8m+qvw49dAEbDacFws=
X-Received: by 2002:a05:6a20:4304:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3bfc50563efmr2667483637.12.1782818400587;
        Tue, 30 Jun 2026 04:20:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95a3e7sm1323781a12.19.2026.06.30.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:20:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] i2c: mt7621: Use dev_err_probe() for clock acquisition failures
Date: Tue, 30 Jun 2026 18:19:42 +0700
Message-ID: <20260630111942.559932-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_042001_635899_D697DCA8 
X-CRM114-Status: UNSURE (   9.41  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when devm_clk_get_enabled() fails. This correctly
handles -EPROBE_DEFER while simplifying the error handling.

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

update in v2 : 
 Add the missing return after dev_err_probe().
 
 
 drivers/i2c/busses/i2c-mt7621.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..8ab7a304a02c 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -280,10 +280,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c->clk);
-	}
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+				     "Failed to enable clock\n");
 
 	i2c->dev = &pdev->dev;
 
-- 
2.43.0


