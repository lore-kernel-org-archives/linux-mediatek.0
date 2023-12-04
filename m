Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E88BC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/uzFrjt8aUKTbxRLxmdKkdFySY3RzU5L+0QmsGF+qqA=; b=aH4ekWIdqbPAW27IF9cJono6dm
	U7hSfVPgzVPniXiqllFiOwBh3xH0Y8oAVGquU4rq/M6Zy5ixprA/MoPrJa8T8uC4NhPnsSEF4GLgg
	qnyWdYVlCVmfEeeHYHiK1DAaKJbMprSS/u1NW4B5etjJ2NwZA/9OG6V4rwG2MBhkIQMDiNBGReDTk
	GG4N2h+sE8ByYFQPQpBH0JpGORpKtAzUH335Tt1X6K6PB8yNoDKS5C+j82zJG6s9nkQJBnQMY5kHG
	wRZAV4sTumCJ/wkBJ26TSYnZtaKiLowiLdWwY3+BKKGaFo73tuHsZTlKjIqUm0XyjRtWREfC3ukd9
	KD+NYvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA50S-003NfO-1t;
	Mon, 04 Dec 2023 09:12:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA50P-003Nf5-1n
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 09:12:46 +0000
X-UUID: 431d5df8928511ee86758d4a7c00f3a0-20231204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/uzFrjt8aUKTbxRLxmdKkdFySY3RzU5L+0QmsGF+qqA=;
	b=YEnvCHmZ3gS12RzwrrOzj6SLxflwouk/XBuF9Q1AOfRPOs7D77wi3rSNIOfGwkV1woztgLNkLvBjKljghAAEroRM8Wlqx0hEQUwrWISzUW9K9safCjQTR5cfvzkygcDIDhjEcC8LawYjN5rQ+LmYOvrZcZsjaBGo2tF3tF47o5A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:709520f5-d34e-491b-8fbd-ee24ca9bb3c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:f21343fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 431d5df8928511ee86758d4a7c00f3a0-20231204
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 362543845; Mon, 04 Dec 2023 02:12:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Dec 2023 17:11:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Dec 2023 17:11:57 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v2] dt-bindings: net: wireless: mt76: add interrupts description for MT7986
Date: Mon, 4 Dec 2023 17:11:56 +0800
Message-ID: <20231204091156.6535-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.679900-8.000000
X-TMASE-MatchedRID: v+sphrBU45F2W20gLTzAqYei/mZCYVwuONP4Z3dggBYY0A95tjAn+/pZ
	jWQiqBlhCqcYnzgqPbt4xIuyG0zHEJDCbn5v5k09Y7jepwkpr699LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO34ZhR52Rc1au7UdPYHaiHyW5kMCPJeUiSb6ByuLYX+T07zv/KPifYCLRhCjkNLcoSRBq
	5lu6PnXv3uL/cp+ftvKHEBTVoCjqueU8bDRAXvQkma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6
	x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.679900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 34C5B0D5B06512149F2AAE3C5D7C8D78FEA92A61C60D7458B60A76B5E78195422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_011245_619262_EA12C3DC 
X-CRM114-Status: UNSURE (   9.67  )
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

The mt7986 can support four interrupts to distribute the interrupts
to different CPUs.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
v2: Change to use description instead of using items.
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 252207adbc54..933bc7bdda01 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -38,7 +38,11 @@ properties:
       MT7986 should contain 3 regions consys, dcm, and sku, in this order.
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
+    description:
+      MT7986 provides up to 4 interrupts including one primary interrupt and
+      three additional interrupts for ring 4, 5, and 19.
 
   power-domains:
     maxItems: 1
-- 
2.18.0


