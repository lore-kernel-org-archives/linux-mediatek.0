Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C87C25B46
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xqb3MLBilNqUzJ8uH0O8CsGoFH99xg5qZH04+7HCYSs=; b=aJlzciq7D3RiaYDpqq5CVj3SLI
	pqDTDsXU82bDYu9SqKBObCUHEDWW2Os4D8QauUmdaDpsW1qMF+175DMzbAGUx159M7UZPCdxDltYz
	w3NMEKXpajuDBmlLXbGELK5JbcZuRLvJJN3XRcCTuvMCV8vjAt9Qtu1eFrC3XdMN/inSGN34JwuGe
	P+ZECubtgsfuL6L408rhyfLQGvDlsFMFgrZOyEyPc1zpEFvHqMxBIn5MZ8CwCB9ErNd2foMaX8swp
	vYYS4yeMMdO+0H4iBB7XascazK4xTqi9V53T1+UJ8WiJfqdHQw1Wwp4OF4uAI8GhWyWAzXOzcImXp
	S3lDhanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4L-007iYJ-15;
	Mon, 23 Oct 2023 15:42:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4F-007iVQ-0r
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:42:13 +0000
X-UUID: b578a9de71ba11ee86758d4a7c00f3a0-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xqb3MLBilNqUzJ8uH0O8CsGoFH99xg5qZH04+7HCYSs=;
	b=NgRVJ8rKw5A8rl7jIQK9bQl7GdnH3FycLkGtHuFd9r646IhTVtpO6VeV7YrQqR6p0BbYuE7OSjCU+ktjWhLTDDAEYTSGSAi9L8QHvYSfSK0PFcSXSXuQaY5o36d6ircdXfz4mXmzfZGdEPP5mdE1p6ABPCaihYoPYWOFUQ8ZSzk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:5c304b0d-ad1b-40d3-8126-4e94bcde9af4,IP:0,U
	RL:0,TC:0,Content:59,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:59
X-CID-META: VersionHash:5f78ec9,CLOUDID:14ac37d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b578a9de71ba11ee86758d4a7c00f3a0-20231023
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1115337648; Mon, 23 Oct 2023 08:42:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Sujuan Chen <sujuan.chen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 06/11] wifi: mt76: mt7996: fix the size of struct bss_rate_tlv
Date: Mon, 23 Oct 2023 23:38:49 +0800
Message-ID: <20231023153854.10708-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023153854.10708-1-shayne.chen@mediatek.com>
References: <20231023153854.10708-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.297500-8.000000
X-TMASE-MatchedRID: jeHmhBrEiJeAy+S7L1wP4Xa57ruHAnHxSiliXIcwP3HrdFaCtcd713ln
	exxwwbXW6NDB1lA5UKvhihMBM8ipLOgU5Ipq9M1NsK+WWVTsOXVCX8V1FiRRkt9RlPzeVuQQ5zl
	dYRH+EtFEANm0QNhRHMpjK4dbPxs8HxPMjOKY7A+Wlioo2ZbGwdmzcdRxL+xwKrauXd3MZDU1Jp
	BASV0yCsAdn5jcjA5bzH9v/HFl9hYL564ITuXOf2UD8eE9N99VEkFGoocKwPG7EKDJDCCqwzvSu
	A0jF5ZL6nvl52G2VRDG7TI4kEpXzxdGg+ZY7eN6THB2Q+oKru8MTI34nyF36MJL1aANdU8KiTSg
	m8kJVKRDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.297500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BC535A2C903C5559AA5EB15258151C7F450E9186B94EFBB191206C198C0BBB412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_084211_314153_C529268E 
X-CRM114-Status: UNSURE (   9.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sujuan Chen <sujuan.chen@mediatek.com>

Align the format of struct bss_rate_tlv to the firmware.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index a2700151ee1c..d3ac6ac0e5c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -320,7 +320,7 @@ struct bss_rate_tlv {
 	u8 short_preamble;
 	u8 bc_fixed_rate;
 	u8 mc_fixed_rate;
-	u8 __rsv2[1];
+	u8 __rsv2[9];
 } __packed;
 
 struct bss_ra_tlv {
-- 
2.39.2


