Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD70C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqcSxvqAWTShHKynix5KTKLbO29ZXdN0ZFHt4UKM3vo=; b=VQrQ821o5PXKi5
	Kvt+siGo/SxIbiiHkJvg3fnwiTLVsn8XH4CWOM+4N8xoOE/wwLkUN+jDNElmRavAZty+XB3t7UVd5
	CKmH9kDhtYyZ34ghnvDjSXuCTZQlp5rjwdzCVd9TLlRgfzUReXVmIdECxQK2euFHhcA3ifc3PzVfi
	arwednmeVR4HPxSU6Da00d1QdhUfhNuFueJUUMgrIdWbg5YxiJS6VbXjGdwQwusz32ucGuWJplz9i
	VJfVWqJWXFKm06lKDaYMcfyEhQ1W4z9JY3a7EiZMggX0v/LbXulbEx4wiRssd0psSH9jq1510mytS
	F+vdgPg1bmEVMy0QQ3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngj1l-002F7E-4O; Tue, 19 Apr 2022 08:16:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiz9-002DgQ-5e; Tue, 19 Apr 2022 08:13:30 +0000
X-UUID: 3d31f19b310941ddb16a65e3070e6955-20220419
X-UUID: 3d31f19b310941ddb16a65e3070e6955-20220419
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 551415681; Tue, 19 Apr 2022 01:12:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 01:12:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 19 Apr 2022 16:12:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Apr 2022 16:12:54 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <stable@vger.kernel.org>, Tainping Fang <tianping.fang@mediatek.com>
Subject: [PATCH] usb: mtu3: fix USB 3.0 dual-role-switch from device to host
Date: Tue, 19 Apr 2022 16:12:45 +0800
Message-ID: <20220419081245.21015-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_011319_242765_BD9B5746 
X-CRM114-Status: GOOD (  10.65  )
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

Issue description:
  When an OTG port has been switched to device role and then switch back
  to host role again, the USB 3.0 Host (XHCI) will not be able to detect
  "plug in event of a connected USB 2.0/1.0 ((Highspeed and Fullspeed)
  devices until system reboot.

Root cause and Solution:
  There is a condition checking flag "ssusb->otg_switch.is_u3_drd" in
  toggle_opstate(). At the end of role switch procedure, toggle_opstate()
  will be called to set DC_SESSION and SOFT_CONN bit. If "is_u3_drd" was
  set and switched the role to USB host 3.0, bit DC_SESSION and SOFT_CONN
  will be skipped hence caused the port cannot detect connected USB 2.0
  (Highspeed and Fullspeed) devices. Simply remove the condition check to
  solve this issue.

Fixes: d0ed062a8b75 ("usb: mtu3: dual-role mode support")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Tainping Fang <tianping.fang@mediatek.com>
Tested-by: Fabien Parent <fparent@baylibre.com>
Cc: stable@vger.kernel.org
---
 drivers/usb/mtu3/mtu3_dr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index ec6ec621838b..b820724c56e4 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -21,10 +21,8 @@ static inline struct ssusb_mtk *otg_sx_to_ssusb(struct otg_switch_mtk *otg_sx)
 
 static void toggle_opstate(struct ssusb_mtk *ssusb)
 {
-	if (!ssusb->otg_switch.is_u3_drd) {
-		mtu3_setbits(ssusb->mac_base, U3D_DEVICE_CONTROL, DC_SESSION);
-		mtu3_setbits(ssusb->mac_base, U3D_POWER_MANAGEMENT, SOFT_CONN);
-	}
+	mtu3_setbits(ssusb->mac_base, U3D_DEVICE_CONTROL, DC_SESSION);
+	mtu3_setbits(ssusb->mac_base, U3D_POWER_MANAGEMENT, SOFT_CONN);
 }
 
 /* only port0 supports dual-role mode */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
