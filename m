Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CD0C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 09:55:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686BA223FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 09:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWrEttkE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aHofETMC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686BA223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wBxmGh/yjsMwa0lX72OBLFAfwyMGAj4hyn9bPJOAGco=; b=gWrEttkEhxmwi+YTNt860lmDJP
	vZ+NGWmfEx5XjZhHzZegCNu2cAOrbuhVy88/T6exGbxQYc+V+P/eTkUsl6U6eVWxeXWZ04V3V3tZr
	e85ejVgLYXJakDZOKkshCrUSoOMqZEWJZIxRDMtQcgdSTklv8sVW6LBCW2V9SdX/15hDv64TBnT7s
	pF7JsVB6ZKQm6PMp3LHNDWD8lwUYPSDvT/y6HC6GlvZtLfL3OxsUP8eOeH7UX04wpL7WdmcN/psTa
	kpyDCCPnrbXClNIk7p4Z3crqVDKeUNutN07wO1OSKQXWfxb26VcV3yyMaCzvVeVFl/bgXk950mybG
	/nkY9enA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVXJ9-0007g8-Cz; Thu, 22 Oct 2020 09:54:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVXJ5-0007c9-1A; Thu, 22 Oct 2020 09:54:52 +0000
X-UUID: 1447803fd8b64e178a5e1dcdbc1e8fd1-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4h6hAq7l0V4rS9t709EExfcDsTlXaMuAC530Tl9I3lE=; 
 b=aHofETMCPK01JrxMeZoldwr40Y5X+PCDLPMw/laQrLcXcZ6OlVKBFs/gi/y7vZtRxhEuIY+8c8Vjhp5cxY/Jo4ncD9Jzxc4Rhmr3nx2hmD0xVAH5xF6gyy64QR1/i1s3G5iyJKL+3/iI5oEhUbxCXFcZs8BDVP8Og+rqmCzRabE=;
X-UUID: 1447803fd8b64e178a5e1dcdbc1e8fd1-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1309757871; Thu, 22 Oct 2020 01:54:31 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 02:44:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 17:44:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 17:44:20 +0800
From: Houlong Wei <houlong.wei@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
Subject: [PATCH] soc: mediatek: cmdq: fixup possible timeout issue
Date: Thu, 22 Oct 2020 17:41:53 +0800
Message-ID: <20201022094152.17662-1-houlong.wei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_055451_261568_734E552B 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, yongqiang.niu@mediatek.com,
 srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>,
 linux-kernel@vger.kernel.org, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK HU <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes: 576f1b4bc802 ("soc: mediatek: Add Mediatek CMDQ helper")

There may be possible timeout issue when lots of cmdq packets are
flushed to the same cmdq client. The necessary modifications are as
below.
1.Adjust the timer timeout period as client->timeout_ms * client->pkt_cnt.
2.Optimize the time to start the timer.

Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index dc644cfb6419..31142c193527 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -350,7 +350,8 @@ static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
 			del_timer(&client->timer);
 		else
 			mod_timer(&client->timer, jiffies +
-				  msecs_to_jiffies(client->timeout_ms));
+				  msecs_to_jiffies(client->timeout_ms *
+						   client->pkt_cnt));
 		spin_unlock_irqrestore(&client->lock, flags);
 	}
 
@@ -379,9 +380,7 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 
 	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
 		spin_lock_irqsave(&client->lock, flags);
-		if (client->pkt_cnt++ == 0)
-			mod_timer(&client->timer, jiffies +
-				  msecs_to_jiffies(client->timeout_ms));
+		client->pkt_cnt++;
 		spin_unlock_irqrestore(&client->lock, flags);
 	}
 
@@ -391,6 +390,21 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 	/* We can send next packet immediately, so just call txdone. */
 	mbox_client_txdone(client->chan, 0);
 
+	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
+		spin_lock_irqsave(&client->lock, flags);
+		/*
+		 * GCE HW maybe execute too quickly and the callback function
+		 * may be invoked earlier. If this happens, pkt_cnt is reduced
+		 * by 1 in cmdq_pkt_flush_async_cb(). The timer is set only if
+		 * pkt_cnt is greater than 0.
+		 */
+		if (client->pkt_cnt > 0)
+			mod_timer(&client->timer, jiffies +
+				  msecs_to_jiffies(client->timeout_ms *
+						   client->pkt_cnt));
+		spin_unlock_irqrestore(&client->lock, flags);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(cmdq_pkt_flush_async);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
