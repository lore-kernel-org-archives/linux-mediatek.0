Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FA606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XrY58ywL;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Hly982mG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=icwSomd9/pkE77nvCjEhjHFfyn1xfdl4Oy+vj7qpDKA=; b=XrY58ywL7/DN795Clt5CDmjKnL
	XfCRpH3Pgr2HQStZmL3P+L6vCSTKbFc2r+OIm4Q8hEKMvtPkYR8kOFIULtChLubM1uC8/U3/HVaKY
	UnIrViMbZC3Lg0sa5iniJ7NAw/d7tDSBIOYoFLovsfX5PTao3yT0KnboIKAQl5cb3weEiPIolvFdM
	yAKpWVJVsfQI5pZZaldf6V76D6gOFvwYB1pqIfaYlkDvIXdxajletX7ZkJdZo+u3yBjCAnNPez+qY
	rE4SWeEqPLgz1Wn8ZIdgjRtQQfUjEfedVX140a2caPmvtb+1xxBjl6enax43Z+KFqcECVuYJMRhs5
	YcThgzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrWD-0000000FHhE-1rnw;
	Fri, 27 Nov 2026 08:41:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrWA-0000000FHfq-1nBv
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 08:41:19 +0000
X-UUID: 4bebb998ea3e11f1a36277631523a8d6-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=icwSomd9/pkE77nvCjEhjHFfyn1xfdl4Oy+vj7qpDKA=;
	b=Hly982mGyIl3T9T+VP8gTqum7Rxeol4PSaltdwPgVC4P08XTSemHkpYoB14OPsNugXIgoNq3hcqDIbMyS4lzpKPHMhjdSWdL+f0ZhLdovclTP6ASXtbVZOjkROmf4rX85yJXLA24GGfGwPJ26NLtylreWVtTN4iBKlorxLptjxQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:3118d905-bf1f-461b-9f78-0d39032b8b3f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2de8dc66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4bebb998ea3e11f1a36277631523a8d6-20261127
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 981357229; Fri, 27 Nov 2026 01:41:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 16:41:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 16:41:08 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <eason.lai@mediatek.com>
Subject: [PATCH v1] wifi: mt76: mt7925: drop RX frame with a header gap past its end
Date: Fri, 27 Nov 2026 16:41:06 +0800
Message-ID: <20261127084106.4094862-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004118_475228_6107F504 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hdr_gap includes the header padding from the RXD, but is not checked
against skb->len. If it is too large, skb_pull() fails and leaves no
headroom, so the __skb_push() in mt76_insert_ccmp_hdr() writes before
skb->head.

Drop the frame if hdr_gap is not within the skb.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 3389a3236187..b5eae71c5285 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -599,6 +599,9 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
 
 	hdr_gap = (u8 *)rxd - skb->data + 2 * remove_pad;
+	if (hdr_gap >= skb->len)
+		return -EINVAL;
+
 	if (hdr_trans && ieee80211_has_morefrags(fc)) {
 		if (mt7925_reverse_frag0_hdr_trans(skb, hdr_gap))
 			return -EINVAL;
-- 
2.45.2


