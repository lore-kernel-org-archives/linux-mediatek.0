Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C0ECDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2HMXOLF5eJrUMENCt8aiW3aj9mFErqyM1uPwOqtdoQ=; b=0A3PhtZdXj2C/ZLAJkLF0j5vAG
	+TXh7an5bldWh2mwh7p0HIlRG9Pyt5UPRw82Zeq9WAr/3iRmUKvDVrE1TNTPd8E3PUcxjoBpLniWn
	mWtXVFUdTtQT2Tw1siLZ+NdhC5Vf0czksH+rr+id3dqVReMaB2Hp13zB8XJKy+rPTSRbWs4qtWKxK
	Kdz1WGrO70gOUGbMyFQ8AdlcRXhcZmd0+r32C2wJQW0reB165ur7TkDcFLqucc4EfTf+Ct7Lc2v1L
	ZdYaXynE/9EItWCZGnXcW1dvRH2+uIUQ9J4229jv0iRDrJeXVAknLCOUV3zxLQ4ByC/yM0tzDEI4l
	t1bXMcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjV-00D5o5-2b;
	Tue, 17 Oct 2023 19:28:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjN-00D5j0-0J;
	Tue, 17 Oct 2023 19:27:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32db8924201so1898872f8f.1;
        Tue, 17 Oct 2023 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697570870; x=1698175670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2HMXOLF5eJrUMENCt8aiW3aj9mFErqyM1uPwOqtdoQ=;
        b=atngvBeCTI+FA+g4bQi4JNkAELWtYstAXzSjwL7agxeh94LI+Tb1LUzAgiBNIXCTMg
         nsSJKkXPBUyuqIr7aNDMFR2AqENOS8p4Rut1sxfWKa92IBVV0FMtp7PclaS2eHRAWqmk
         LS+GEun+Fc8RSrHuhhjIX0/YrICfjSnIwNvUZm/fTsr396NCGBSowdM5wDDPbLWz8Fwv
         Lr0b5qaJMnITpnNWLMOM32xEisHiCMDUqevxAyLe9IMOnKJDEMFmrFn7TsYP3jN/2CiG
         ci8K7Qy1Nlw5jcxeOBoV0LyldN/8uTmHWu741wVrZAA1UNrzNrmrsjgHiJssY7r3+bNm
         FFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570870; x=1698175670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2HMXOLF5eJrUMENCt8aiW3aj9mFErqyM1uPwOqtdoQ=;
        b=D64Xzdk74jSh9+yQXc6bgf1RS0XT7A0c8mTpMUApEbTuFUAuNcsoApejrAUnKGNw6g
         rqOyPoyIi9nZ/G1rvH9sCCQLIQkqcklJYY/khKFmRXKMlwqrTYxwD6/5McyvM5mdNuHQ
         NIQZkV65BKqRtpe3SFu/25eQ4QfvEj/H5hMerJZCcmf17/gIKlZNpcGvZ9EQmCqrcmc7
         WXTNEEu+eSz2QBIDcF4GaGS8IIY7tx+LLjiDBACoGt0rauAfmAP1O5ZqlPZ6ZxCQh34s
         3We7+MmCyPfUhAa72VqL3Lw1GeQZtoivF+ONKAaN1xh6p1g36OFuevHo3de3XGeztu51
         M8EQ==
X-Gm-Message-State: AOJu0YyuH65EDhzxq/USF094SDdmrhfxH1AVQW+f0Deg7uplpYrEE1bd
	IMoa7S9ZcZ4O4NTJR8zPcbg=
X-Google-Smtp-Source: AGHT+IHaxYR/ji/TpEeQiKOxetQQnrm2fznjqODcepcXxmiYcoSadf6rAytgEwutDBenrBNoao4Scg==
X-Received: by 2002:a05:6000:1375:b0:32d:a98c:aa1f with SMTP id q21-20020a056000137500b0032da98caa1fmr2431879wrz.1.1697570870180;
        Tue, 17 Oct 2023 12:27:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id o2-20020adfeac2000000b0032cc35c2ef7sm435897wrn.29.2023.10.17.12.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:27:49 -0700 (PDT)
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
Subject: [net-next RFC PATCH 2/6] wifi: mt76: fix typo in mt76_get_of_eeprom_from_nvmem function
Date: Tue, 17 Oct 2023 21:05:06 +0200
Message-Id: <20231017190510.27163-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017190510.27163-1-ansuelsmth@gmail.com>
References: <20231017190510.27163-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_122753_134619_EDC3398E 
X-CRM114-Status: GOOD (  13.41  )
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

Fix typo in mt76_get_of_eeprom_from_nvmem where eeprom was misspelled as
epprom.

Fixes: 5bef3a406c6e ("wifi: mt76: add support for providing eeprom in nvmem cells")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 2558788f7ffb..1de3c734e136 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -106,7 +106,7 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
 #endif
 }
 
-static int mt76_get_of_epprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
+static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
 {
 	struct device_node *np = dev->dev->of_node;
 	struct nvmem_cell *cell;
@@ -153,7 +153,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	if (!ret)
 		return 0;
 
-	return mt76_get_of_epprom_from_nvmem(dev, eep, len);
+	return mt76_get_of_eeprom_from_nvmem(dev, eep, len);
 }
 EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
 
-- 
2.40.1


