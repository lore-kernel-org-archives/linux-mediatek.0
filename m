Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09793C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjbXh6mGxVxP5rMdPkkW1nx6stfkaFQe20fNmE+IPDg=; b=MtB48cV/r5Zzv5
	5rOurDkp2kA973reircJuL5zVAzT7WtoGlj3XZ51+d3L77Wmk9h71XA/MEoTonr/5W1qqYRk7Ei9C
	q1WHywz4DfXrI4cz9rafnc1zu8ugE8DV5a3sDqeLeupKTytvlhOlEi8xCw4pgMZZlPP11RF/TGtvJ
	0kiRG3fksZVVI1Vq6GiwNEofyBE4sVcH3GvdDb3+JwaFHWuiVhFhfLRPquIjb88EbpZAqqent3ZIL
	JRHY6lyTdchL5G3xYW1GL20lAracEqRyU8mepswHqfshcLIeEAGRtinXLLOv1mEQ5Dka3qPtu1Ws0
	/yYGDrbQrknOqyHnIP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWuE-00Eir7-0h; Thu, 05 May 2022 08:32:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWuA-00Eip8-DB
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:32:11 +0000
X-UUID: 5416d90ae1124173a29c25877643daa6-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8e2d3d27-f6ef-4514-82b7-905a7877536f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2a60abb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5416d90ae1124173a29c25877643daa6-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 298761307; Thu, 05 May 2022 01:32:07 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 01:25:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 16:25:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 May 2022 16:25:56 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 2/4] mt76: mt7915: fix twt table_mask to u16 in mt7915_dev
Date: Thu, 5 May 2022 16:25:52 +0800
Message-ID: <20220505082554.16656-2-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_013210_476968_390A2CB2 
X-CRM114-Status: UNSURE (   9.96  )
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

mt7915 can support 16 twt stations so modify table_mask to u16.

Fixes: 3782b69d03e7 ("mt76: mt7915: introduce mt7915_mac_add_twt_setup routine")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 6c590eff14f1..0f51d7657caf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -319,7 +319,7 @@ struct mt7915_dev {
 	void *cal;
 
 	struct {
-		u8 table_mask;
+		u16 table_mask;
 		u8 n_agrt;
 	} twt;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
