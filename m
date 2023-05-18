Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFCEC77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 04:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xlKKwoSCHB/hWBr95sZMrzCVAZzotOyMBb84BEXYmhQ=; b=hUtm2u33ZrsoBbstUSj2qsYR1i
	E20WTvPwxU0ArXH8Cvc8rFWyvgZ2EpkYOIGqtnnP72y1QBqAnUqwSNbmWG6iDt+iBnm1fwW4gD3Rv
	R8l/qfsLagJ7M9XagHb6BcmJwdSRkbp39OsTHrp/z0uRxaTqJDTarK69/7xBncmn2F3QnZNAlZLIx
	D9c9JPbzmo4B02QRtnIEh/Z8lRnNJ2Q4Jn/R4Q9xvWNaLjcyTWU52MdnLhKzDyKBZsFpAXKp65YnB
	n7TCn70L8CEOrNQiNus8ZWk3YAsdKBkgcBVUKiXWkFP8eZkQOh3/0jJ2OfPn0YEtY+9oyheWajqG6
	9YPzwBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzV5j-00BplY-2o;
	Thu, 18 May 2023 04:18:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzV5g-00Bpkd-1Z;
	Thu, 18 May 2023 04:18:14 +0000
X-UUID: fe73f3e6f53211ed912e1518a6540028-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xlKKwoSCHB/hWBr95sZMrzCVAZzotOyMBb84BEXYmhQ=;
	b=BSafWlqaqtfJzTQJG/iaKqokmHk3DKrSKieQPk+J0Il8RqkpsmWeICqTuhovpCcaGv0ZwUC7kYlCzEP9ygDuQUQ3Cic0yZRbTdLgHbB4zG/wIzeZT52aDYXRlEpVsr/gpuxBf8hpoB3lKAUYqYpCe4f3h1hsN5gzLv7Px2TyCfU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:f8ceb377-5a6a-40e4-83be-81c58f74fbd5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:7a018c3b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fe73f3e6f53211ed912e1518a6540028-20230517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sen.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1078909735; Wed, 17 May 2023 21:18:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 May 2023 12:07:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 May 2023 12:07:31 +0800
From: Sen Chu <sen.chu@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Sen Chu <sen.chu@mediatek.com>
Subject: [PATCH v2] spmi: mediatek: add device id check
Date: Thu, 18 May 2023 12:07:29 +0800
Message-ID: <20230518040729.8789-1-sen.chu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_211812_534399_6B03477D 
X-CRM114-Status: GOOD (  10.76  )
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

Add device id check for spmi write API.

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
---
Change in v1:
    Fix: this should be unlikely(sid & ~0xf)
    [Sen Chu <sen.chu@mediatek.com>]
---
---
 drivers/spmi/spmi-mtk-pmif.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index b3c991e1ea40..78a96e00ed54 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -378,6 +378,12 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	int ret;
 	u32 data, cmd;
 
+	/* Check for argument validation. */
+	if (unlikely(sid & ~0xf)) {
+		dev_err(&ctrl->dev, "exceed the max slv id\n");
+		return -EINVAL;
+	}
+
 	if (len > 4) {
 		dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
 
-- 
2.18.0


