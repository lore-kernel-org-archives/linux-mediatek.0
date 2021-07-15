Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A604C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:20:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A950610C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A950610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLFRzVOsuBHYYbSO21L9t9dlVIdW1gE4Y5Tjbg43tQ0=; b=NPL5jYwuEoxSrJ
	HBATdbtuJg6HjmeBoM3e6EYDoTzj3RHXjxY5ciqAPXN/XBC6aV9lSs4zEjQ347xHnMmgUFs1LuIkt
	MKf/iEiuOQySo79Ul1paarlkTH02s3OFwPr7XStZMtFFHUMOFqYahYPa+O7YGCRY4PiMOu9UWSXRN
	aK9m5moMo3xsF3I8fzgpXEt1E3oV8/rQhnqxT0WbHkkQKBuenxMwOd/H7U6R7ggOg+WV8OSpLGLRf
	te1ILeDal8wu3fFq+yLkqW560MVYtt13cBwGWjIEFDzoE1vlhJf6Keu7gdAkBxhvBmiEuO/KAiAI8
	fMAn0OTyE57X6h0IjEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xX6-0007M9-Aq; Thu, 15 Jul 2021 09:19:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xVh-0006jy-F0; Thu, 15 Jul 2021 09:18:30 +0000
X-UUID: 19d2efb14c564c9b96e3a17ce590d857-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8DPuPo7iXq2kocHLBztZQq18jBCRAG4HgUTB2pFTcBs=; 
 b=c1IBqamHBOkJ3q1K3V5iYAK5wQDRN6/muMStW7++CS97vTrqkBDwoZBRikulBqzSbadV80+Ih/1j4Y3C1pBNv/+8GpnJcYq8dyI/4nlO71z4EPierrsStUxhY0y7URMncb6iei2oEPB4r/gPceHCqNhjhFf5xLM7BuxV9iGF5Ag=;
X-UUID: 19d2efb14c564c9b96e3a17ce590d857-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 59401607; Thu, 15 Jul 2021 02:18:21 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 02:08:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 17:08:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 17:08:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 07/13] usb: mtu3: support property role-switch-default-mode
Date: Thu, 15 Jul 2021 17:07:52 +0800
Message-ID: <1626340078-29111-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_021825_596746_4D2BBA89 
X-CRM114-Status: GOOD (  17.41  )
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

Support default mode config when use usb-role-switch

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/usb/mtu3/mtu3.h    |  2 ++
 drivers/usb/mtu3/mtu3_dr.c | 24 ++++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 5546b868b08b..bc82c7f97ad6 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -199,6 +199,7 @@ struct mtu3_gpd_ring {
 * @id_nb : notifier for iddig(idpin) detection
 * @dr_work : work for drd mode switch, used to avoid sleep in atomic context
 * @desired_role : role desired to switch
+* @default_role : default mode while usb role is USB_ROLE_NONE
 * @role_sw : use USB Role Switch to support dual-role switch, can't use
 *		extcon at the same time, and extcon is deprecated.
 * @role_sw_used : true when the USB Role Switch is used.
@@ -212,6 +213,7 @@ struct otg_switch_mtk {
 	struct notifier_block id_nb;
 	struct work_struct dr_work;
 	enum usb_role desired_role;
+	enum usb_role default_role;
 	struct usb_role_switch *role_sw;
 	bool role_sw_used;
 	bool is_u3_drd;
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 318fbc618137..30e7e5fc0f88 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -137,8 +137,12 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 	current_role = ssusb->is_host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	if (desired_role == USB_ROLE_NONE)
+	if (desired_role == USB_ROLE_NONE) {
+		/* the default mode is host as probe does */
 		desired_role = USB_ROLE_HOST;
+		if (otg_sx->default_role == USB_ROLE_DEVICE)
+			desired_role = USB_ROLE_DEVICE;
+	}
 
 	if (current_role == desired_role)
 		return;
@@ -274,17 +278,29 @@ static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
 {
 	struct usb_role_switch_desc role_sx_desc = { 0 };
 	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
+	struct device *dev = ssusb->dev;
+	enum usb_dr_mode mode;
 
 	if (!otg_sx->role_sw_used)
 		return 0;
 
+	mode = usb_get_role_switch_default_mode(dev);
+	if (mode == USB_DR_MODE_PERIPHERAL)
+		otg_sx->default_role = USB_ROLE_DEVICE;
+	else
+		otg_sx->default_role = USB_ROLE_HOST;
+
 	role_sx_desc.set = ssusb_role_sw_set;
 	role_sx_desc.get = ssusb_role_sw_get;
-	role_sx_desc.fwnode = dev_fwnode(ssusb->dev);
+	role_sx_desc.fwnode = dev_fwnode(dev);
 	role_sx_desc.driver_data = ssusb;
-	otg_sx->role_sw = usb_role_switch_register(ssusb->dev, &role_sx_desc);
+	otg_sx->role_sw = usb_role_switch_register(dev, &role_sx_desc);
+	if (IS_ERR(otg_sx->role_sw))
+		return PTR_ERR(otg_sx->role_sw);
 
-	return PTR_ERR_OR_ZERO(otg_sx->role_sw);
+	ssusb_set_mode(otg_sx, otg_sx->default_role);
+
+	return 0;
 }
 
 int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
