Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18475CDB488
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mw4sfthIPjM3BfawqG9k28qO9mlhU0PnICKHznmlMio=; b=bS9ZHueioQvBqZte5WtpyierVK
	02+ps1YoIiRbpkDVp3Hgo3bJvQghmcChwRI+11AR7kI2RTZdto0rUqbfyDPU48Gf9Enl1JGfIGX09
	9WA0AbKXq6Jgps2PScpiuldpHpgGupAnylDuHiviIQQmRGy3yPIxcZW0x3sZz59XlnuOYvLRkuT+6
	2nsnAdefiO0+dOWTEIrcionanlLl+TdaxzWwDWydo1Q0bBw5UTUDHyOI3+91Mfa0VfZ+u6h4ajdGW
	QEHtt23AlonX2W52vmc92YcfET21ZncOzzAbu1caOXHzOoNBJD0sl6Wp4d+ugehBVJrbQLrfMkzqK
	SkcBHVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjZ-00D5s5-2J;
	Tue, 17 Oct 2023 19:28:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjS-00D5lD-1J;
	Tue, 17 Oct 2023 19:27:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32daeed7771so2467320f8f.3;
        Tue, 17 Oct 2023 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697570875; x=1698175675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mw4sfthIPjM3BfawqG9k28qO9mlhU0PnICKHznmlMio=;
        b=BrmYiDqJwBo7IT/OyQ72xwMMDsbY6Ou1TsWCUlr1ADRIibJSlsUDoFDRIM/M/ogfDZ
         VnPdAsFD7j2KSYbxooN9mgE40s08UwNUi8NHLd2EsMyGx8okfbL0IuQAb6l3c9jLIoq4
         wdCWk1Q3dQt5kYMIMX7ATb5y0DnATbMjtn8EJn3SkM/RReXJvvxY7uJtwohlvMj2lw1N
         FBGEog3kYirar0WHuLilJxCfqgMBisx37QSiQLXInAx3lsKL5RxXVMasIN/QV/Ab8hs8
         x1PZ89bG4ENlFwx4jNhQ/c2rb2L0/L4X8YPznP8qqKAiSNGGAfF1fZsRCvkFKGech/E2
         HzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570875; x=1698175675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mw4sfthIPjM3BfawqG9k28qO9mlhU0PnICKHznmlMio=;
        b=GgIz0Yp8ESBdo5m7i1Su7e0kBigZGyFNSjARQI+X6sBn3abqjuRZrg+ISXl2lwcdnH
         nZZJmW+rwr+4wgdx4bFLB37MnOviW1coxcGDdHFrQfFXrXA6LisoQfIv20yOt23hM/3c
         KPUp8nuo0jGcB3ITDVVkz/n6kPBNIGn1oFxsu4e5FP+SDy/v+T6/w1Yq+AV+ToP9iLnm
         FI6n6c72/gvdMzu8yisBXjlaBH2u42qkECKk6fU6tFRV4J29CACRXUB4c4zD0mUBMcZJ
         UwMOCoB+AYh3TM0t7UpaasDP11X+tcLPtAhDmUhojMt8eTOybbgMe+8QqmcYTDWf/gSr
         yFjA==
X-Gm-Message-State: AOJu0YxZ2eG3QQH75hkHYwN1dFzVtbxf6R8aauY+ZYdMgjfYkUFK8OJR
	nZHoLB4s1LbeRqfRKGJz08I=
X-Google-Smtp-Source: AGHT+IHglYUm70uW0GVWCXnzNjqxcIopFPc+GSa/J1yUXCB4sfKjA0wso4+1pkjiDF1KQL7RhyLuhg==
X-Received: by 2002:adf:e5cb:0:b0:32d:9d3d:3025 with SMTP id a11-20020adfe5cb000000b0032d9d3d3025mr2390702wrn.26.1697570875023;
        Tue, 17 Oct 2023 12:27:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id o2-20020adfeac2000000b0032cc35c2ef7sm435897wrn.29.2023.10.17.12.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:27:54 -0700 (PDT)
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
Subject: [net-next RFC PATCH 6/6] wifi: mt76: permit to load precal from NVMEM cell for mt7915
Date: Tue, 17 Oct 2023 21:05:10 +0200
Message-Id: <20231017190510.27163-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017190510.27163-1-ansuelsmth@gmail.com>
References: <20231017190510.27163-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_122758_453007_464637DE 
X-CRM114-Status: GOOD (  12.85  )
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

Permit to load precal from NVMEM cell for mt7915. The NVMEM cell must be
named "precal" to be correctly loaded.

NVMEM cell must already account the correct offset and be placed after
the EEPROM as the function expect the data right from the start.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

I would like to have some hint of the cell name... Is it ok to use
precal? Should we use "precal-eeprom"?

---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 5228f710b3da..3bb2643d1b26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -11,6 +11,7 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 	u8 *eeprom = mdev->eeprom.data;
 	u32 val = eeprom[MT_EE_DO_PRE_CAL];
 	u32 offs;
+	int ret;
 
 	if (!dev->flash_mode)
 		return 0;
@@ -25,7 +26,11 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	return mt76_get_of_data_from_mtd(mdev, dev->cal, offs, val);
+	ret = mt76_get_of_data_from_mtd(mdev, dev->cal, offs, val);
+	if (!ret)
+		return ret;
+
+	return mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", val);
 }
 
 static int mt7915_check_eeprom(struct mt7915_dev *dev)
-- 
2.40.1


