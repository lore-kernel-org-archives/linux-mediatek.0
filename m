Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218C2C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jw+aLfnj7i1Y8FcmfwnIOGelpoF+TqByMoYNXug1t7Q=; b=RR1/OD4cHbYiDpwm3DRW8fkjUa
	O3rnM/cfzk7a/r9LlqKVa+LUglTJZnTaRS2KU0oWbi662+qALpJVK5uS+N9VcOxJ3unQLA4s6LSGa
	8+WCgx4L2HLeoZAS5UiqqojLX82cvrXs9hT+gAWF7ZtWS/w4Nu+Yuc0jvFMDGFtUYGVgybu+9UeWX
	Nr+N0KfpQpPa9vC/Iz5OEwNmCgwvFcZM5LOzFCCL3j7F9hixjitUR0Cj9WEJpFeDI3Ui/e0Xkj0Tb
	RECLztmWvt6h5HkfwMsqtv+/jv9J3jh37CLLk+0dFFEFEwK6A2rerV9fS6z7y1geTyJQ9t674exoj
	u3A/mRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5Q3-00DhXj-31;
	Tue, 28 Mar 2023 09:15:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5Q0-00DhWn-30;
	Tue, 28 Mar 2023 09:15:06 +0000
X-UUID: 016619d8cd4911ed8687db9d93187ff1-20230328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Jw+aLfnj7i1Y8FcmfwnIOGelpoF+TqByMoYNXug1t7Q=;
	b=OcEaPKvxMQ14xNxx6wJXYeaHzfoPvaARf698UcQ2Rg5E4bnbIsjzHdqBGNv7oei9P+V1XghR5OfqtmeVKNw0tmke3BG3GyBjlnVtbRDeLWrt79jz6A4GB8E0aIUpD+F2cB+aUbHXywPbyTMjJjQgmzZS75feSbQNfbHoXohRinw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b74ccc67-3c5e-4855-81f3-5aaf468cdd27,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:35b3b929-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 016619d8cd4911ed8687db9d93187ff1-20230328
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 746254264; Tue, 28 Mar 2023 02:14:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 17:14:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 17:14:52 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/2] media: mediatek: vcodec: fix decoder disable pm crash
Date: Tue, 28 Mar 2023 17:14:49 +0800
Message-ID: <20230328091451.21979-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_021505_117637_71734CB7 
X-CRM114-Status: GOOD (  12.15  )
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

Can't call pm_runtime_disable when the architecture support sub device for
'dev->pm.dev' is NUll, or will get below crash log.

[   10.771551] pc : _raw_spin_lock_irq+0x4c/0xa0
[   10.771556] lr : __pm_runtime_disable+0x30/0x130
[   10.771558] sp : ffffffc01e4cb800
[   10.771559] x29: ffffffc01e4cb800 x28: ffffffdf082108a8
[   10.771563] x27: ffffffc01e4cbd70 x26: ffffff8605df55f0
[   10.771567] x25: 0000000000000002 x24: 0000000000000002
[   10.771570] x23: ffffff85c0dc9c00 x22: 0000000000000001
[   10.771573] x21: 0000000000000001 x20: 0000000000000000
[   10.771577] x19: 00000000000000f4 x18: ffffffdf2e9fbe18
[   10.771580] x17: 0000000000000000 x16: ffffffdf2df13c74
[   10.771583] x15: 00000000000002ea x14: 0000000000000058
[   10.771587] x13: ffffffdf2de1b62c x12: ffffffdf2e9e30e4
[   10.771590] x11: 0000000000000000 x10: 0000000000000001
[   10.771593] x9 : 0000000000000000 x8 : 00000000000000f4
[   10.771596] x7 : 6bff6264632c6264 x6 : 0000000000008000
[   10.771600] x5 : 0080000000000000 x4 : 0000000000000001
[   10.771603] x3 : 0000000000000008 x2 : 0000000000000001
[   10.771608] x1 : 0000000000000000 x0 : 00000000000000f4
[   10.771613] Call trace:
[   10.771617]  _raw_spin_lock_irq+0x4c/0xa0
[   10.771620]  __pm_runtime_disable+0x30/0x130
[   10.771657]  mtk_vcodec_probe+0x69c/0x728 [mtk_vcodec_dec 800cc929d6631f79f9b273254c8db94d0d3500dc]
[   10.771662]  platform_drv_probe+0x9c/0xbc
[   10.771665]  really_probe+0x13c/0x3a0
[   10.771668]  driver_probe_device+0x84/0xc0
[   10.771671]  device_driver_attach+0x54/0x78

Fixes: ba31a5b39400 ("media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
- Won't crash when the driver running in error condition.
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index bba7b932f4fa..2b6eaa222846 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -454,7 +454,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
 		destroy_workqueue(dev->core_workqueue);
 err_res:
-	pm_runtime_disable(dev->pm.dev);
+	if (!dev->vdec_pdata->is_subdev_supported)
+		pm_runtime_disable(dev->pm.dev);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
-- 
2.18.0


