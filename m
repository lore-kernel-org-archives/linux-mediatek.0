Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56DCC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qyAJVegbfyrJxQWNLL4+WJEBhbqapbMYo1uIZ2+vwQ0=; b=CYkhw3BHfskFrxsASdSorPHdsx
	qW6qo1ser3Qy4TYdDmxp3jjEyv8DEwHMVjgwO5qlX9TCDr2OuVS73LvgzHiWYowezcvZ4kjyfwUDP
	jXiVJ9nZWxzQIApEWPpvNq7RqAbgjh+c07a7ehABcYX8ZudSUJMhnovEwNw9ccQtq+dFQL2BT35sS
	x5abQXXOdkHdDwFrQPSy4JVFgOUPy/7xITEZXK6f9C8u6i055w287XGCMRTTqdom9Te+mEFk6jw7o
	Nn3k1byA2EUyu3wVvGun9kRHoH57TV/tj5RR2lXri2bjGe+8ncWge53L/hb4umnOObLMEj8iQJXnu
	iytj8kTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefb3-00000000DCu-3cNS;
	Tue, 30 Jun 2026 21:02:22 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefb1-00000000DC0-0lHO
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 21:02:20 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-13b2b08a553so2854675c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 14:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853338; x=1783458138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyAJVegbfyrJxQWNLL4+WJEBhbqapbMYo1uIZ2+vwQ0=;
        b=Xhyq0h6nFKNvTDQrG1/x0v9/+t7+lH1d0jpRAsCvwQLKAWTHR7DdEAWnewUaIAjZs3
         lBsqtqiTdK3vKFbv6rFRGNsZfvstETVr0fBhb6q1aRV6sNYagLnsY3/sDNWXM94l14bq
         BxyXF6yzUZHQci53nNzRR7uYwI8Cw6dWAd+7BvlOpLQx+pgCLi/Uit+9xghlJTx2vdvI
         gCU8yJ1nLbgoAR03rswuXvyL1nET1ZjTeGalEMLJ+zkgZjqYOQotOSK1WfY1h2WlEhzv
         8qADCW/jjoHiznbpw26G4WbYUIhl2DYhY9dQ9OwURvIgGaOBfrJ384WZysZ/INimiAnQ
         XayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853338; x=1783458138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyAJVegbfyrJxQWNLL4+WJEBhbqapbMYo1uIZ2+vwQ0=;
        b=n8RpTl8jKkwxgOcMyd2N5r2APUyViFjmCHbuRMxIPFDqqv0eqOxzUtZ8vYgoAMMmvx
         qVZLw4FREI+xw4NSGhE9eYSIehIgB0Qy8JhV8QM757c2VVN60OZtoKK7jSahLsNQbTtK
         ZOLBDsnzsvQGHR8uhipuSJrr6tZ3vTqqToSgCqThGZ3nKpoiNViTTU6/AYO/5Zp5Tmg2
         Aaxn0bkiAqICvzSgg8/KXq9qy8sdP1xK/uIBNCtRjdDa0dYOdXuh0iKp93CTWMMInetG
         4m2zevWAscphlEx8oAPp4kFtX/Vjbg6f9YF9yYlQwtj3xse0LxedOZB4QKL0oyFiQA4Q
         k2Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rojpf0aO8M5cr99p9lsQNlAEXuTn9W5CepVrWuq7YNGXhg3XTUdkv3ueJLtDJOp9wS2MR8tpoCDLClv+ol3sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9skTMYw/ybOhRXTYk16rC/Zrll2PwJsMGG8faTOLVNZ86fBcv
	GABqjMstOVBFNkl6XYAce6GJ2PkyHhdJjvrLD8U/OAdc/aZilhW7GJSuGMqx32jJ
X-Gm-Gg: AfdE7clsmmt2xZ4aBTuYWbul7mSH69AXvYCtcnY09QrjwXSEbR5UeDH5FXj33CAtVWy
	c3N/667BVWycnchgv9QfzNu5n+ZqFZPJXPvEiXSaauPBEfnxGj03sJrLptNztK2bxp8qnqIir6H
	CqHg1KxXvr4b0cRLEUnJ/Seb2d3DsR4IATabd0sU5wBRHS0y51XcxlWEBvUHUsY+N41DmEKGz5t
	HRjaR1gRkBDG5vGiKFHI5sSe1oNwniuR+m1psy3U+k97zcff2qXxaB7sGrKq0bgRrbJ17bk/+aD
	ihXe/RaXNokSkjYmwfghd6XrJXHgDgmQUfS9P6rCfkGZwfsmKYvuIteWsXh3OCWsd3f6al0Gznx
	ub29sftwjndO7AytrLSjSMjWnaFHRBhQTL+ii7+hQmkWm5S1Oqz8F7TKdxQXFUVdsXZAnVH5LPh
	zT1jb8/YWDyFehp7Nhf5JQTUW57wnqbF9vhd/lr+5bjJtTmjIILKnhufH7UIV0IwYrbtWqm//XD
	Llm2QFiMQ==
X-Received: by 2002:a05:7300:6144:b0:306:f474:7389 with SMTP id 5a478bee46e88-30ee134fe86mr3861886eec.25.1782853337951;
        Tue, 30 Jun 2026 14:02:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5c4c3sm11592642eec.2.2026.06.30.14.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:02:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF pcie cards
Date: Tue, 30 Jun 2026 14:02:15 -0700
Message-ID: <20260630210215.400379-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_140219_229697_7767AFC1 
X-CRM114-Status: GOOD (  11.66  )
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

If seems the check for err is wrong as the proper macaddr gets written
to from the EEPROM itself. Meaning checking err from of_get_mac_address is
wrong as the proper macaddr has been written by this point.

Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index b99d7452800f..afdb73661866 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
 	if (err == -EPROBE_DEFER)
 		return err;
 
-	if (err) {
+	if (!is_valid_ether_addr(phy->macaddr)) {
 		eth_random_addr(phy->macaddr);
 		dev_info(dev->dev,
 			 "Invalid MAC address, using random address %pM\n",
-- 
2.55.0


