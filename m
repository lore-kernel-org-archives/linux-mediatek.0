Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD220C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 18:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvXeXo+KpHfjuV8PIW9r3Bf8AP/Ou+5EifnEvDBtmag=; b=Tu8ZwdlGgbprmg
	Di1akDyZ2nUYRFEyUtDom8y1Ky9JZkmVHet0szmLgYU+XBj/BmfT0/P/d/BCGXhybwuJuoJk9fP5p
	fCKFImNIW07p5Rlgijc2G5PUo6aZKhZ573itsZJMBSDLgqdlye8EIr6SeYOkloIepSK6DCFckFi1g
	KB3P01RKCOIrY3VkLNKbXjOGnCGvdOC1U0P+ZNaqwHRz2cJr6q9R1t9S2gxgqmUsMkR4adKz9TpJ6
	WnmAgKeK3icMVojnhE+yn3oprt6NG5HWB7nd4wgJs0cpb9d46JW1Y7B0SvsSqZ3NZNHseAYjG5aKU
	lz0Yi0VJk6I2RGNQXDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkG3-0036l1-0v; Fri, 10 Dec 2021 18:04:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkEF-00362T-Ii; Fri, 10 Dec 2021 18:02:44 +0000
X-UUID: 8de070fcabb14949a5a38e8cdbfdb962-20211210
X-UUID: 8de070fcabb14949a5a38e8cdbfdb962-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 132050819; Fri, 10 Dec 2021 11:02:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:52:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:35 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 05/12] remoteproc: mediatek: Add MT8195 APU remoteproc support
Date: Sat, 11 Dec 2021 01:52:16 +0800
Message-ID: <20211210175223.31131-6-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_100243_674358_CEABD959 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8195 platform data in the APU remoteproc driver.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/remoteproc/mtk-apu-rproc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/mtk-apu-rproc.c b/drivers/remoteproc/mtk-apu-rproc.c
index 40af8e88f41a..dc54b87ad661 100644
--- a/drivers/remoteproc/mtk-apu-rproc.c
+++ b/drivers/remoteproc/mtk-apu-rproc.c
@@ -997,8 +997,23 @@ const struct mtk_apu_platdata mt8192_platdata = {
 	},
 };
 
+const struct mtk_apu_platdata mt8195_platdata = {
+	.flags = F_AUTO_BOOT,
+	.ipi_attrs = mt81xx_ipi_attrs,
+	.ops = {
+		.start = mt81xx_rproc_start,
+		.stop = mt81xx_rproc_stop,
+		.resume = mt81xx_rproc_resume,
+		.apu_memmap_init = mt81xx_apu_memmap_init,
+		.apu_memmap_remove = mt81xx_apu_memmap_remove,
+		.power_on = mt81xx_apu_power_on,
+		.power_off = mt81xx_apu_power_off,
+	},
+};
+
 static const struct of_device_id apu_of_match[] = {
 	{ .compatible = "mediatek,mt8192-apusys-rv", .data = &mt8192_platdata},
+	{ .compatible = "mediatek,mt8195-apusys-rv", .data = &mt8195_platdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, apu_of_match);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
