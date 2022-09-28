Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623CCC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPvQ+AXkrWKki4c5AVwC7iWwQ8GaDVJAZCtWTLTe5AM=; b=HjxLlGXvQbDuUnav3v69/T6Miz
	BiUk8S7aBmaELMl49X/fpRocyeUZQCvrHWA9Yp3hf3v8c7rRMGbxbQ5I24yMeGf6f+oavNdn6YIWy
	mV9Pe2bcpqZSTjprVcXgIfDcVdy2JvEhCR9STYAg80frnTYpt4jDoYIPZ40rfGIFi+7pZdTk/816r
	CfLkxcY5+3aiSTNXwvF6mnQA/ZEHspeYmKMH+lHRvsUiIj3FQUuYfcklBzmyBGLhywcHWvlrer+4x
	OOOo+p013QJ/lM1O/YPbW9eLtDsqNX/ZRnl0Gf8/wtdoO3TbcaKPJ69cWCy31OOkf2RPcoiLd4xZp
	ObnZreZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTMS-00FCLp-Oy; Wed, 28 Sep 2022 09:28:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTMP-00FCKE-BC; Wed, 28 Sep 2022 09:28:10 +0000
X-UUID: fec30962ebf74ff8b7a4dcb81a2f1fa7-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yPvQ+AXkrWKki4c5AVwC7iWwQ8GaDVJAZCtWTLTe5AM=;
	b=q3uBbzFkFgg2o7n66yTqOkqpnArif/XskPadC5XCQo3vb6C3Xumth69INBdragjnEe2SuRGtj9P1/hV4opXCVciBzPJx9tcFEYyn77noJLffu7fMf97wPju+68DsVRxz3b0JysAoIOlG6vFla6m4T27kamXoZtfQKEfjpwKTajU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1716dcce-d981-442e-aeec-33837dd3b018,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:40474e07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fec30962ebf74ff8b7a4dcb81a2f1fa7-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 189683301; Wed, 28 Sep 2022 02:28:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 17:17:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 17:17:27 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, Min Guo
	<min.guo@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
Subject: [PATCH 2/2] usb: mtu3: fix failed runtime suspend in host only mode
Date: Wed, 28 Sep 2022 17:17:21 +0800
Message-ID: <20220928091721.26112-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
References: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_022809_413248_41CFDC34 
X-CRM114-Status: GOOD (  14.11  )
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
Reported-by: Tianping Fang <tianping.fang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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


