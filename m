Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CFC27C50
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 22:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3D09rwq099rXAFTrCTUTJ+my0BjE9qWUOio5w9f6c2g=; b=LeNPbNXZ2eT1P0aCQhmIa+CSyC
	AJZBYxjJkYwLEgLCB4VB5hzlA+I3zZ0GarTnKJr3fzUd1+oxvbzo3CVeJ/7SWOlABckmWWi4WxWj+
	Bj5RkCtGdEWTLgbi+Bu3XGBLz9u2Mp9H509rIptyVgJM7ww6RawTszB6AzbpQTgwumGeBFhks+XGD
	lWm9ojDQT9fjUMpA4VJQuvU6MwQ7pn2NYz97bqYR9su/9A1gfKlv/oK1rdBdequ66x+eajfVpidAe
	2/q9d3Re4t/9MQfYSMJC8LUdfzdCSkQf7PTnlmKf5Y0jjBRFHjFYkFRSwxEKrJuklcJV5EWQ3hIFZ
	MCjBo+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEcvx-000000046G4-0KRW;
	Tue, 04 Jun 2024 22:47:13 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEcvu-000000046Eh-36yH
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 22:47:12 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f939ebddd7so30722a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 15:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717541229; x=1718146029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3D09rwq099rXAFTrCTUTJ+my0BjE9qWUOio5w9f6c2g=;
        b=kYmZU/03XCJ7GXjtQv6uWyBdhpN4197Sezjol+w6ne8nnMu1lFeqhXrX7a6E1WcVs9
         KGdXlrfDnTEHQkkwAI5uWxghWZxZxPURnV6WVHLu+Zh9BCIVqFOiHdoXWQQoVzhhfGUm
         bhyXC4N4M+WjiPclW6Nwlwb1itmrcz1cR8xfethdBWh7EAheBognehhdF4q390N7+Sfu
         QMZGHt3fucK+7hTrzmqz9dKzKatzdWHeK9HC8tTRiuXNx5vHV9WBQeJep38MZWMdwQEL
         pGCu04PtDIJzgXRjj0AGsU3zQK5TdxV0DFQyNC+sPoyvX1In2Zs5pAcqQgxxtPu1uWpW
         bM2w==
X-Forwarded-Encrypted: i=1; AJvYcCXnfmEpLm9qtqQct5wfp/5AkHHYBZsa9GZnAW7vJqxiHjjhB0IsMmlpcOV8JaVFEbM1paTlzdXbS1wPmPGpCNNQu7dpGME9IGgHFl5CrLfc771l
X-Gm-Message-State: AOJu0YxFMSWdb7oyzSUQETFQUS2ugWWHtEh1DitMzq5UHOHEgsqBiHSC
	vEpmiyRmVKLKK3odLqWO2Pmqw2QiSiMF8dHygnvw+DN/H4yBfqg08xPEp2AjTa4=
X-Google-Smtp-Source: AGHT+IFFjZn5VUCIfKrOqhS1vAjSWJAr8KWnPs723c+O2GD3GNi8hUtWTao+vLFexfJb+mZ73Cbm4w==
X-Received: by 2002:a05:6830:4520:b0:6f9:37d8:c057 with SMTP id 46e09a7af769-6f94384edcamr706008a34.3.1717541228779;
        Tue, 04 Jun 2024 15:47:08 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f93b4a3e00sm478529a34.50.2024.06.04.15.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 15:47:08 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/2] Bluetooth: btusb: mediatek: return error code for failed register access
Date: Tue,  4 Jun 2024 15:47:00 -0700
Message-Id: <7673d4432c2ba07ad3d38f9c483862b77b1db211.1717540338.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8f809ae0094c89ed99efb4074472edd119db8ec1.1717540338.git.sean.wang@kernel.org>
References: <8f809ae0094c89ed99efb4074472edd119db8ec1.1717540338.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_154711_068913_1681A7EA 
X-CRM114-Status: GOOD (  13.22  )
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

From: Sean Wang <sean.wang@mediatek.com>

Update the code to immediately return an error code if accessing a
related register fails. This ensures that our desired logic for
subsequent register operations is maintained and allows us to promptly
catch any unexpected errors.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btusb.c | 116 ++++++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 31 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcdd660add19..e862e4648082 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3037,47 +3037,96 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	int err;
 
 	if (dev_id == 0x7922) {
-		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		if (err < 0)
+			return err;
 		val |= 0x00002020;
-		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
-		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
-		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		if (err < 0)
+			return err;
 		val |= BIT(0);
-		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		if (err < 0)
+			return err;
 		msleep(100);
 	} else if (dev_id == 0x7925) {
-		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
+		if (err < 0)
+			return err;
 		val |= (1 << 5);
-		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
-		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
+		if (err < 0)
+			return err;
 		val &= 0xFFFF00FF;
 		val |= (1 << 13);
-		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
-		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
-		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
+		if (err < 0)
+			return err;
 		val |= (1 << 0);
-		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
-		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
-		btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
-		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT1, 0x000000FF);
-		btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT1, &val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT1, 0x000000FF);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT1, &val);
+		if (err < 0)
+			return err;
 		msleep(100);
 	} else {
 		/* It's Device EndPoint Reset Option Register */
 		bt_dev_dbg(hdev, "Initiating reset mechanism via uhw");
-		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
-		btusb_mtk_uhw_reg_read(data, MTK_BT_WDT_STATUS, &val);
-
+		err = btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_WDT_STATUS, &val);
+		if (err < 0)
+			return err;
 		/* Reset the bluetooth chip via USB interface. */
-		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 1);
-		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
-		btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
-		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT1, 0x000000FF);
-		btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT1, &val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 1);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT1, 0x000000FF);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT1, &val);
+		if (err < 0)
+			return err;
 		/* MT7921 need to delay 20ms between toggle reset bit */
 		msleep(20);
-		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
-		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		err = btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
+		if (err < 0)
+			return err;
+		err = btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		if (err < 0)
+			return err;
 	}
 
 	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
@@ -3085,11 +3134,14 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	if (err < 0)
 		bt_dev_err(hdev, "Reset timeout");
 
-	if (dev_id == 0x7922)
-		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+	if (dev_id == 0x7922) {
+		err = btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+		if (err < 0)
+			return err;
+	}
 
-	btusb_mtk_id_get(data, 0x70010200, &val);
-	if (!val)
+	err = btusb_mtk_id_get(data, 0x70010200, &val);
+	if (err < 0 || !val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
 
 	return err;
@@ -3205,7 +3257,9 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
 
 		/* It's Device EndPoint Reset Option Register */
-		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
+		err = btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
+		if (err < 0)
+			return err;
 
 		/* Enable Bluetooth protocol */
 		param = 1;
-- 
2.25.1


