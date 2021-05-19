Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4C3C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 06:45:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4803761042
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 06:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4803761042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XrszHIVTXkQMqRG8b5Mmtz78/gmsKigKe/r8tEsq2sk=; b=YO7sxMqEedqwarlg8erSB8gRd
	02cK/SAPzRUZHpXY+x13MT0JXJ5GyJbtRMbyOCmFIx3IIzuSF99iuuUm1NmjmIwGjg8oY78m/e8xg
	H88wRlnZ6MDoaJr30WSfS3gwhV2zStoM50TjYP/QRr7hZmgSGDjFqOwNrg81/f4ED6tdRXo1z7Lju
	UftTg/d5UozTDaZ+rptNG+CuJERj87Er3wnOoXClQwlyND2aCfVLG/FmjYjR/8s6fwpNUDTTA6Hz7
	2ieK9oy7/MRKNlKqjn4Tm6FRpjyslrLjYTYoA5Jok+wXheOa1fnW7A6BGCLcm7GBWYFY1YWAJ70EV
	yrODpHCxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFxC-00327L-GY; Wed, 19 May 2021 06:45:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFwd-00321Y-5L; Wed, 19 May 2021 06:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=WptadbQ4jCa57vAznmDmHO9I76lcJbXhSK3aQCB6Amg=; b=A7LKLyvxGHF5xQGOBUVTe9AHmk
 jeEXZ9uneYw82rX98d8Q0muhi1FFqG4OZ0EjxrUxXSjLQ31vuyvM/eZa4NzkPA2SqU3yMmzM8n1Lf
 5SFw1kEvGc9GTNrAnB8hjyg/0Ppw/d+4JAboCMjuCVv/q6oGSqL7s1xi7e+a1q9ETnM85DddXTRRM
 5fESzWvP886Oy3Z2iCbet3fP6d2JgBmpqIgXn4YSGO3G4hRV/M1DtBA0L3jB4JwERyMLmTwUtSdwD
 7CbBy0vwBr2Jq2heqieCfG/2tU52vOX8WStapyliyCziBWLcb9PL+0cBnjXb3RxN0Kv9gfj0xF3K+
 f2xAYhTw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFwW-00FBni-OX; Wed, 19 May 2021 06:44:36 +0000
X-UUID: d847fcfce6b74aafae93963dd9871398-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WptadbQ4jCa57vAznmDmHO9I76lcJbXhSK3aQCB6Amg=; 
 b=HJKW92R/LnEm4uCSm7sqXWK1NYy6JRHzKS2DgeghHcCiHQppdXOeP0eFZJGWve+ifEE6BL9T74FeXVNyoGvAi/JP6DCA1KNeiAP34R4e2s7bp1O+N7JllsF8oPtahy0yf1zKgyQ0dBACiZBGhzq09DRpT74PeZ/xI+vELZVjaS8=;
X-UUID: d847fcfce6b74aafae93963dd9871398-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2280508; Tue, 18 May 2021 23:44:28 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 23:34:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 14:34:20 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 14:34:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding
 <treding@nvidia.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Paul Cercueil <paul@crapouillou.net>, Lee Jones
 <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS supply
 optional"
Date: Wed, 19 May 2021 14:34:15 +0800
Message-ID: <1621406055-18749-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1621406055-18749-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1621406055-18749-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EC0D35134169962D652787113D82E54CFD756EFEAD831699B6318AC78E25A0602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_234432_842972_D3B6524A 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Vbus is already an optional supply, if the vbus-supply is not
provided in DTS, will use a dummy regulator,
the warning log is as below:
"supply vbus not found, using dummy regulator"

This reverts commit 4ddf1ac79e5f082451cd549283d2eb7559ab6ca9.

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/common/usb-conn-gpio.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index dfbbc4f51ed6..143bbd8f557a 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -91,14 +91,14 @@ static void usb_conn_detect_cable(struct work_struct *work)
 		return;
 	}
 
-	if (info->last_role == USB_ROLE_HOST && info->vbus)
+	if (info->last_role == USB_ROLE_HOST)
 		regulator_disable(info->vbus);
 
 	ret = usb_role_switch_set_role(info->role_sw, role);
 	if (ret)
 		dev_err(info->dev, "failed to set role: %d\n", ret);
 
-	if (role == USB_ROLE_HOST && info->vbus) {
+	if (role == USB_ROLE_HOST) {
 		ret = regulator_enable(info->vbus);
 		if (ret)
 			dev_err(info->dev, "enable vbus regulator failed\n");
@@ -106,9 +106,8 @@ static void usb_conn_detect_cable(struct work_struct *work)
 
 	info->last_role = role;
 
-	if (info->vbus)
-		dev_dbg(info->dev, "vbus regulator is %s\n",
-			regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
+	dev_dbg(info->dev, "vbus regulator is %s\n",
+		regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
 
 	power_supply_changed(info->charger);
 }
@@ -205,23 +204,7 @@ static int usb_conn_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&info->dw_det, usb_conn_detect_cable);
 
-	/*
-	 * If the USB connector is a child of a USB port and that port already provides the VBUS
-	 * supply, there's no need for the USB connector to provide it again.
-	 */
-	if (dev->parent && dev->parent->of_node) {
-		if (of_find_property(dev->parent->of_node, "vbus-supply", NULL))
-			need_vbus = false;
-	}
-
-	if (!need_vbus) {
-		info->vbus = devm_regulator_get_optional(dev, "vbus");
-		if (PTR_ERR(info->vbus) == -ENODEV)
-			info->vbus = NULL;
-	} else {
-		info->vbus = devm_regulator_get(dev, "vbus");
-	}
-
+	info->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(info->vbus)) {
 		ret = PTR_ERR(info->vbus);
 		return dev_err_probe(dev, ret, "failed to get vbus :%d\n", ret);
@@ -288,7 +271,7 @@ static int usb_conn_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&info->dw_det);
 
-	if (info->last_role == USB_ROLE_HOST && info->vbus)
+	if (info->last_role == USB_ROLE_HOST)
 		regulator_disable(info->vbus);
 
 	usb_role_switch_put(info->role_sw);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
