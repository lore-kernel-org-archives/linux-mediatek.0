Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25565C88E72
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 14:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=; b=SAHaF0qWbGHYOimaQrpboCTxZN
	zzglZVIQSe89Ep8mgFWVzzl8bSsAYZiAGQomKL7ia/NyGbr/UdcyVrru1pU4Xm8JWzIrf2ABQmJnU
	agoH2PKaLNIl8NIR7HxVyGg2QQYFvYyZA5MA9JfoJJvPfBjDWzAkwYP9xUZiRMppJ5T463XEQRWvi
	dXB0STiSnFvTf7fcdBpI/rdl+3gztJEwBlqvRdmJJbFgRPIi5sC1ACd5fsJlH6hYbmnbu65WT3n8C
	/07Dp8LOUvftaSzydj6Ys4uh/OAA4GBff1z/8PalGZKd1Xb0coHi9eVG+EH+hTH1Dg2FxE+v/NdZv
	lXKzZ6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLS-0000000BZiQ-0uni;
	Thu, 17 Sep 2026 14:44:14 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLP-0000000BZgc-3Dpn
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 14:44:13 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8674704dab1so1151248b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656251; x=1790261051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=;
        b=eb3Ra2moKh5cnPQH+mYax8A9noTgMBI+AZ5fI8IaWdnaFbHqVh2VQA9E+wcN60/IXM
         6xlGiQcnL3UcA1qBCXgO25VeWuQxhINtDFszPuTDOORFNAAn9VXUNulwSVRZWyxMlTia
         vN6TMIobWmDlJVdRHjWxTTcbEtlnWzilM1e4m0EOzIrMxbhgrQe59ERotxObMbWsLWic
         MXf3i0QRZzMmNqmeZAusCvNKVJ55Cphnhyrh7YJvLydSfcAhXBgs+Bw7aIDiAalxWJaV
         3+dV1X8k+sY0fOb/PvTYn5C1Q1819nZzy5qsP50PPEKEFv5fGMh0bWkNyge/L8BgGXiI
         FJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656251; x=1790261051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=;
        b=CV6IYiMoi9dhGhfGNPS1uI7vMSvLSptLJE8ipjCv4bLb+d6InK/w84bh32Obpps4Qx
         hE1okBiuCZBQ38YbsgW2wz2rYXN9ymHsszSb31cAn42qFF7hP4+M8tIYja/w+ajeitv4
         McATyBdaqaVeWVsWiWwd7om2nw79f0StHoaOXf/3g/09gSaxyWzu1IjYBhvfSC3bFk4b
         NepuJA5N+K8+Cfqs6IHWzpqfmSNTTYQoTmreF9ouL5mCdSLyLprIeqvy4hANAcnnVtnJ
         V7KCY2O+c8AouVl6vr1cgbmKjC7z91gHAjeA9xG9T6GThQKA6RIDpuetC2sdTXy32/cn
         EVeA==
X-Forwarded-Encrypted: i=1; AKwUvBx8RcO5Ut6Txo6xDMWKDVj7hX7y92jdS6J6LoYQkQPuyDVOGX20x3O9NHQFNYNrjxdlv6TpDK0nx5L9aSS04A==@lists.infradead.org
X-Gm-Message-State: AFuF++mqxflWDZMQI0qVfpCVuxBzkhsb5LiJa/+ZWG5qLo9isUyb37L6
	ZX1VtYNkJIZSviH108dc6Cjj4BtUY/cdfUVebg9cVAJwNzVN6TVTBXA6
X-Gm-Gg: AYBFou3yk/6O1+nWv0E7hupUqTcCDqZhZKBLQ91OUODO5H6igBqFfOvPqEFTRzBe2fX
	u2KLOCbOLq+PuuCX5yVL90O65PDn9vM/aePpURgg0tFDEmKGxdIn8N/J2VyGpRB+3X8XpTFnFTX
	8EDWujJrP0xDWY8xHAREThBl8cMI3GYXWEoCndlYGkf0vBcxtR/Bvj+uVLa7Pteihb4wPowgKms
	wiIV6h+uTC/nfmmF8VRj+TfDKLw5m/GxNuhkP1zWVFE2WDxOC6bZZleFRwc6p03tGuFwyZ29HDr
	9M6D9r1vbLv7/BIBSSS7+rpCEngp8tyNu1LOQZ7pXYWNaUM4vOXIrUEJEJ5J9kcySFwc7DvykCj
	IxAIniY6H0X9QReROhLZ/VjCD5R9hhetMDxHe0DgKGJDW8kk9G9NW2H9JmMR8hDsWfqvt/o9sGw
	BnjQY5yT+UEclJ3dXcjktgNVYF6LzwbEbI7ki+zW3fEqEQzO8HfQFoAgJTC/QoyHYyDZrxg9RBf
	nxME1s4DfxSflQxXSi0Pgy2Nn2kFdj+D33/qi1qEQ==
X-Received: by 2002:a05:6a00:398f:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-8723adafcb6mr14166549b3a.3.1789656250736;
        Thu, 17 Sep 2026 07:44:10 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:10 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 2/3] net: ethernet: mtk_wed: fix reset condition for rx wdma
Date: Thu, 17 Sep 2026 22:43:34 +0800
Message-ID: <20260917144335.19466-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917144335.19466-1-hujy652@gmail.com>
References: <20260917144335.19466-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074411_815468_8F72647C 
X-CRM114-Status: GOOD (  12.33  )
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

In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
reset which is wrong.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- Patch added for issue raised by Sashiko
- Link to Sashiko review: https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,
-- 
2.47.3


