Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6268C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 10:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CBC613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 10:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81CBC613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eY0Jblds3dP643SStUm2tbc/WDssIoTi5dBwI9NRQtM=; b=CgVOenz3qrHlFq
	7haH5FxRhTXRLGB5v5ZoY8CG8p96pDA2xjjOlHeEtn0NSCrQIofSvJtrX/4BhNOTk3Hk6eXfM1vOv
	GLNbKrNZVhXGBO/YU6G/1d8i/ybTdOnS46wiEn6iG5qlZE01YCDlaBG2MXOUzLi7MtXbJEVmfeE8B
	rOjGzuRihXUs+AQkUOCUH2M2uV8c06ghW9eZYYcj7AZgVWQf5lup3ZYhU9ZBgshm6P90G4CHrw5oC
	oJvHlF/OxpEs2nb5BaswdcVa2ZNnfCTJguGV7x1anhdvepe09o5DBKVD3t2T8Qy8m2PfdnAXL3/Rf
	QpcqrcPGN5zsiS6DMriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4hYt-006UeC-Mw; Sat, 17 Jul 2021 10:28:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4hYK-006UXH-MT; Sat, 17 Jul 2021 10:28:14 +0000
X-UUID: a972e4c822514f819e288f2b0a6bc5a1-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=V0xwo/ZkM4DPm5TWY63MjadvyXnnZV/oekq5cGpwqDg=; 
 b=AZWYTGITm3V3KDLX8RTdi+rcPbHE55vb8HnUx9WtT5mCD37Yn6P4bYyPc/QJaq64NRmbzmDg5rx55+CvRx0C7LBXbjZDrgAuwrw3z0GOrzGTaXflKSCmkPsvYi/XkOA70966TiIlkyBgjDNX/2T2iu4O59rAdMnk1oIDwBvB4Kk=;
X-UUID: a972e4c822514f819e288f2b0a6bc5a1-20210717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1752414504; Sat, 17 Jul 2021 03:28:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 03:18:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 18:18:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 18:18:07 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
 <liguo.zhang@mediatek.com>
Subject: [PATCH v4 6/8] i2c: mediatek: Add OFFSET_EXT_CONF setting back
Date: Sat, 17 Jul 2021 18:17:57 +0800
Message-ID: <1626517079-9057-7-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_032812_761591_4027DFC4 
X-CRM114-Status: GOOD (  10.18  )
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

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), we miss setting OFFSET_EXT_CONF register if
i2c->dev_comp->timing_adjust is false, now add it back.

Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index abdbf27b6eb4..a2a5a4ec1d81 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -41,6 +41,8 @@
 #define I2C_HANDSHAKE_RST		0x0020
 #define I2C_FIFO_ADDR_CLR		0x0001
 #define I2C_DELAY_LEN			0x0002
+#define I2C_ST_START_CON		0x8001
+#define I2C_FS_START_CON		0x1800
 #define I2C_TIME_CLR_VALUE		0x0000
 #define I2C_TIME_DEFAULT_VALUE		0x0003
 #define I2C_WRRD_TRANAC_VALUE		0x0002
@@ -484,6 +486,7 @@ static void mtk_i2c_clock_disable(struct mtk_i2c *i2c)
 static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
+	u16 ext_conf_val;
 
 	if (i2c->dev_comp->apdma_sync) {
 		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
@@ -518,8 +521,13 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	if (i2c->dev_comp->ltiming_adjust)
 		mtk_i2c_writew(i2c, i2c->ltiming_reg, OFFSET_LTIMING);
 
+	if (i2c->speed_hz <= I2C_MAX_STANDARD_MODE_FREQ)
+		ext_conf_val = I2C_ST_START_CON;
+	else
+		ext_conf_val = I2C_FS_START_CON;
+
 	if (i2c->dev_comp->timing_adjust) {
-		mtk_i2c_writew(i2c, i2c->ac_timing.ext, OFFSET_EXT_CONF);
+		ext_conf_val = i2c->ac_timing.ext;
 		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
 			       OFFSET_CLOCK_DIV);
 		mtk_i2c_writew(i2c, I2C_SCL_MIS_COMP_VALUE,
@@ -544,6 +552,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 				       OFFSET_HS_STA_STO_AC_TIMING);
 		}
 	}
+	mtk_i2c_writew(i2c, ext_conf_val, OFFSET_EXT_CONF);
 
 	/* If use i2c pin from PMIC mt6397 side, need set PATH_DIR first */
 	if (i2c->have_pmic)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
