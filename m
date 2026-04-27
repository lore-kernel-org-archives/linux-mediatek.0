Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492ABFF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 05:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IrWP5CDvZT0EW03kM+B3gbb16k7M4gE4dJ/XgHLlCEY=; b=aeZzfSqFOrlJ3HT8C/WgIoKAn/
	qpaIZ/CSY41wUPzIlmB7eELZ6oM1IXY7UAVLhndovKX2MRxMP9c+CI3PO2+FQpIzLSxEzOybdCXWH
	j8/Lw/rFyLTtgVBPX8yhaDef1/qtcnFBWCjDMcaXxk2OHEchy7E4nGoxWTVA8j3oc17IBAGWkUsqO
	lsowyx/nCrEh6j9yyyMPtjjqgdrzLqd+rgONs1Z0wSyIFuyqRYBQNDnZw6mpJz6F4G/ol5YYP6qMZ
	oUJPVw+YHSD2sKvSLoJHJ9rRzuwBRBE+imPXbInhV1daDEGCXNEzYmV6E+BY//XucMc4Yoy0AHBA3
	2Ft8RXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEMC-0000000GAbs-3T1k;
	Mon, 27 Apr 2026 05:18:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEM8-0000000GAYD-1a5u
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 05:18:05 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso7462525a91.1
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 22:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777267083; x=1777871883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrWP5CDvZT0EW03kM+B3gbb16k7M4gE4dJ/XgHLlCEY=;
        b=Mw+8px4H2WtUKG3/IuynUQgmuczghK3oR79d3x7WfwuhA4nuk+jHMKmuNSPrpDl5xv
         YO6MU5IDicwUDt7zed88LZpOjO3ruVIEOiCO6XP8w39CBwQaJAbexAHcIvzvdsdSzDTF
         7SFc2yC0udca7T/EmqHNUEGLdczIXLm1PXy6tE5FRzdAaWzs/yY4OiOoE5AbGVJZctPI
         3kUyKQnjshXHkoxr48idoRMZCuY0h/62bhdz7D1P13RE4Ra8+mVJc63N+9qSuGde7j48
         hZPt/iY+toajEy62d/8rsHFKBpDcSGALYv9csJz9SRuZhCoCMTuMtbWshT4qKbdTvC9S
         8Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267083; x=1777871883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrWP5CDvZT0EW03kM+B3gbb16k7M4gE4dJ/XgHLlCEY=;
        b=lQxUeE1CnGhJUM260Wgxkw19jElooCmCEffgLnjdP8Pp4s+XmLUJJCMwepU2nnUQat
         fLKh5jGri//OvH00M5K2nne8oqqGZIDQPLH68xvr6p1elgif9oa4M1durX6RnA8oJwQo
         r9rjHHmrR4tEZUAMB/F7eM2sN2bpBIW31M/fVFAm/8K8q+wvu1fOTc4OhrD+2VVrgyrA
         KJc/qbU+ALkf1ZX+j9p2P/m4HziYmE+KqQfv00pIMdf/XxjvyhkwkPkeH0GiMVd5luU5
         NqgUost0q9MtOYRuLuIkX1023Hvy0SUbhasrbsP4H5FSClQ46qV5gAf5NAaGnx+ty8et
         Pwgw==
X-Forwarded-Encrypted: i=1; AFNElJ95xIvecT8EigiY+7dGoPRFKqFjVCqOwJ9N6jD9fMtm8lQQZCt/5R1stAGvKbcv2yTeclNcge/34xFEudSbSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZKcYv8E45OctqH23m3Up5wmnVw4R3Uxkl2YpG7HhAMwdSwjx
	4h6yFg+iTAAm1iy15ZxghnIqIqXBeTGE9yiHBygfoV2UDfKw2u8ZodYi
X-Gm-Gg: AeBDievXnet3y/Z/BP0NM/Ommh6/zHHMfFoXuv5I7W8qsTID13UH59NO9LvAqf5bZco
	INwS8S2Hqg8VfFL+pAu0gL0CP34RcT4uM2E+U7MARX6A2zf6RDbuF9PVEarg/YIo6p3U1BV/6m8
	TfUvB7fo2BK6H4JAVP6I9nGQBtLwpaxdYC/x6CrZUEW2BAymdGWIm92VSCFywRh52lZQ9vVOLhd
	BTlbl+3sxR5YXglEmcPrK4tGxTnRbl5x6iB6r0+HTBuDbN701mIAiegn/6w5Qt0ul+C7OSL3wZG
	rWcxeFAYzafrn/wKeGkzDbAUT4q9H4vx/aWi7heBknitzTpe9fzLe0cAkBShbGiI8Pu0AcW4CuV
	76uNYllEcm/DkHs0l+8R9HhyieeTC1nQqiZGYGQH0Dl/TE/5fmaHJLmwAplqemeKcIMe4QoVdgw
	/pRV8SDMVZPfy4pXJk7fj5lTIxRx3RO0hDiwvfGu4r/LLn2614iChCJUpsHDDKZJyfkzgJgaovg
	i2VByL6ELy3rB/I4rNrDAmyjg==
X-Received: by 2002:a17:90a:e7ca:b0:35d:8fdb:4f36 with SMTP id 98e67ed59e1d1-3614048a21bmr43367074a91.18.1777267083487;
        Sun, 26 Apr 2026 22:18:03 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab2112csm280636685ad.62.2026.04.26.22.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:18:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
Date: Sun, 26 Apr 2026 22:17:46 -0700
Message-ID: <20260427051746.954704-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_221804_769323_1AE9298E 
X-CRM114-Status: GOOD (  10.35  )
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

Check return value instead of is_valid_ether_addr. The latter is handled
by the former.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 93d91264687f..0f6ccf6ed53d 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
 	if (err == -EPROBE_DEFER)
 		return err;
 
-	if (!is_valid_ether_addr(phy->macaddr)) {
+	if (err) {
 		eth_random_addr(phy->macaddr);
 		dev_info(dev->dev,
 			 "Invalid MAC address, using random address %pM\n",
-- 
2.54.0


