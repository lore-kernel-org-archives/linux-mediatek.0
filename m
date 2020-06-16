Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65359C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204B92071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+M5aw8n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iQnnbsRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204B92071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pE22qUofcm0X4xsxiAahcfuKmyTTELOWCbRICPLMUGQ=; b=d+M5aw8njGWLTj
	us6o12oCBGdSfanEM+Rc8ReFQ2VUfZnYRZrJWrLZCGYwxwsVNLnXmlqbabMyYMlvJa2KcJSnTvLVb
	Asu9ugmt+awz/rYl+2fHiRlXhtZdXr8tgRZnQWhlaIKyxl65hcE30QFr+s+e3l8KFPybExDhX6L+F
	fyYDkf9XMhlBUJJSCHSnPm4HRMIJMCB5lRYIAtR7cK7VqbMBwNKzzwIx/nN7ZX1t3Fjyn5njbDQd9
	+0waZUffUc7SgkX7+3/DekU6pECqlvPNyhCZZ3h1d6m5BHjADb4cHWTUZa+pcSC+Ku/hTbIpt8n1H
	vtu/Qh33z/t3rX6+9RUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlAy6-0007N9-SJ; Tue, 16 Jun 2020 12:45:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlAxa-0004VV-Ml; Tue, 16 Jun 2020 12:45:04 +0000
X-UUID: 4d82aed94592474f8381813f80a32ca5-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1y6jYCU5bn8D2X7/K/Tvzzlj7X36JuNHASO4pxrPu4w=; 
 b=iQnnbsRTQitClaSbkDUZL8p5j1UhN/N0a5ci1xagj+SPqnGJrzpDu9K8qXY0GEqvkm/5tOJCUIW8SFZRqygRE0vjXP9Z9AzJdl2QGfFmTsN48qrV1puJ+aD5Em255xhl/L0G4KiP4alOAGAH4vg/szZj1braTQKUI3CFef5Iscw=;
X-UUID: 4d82aed94592474f8381813f80a32ca5-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1256596933; Tue, 16 Jun 2020 04:44:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 05:34:51 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:34:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 20:34:45 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?=
 <mirq-linux@rere.qmqm.pl>, Sergey Organov <sorganov@gmail.com>, "Fabrice
 Gasnier" <fabrice.gasnier@st.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] usb: gadget: introduce flag for large request
Date: Tue, 16 Jun 2020 20:34:43 +0800
Message-ID: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_054502_767313_080F3DFB 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Macpaul Lin <macpaul.lin@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some USB hardware like DMA engine can help to process (split) the data
of each URB request into small packets. For example, the max packet size
of high speed is 512 bytes. These kinds of hardware can help to split
the continue Tx/Rx data requests into packets just at the max packet
size during transmission. Hence upper layer software can reduce some
effort for queueing many requests back and forth for larger data.

Here we introduce "can_exceed_maxp" flag in gadget when these kinds of
hardware is ready to support these operations.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/mtu3/mtu3_qmu.c |   11 ++++++++++-
 include/linux/usb/gadget.h  |    1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 3f414f9..2b51a20 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -620,7 +620,7 @@ irqreturn_t mtu3_qmu_isr(struct mtu3 *mtu)
 
 int mtu3_qmu_init(struct mtu3 *mtu)
 {
-
+	int i;
 	compiletime_assert(QMU_GPD_SIZE == 16, "QMU_GPD size SHOULD be 16B");
 
 	mtu->qmu_gpd_pool = dma_pool_create("QMU_GPD", mtu->dev,
@@ -629,10 +629,19 @@ int mtu3_qmu_init(struct mtu3 *mtu)
 	if (!mtu->qmu_gpd_pool)
 		return -ENOMEM;
 
+	/* Let gadget know we can process request larger than max packet */
+	for (i = 1; i < mtu->num_eps; i++)
+		mtu->ep_array[i].ep.can_exceed_maxp = 1;
+
 	return 0;
 }
 
 void mtu3_qmu_exit(struct mtu3 *mtu)
 {
+	int i;
 	dma_pool_destroy(mtu->qmu_gpd_pool);
+
+	/* Disable large request support */
+	for (i = 1; i < mtu->num_eps; i++)
+		mtu->ep_array[i].ep.can_exceed_maxp = 0;
 }
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 6a17817..60e0645 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -236,6 +236,7 @@ struct usb_ep {
 	unsigned		max_streams:16;
 	unsigned		mult:2;
 	unsigned		maxburst:5;
+	unsigned		can_exceed_maxp:1;
 	u8			address;
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
