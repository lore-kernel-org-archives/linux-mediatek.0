Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE0CDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IL6KY3EzM2BxcqkNoWLsWmWA0zN5X5Kl3affJBzO2c=; b=jk7YHy1r1Tw5astw7ei1Q/rxY3
	/Z4bNuNRVL7nO+xWHLS0GdfMz2UuegR2LNTLUqExvWcBV631sfVBn2WNkZL1ZtWNyXR0FCnOgRVoB
	Xu2OMyGMF+KAqi1SXsllkAfOYlo0Y3I/NSV0qKDX6aI3hUN2P8t2qsCRuAgiDX+/AvpT5l0gUnU4j
	uO5BPLG+7S+6PF1xD/uBCVtxkNNSIacQxdLhHkO8/Irqzz1mGZJF4lS7+pBUs2prunwO3KPmz89nd
	dFrXJEyJ4FBSy4rI4PNChP+vLwRFWrJxU445rNV3zjve6nYJ+x+f03GKzmjfB1RS8cEVyYOt0UPlh
	4SKHEaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjY-00D5qx-2F;
	Tue, 17 Oct 2023 19:28:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjQ-00D5jk-2O;
	Tue, 17 Oct 2023 19:27:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40837ebba42so4304935e9.0;
        Tue, 17 Oct 2023 12:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697570873; x=1698175673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IL6KY3EzM2BxcqkNoWLsWmWA0zN5X5Kl3affJBzO2c=;
        b=BF88jsJRvsKxXK1XlXguyVK/JzsNvCYQFz2vuHWPpkYlZLuUGAQ6vqE0XjMhNonwl5
         4/V/X308WUIVymA227pxZS5Asyb3f5iKNIwWsmu+nSPj05Y4my4oKo5irisJI1r7LTJr
         V8So8KPf+zd9LF6uzpkykoGUwdOZnsvWwTtcufMExM9qnV9jcLnP+2jWrSuKsGRv41Fp
         sHFVo2Kxri6/P+K+e8THxpUWOqdoUGlSl/3c2prcXZ5p1Bx3rZuHAGvs7LbmmY0EHiyd
         VcVwIbCGUAxMJ2O5ANe1ilyFZfxBJ9l07iUvDzYRK4ZOUC6W+gm09hiMH09vEC7FvOh8
         Hfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570873; x=1698175673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IL6KY3EzM2BxcqkNoWLsWmWA0zN5X5Kl3affJBzO2c=;
        b=icLbZ8/KNBSlVruLjJumo/4dtRwtD2+sToq6zCmWWbxoFICBxwbUTROcQ588+OjT1c
         Q1fApha0ArQtp5zhz/Hlo7jXPyp5lykjWHMHBcYJ6nKz8phiQvczpgRT7qIVQTosjM8D
         etfYlvvMOuZIXnStvS75TrKcKKTpPL6q77SumXWd3B2wZX0J6on/+lnql9jsMA6496BD
         JUUcnJyb5YA1EKAtuPzrBElsjHzq9FWPxt8NK6TVCPgpe5GMfDiLOGm5MdxGbh1TzcnN
         c1o8otH1xXswzIEJNqpPZ4GGZAGrJzlx8Hstslt4NKCF8fJIXAnXJHmZGFdQuiIy1YJM
         svww==
X-Gm-Message-State: AOJu0YzhJ8CnmPVngYgFDZfkezvN0ZPt6wAadoTtPCSdFmh5FTkX+fde
	QKfV+snpcn7YIZErwP6nURg=
X-Google-Smtp-Source: AGHT+IG5U1O8F0WYcC/ShlvOiLSsSiY7RwLNMBcm6vpZV2ouHYIJnXX4mFscSuxO+x0YZ3wBKSLK9Q==
X-Received: by 2002:adf:f982:0:b0:32d:b06c:80b2 with SMTP id f2-20020adff982000000b0032db06c80b2mr2969857wrr.0.1697570872715;
        Tue, 17 Oct 2023 12:27:52 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id o2-20020adfeac2000000b0032cc35c2ef7sm435897wrn.29.2023.10.17.12.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:27:52 -0700 (PDT)
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
Subject: [net-next RFC PATCH 4/6] wifi: mt76: make mt76_get_of_eeprom static again
Date: Tue, 17 Oct 2023 21:05:08 +0200
Message-Id: <20231017190510.27163-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017190510.27163-1-ansuelsmth@gmail.com>
References: <20231017190510.27163-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_122756_796603_56A7A532 
X-CRM114-Status: GOOD (  14.05  )
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

Since mt76_get_of_eeprom is not used by mt7915 anymore, unexport it and
make it static again.

Also drop offset arg as it's only supported for MTD and was always set
to 0, hardcode the MTD functio instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 7 +++----
 drivers/net/wireless/mediatek/mt76/mt76.h   | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 817074a5d2fc..748f4b643a5e 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -138,7 +138,7 @@ static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int le
 	return ret;
 }
 
-int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
+static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 {
 	struct device_node *np = dev->dev->of_node;
 	int ret;
@@ -150,13 +150,12 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	if (!ret)
 		return 0;
 
-	ret = mt76_get_of_data_from_mtd(dev, eep, offset, len);
+	ret = mt76_get_of_data_from_mtd(dev, eep, 0, len);
 	if (!ret)
 		return 0;
 
 	return mt76_get_of_eeprom_from_nvmem(dev, eep, len);
 }
-EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
 
 void
 mt76_eeprom_override(struct mt76_phy *phy)
@@ -410,6 +409,6 @@ mt76_eeprom_init(struct mt76_dev *dev, int len)
 	if (!dev->eeprom.data)
 		return -ENOMEM;
 
-	return !mt76_get_of_eeprom(dev, dev->eeprom.data, 0, len);
+	return !mt76_get_of_eeprom(dev, dev->eeprom.data, len);
 }
 EXPORT_SYMBOL_GPL(mt76_eeprom_init);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index f6c850557447..41e4f398083e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1096,7 +1096,6 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 void mt76_eeprom_override(struct mt76_phy *phy);
 int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
-int mt76_get_of_eeprom(struct mt76_dev *dev, void *data, int offset, int len);
 
 struct mt76_queue *
 mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
-- 
2.40.1


