Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD05E81BD7
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YTzvCYXiRiQsNzIWAR8ywGvKHYp+IRPHv2CPPhaIo54=; b=fp4AJ4zvwLFZ2wCokjROryBMmm
	fak096WyH+TwJTgHxBkdgDu/bHc3zOF6hXli3HLsBpQBlaqX3O7XTArYDEYvRtZcEahbl5qud3wZT
	HJ7/EWMMruzY9+zJx4BAtCAFXIGq6D/PYN6O6gl9G3z7JYixgAk25XjXRlW84KZIhoUpPtkZ94Wcu
	rNJ6yc17yIkHFitn2ohTMP6Gf5l2M2dbpGFrOcHOxvtJ8sa/Fwqxe3HfobM+Xy1g5CKIPIlE9oFIP
	TiiL/7JhX0TC51CIjaJcTnXxeTBElaocdUWpDjgAPmOA+2fY/4Ae5wbvuAMO+r5BFyNT+TQY4OFQa
	btLKgkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpT3D-0000000FawG-3j3h;
	Mon, 09 Feb 2026 15:19:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpT38-0000000FatU-0k47
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 15:19:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43636c9fd7eso77607f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 07:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770650379; x=1771255179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTzvCYXiRiQsNzIWAR8ywGvKHYp+IRPHv2CPPhaIo54=;
        b=g1KM9thy7/ZRG7Q+0c2BpSM8zBceORF2xA4nfcMkkuhxggMb1pUBwY27sN4k6zwjqX
         na+4ZOPiRGyoSgRu56s106Ga/qtaDiDnJFEXhWKUeMKm4WPyZodvO3xnMVnxK6hohWf6
         Cj+igLmMBHMRRs0uX2cjVB8fyhstRU3cKbgwcVCq4nCRmrMjVYaLzwnCRFud2tLvfEsY
         v9JCSCfRDrF1FRyCRw7jqztSqkR8r6ciGJXpTQARp3YjkdcfqBdDLQIqkimEb9URyJ/7
         m9aFZ213Cvip1szWd/GloR788a7Rwe7YC32NUJd0GK2LPavyaD2eC7rhGFKNWDT6KwfD
         NYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650379; x=1771255179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTzvCYXiRiQsNzIWAR8ywGvKHYp+IRPHv2CPPhaIo54=;
        b=eIwUBBegZyA6kCs+zCiK67MfGYL+0derqKI6+uxVOJv2JGgwbJuklaB1LIh6xYYV8k
         wC63FGPAZ4u7qUW5ztah6eFdnKvzevxsYwAK7lTAynCWWU3r7uyC7IuAqKBEmMKr+1O4
         jozJpRsDRCiwijLwDBUVgB4OZybz6RKamuhXVlTvRzoc/CJ8xwyTBydNq+4XuJyvNuxp
         RTroM7Ak7rM9zovAclktq70FSvuV72pTCIQjUnTiZ1jNn2Rlf9dEpSj/YQZgscnDAvN+
         pDii9FId8Ekno96KRswTPv8Piq3MHOF9jpVapcl3Wj5r1yNVnVy7lBR/V2r4sMvvg+M0
         nZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIzgv88o/14/OaNIxR0kgpL9FmU/jS1U4UnSUSril9Y4zhrIa/1IPhvDPgcSYvHO6oJh+OrWrcNVa0ECCeKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhO/M5KkEqpqyLN3QDH8bKu1d1uhZQOI/0dLHq0XB2l9TpulE3
	0di06cHCnNONi6zDDoptMdiY04DRdlx2ZCFPwV0MGkWCMQ6iHoulY8dT
X-Gm-Gg: AZuq6aJp5FV7c37yTEDTfa8dOdxlhtnFB9gECIMiuRyGtufnImIzh2OvnnJBJL69yRP
	bHNnj/bQKo7/RrL6t8Y41I/+yTCt9Qe7u961A7l1frpxarHjZ7hmiTXU9Z1mSE/R5zd//epVpgp
	VmA9L4utQLUGv0M5ZWP1THQSZsVolkzcDLBMMHYDQI9kaWCkf8KCzsCnGqyGOEOdCcd3g158TLO
	+etNnL/V3OXYWxu4cK0QePdmcEValxOocbSNjXatAAZpAw6eR00D1zuFMZIbG4Itp5MPzsmmR7F
	nIFbHFdeB/frQL9WLzbCFKQGXRJyOnYeW1bF5o+q3LLls2k75CbT7+ie023a54nZi1q/32R4BEG
	cELdq18AP38kGN2f7zkdb6BO4x6pAAyQxr5vKVDVh24Fmx7LG5PsMp38jvCsz4ezemxOO5yBIdA
	McLcUoCh+YsbvZNTlSY1ecYu7OUAhL6v00bwPv3cls12Pu0vFCxAsIRfmNAce7/98jZUrExSQ1K
	vhD4nyW
X-Received: by 2002:a05:6000:184b:b0:437:72ce:8954 with SMTP id ffacd0b85a97d-43772ce8a4dmr1977190f8f.6.1770650378901;
        Mon, 09 Feb 2026 07:19:38 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-213.paris.inria.fr. [128.93.83.213])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4376686130csm15122697f8f.1.2026.02.09.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:19:38 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: mtk: wed: Fix dma_free_coherent() size mtk_wed_hwrro_free_buffer()
Date: Mon,  9 Feb 2026 16:18:21 +0100
Message-ID: <20260209151822.136934-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_071942_259603_145F2278 
X-CRM114-Status: GOOD (  10.87  )
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

The DMA buffer alloc'd in mtk_wed_hwrro_buffer_alloc() with size
dev->wlan.rx_nbuf but is freed with size dev->hw_rro.size.

Change the dealloc size to match the one used in
mtk_wed_hwrro_buffer_alloc().

Fixes: 6757d345dd7d ("net: ethernet: mtk_wed: introduce hw_rro support for MT7988")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 1ed1f88dd7f8..455df564174d 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -879,7 +879,7 @@ mtk_wed_hwrro_free_buffer(struct mtk_wed_device *dev)
 		__free_page(page);
 	}
 
-	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
+	dma_free_coherent(dev->hw->dev, dev->wlan.rx_nbuf * sizeof(*desc),
 			  desc, dev->hw_rro.desc_phys);
 
 free_pagelist:
-- 
2.43.0


