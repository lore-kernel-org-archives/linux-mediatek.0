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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309A4C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 06:50:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E7B611BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 06:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2E7B611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Llv7dP18npXHdy27M+jptufDFiQhJcTAplkZvcP/1eM=; b=oHpCdt3HVrCmqh7knC29SkQ4y
	70PM+d0hQJ/ELud5EMYEEve9rnvao4TJMadqJA682fTuYiqwjTQbTSbBYJsXtug6BzubZqa8YQG2e
	jS0YC8UNIwaN78EegVvVGcDG/ZJBq/Uy+NUTHHjqPUNKAwlFPmePpN/uGsnG/qLC33m4o8ItwGn0x
	AU8Wu+AsWYgDDQP6gQJcJQYrXT5JttxbUzLpbroXye6xn2H8ubmFRa0ITRQY9T7qP6FBq/eNLFYsZ
	YKYx+ljcBEpvpKtIzIgExldUbJF90RKuG7ORfoEcQtkWskDovfcWD60doR63pfs778+At2NjZGx9D
	B67tpuUlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljG2E-00330L-6O; Wed, 19 May 2021 06:50:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG20-0032yF-Lv; Wed, 19 May 2021 06:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=yf3j0i+IsS2HDLwpRWDeNcl69YmoTlrxTWRCwWXxdHE=; b=h4xmblJB0lDJWdG18tCLUNDwtP
 obW52K7uIXwJPIN4YHjjQlw33o/aHgPL8wESgjer2HyWgU6pLUC1my24gGjJ+mKgNtpsyaYSMuet6
 4llBuKxBsxZQUuuwUk76PPbzKudEoQWJ+uNDl7pUmV56WkOAlBYdFrX8GAxe1PTmoldtEx1UZmT6s
 tpepQniR9RrFlPCGYl2bm3NXEYrssLi78yYcfjjHxZWbYGG3PLOwibGgkGQBR4lfnpP8+heVIyuSg
 C7WfWt86hwtYr7KKC+M0z/Xp/kznEVyYsgAuO3K3A/fz67KeAuDyGfXgxlOsv+97c0VAO3R0izcJW
 Ksav9NRQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG1v-00FC2y-Gq; Wed, 19 May 2021 06:50:10 +0000
X-UUID: bad0e3c8e67d4441b346f76efdf0abe4-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yf3j0i+IsS2HDLwpRWDeNcl69YmoTlrxTWRCwWXxdHE=; 
 b=PImMcEvAOolKyQVSK5zFEiOV09mi83Ji56ecQQmYgbdw7hdnQFkd+fIzqyo/YgeOZGTto43RpSq5/SSx6/NWZaNgFrruYrIdZlC+jGGpXrSdrQ6PTCuGGhl0XUmaHZbjaf6i9JLmVQU9UV95HxIISH04Ya3LNB8n7Mo+ZysyaHg=;
X-UUID: bad0e3c8e67d4441b346f76efdf0abe4-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 588833310; Tue, 18 May 2021 23:50:04 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 23:40:04 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 14:39:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 14:39:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding
 <treding@nvidia.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Paul Cercueil <paul@crapouillou.net>, Lee Jones
 <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS supply
 optional"
Date: Wed, 19 May 2021 14:39:46 +0800
Message-ID: <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 164287284D5D51868550B33931481A8944D3E274C0BECC5DD68242334BA10D312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_235008_131855_ABFE4112 
X-CRM114-Status: GOOD (  19.66  )
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
v2: remove unused variable "need_vbus"
---
 drivers/usb/common/usb-conn-gpio.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index dfbbc4f51ed6..65d89140cd19 100644
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
@@ -175,7 +174,6 @@ static int usb_conn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct usb_conn_info *info;
-	bool need_vbus = true;
 	int ret = 0;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
@@ -205,23 +203,7 @@ static int usb_conn_probe(struct platform_device *pdev)
 
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
@@ -288,7 +270,7 @@ static int usb_conn_remove(struct platform_device *pdev)
 
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
