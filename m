Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A8EC43611
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D76061493
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D76061493
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DPEurBHlhtj/v3/kCfE1vXrcXJ9kBIFwSc1iGgVTcY=; b=T9/qSm5DBPFteHPYuzvd6QR0s5
	rj8gBlcpn7HmaVZp7Xzd6H8jpMRuzyIbEZDxwB32idvE30pbjT0/Kc04Zh+gmmdTYMuYBYig/KzMJ
	LKFeDWw7y+XyXnSW4SCkS3bfxGqsSmQSKDL8EKU6EIseje/6ZOCmHE+qM9bhS14VIGnk/ceK+luTG
	0cEmytjGywQWDzZmITUzdFsrtYKn8hj9MdGLxt3TuiJ8r0DQS4THorqCVloBtK87wnsxUe61rB5i0
	ZyWYubBaVylP6XPaKkDpuMtidrZTk4LNbRcBQpneWBF3bzJlDsaj6zG8MPB1tavt/IONibrqcS/QB
	miEXA/wA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7cl-00ElMI-Qw; Mon, 10 May 2021 15:15:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cj-00ElLh-Gy
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=OyJ2QstMf311/CPHWgZQBj56MIf3t/hCD2ihcdvp/AE=; b=MVa3uR9OqlQ+sONY9qydwSq3aM
 K7mxyEQZQj0+yUFCUGDdzS8xt9R7mubroGRGpafwCRbXuUJwtX2WsiT5LsWBXVBR4OGSulcge183Y
 TOrj0uUWYW1RcC5abAt7ayWc3nhdRmOnsX+yMlnS/YizSvGCwklORXEIisJtmcLqp+cGt67zA41aY
 JuQDcqGIKa2XhGO3lOEeJ+FUJif6Rpd59D2Bg10teW7hxixvsm2MGrWLGTMawMP9dLqMuxc+F4zEE
 XyTaKFoxBj9eiNR1bUhXHupqVtXk42KHKJGTA20XMhGXl7DCg/67b+aHDRWF0VNb89DCsCiNA1y3N
 aCADjk8Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cg-008rIR-EW
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:15:08 +0000
X-UUID: dc7b2a3585024f319739441f556309e1-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OyJ2QstMf311/CPHWgZQBj56MIf3t/hCD2ihcdvp/AE=; 
 b=GUlYQ+90A1U/ih8lHB0kIg5MdyiTluITkUXw8CE25iHla24aTfOry+SPwUbnIhl5CRf6Iy5S0qug0zaSKCpT6ZBQ1pUGWOwQkt4UCN++X3Ju8fyZ0NNtGB5+bDox/WosPrO7f9t70AkMLv+c2pKcQw6jaPrt8hsa21h6/94JtNs=;
X-UUID: dc7b2a3585024f319739441f556309e1-20210510
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 21231030; Mon, 10 May 2021 08:15:01 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:14:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:58 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/9] mt76: mt7921: fix mt7921_wfsys_reset sequence
Date: Mon, 10 May 2021 23:14:49 +0800
Message-ID: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081506_977958_5F63D78D 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Sean Wang <sean.wang@mediatek.com>

WiFi subsytem reset should control MT_WFSYS_SW_RST_B and then poll the
same register until the bit WFSYS_SW_INIT_DONE bit is set.

Fixes: 0c1ce9884607 ("mt76: mt7921: add wifi reset support")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 71e664ee7652..bd9143dc865f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -313,9 +313,9 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
 
 int mt7921_wfsys_reset(struct mt7921_dev *dev)
 {
-	mt76_set(dev, 0x70002600, BIT(0));
-	msleep(200);
-	mt76_clear(dev, 0x70002600, BIT(0));
+	mt76_clear(dev, MT_WFSYS_SW_RST_B, WFSYS_SW_RST_B);
+	msleep(50);
+	mt76_set(dev, MT_WFSYS_SW_RST_B, WFSYS_SW_RST_B);
 
 	if (!__mt76_poll_msec(&dev->mt76, MT_WFSYS_SW_RST_B,
 			      WFSYS_SW_INIT_DONE, WFSYS_SW_INIT_DONE, 500))
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
