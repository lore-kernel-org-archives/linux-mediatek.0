Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA8C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBD40zR9wWh1sckjELKZXTOemjbdZqIQwnnA64yKeJY=; b=YeKJgA6u5/5rVheTtqSmb3+PqA
	z8nPVieul4xBZenulezvvOJwQEcqd8SqNexSgyPmjGGOpdicNf2Y8Iskudt4unn7dOkf6CP6H7pZe
	d7b3MOxzGKbxG+AJ1+UxCbqQxQBVT15GfMi6PyHNJFwB/8JZn6s2vzFjrzTTPuvIXqa3+ke/XtqS8
	PoGAkbUvxfg4CxTxZQ717cBhTahfxkDqi11na/w2nTHVw7cgB9raC8CxD0pXwMLWb0jW4Ao3/F6cF
	KoXII8vbC9jOdj5TJ5tjzokEO5wJ4LoPIqENl36wlA+TFGqEYwcMJXH11ZyRJ8WbcTB6V2h0jNP1O
	L4l+tMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0J0h-0000000CB7Q-0Zjf;
	Fri, 26 Apr 2024 10:40:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0J0d-0000000CB6d-1BJ8;
	Fri, 26 Apr 2024 10:40:52 +0000
X-UUID: 6f870c9a03b911efa8f1cd58ee6c2400-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FBD40zR9wWh1sckjELKZXTOemjbdZqIQwnnA64yKeJY=;
	b=dM2DRHkh25+7sDwdzD6zExckewvm9s2Z16aQzokSAEgnqUP4Vjfc7YcJys7nmCr4GmKS//XUI5GgQF662s3a8fungnZ5WM6VS6vViVrIjW1GopYkQV5fUQm/4hvZLcx2Tj4E/UquZiWcLZGItryEISfoZCsAx4cFW/gNa4sRNSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:4ef097f3-e391-481b-b69f-d5e4e3cac452,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:33822683-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6f870c9a03b911efa8f1cd58ee6c2400-20240426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 985235958; Fri, 26 Apr 2024 03:40:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:40 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zoie Lin
	<zoie.lin@mediatek.com>
Subject: [PATCH 1/3] misc: eeprom: at24: add optional dovdd-supply
Date: Fri, 26 Apr 2024 18:29:47 +0800
Message-ID: <20240426102949.23057-2-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240426102949.23057-1-zoie.lin@mediatek.com>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.822200-8.000000
X-TMASE-MatchedRID: srvpIgWJJtlveCKWtaLcaBWCVBr+Ay98h+w9Wz/xXDoKogmGusPLb8bX
	zAmc72fpj7Wc8+5sjRQYGNM7XoZ5vKF2E6v/FJwhDko+EYiDQxG/lNQoFWTBKlSOymiJfTYXmDU
	U4w5Ch9HGK2Un1Qzz54Ay6p60ZV62fJ5/bZ6npdjKayT/BQTiGhwHPzrPx3/LH3JmFo2Le/cGF+
	eCWUDtSe/zhBFYHPGPKFqfM6Ow4ZGY+IvowaUQiVI5iMtRu6lG9OWOVhEk0dxL8+YJouWudF4Bs
	BlJkIbFdATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZbxffl9hhCBw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.822200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8CC693C4F21B0F532796730FE4252B88B50B15F003698EF2208244DB84F1D902000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_034051_341993_4BA4D635 
X-CRM114-Status: GOOD (  15.40  )
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

From: Zoie Lin <zoie.lin@mediatek.com>

Incorporate support for the dovdd regulator, which supplies an
additional power source to the EEPROM.

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 drivers/misc/eeprom/at24.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 572333ead5fb..b96f6eda3ad2 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -86,6 +86,7 @@ struct at24_data {
 
 	struct nvmem_device *nvmem;
 	struct regulator *vcc_reg;
+	struct regulator *dovdd_reg;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 
 	/*
@@ -697,6 +698,14 @@ static int at24_probe(struct i2c_client *client)
 	if (IS_ERR(at24->vcc_reg))
 		return PTR_ERR(at24->vcc_reg);
 
+	at24->dovdd_reg = devm_regulator_get_optional(dev, "dovdd");
+	if (IS_ERR(at24->dovdd_reg)) {
+		if (PTR_ERR(at24->dovdd_reg) == -ENODEV)
+			at24->dovdd_reg = NULL;
+		else
+			return PTR_ERR(at24->dovdd_reg);
+	}
+
 	writable = !(flags & AT24_FLAG_READONLY);
 	if (writable) {
 		at24->write_max = min_t(unsigned int,
@@ -754,6 +763,14 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 		}
 
+		if (at24->dovdd_reg != NULL) {
+			err = regulator_enable(at24->dovdd_reg);
+			if (err) {
+				dev_err(dev, "Failed to enable dovdd regulator\n");
+				return err;
+			}
+		}
+
 		pm_runtime_set_active(dev);
 	}
 	pm_runtime_enable(dev);
@@ -761,8 +778,11 @@ static int at24_probe(struct i2c_client *client)
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(at24->nvmem)) {
 		pm_runtime_disable(dev);
-		if (!pm_runtime_status_suspended(dev))
+		if (!pm_runtime_status_suspended(dev)) {
 			regulator_disable(at24->vcc_reg);
+			if (at24->dovdd_reg != NULL)
+				regulator_disable(at24->dovdd_reg);
+		}
 		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
 				     "failed to register nvmem\n");
 	}
@@ -804,8 +824,11 @@ static void at24_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	if (acpi_dev_state_d0(&client->dev)) {
-		if (!pm_runtime_status_suspended(&client->dev))
+		if (!pm_runtime_status_suspended(&client->dev)) {
 			regulator_disable(at24->vcc_reg);
+			if (at24->dovdd_reg != NULL)
+				regulator_disable(at24->dovdd_reg);
+		}
 		pm_runtime_set_suspended(&client->dev);
 	}
 }
@@ -815,14 +838,24 @@ static int __maybe_unused at24_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
+	if (at24->dovdd_reg != NULL)
+		regulator_disable(at24->dovdd_reg);
+
 	return regulator_disable(at24->vcc_reg);
 }
 
 static int __maybe_unused at24_resume(struct device *dev)
 {
+	int err;
 	struct i2c_client *client = to_i2c_client(dev);
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
+	if (at24->dovdd_reg != NULL) {
+		err = regulator_enable(at24->dovdd_reg);
+		if (err)
+			return err;
+	}
+
 	return regulator_enable(at24->vcc_reg);
 }
 
-- 
2.18.0


