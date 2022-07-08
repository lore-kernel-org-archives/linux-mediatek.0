Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgqLdvGM6FU2QJqPfLI8MwRIRTbYkDIFeOVwjyu4cJc=; b=PGp5L9hj4W3PMafTwakpkm4HR1
	Ec2hO1hg6OchAg0h+TQDksxVjB+2+qw0gCHa6aMjZPxMmWVA9AScMK5WFF7LSsqR/l7ZQq/yXLf1t
	E66VaU2uZgYltfoPcTU/ySUAKWg70EdwycstPHKCm2Dl1U3TNeuroHH2Fb7XIp8wEAddR86XrOEos
	5dNZcUYE/Dn6/CYFChuOctgPgLC9x602VPyVJn2hqeKD77x9tqmaFBSpAPMfDO6M4Li/f16Lyf3/V
	gLdOt55Is0+fIa7BCLeibTVahsax92JgxjNH2NtTVJIlsRDpucIl3h4qTCLUvso3lwqhVKMo9L/Vw
	JHKPMt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ibA-002H4z-Gs; Fri, 08 Jul 2022 07:40:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ib7-002H3r-7F; Fri, 08 Jul 2022 07:40:22 +0000
X-UUID: a5bf1318de0d4fdfa8074204b33932c4-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:fb7781cf-48a9-41f6-9086-08363208564e,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:1a19c263-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a5bf1318de0d4fdfa8074204b33932c4-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1448741132; Fri, 08 Jul 2022 00:40:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 15:19:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 15:19:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Subject: [PATCH 4/5] usb: mtu3: check capability of usb3 dual role
Date: Fri, 8 Jul 2022 15:19:02 +0800
Message-ID: <20220708071903.25752-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_004021_307137_B279C3CA 
X-CRM114-Status: GOOD (  15.58  )
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

It is capable of supporting usb3 dual role if there is at least one
usb3 port for device and xhci controller, we can check it from the
controller's capability, so no need the property "mediatek,usb3-drd"
anymore, but I find the property is not decribed in dt-binding.
Meanwhile, also take into account if the u3 port is disabled when the
u3 phy is shared with pcie.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 42987d08ce8c..4cb65346789d 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -190,6 +190,31 @@ static void ssusb_ip_sw_reset(struct ssusb_mtk *ssusb)
 	mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
 
+static void ssusb_u3_drd_check(struct ssusb_mtk *ssusb)
+{
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+	u32 dev_u3p_num;
+	u32 host_u3p_num;
+	u32 value;
+
+	/* u3 port0 is disabled */
+	if (ssusb->u3p_dis_msk & BIT(0)) {
+		otg_sx->is_u3_drd = false;
+		goto out;
+	}
+
+	value = mtu3_readl(ssusb->ippc_base, U3D_SSUSB_IP_DEV_CAP);
+	dev_u3p_num = SSUSB_IP_DEV_U3_PORT_NUM(value);
+
+	value = mtu3_readl(ssusb->ippc_base, U3D_SSUSB_IP_XHCI_CAP);
+	host_u3p_num = SSUSB_IP_XHCI_U3_PORT_NUM(value);
+
+	otg_sx->is_u3_drd = !!(dev_u3p_num && host_u3p_num);
+
+out:
+	dev_info(ssusb->dev, "usb3-drd: %d\n", otg_sx->is_u3_drd);
+}
+
 static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -270,7 +295,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		goto out;
 
 	/* if dual-role mode is supported */
-	otg_sx->is_u3_drd = of_property_read_bool(node, "mediatek,usb3-drd");
 	otg_sx->manual_drd_enabled =
 		of_property_read_bool(node, "enable-manual-drd");
 	otg_sx->role_sw_used = of_property_read_bool(node, "usb-role-switch");
@@ -290,9 +314,8 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	}
 
 out:
-	dev_info(dev, "dr_mode: %d, is_u3_dr: %d, drd: %s\n",
-		 ssusb->dr_mode, otg_sx->is_u3_drd,
-		otg_sx->manual_drd_enabled ? "manual" : "auto");
+	dev_info(dev, "dr_mode: %d, drd: %s\n", ssusb->dr_mode,
+		 otg_sx->manual_drd_enabled ? "manual" : "auto");
 	dev_info(dev, "u2p_dis_msk: %x, u3p_dis_msk: %x\n",
 		 ssusb->u2p_dis_msk, ssusb->u3p_dis_msk);
 
@@ -353,6 +376,7 @@ static int mtu3_probe(struct platform_device *pdev)
 	}
 
 	ssusb_ip_sw_reset(ssusb);
+	ssusb_u3_drd_check(ssusb);
 
 	if (IS_ENABLED(CONFIG_USB_MTU3_HOST))
 		ssusb->dr_mode = USB_DR_MODE_HOST;
-- 
2.18.0


