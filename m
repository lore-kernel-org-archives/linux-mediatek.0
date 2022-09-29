Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D7AC6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 07:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kiOzCeiwrP7bYeA7Uexju07lk5sFmybh+kBdygu2puM=; b=ZsoCtGwerf1sLjnBzU0kBKN31W
	VTKxXtsDFHpP9JwAYJIIhbvhaV/c2+FF+lBnxd2Xj7puae6cA/ZPlzRhgB8V3b18M3Wtc3Sp8fe1S
	djinDP1XhhrlLyyf62hKBCJV2Srj4Arn0qGlgGZgQ5wgotNLaNK5tBXqmNKiN8XgMfLvTi048qmBS
	K7SObbjnzpUWH4i3iWfasG/WesXNwYyjCIVA/y/0j+i2W0kqG+Z7Prw+V7ancerXrkN7+Vh4VzAG4
	EIRFDh/6FMfiT9dLcDn+t7/CPLxuWAuDXyhpHFsg5HGwb5sxxlkIXzR3SRB4wJV8+Go1sRum/eLAb
	EUnfI/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odnkL-001XGn-RB; Thu, 29 Sep 2022 07:14:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odnkI-001XEI-Ur; Thu, 29 Sep 2022 07:14:12 +0000
X-UUID: 8e3e4a82ec5d4da383a77c2cc6c8709f-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kiOzCeiwrP7bYeA7Uexju07lk5sFmybh+kBdygu2puM=;
	b=gFYZIi5gSUr7I3TvqK+rdxFEECKXO9U/kZqmHQgXSFh1U9p+N3reU1v08wPTm5wXz58/ufN5QSVEzwfgbax+tWOIkxs1dHO2cTy/vnknXUF2ArznwLmPi6Mwbp+kxUzTMmho8sJRHZDW0U3oIEtLelszXfOTWr7KFXL4CGcgCLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8c3269da-9f29-455d-bff9-76ae5ab04d67,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:8b3e6a07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e3e4a82ec5d4da383a77c2cc6c8709f-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 568426302; Thu, 29 Sep 2022 00:05:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 14:45:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Sep 2022 14:45:01 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
	Tianping Fang <tianping.fang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] usb: mtu3: fix failed runtime suspend in host only mode
Date: Thu, 29 Sep 2022 14:44:59 +0800
Message-ID: <20220929064459.32522-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_001411_023900_57AFD728 
X-CRM114-Status: GOOD (  13.19  )
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

When the dr_mode is "host", after the host enter runtime suspend,
the mtu3 can't do it, because the mtu3's device wakeup function is
not enabled, instead it's enabled in gadget init function, to fix
the issue, init wakeup early in mtu3's probe()

Fixes: 6b587394c65c ("usb: mtu3: support suspend/resume for dual-role mode")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reported-by: Tianping Fang <tianping.fang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add Reviewed-by AngeloGioacchino
    abandon another patch:
       "[PATCH 1/2] usb: mtu3: fix ep0's stall of out data stage"
---
 drivers/usb/mtu3/mtu3_core.c | 2 --
 drivers/usb/mtu3/mtu3_plat.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 0ca173af87bb..a3a6282893d0 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -978,8 +978,6 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 		goto irq_err;
 	}
 
-	device_init_wakeup(dev, true);
-
 	/* power down device IP for power saving by default */
 	mtu3_stop(mtu);
 
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 4cb65346789d..d78ae52b4e26 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -356,6 +356,8 @@ static int mtu3_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
+	device_init_wakeup(dev, true);
+
 	ret = ssusb_rscs_init(ssusb);
 	if (ret)
 		goto comm_init_err;
-- 
2.18.0


