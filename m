Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F6C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=; b=LIdzfPhCTEUI4uu2fzvMM1qge7
	61wj4XnIfxKpemdyoX9S8QjsORN0+VHcL+93/UpEfEieSXTy7gziYrQ/lkcv/+knMaidMRbjYxa6+
	swPe/Z24GjYt5OLVqfCUh8+PyiDkumWTD/nksm8qGDTLTy7fGATX3dTFFVWUjV7nXi+UHticcee2W
	b0nipG/nxeFslHxS9T0QNvHdqZ5+SrqF6pKDbq6V0sNo+PK24hoiwW38TDthOI32pB0tC8tT7kOFy
	hlvJeUx2+Kk0aj6FmwbcgMnzrHrn/M98Ori0hLlmSTWzziefP9lCNFAFK34gVyuAxngOd7gBaEDDu
	8fMWGGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x296u-0000000HaD2-06Nw;
	Thu, 03 Sep 2026 15:12:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x296s-0000000HaC4-0Bef
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 15:12:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48433e9562bso581841f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448331; x=1789053131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=RB6Sz6HWSdc9WrEK/BwMmz7m/If21+ocOeDya81Q26KqpSlU+KYdK441itUT++GpeM
         4VpOn6zKvN42w6Q4SrP7vk75lJsBLGZs8Y8m8tZ0B7vRmin4aHqln3RGCAc4Xr+yg74K
         G4g9S/QTiWSP+S+5I6zwfG1GLKTkiDiGCGummllLl/FXoP9FIYbQv6FprQ3fgPee8NjT
         5QJO4+zn3IP3QlondfIreQN8qiJggPnDCePCa2ACYWjhRMszPO82Mw3c2O+yQu5RQc1Q
         LMnibo7qgKnAoNAN/MQS6a8uoNTxffYWu1FrGZDCbFHS1reYZSdbMi7lHFOGzRK4XDIP
         K9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448331; x=1789053131;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=V8Utu59rpGaFgI5Wzlj0nzuIxPlTxIDauvV2vytXamGnawbphuG5TBi2A7KkzjSSrT
         Lpqia6uLGo6Vq6LH74GIVt3kQG1jdv8VLXNJ4dL6xEur1fRmj5mXp9clureLmWii8C1B
         KhRHNAgNX5TB6Ve/NXA4+ccJsOtS34PrA2kFe8xQZSAxWwpj3SSIdv0Ow+fKlqrtRtiU
         OShOGm/sEx9rU0D8VP5D6I8RKcJ4ox+9PfyVB5vIjyIDr0lsPzDRjRLqo5Ligcnc4eCS
         fxeYJhJmoRY52c4Rh65a6eImX0HY5shAPpZf+pU3sKx26wqgtMg2JUUFoJUVq6Bdr/Uz
         EDPA==
X-Forwarded-Encrypted: i=1; AKwUvByzPxA8ZpqHsUS/CxkfVhKEouoWlM5lxPRmHJLnqZ0iPnLTjoHGMQFbX2UrpUqiMkExlgyjooHCnPYn39S++Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mEyF/sDnQtiRa9Nj9ST7U6Nvi7uyJfbFWITB7Aa/tS3pzKybCQ
	sjqTY/x/6GKKK8oi0G/b+KqqYXra1P8TziOiZni+LMHWNMzfMZi9qoQ2
X-Gm-Gg: AYBFou221TTod3Nqboq6JxWcNZR8uBLT6fqwcXp38PZF1TuBE7lQVv9QVUfa9/qGXOJ
	gvJnOk+xFttMePvBLRibuq3221UYEraKS+tQhavh/VnJTduZb5xaMAw00ajiLccBEJJhR9WKvsq
	erDLl+tMd29l7kMOs4BfSKvVGItUTcG+jadDKbg2EzR3woHSTIENkQNXF3rDcJ4HjlS9i3sceop
	NA0civbVTz1MmsptamuQpQ394o5F4IAg6vOyR5aCMsRKdnWvhIMo3dAKnhckej4YAQvp+Y0bKnN
	RQJ0clXFzSuZfTUiePYejIAzJA86jv/dF4VFy3SDL1VJEWcxQ9G/Cd5izlHhQd7Dd1LvQn6Weoi
	rVX7TN09A4qmWHWBEjEJOWeAW0D30W7q8DmgAqPRHyAa8p6ltXMxQASPmpipdxftjl+Gzm197JB
	sHaOTGoTGk3n980nucTqVf2iqE0K1JRO6Q664VfgNdR1LelUcxYgxbIxLIjos=
X-Received: by 2002:a05:6000:2f8a:b0:482:e64d:a1f7 with SMTP id ffacd0b85a97d-48488e0371cmr21537891f8f.11.1788448331284;
        Thu, 03 Sep 2026 08:12:11 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14396587f8f.2.2026.09.03.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:12:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
Date: Thu,  3 Sep 2026 16:10:07 +0100
Message-ID: <20260903151007.14832-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_081214_079478_436CAD5B 
X-CRM114-Status: GOOD (  11.04  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..9552fadbc17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_dev *dev,
 		err = mt76_connac_mcu_init_download(dev, addr, len, mode);
 		if (err) {
 			dev_err(dev->dev,
-				"The request to dowload PHY firmware failed.\n");
+				"The request to download PHY firmware failed.\n");
 			return err;
 		}
 
-- 
2.55.0


