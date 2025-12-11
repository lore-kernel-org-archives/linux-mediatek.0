Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E25D41C05
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=trUfnuuHzLWg0hqtTbFZbrBapbqubE16vGf51eAqUyI=; b=F9Z6snVimibrT8ZOFvoo8ldoRS
	A8is4u+VEYtB1UAfdrMCo5HGaG5vlaqJFU8eKAoo/yfQkv2UOKO2PWsSeqIEiKS/crn+a2qitSEoS
	YBfTtU8RVUd6jP6TcT2NP+WYHwtN7tMjEJtLhd/abwkIq6MabEX0dwryoms+3sHWuGMx1+MAFBtAN
	dhIaGr0GzCTJfnlg58Ywqzi825Gw2FdKkCHBU0AJEePGqpHVyVkkr8YYMPjdRxDL9YZn2HQm1MGKn
	gZu9p4TX1g3kM4xyfk7eKVRnbhec6RoBCj4MEIWCH9j4aKuar/H7lJBkxz48KHmguIAqJLZB1eJ3A
	1i66AhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbnp-0000000GMdn-0GZH;
	Thu, 11 Dec 2025 08:13:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbnn-0000000GMcy-1JeP
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 08:13:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-297dc3e299bso6962905ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765440810; x=1766045610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trUfnuuHzLWg0hqtTbFZbrBapbqubE16vGf51eAqUyI=;
        b=GFCpNrCxcj1KZq8Rr4gRIP7+xjuNQ9pHrft9UCdLY1aY2pPuqZ18tYdzk5mF0BxVCF
         2KRdm/D6Fx/JT72htAHUUGLlQuBj7jDXHqVp7kkAx7/wZF14ZUB+lTPr/PjpMk4rJhtM
         fMj3zORJUA2NHX4sgrM/B87oeT9vOutI7N/8ehTB1FaDIrhOh5XRuw/31XNEFMBanNR3
         S+kvEI7OtbUQUvcuWn24Ys8Dfg2Qt4VOJVcFeoM22E18F9XTmzegbbGsGYea8o53WGSb
         vDhq7pCKrXN3kGnjaSA49BRPSYke+1XiNuCNFk3tQX6VQKr7j26phzT+KCXmVrbKlj2c
         ZYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440810; x=1766045610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trUfnuuHzLWg0hqtTbFZbrBapbqubE16vGf51eAqUyI=;
        b=ZaQLqj5Dd8u4Tjygpkfen4qkJTRIbLSKzibSygRLhxO8oIVd5hjXhkok9cmLhkN+tQ
         5kWkL0LFrh2OhvqqJVGo8rrNCiOaafKchI4wzAnZiqFHLxFDRTK+iH2/2tu0dMehrY3B
         OzOpjU/5cdEDTADlXSeCQniyebRQzNXVJLOpYt2Y26Ivqi4zvxTUaWUov1BFz8YJjwHT
         NEZsTf1+vuDba1UBRDQ4EbTj4Sc93baGK/MCdtl/j4vJ6LwXRo4lqipEsFpnSV5qXy/G
         sYPv8ESCJbhDRWU9xnIFFCLi8BTCVeVVMqyIcTispMInQnhLjM2lkU4OKZKb6gedWNbC
         tUVA==
X-Forwarded-Encrypted: i=1; AJvYcCWe+8wntQ0ZJ2xIxc+bvlyxoHBhfXgPXCGpaXnjKh3t+4/T07EJfCmJ5cfy7VW/qRqi3m91wmQC/MarGnYllA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlsGC4J5UUWYl1/2kaDFgcEw0hF05L5zsAqRVx2un70fZFKE1C
	91i1i9Ds21wwe6FFaVQqCsjPm9/Zta8K/x30HNi5x6ZBmarPkRfHUWPC
X-Gm-Gg: AY/fxX55hD13CYNPgAEPa5hFxhe1X5XPHqkd6ONGFimFmOvJFHYiv/ogZbTJp3rTil/
	bNylolAJZCb1pF6wElbtZ6ZSeRcXjmfG2kiprEpdyfsEi+T56NpoETkFlpmrYjPhy1lrhM3J+jw
	rxIZTjPHwk3CEsXR8Rr0fXPfF6XBEWK4pfeT68GV6iaomYQ2scgXvDiWPxszysZcvFatsD73P2/
	mRh7jSWfFLs2BfI7PTC6W3QwpvdtHM4xAAsq5DQymcGGFzG6yb/50AgB+hhHaQ4p1jN+f507SfW
	GTf7buUdKEHgoeLRqvBCFWhazgXoxsX0vntGpRSkge+s3o/zS5o1UxyUbNrao4fD7mbLf1kNlPP
	xsycCgNCJMXzFA695YOD5u0Otl+GFbLUm2G00XnbcezgIZT/aaKdOjOQzUxNGCJHhiQHWWGgQad
	tQ1K34wzdK
X-Google-Smtp-Source: AGHT+IGpU0Pf7s9UlmMW8EGY8yYMuomHFnlX0/Df9bPI6JMt8uShHZ+gMWWhZpAR4wob/58V/qG9Zw==
X-Received: by 2002:a17:903:2c7:b0:295:6a69:4ad5 with SMTP id d9443c01a7336-29ec2803d18mr60221255ad.56.1765440810038;
        Thu, 11 Dec 2025 00:13:30 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29eea04036bsm16048855ad.78.2025.12.11.00.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:13:29 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] net: phy: mediatek: fix nvmem cell reference leak in mt798x_phy_calibration
Date: Thu, 11 Dec 2025 12:13:13 +0400
Message-Id: <20251211081313.2368460-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_001331_346240_EF0CE606 
X-CRM114-Status: GOOD (  11.84  )
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

When nvmem_cell_read() fails in mt798x_phy_calibration(), the function
returns without calling nvmem_cell_put(), leaking the cell reference.

Move nvmem_cell_put() right after nvmem_cell_read() to ensure the cell
reference is always released regardless of the read result.

Found via static analysis and code review.

Fixes: 98c485eaf509 ("net: phy: add driver for MediaTek SoC built-in GE PHYs")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index cd09fbf92ef2..2c4bbc236202 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1167,9 +1167,9 @@ static int mt798x_phy_calibration(struct phy_device *phydev)
 	}
 
 	buf = (u32 *)nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
-	nvmem_cell_put(cell);
 
 	if (!buf[0] || !buf[1] || !buf[2] || !buf[3] || len < 4 * sizeof(u32)) {
 		phydev_err(phydev, "invalid efuse data\n");
-- 
2.25.1


