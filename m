Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59855C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 02:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FvLKVHjka7cRO5KYMLXa5+eHvbBfffFIZp5h7B2yAEk=; b=WBprDLFdNHP5jJ7a11bAm8EIW0
	DRDJj4gq8MAJr6DcVAVRXcKiRhKPt9znI8oBZf42LcxO1cKAMzQiGE0yuFRdJtS6HSZuCej0b2bGu
	HjqHFRpat6fmszrwYDv0f84RudY/DbmhUIvLzEzVRFo8LlSxfY169Pbs5ZaZDMHve4v2ZbstGN9Ni
	P4tD81DrNWc7doYwl2BQQ/bTeGQ0lDB6P1zbwkEAENa3BjcAO066tCo+4/8ePnFDTACFmJOUbu/0R
	/gxcPOMmJxHA6GVZoDyQ3P45SEdQgn8nxvngn4fTZUhhVph+U8r0pefPscgMRAw6mOCoS2pvGUwcO
	IaUohtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0vKW-0056kk-1J;
	Mon, 22 May 2023 02:31:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0vKO-0056iz-2W;
	Mon, 22 May 2023 02:31:21 +0000
X-UUID: b4084a3cf84811ed83ed1395ce914268-20230521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FvLKVHjka7cRO5KYMLXa5+eHvbBfffFIZp5h7B2yAEk=;
	b=TcV/Ri9xxnUaUP83Qn7Y1ZzndluR/EixtIH47azDWEN+1ygWO1vYjFGd8jyP2+VN8bw10JzOsFnW2WNoVy3KMJ0YJc70m2ShCyNZFOyRLrppV9Gxf+d1iD/njURPDtq8rMbmOkvtbyYwviKk/oFzlcijgw/QanefQp4EdeDdnew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:18326083-b4f7-417c-ad59-c069dcaa8b76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:e60d8b6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b4084a3cf84811ed83ed1395ce914268-20230521
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1343298697; Sun, 21 May 2023 19:31:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 22 May 2023 10:21:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 22 May 2023 10:21:02 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alan Stern
	<stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Prashanth K <quic_prashk@quicinc.com>, Xiu Jianfeng <xiujianfeng@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Fabrice Gasnier
	<fabrice.gasnier@st.com>, Felipe Balbi <balbi@kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kewu Chen <Kewu.Chen@mediatek.com>, stable <stable@kernel.org>
Subject: [PATCH] usb: gadget: u_serial: Add null pointer check in gserial_suspend
Date: Mon, 22 May 2023 10:21:01 +0800
Message-ID: <20230522022101.32163-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_193117_245032_2F2800F6 
X-CRM114-Status: GOOD (  10.94  )
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

When gserial_disconnect has already cleared gser->ioport, and the
suspend triggers afterwards, gserial_suspend gets called, which will
lead to accessing of gser->ioport and thus causing null pointer
dereference. Add a null pointer check to prevent it as the bellow
patch does:
5ec63fdbca60 ("usb: gadget: u_serial: Add null pointer check in gserial_resume")

Fixes: aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume callbacks")
Cc: stable <stable@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/function/u_serial.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index a0ca47fbff0f..40ba220cf6d2 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1420,10 +1420,18 @@ EXPORT_SYMBOL_GPL(gserial_disconnect);
 
 void gserial_suspend(struct gserial *gser)
 {
-	struct gs_port	*port = gser->ioport;
+	struct gs_port	*port;
 	unsigned long	flags;
 
-	spin_lock_irqsave(&port->port_lock, flags);
+	spin_lock_irqsave(&serial_port_lock, flags);
+	port = gser->ioport;
+	if (!port) {
+		spin_unlock_irqrestore(&serial_port_lock, flags);
+		return;
+	}
+
+	spin_lock(&port->port_lock);
+	spin_unlock(&serial_port_lock);
 	port->suspended = true;
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
-- 
2.18.0


