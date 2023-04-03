Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A7BC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 03:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOoYztQ2hPxziZWMeexokd/QuvS5gj5c83hDDsYaZmA=; b=U+UcfdSrAaLNmYFpil3wdOiCKg
	quTf5yxlo51mrzsQUY0PT1oKAxHY4oBjVkx/YD9b9LEdLE9CxfkR1XWljex76jZQUkiSdve6EVEXJ
	5iLkf1WXHRw81iZC+zjzHwAS9obhe/Ofp+o2P3pAgvHh1ymCg1WIwZ07SUoo6KA3qagmzNgVdIikt
	U6r9cu7fc5Awk0UuKe/2vFC0RcZzgYk3pHrzl/yr2tWjIrFbV1Mw00gQi2qDkK3ZviqGtDZBVwkzV
	s54XQpRA+WXsLphiFcIGQreUNyqyNQLYrmsnDN1c5cX5AoAuQCxzDXvCkLB1zmXdNHbSD+0JUFCmN
	976HP1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjATE-00E0JU-2h;
	Mon, 03 Apr 2023 03:03:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjATB-00E0Ib-0u;
	Mon, 03 Apr 2023 03:02:59 +0000
X-UUID: fd36da5ad1cb11ed8687db9d93187ff1-20230402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FOoYztQ2hPxziZWMeexokd/QuvS5gj5c83hDDsYaZmA=;
	b=G4pvE2zRjvpKTGcFvVm8F/ZUUbVSR2j+b40cVFMEmNQgNzvIy8FlrzdDAQyP4WFLL/WA05CQ5faNyqNBk81wWGAye0Acfz0DpJVyDiiTffNFHkYIoBlA4pHMbrmYCTcIfD01fOCAKsr5/ZGgGeSRmugGg2n97t4UwjUZkFdh1DY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b6767b02-9b5b-4586-8d23-3555f4a3b490,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:46bf1db5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fd36da5ad1cb11ed8687db9d93187ff1-20230402
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1602100729; Sun, 02 Apr 2023 20:02:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 10:52:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 10:52:33 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
Subject: [PATCH 4/7] usb: mtu3: unlock @mtu->lock just before giving back request
Date: Mon, 3 Apr 2023 10:52:27 +0800
Message-ID: <20230403025230.25035-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_200257_371731_726B818A 
X-CRM114-Status: GOOD (  11.78  )
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

No need unlock @mtu->lock when unmap request, unlock it just before
giving back request, due to we do not lock this spinlock when map
the request.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index c0264d5426bf..ad0eeac4332d 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -23,7 +23,6 @@ __acquires(mep->mtu->lock)
 		req->status = status;
 
 	trace_mtu3_req_complete(mreq);
-	spin_unlock(&mtu->lock);
 
 	/* ep0 makes use of PIO, needn't unmap it */
 	if (mep->epnum)
@@ -32,6 +31,7 @@ __acquires(mep->mtu->lock)
 	dev_dbg(mtu->dev, "%s complete req: %p, sts %d, %d/%d\n",
 		mep->name, req, req->status, req->actual, req->length);
 
+	spin_unlock(&mtu->lock);
 	usb_gadget_giveback_request(&mep->ep, req);
 	spin_lock(&mtu->lock);
 }
-- 
2.18.0


