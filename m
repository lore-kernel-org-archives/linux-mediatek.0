Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E83C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 02:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQPvkby8Wlmd7ypzID5CR7DQzhydu1YPm77rqyaaOP0=; b=Bf7hqiP/O+BYlsmdtjKDL7fPCD
	EezmrDl0vKHniNfakHbgF4L0Ol6huY7OkGacscxz+r5hJ6beXBT4gcXH8H5PGmQ6mvm6poo8UMFnC
	gJn1tyPdWkbqXp6OfX4Xb/sqgGPDZ6TTZ9t1MkCyHparjcTPLgSfUnPzTAvNaEpdXEl1XZX3apjYe
	Es3c9Nxmt3BMHFobEKaQtpYDOBHNgxr702gpB8X9K6DrclvCgvGJhAjmrOLbIY2xM3rNveFSO5+Ez
	b5xR8FRHPm/pQrVCfkyb7KRL3Q4mXK7hLBuUptkbcVxNAyR8NMkiDxl036GOKhVOb1QBzEtJd3ivy
	R6yOT0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAK7-00Dz6o-1E;
	Mon, 03 Apr 2023 02:53:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAK2-00Dz5K-2W;
	Mon, 03 Apr 2023 02:53:33 +0000
X-UUID: ab954ab6d1ca11ed8687db9d93187ff1-20230402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XQPvkby8Wlmd7ypzID5CR7DQzhydu1YPm77rqyaaOP0=;
	b=oSv8B2fBpeR5FHiAI8T62Jh6fnIQ2gP1PoQAtbl9cjNnzQd6EoiqYueukHyjD/hxXa8QPVzYHvt1sr+UCohHq+XY7KU3dqRkbBmRrGIcAyhTwoTh0chRYQuKQ8w0ymgKW05/R/+SvotYkIRHjoLEO8ztuYnKFr6ugQSRg42gCdA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:040b4bae-3a02-45c2-91e8-efa96e98c514,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:040b4bae-3a02-45c2-91e8-efa96e98c514,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:6551abf7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230403105236IUDYACW1,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ab954ab6d1ca11ed8687db9d93187ff1-20230402
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1500127844; Sun, 02 Apr 2023 19:53:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 10:52:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 10:52:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
Subject: [PATCH 5/7] usb: mtu3: expose role-switch control to userspace
Date: Mon, 3 Apr 2023 10:52:28 +0800
Message-ID: <20230403025230.25035-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_195330_847441_43C2EBC2 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

The allow_userspace_control flag enables manual role switch from userspace,
turn this feature on like several other USB DRD controller drivers.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 9b8aded3d95e..8191b7ed3852 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -294,6 +294,7 @@ static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
 	role_sx_desc.get = ssusb_role_sw_get;
 	role_sx_desc.fwnode = dev_fwnode(dev);
 	role_sx_desc.driver_data = ssusb;
+	role_sx_desc.allow_userspace_control = true;
 	otg_sx->role_sw = usb_role_switch_register(dev, &role_sx_desc);
 	if (IS_ERR(otg_sx->role_sw))
 		return PTR_ERR(otg_sx->role_sw);
-- 
2.18.0


