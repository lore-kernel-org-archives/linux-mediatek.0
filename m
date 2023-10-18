Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C027BCDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IL6KY3EzM2BxcqkNoWLsWmWA0zN5X5Kl3affJBzO2c=; b=aKrg3++fcLgF2isAYyUZedq2RX
	af6k25y689j/N7Y9oPL2qhxxVKhmxGCwzc9zxXiXmwmuBH0+vnj/OLpHIok0tz3phsre5h/WO6Y94
	WU3s+a60FQt+R+IX1dkcmjpRP4ZF97O6PI7/eQRVQa56umPLbMn0p1t96tUxr2ztvQ/VcR3P5ilCc
	JjIczzjokQaQeFY4uuaLjK0yHkJliKv951r2qvy3qGl/1OT3s2+9168WCR9B+FL2XIkeP1tBrleJG
	24pebLu20NkXdfOmpIodZyBodfNW80E+w94ORGn2qXyTojuJLJjszLdEx7zmgqicoZlOGlWcuW/j0
	ZGkyjrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6KI-00EkV2-2J;
	Wed, 18 Oct 2023 13:11:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Jy-00EkMb-33;
	Wed, 18 Oct 2023 13:10:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507a936f4a9so4786260e87.1;
        Wed, 18 Oct 2023 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634645; x=1698239445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IL6KY3EzM2BxcqkNoWLsWmWA0zN5X5Kl3affJBzO2c=;
        b=H5RpWJbV4bSZfLTEQHAQh2SKp5Fzrolh8L0KGGALk7tBjsStf6wRH20uy4eh+3WJPT
         qdhBQ88Tp5NHnY3SwcDuldENXE9dvdD5pgeemfOovCoJ67jTdf0yktg/BX7+465f9GKR
         rL78gJ0SMQWMn1KqafKkK/4Y0qQoMIK4GF2kZBYsBK8bAeEP/weVPkmpHa/lO4dm6a6D
         dE7UGJcNh34jkwIYPj4E9mPKkXBHBYk/yy4OBPSbBCQ4i1zhfXeY0UmTbTkndlyB/hv7
         nhewTtV0tZDnZwJDgeeQh0vQKgLtex0hyEDEznswXoZML8/hHBACbADTf68T8yeNxzlF
         6Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634645; x=1698239445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IL6KY3EzM2BxcqkNoWLsWmWA0zN5X5Kl3affJBzO2c=;
        b=aesiw+rY0h8f1C320ipkZM01gZgoSrjBLBz0OVhTguLoP9aoEa2NBIL+h+T4cxg+wi
         EQ3P5Ii8oIxKnPhfSHmU7EH1CGqj1BXQ5VHbqtQ9bzWtcO4bn7oYFNt065wX6mwxHsOk
         LmKWCeQUOL4b5Wgi744cPO0NMKOSbqK3KDPbEjvIAgZ+jzI/OWTthWzOWYac76G2Tl4H
         Q2GGSSXSSLPzcsMIQ7JWogvOdc+jQ/jg8EjdluLiLrI2XfAJJBZDBnSjYjgsMF+KaYch
         TxyG/iLX6UCzHthGt2DJsViVcaFhCYqTw+wm+ge4+SkC7C7E8psO0x0JOBh0bafjSdba
         puzg==
X-Gm-Message-State: AOJu0YyrTV+VtlbxqP+gtbWYWhdZE06fMLyYtf6gUrBp8zERTMCChxRI
	/z2yHltcaZkTdHzgKvjsxOs=
X-Google-Smtp-Source: AGHT+IHVrlIY0nKXXNIA7AIoU3XvDxI2gChao7CZ4wvCGgAaU+xe/hqRNOJjT76PDnhKoWnpatNjrA==
X-Received: by 2002:ac2:4245:0:b0:4f8:77db:1d9e with SMTP id m5-20020ac24245000000b004f877db1d9emr4117861lfl.12.1697634644820;
        Wed, 18 Oct 2023 06:10:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u6-20020a05600c138600b004064288597bsm1677426wmf.30.2023.10.18.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:10:44 -0700 (PDT)
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
	Alexander Couzens <lynxis@fe80.eu>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/6] wifi: mt76: make mt76_get_of_eeprom static again
Date: Wed, 18 Oct 2023 15:09:40 +0200
Message-Id: <20231018130942.31187-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018130942.31187-1-ansuelsmth@gmail.com>
References: <20231018130942.31187-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_061046_985950_63B86293 
X-CRM114-Status: GOOD (  14.56  )
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


