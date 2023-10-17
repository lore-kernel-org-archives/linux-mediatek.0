Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B0CDB484
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/WIYTERMpa/hQ3nYRT3WjhR5KvI3DYiqFx8C9H6a/AQ=; b=ndy+hf76APWF4uQWIiQR5z6zfH
	2sTv0+bASo4Zyz1ONydXXuGffd40Gy5YTQxNidsZ8w0ybMKYPo0q73Cn0VZGm3Rwme0OLr4pm6zws
	0MiIgF8TX3cajzEkWGivJMJBB1iFJ0/l2PXWcGoonQPiFwA04CkIugkdYffLyfOas9Jy/0qwaUdpa
	qkWZR4xCG+iu8nTuAdI8nnRlvt28nHmKew1+25fyGBVcEiXffMTV0PMYJ/CHF6NsQItZbvuDi8zE2
	axBep+oqw9UBjXW2K/Helx4fXjE27VwBCSSgNUihSZfpb7zrsBNd7/DUT65SiX6+qvcYkcbMxw/Jw
	Zbl3FIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjP-00D5lE-2X;
	Tue, 17 Oct 2023 19:27:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjM-00D5ij-1M;
	Tue, 17 Oct 2023 19:27:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32dc918d454so605426f8f.2;
        Tue, 17 Oct 2023 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697570869; x=1698175669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WIYTERMpa/hQ3nYRT3WjhR5KvI3DYiqFx8C9H6a/AQ=;
        b=PJGnpj3IrSE49jh+zuRLwn8I6+YmxnREZsvCWtN7RYbsJ6bNSksb8w3pEwPbw/B6Q3
         TTTCx+xoI9b8Oz5DylW5WF6saXZbxo4Wg3jOB1sb8d+nK6UIfV22N05vMOFIG2WDuuyM
         Xnv923JD0dXM7FAZ0SprJz6IbGwxBbZPoQXjkpzZdUXC9jlNjaByOdx59QTaKEt5fzTn
         cV/tPUOTQkPouLEpJeWbmBfBUTNSyDmNJZvWDz6c9zZ+AnznmKEwcDi9ln/3cEThm9lz
         E3XhZtsc6SAlz6uYpBCS6gF+WJouXp2IpIfdE9iqWZwUeok009E+o3gTXlchOE7WP7No
         qKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570869; x=1698175669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WIYTERMpa/hQ3nYRT3WjhR5KvI3DYiqFx8C9H6a/AQ=;
        b=v4acyOLw9SLgAziOqZ8tcjrnurQl2mYR8el/v196UWqyiwoBqYbUssjl9rb4A2oOPE
         9fHO84xjgM2dz7RyKS0kt8ftdwstmpK5Xs15ZGCzRELs/AD+wbnVB4K3BqHPk03krYvn
         kHThIsQJc+bA6lZlN27F6eI3p3qB/62wrURPLOHZycUuXqdS2gouFg+cBEhtoT351Ubj
         +YlX+RlxOW+4ZhdyG/ndrXWgIaM/qdOD6AqGl8gXFj2/h5mYqSJi3jtnu8BIh/RLxni3
         CdMCHAPNtoWZrwaT2uPuSIdDmCctgwM9Wgjo36Ud7+vE5sKW9jEK60owct9x+cSaUDly
         Yfug==
X-Gm-Message-State: AOJu0Yx4XHY7erPoPeNNBr13j7aAFelQOiz3h5LAAiZPHaJD8giQXc2W
	2S946R54uKnwlNohudncrYs=
X-Google-Smtp-Source: AGHT+IH1sIJVj6vXFk3PsUqXsDejVqOQyTaC/4Gh2c9aKr1SO/xiGQdSW9KnyI9IseCxWCSAKxk3+A==
X-Received: by 2002:adf:f7c3:0:b0:32d:89b5:7fd9 with SMTP id a3-20020adff7c3000000b0032d89b57fd9mr2562686wrq.56.1697570868914;
        Tue, 17 Oct 2023 12:27:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id o2-20020adfeac2000000b0032cc35c2ef7sm435897wrn.29.2023.10.17.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:27:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [net-next RFC PATCH 1/6] wifi: mt76: fix broken precal loading from MTD for mt7915
Date: Tue, 17 Oct 2023 21:05:05 +0200
Message-Id: <20231017190510.27163-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_122752_484573_57E42617 
X-CRM114-Status: GOOD (  14.74  )
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

Commit 495184ac91bb ("mt76: mt7915: add support for applying
pre-calibration data") was fundamentally broken and never worked.

The idea (before NVMEM support) was to expand the MTD function and pass
an additional offset. For normal EEPROM load the offset would always be
0. For the purpose of precal loading, an offset was passed that was
internally the size of EEPROM, since precal data is right after the
EEPROM.

Problem is that the offset value passed is never handled and is actually
overwrite by

	offset = be32_to_cpup(list);
	ret = mtd_read(mtd, offset, len, &retlen, eep);

resulting in the passed offset value always ingnored. (and even passing
garbage data as precal as the start of the EEPROM is getting read)

Fix this by adding to the current offset value, the offset from DT to
correctly read the piece of data at the requested location.

Cc: stable@vger.kernel.org
Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 36564930aef1..2558788f7ffb 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -67,7 +67,7 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
 		goto out_put_node;
 	}
 
-	offset = be32_to_cpup(list);
+	offset += be32_to_cpup(list);
 	ret = mtd_read(mtd, offset, len, &retlen, eep);
 	put_mtd_device(mtd);
 	if (mtd_is_bitflip(ret))
-- 
2.40.1


