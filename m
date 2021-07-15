Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A986FC1B08C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 02:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B53C613CF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 02:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B53C613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAIK06hgRpPPqYNk/5HYFQ0rdh+lQbeOw2hP9EXtHm0=; b=vJC+3yIXvJFUuT
	xXGCsENSvVQDAZ6t/PucIcz4N1TU1bBGneqZZYmqXiaPxIfXqcrr60lUBCLq8lW68EFJfE02scpHz
	+wx6CcvpqmvlkfB9xp2o+rMdt68zFsdOcoglUFO2eFpBxr/ITCFB8wyWUFY1NngWZT28ccNoLR+iE
	j+L12lB03383g7cJFduXmO70UtYg1qx+YLKzUazQQXjUWQlJ9NParhsVsKkkJZfu8gF5QrSPGFFWM
	JZgCj+Dj3qrK/AK6IuSBKn22o4lSBXZCazaDevZASzs2Qa4E4sAbQV4i9URLn/1gW1k9oC2NkHu1M
	tB7dKFTI74lymIKfgUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3r9j-00GrCO-Q7; Thu, 15 Jul 2021 02:31:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3r8o-00Gqsn-ND; Thu, 15 Jul 2021 02:30:24 +0000
X-UUID: 3244fe1251cc4491904b45796359a8e2-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NSrWcTyLS1KQngtl06CFfAQQd8M1i2etYIFNJXKpc8Y=; 
 b=NFmwc8OynJdHAJ0SKydsUl8GCucnr+MmDJREOgf/mbqI5es4ERfSXqJI/AKI22xA4KNZtjTGW4g/4W6Z9PL+tnV+8TLzSE5gim+acfdKkQ1rLHBal9dhK5+W7nbHYfck0w8m7WgEo3KrTY89chAxEyMRn6oBj3WIb09Ggq8DwkQ=;
X-UUID: 3244fe1251cc4491904b45796359a8e2-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1771995533; Wed, 14 Jul 2021 19:30:15 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 19:30:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:30:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 10:30:11 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <qiangming.xia@mediatek.com>, <kewei.xu@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>
Subject: [PATCH 4/8] i2c: mediatek: Reset the handshake signal between i2c and
 dma
Date: Thu, 15 Jul 2021 10:29:13 +0800
Message-ID: <1626316157-24935-5-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_193022_794234_B0A33D4B 
X-CRM114-Status: GOOD (  10.58  )
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

Due to changes in the hardware design of the handshaking signal
between i2c and dma, it is necessary to reset the handshaking
signal before each transfer to ensure that the multi-msgs can
be transferred correctly.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e65a41e..ded94f9 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -47,6 +47,9 @@
 #define I2C_RD_TRANAC_VALUE		0x0001
 #define I2C_SCL_MIS_COMP_VALUE		0x0000
 #define I2C_CHN_CLR_FLAG		0x0000
+#define I2C_CLR_DEBUGCTR		0x0000
+#define I2C_RELIABILITY			0x0010
+#define I2C_DMAACK_ENABLE		0x0008
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
@@ -942,6 +945,17 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	reinit_completion(&i2c->msg_complete);
 
+	if (i2c->dev_comp->apdma_sync) {
+		mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR, OFFSET_DEBUGCTRL);
+		writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_WARM_RST,
+		       i2c->pdmabase + OFFSET_RST);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_HANDSHAKE_RST, OFFSET_SOFTRESET);
+		mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_SOFTRESET);
+		mtk_i2c_writew(i2c, I2C_RELIABILITY | I2C_DMAACK_ENABLE,
+			       OFFSET_DEBUGCTRL);
+	}
+
 	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
 			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
 	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) || (left_num >= 1))
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
