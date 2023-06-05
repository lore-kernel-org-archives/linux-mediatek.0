Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F251C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAgRq2EXmiJlw5QVvMbHQppFdqv5pzza5dzmoTwBNQ8=; b=mXWXTM9AbXxkgKGyLKlnu8UaYz
	BxzXfg7QtkbOyg45sArmfMSWICQJy/W9GkLn8G25goCRyppkElVJ9manzCedu6bpdcjEl6/BxeXdx
	Jaw8Pz7jIm3/CAjVdrx5tSl4D+/bT0P9GzIeaxIGW3Ok7uph/2FeSmQYMKJvJCozVoa6vnPejSqof
	crUQ73LECl+lvxEQ6kEATn2SYkAq5/kdk4O+Enfn9T4S83Mb27xczCbNyGn8TNXOk9KAxF3ox7VUb
	TK4xYdoaBCMht7n9AsJYw7BdAMYyK7Tdg2B76Qw2sBSEjOxWc115qbATaQAwGdYXW34H46kvcfnsJ
	vLzD/U9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64jp-00EYky-08;
	Mon, 05 Jun 2023 07:34:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64jk-00EYiD-0p;
	Mon, 05 Jun 2023 07:34:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f62b552751so634565e87.3;
        Mon, 05 Jun 2023 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685950480; x=1688542480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAgRq2EXmiJlw5QVvMbHQppFdqv5pzza5dzmoTwBNQ8=;
        b=GOPR4d+/UEzaru7bfg0RdVmwWCfzmOk0IQA91sr3KwRMPXT30HCwHUn05o8osUkDpD
         MsA7L94HI7gZfq3ALkgV3RippOJKS26pkN/bdoRJPCCwr7GkxE4BELQdzz+/jiFCzj47
         LutkrzD710untVOO5vy2jWpN3/4HCZv99+yPalk8MvgtcRMziJfLxNsR4GIugdW83XaK
         u8oLh5kpyiDr1n44SQIuGNyMUQvqnSeddlU6ij+6RtpodwOZ7ENHZiUkGCL7qydhznuI
         6RNnLnHKr8Qzd4ibaeAcm/tw0ObHcTOAA7muPFpKY/VxTLR7Y6kU0cV6lDEK+5JOB94w
         vMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685950480; x=1688542480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAgRq2EXmiJlw5QVvMbHQppFdqv5pzza5dzmoTwBNQ8=;
        b=W5ftNuZb1+PYGPVJ/ErxcDdctQo0zL5baTPexqzMgEz1l1At+rZqsd5SJDMCQc+z/h
         ggckcBDaoiT583WZlg9Bl6j+lc2si728Sn8VA+Y+P6zORCY4EgF0lnBcU4IgOcuBLaZo
         2mwZ8+d8EMW+oAdoVHLz12gEjk+fNavk/Nx3yxgVtcnnxpEUMEzPBrchgEubRMDqVh2g
         1cMwN4C72NdxUeHIZVgEGQHUuU7SUJyoLH8vvjEDCxe7SkuUdBFOCfzKI8meEKKLHt9L
         dK8wCdJfsmFd/naW3s7KM3OapphJBmC98ixsP463vM5FFWe3MtXuFHvPf4RocVTASidu
         tS2g==
X-Gm-Message-State: AC+VfDyxhEh+lFxsEXcaGvmhYDyT/vindkgrtgCbtX2WE9NQbUJAZlRH
	g0GqM1tN9DTgz7fgzZAkk2o=
X-Google-Smtp-Source: ACHHUZ5IEYPCmzkGOJfS9ic1+YXKE8YtO6DZakUgS6piCmgDsgm+OHr8VSg70fHzplr4P2NyIUY0Sw==
X-Received: by 2002:ac2:4281:0:b0:4f1:3d6c:d89b with SMTP id m1-20020ac24281000000b004f13d6cd89bmr4850910lfh.42.1685950479796;
        Mon, 05 Jun 2023 00:34:39 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id w12-20020ac2598c000000b004f62225ffb6sm564382lfn.105.2023.06.05.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 00:34:39 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3557YZcg008744;
	Mon, 5 Jun 2023 10:34:36 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3557YXaZ008743;
	Mon, 5 Jun 2023 10:34:33 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Rani Hod <rani.hod@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH] mt76: mt7615: do not advertise 5 GHz on first phy of MT7615D (DBDC)
Date: Mon,  5 Jun 2023 10:34:07 +0300
Message-Id: <20230605073408.8699-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_003444_293358_0564ECEF 
X-CRM114-Status: UNSURE (   9.86  )
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

On DBDC devices the first (internal) phy is only capable of using
2.4 GHz band, and the 5 GHz band is exposed via a separate phy object,
so avoid the false advertising.

Reported-by: Rani Hod <rani.hod@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/12361
Fixes: 7660a1bd0c22 ("mt76: mt7615: register ext_phy if DBDC is detected")
Cc: stable@vger.kernel.org
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index 68e88224b8b1..ccedea7e8a50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -128,12 +128,12 @@ mt7615_eeprom_parse_hw_band_cap(struct mt7615_dev *dev)
 	case MT_EE_5GHZ:
 		dev->mphy.cap.has_5ghz = true;
 		break;
-	case MT_EE_2GHZ:
-		dev->mphy.cap.has_2ghz = true;
-		break;
 	case MT_EE_DBDC:
 		dev->dbdc_support = true;
 		fallthrough;
+	case MT_EE_2GHZ:
+		dev->mphy.cap.has_2ghz = true;
+		break;
 	default:
 		dev->mphy.cap.has_2ghz = true;
 		dev->mphy.cap.has_5ghz = true;
-- 
2.34.1


