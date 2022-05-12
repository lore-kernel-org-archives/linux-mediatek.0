Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A175C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2RtKVrLLLuNLpC96az88GWFtsH5ccovfGSOvpCzNFM=; b=NOB6aMSWQUKzSi
	k+KhrcO8idRbtlJGJErxiNQrdN0SVUa3CpFWC4+9gX5hlO9f7ZS7GR11tWDTVF8g72n+7F5MUHYeN
	sfQVUh4tuvoZyB8FFuMDsxjfTT8AHuuNF2dlQL0CnqZWLVG82GWLuXuGTWe9psF39KeeEALpRFpgK
	SDYKvrpVIQB8Dmk/M2A1eAVYkTFRIEJB/H/+NqAoY9DuC+5mGydd4ZYyrOYbw/iMOeRqGkXP4F4O/
	q1ed2qOiUxNIdVzsmR2UeuqMF3nYnrlSNcwtwmCQ3Mx6u16vBk8w5k9mqxWgqsuwa86ckYiyvnbYN
	486FleeSATCm0mlcjLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyTF-009Pnc-MG; Thu, 12 May 2022 02:22:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyRi-009Oko-6Z; Thu, 12 May 2022 02:20:55 +0000
X-UUID: d115aad465ff47f186bd62c8a37b79df-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fba083f0-fa50-4ca6-8c86-41580056b50f, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-15
X-CID-META: VersionHash:faefae9, CLOUDID:8f254125-b432-452e-9e03-2bf3148aed85,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d115aad465ff47f186bd62c8a37b79df-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 127978648; Wed, 11 May 2022 19:20:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:20:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 10:20:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:20:21 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12,
 17/17] media: mediatek: vcodec: prevent kernel crash when rmmod
 mtk-vcodec-dec.ko
Date: Thu, 12 May 2022 10:19:50 +0800
Message-ID: <20220512021950.29087-18-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512021950.29087-1-yunfei.dong@mediatek.com>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_192054_278082_29D8D3A0 
X-CRM114-Status: GOOD (  11.77  )
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

If the driver support subdev mode, the parameter "dev->pm.dev" will be
NULL in mtk_vcodec_dec_remove. Kernel will crash when try to rmmod
mtk-vcodec-dec.ko.

[ 4380.702726] pc : do_raw_spin_trylock+0x4/0x80
[ 4380.707075] lr : _raw_spin_lock_irq+0x90/0x14c
[ 4380.711509] sp : ffff80000819bc10
[ 4380.714811] x29: ffff80000819bc10 x28: ffff3600c03e4000 x27: 0000000000000000
[ 4380.721934] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[ 4380.729057] x23: ffff3600c0f34930 x22: ffffd5e923549000 x21: 0000000000000220
[ 4380.736179] x20: 0000000000000208 x19: ffffd5e9213e8ebc x18: 0000000000000020
[ 4380.743298] x17: 0000002000000000 x16: ffffd5e9213e8e90 x15: 696c346f65646976
[ 4380.750420] x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
[ 4380.757542] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[ 4380.764664] x8 : 0000000000000000 x7 : ffff3600c7273ae8 x6 : ffffd5e9213e8ebc
[ 4380.771786] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[ 4380.778908] x2 : 0000000000000000 x1 : ffff3600c03e4000 x0 : 0000000000000208
[ 4380.786031] Call trace:
[ 4380.788465]  do_raw_spin_trylock+0x4/0x80
[ 4380.792462]  __pm_runtime_disable+0x2c/0x1b0
[ 4380.796723]  mtk_vcodec_dec_remove+0x5c/0xa0 [mtk_vcodec_dec]
[ 4380.802466]  platform_remove+0x2c/0x60
[ 4380.806204]  __device_release_driver+0x194/0x250
[ 4380.810810]  driver_detach+0xc8/0x15c
[ 4380.814462]  bus_remove_driver+0x5c/0xb0
[ 4380.818375]  driver_unregister+0x34/0x64
[ 4380.822288]  platform_driver_unregister+0x18/0x24
[ 4380.826979]  mtk_vcodec_dec_driver_exit+0x1c/0x888 [mtk_vcodec_dec]
[ 4380.833240]  __arm64_sys_delete_module+0x190/0x224
[ 4380.838020]  invoke_syscall+0x48/0x114
[ 4380.841760]  el0_svc_common.constprop.0+0x60/0x11c
[ 4380.846540]  do_el0_svc+0x28/0x90
[ 4380.849844]  el0_svc+0x4c/0x100
[ 4380.852975]  el0t_64_sync_handler+0xec/0xf0
[ 4380.857148]  el0t_64_sync+0x190/0x194
[ 4380.860801] Code: 94431515 17ffffca d503201f d503245f (b9400004)

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index a84df6596aaa..5da4572c5b14 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -482,7 +482,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	pm_runtime_disable(dev->pm.dev);
+	if (!dev->vdec_pdata->is_subdev_supported)
+		pm_runtime_disable(dev->pm.dev);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
