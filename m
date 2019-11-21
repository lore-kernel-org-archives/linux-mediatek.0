Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46070C43215
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 07:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD62208A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 07:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/tEiLn5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dF7WIzR/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD62208A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W5CS8G7X4cVaQgzdvTKlMzw6Uvts/queL4z9QhXt6YU=; b=R/tEiLn5EVyZqe
	uw8ZQlZZYPYt/k8vbB/Y8XmuKe7K6hcUBYVC7POIlK+mNmwFxdGHd5prHIGd4zvgwX4QEEOReg6Ld
	iS3BywDFXkISluNUueWGyQ2TOpKcJWIRqphgc5lMjpfIn7RhFH7xcNVhXjCzv6ytMI39kEShKcuuC
	7phZGFcwdGIud0UFy8zpmXBnNi2HyLtp5OyeATL1RO3SJolNkfPwWl8bAUeUS5uUbLxlC2rzzPulX
	n4YB12VV9HCN4Ullj5e+JH+7MN3+kvgpm0AHz6g34Ml4I4VmkQ0cTB+dx3qHwHq/v+Uakk1b52okC
	CsdUUGj2NXpT+uwkS9cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXguS-0002Qh-AD; Thu, 21 Nov 2019 07:29:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXgtz-00020d-Kd; Thu, 21 Nov 2019 07:29:21 +0000
X-UUID: 1ea9954627d44ae4a772b4488c1dc56d-20191120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DdOBazdkEY8z3b9oLQBOBsUR+PwkBxvsgtd16bL2wP8=; 
 b=dF7WIzR/p2XrAtxWVR+Uau04hx1SguyHDCvtAL0bumQpo8ZGhIzB07H26eHEYfdMkn2/o/0CgR9ItlVNh8Tz6g35yZIUMZs4km/tPhXQSPOFehPH3nUmb72k9cxTI3ZY5Io2WtdLG+tBJ8+lHghSvJ+oEnk/4FWL1CZdQVzL55o=;
X-UUID: 1ea9954627d44ae4a772b4488c1dc56d-20191120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 28618728; Wed, 20 Nov 2019 23:29:12 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 20 Nov 2019 23:29:32 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 15:29:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 21 Nov 2019 15:29:07 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH] soc: mediatek: cmdq: avoid racing condition with mutex
Date: Thu, 21 Nov 2019 15:29:10 +0800
Message-ID: <20191121072910.31665-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_232919_685554_994E055A 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If cmdq client is multi thread user, racing will occur without mutex
protection. It will make the C message queued in mailbox's queue
always need D message's triggering.

Thread A		Thread B		  Thread C		Thread D...
-----------------------------------------------------------------------------------
mbox_send_message()
	send_data()
			mbox_send_message()
				*exit
						mbox_send_message()
							*exit
mbox_client_txdone()
	tx_tick()
			mbox_client_txdone()
				tx_tick()
						mbox_client_txdone()
							tx_tick()
msg_submit()
	send_data()
			msg_submit()
				*exit
						msg_submit()
							*exit
-----------------------------------------------------------------------------------

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 3 +++
 include/linux/soc/mediatek/mtk-cmdq.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 9add0fd5fa6c..9e35e0beffaa 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -81,6 +81,7 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
 	client->client.dev = dev;
 	client->client.tx_block = false;
 	client->chan = mbox_request_channel(&client->client, index);
+	mutex_init(&client->mutex);
 
 	if (IS_ERR(client->chan)) {
 		long err;
@@ -352,9 +353,11 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 		spin_unlock_irqrestore(&client->lock, flags);
 	}
 
+	mutex_lock(&client->mutex);
 	mbox_send_message(client->chan, pkt);
 	/* We can send next packet immediately, so just call txdone. */
 	mbox_client_txdone(client->chan, 0);
+	mutex_unlock(&client->mutex);
 
 	return 0;
 }
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a74c1d5acdf3..0f9071cd1bc7 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -28,6 +28,7 @@ struct cmdq_client {
 	struct mbox_chan *chan;
 	struct timer_list timer;
 	u32 timeout_ms; /* in unit of microsecond */
+	struct mutex mutex;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
