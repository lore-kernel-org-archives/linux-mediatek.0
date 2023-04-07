Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFB5C76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgPmlZ5Rc5SqpbW8c7zrSNMdoNSH2yTeyLzGUm9Y1kU=; b=h19CnP6KO88R6YTHefbmI0r/Pl
	lJejC7hYbiBap2C09Mie6/Op9dD+Fzu5MPRUyogoYrllZHvHSUAsL2R+fh4SkvskvqVNnctA4/G+5
	rL9Sow4uRggMyWAEwnelZYsbm3iJPRUb5Di1u6Y/t5GIKxWWkm9aaMEB2kb/z38l/f9wb9WLLPyjw
	ctJnb3VQJSQSPJ2tcWe1hbqgHf5OfeC3XKKs8j1KDMyIs1TLEbHdIb2/N5kHujXh9wzjVvH/X0L6C
	15LliuFjsWvfxMOtaDziZ/vdGwmM2ScJ723Otsghy0GByt19aUTDRolCzc0gepAj9ftK6lUvRkYms
	/K3awXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhTk-009UdH-2m;
	Fri, 07 Apr 2023 08:29:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhTg-009Uav-1F;
	Fri, 07 Apr 2023 08:29:49 +0000
X-UUID: 58e4010cd51e11ed8687db9d93187ff1-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KgPmlZ5Rc5SqpbW8c7zrSNMdoNSH2yTeyLzGUm9Y1kU=;
	b=m3jD4EWrAc0lu3o0PuX0RHgKJt8EliBvTfDoqbWEVqsImVhIUGtPMMQFiQZAfQJVzJsuIUzXxSwEBuqCxskNpV4RkCLl5C+1WmTVYNrThQ2GUhu+W5C4Gl0VP22Fmq6hFrL3KIAvBHj0AviUoOXx6CryI2pNzdb97Iu212jnjdU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a55a4ae1-ee1f-4f91-8f63-192077667646,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:c2170ff8-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 58e4010cd51e11ed8687db9d93187ff1-20230407
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2091001640; Fri, 07 Apr 2023 01:29:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 16:29:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 16:29:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>
Subject: [PATCH v2 5/7] usb: mtu3: expose role-switch control to userspace
Date: Fri, 7 Apr 2023 16:29:35 +0800
Message-ID: <20230407082937.14558-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
References: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_012948_427235_50B72F79 
X-CRM114-Status: GOOD (  10.02  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add Reviewed-by AngeloGioacchino
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


