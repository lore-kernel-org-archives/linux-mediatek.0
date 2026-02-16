Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF14E63F2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 04:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53vcwOP/6ivmLiaxHrY0s7DSB4vFjXKU7TPf9PKg3t8=; b=gd/fVxZi52RXkFRQslZdO3pPgv
	BDXETG40DT/A/outEjFlDRcjvUOpVISsVN4ljdWPg3JMp+D9/04tSuHHE9pNJKYjC2h8bWid6AZSB
	eo/xHrGlK3osG3PMpprdEiLLTrLDMFiP58+03Ne8WeHw9sGAzrDHJ4DdDjLZYSQNtNm6r0ZtK/139
	6B9sohb7b8OdoZTKaxUZkZv2OkkvfabNSYGoidNCJ0fnrjBBIryVLoXB860YFE0/erwjon+1HSDDP
	OOHD7lyEPePMAZe1sMiPxuzO9yQ62V7AzmCO1Eh34xFrZfWE7NdASSAnZpBPuq2e5eyq27OXKYcIK
	4Unqcvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrqWF-00000005xbU-2ZHR;
	Mon, 16 Feb 2026 04:47:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrqWD-00000005xaG-1ND4
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 04:47:34 +0000
X-UUID: 991bb5a00af211f1a16f0188aa809bee-20260215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=53vcwOP/6ivmLiaxHrY0s7DSB4vFjXKU7TPf9PKg3t8=;
	b=VY/Sil4q5N8+sfTpR7xf+m4Muu8ExGX40tjJ6rwNapZlgt1rywSCK0EFsWkIm0BIUiS6xKlPnrORU7gO+ILibyPEIvXE2KCWTnUBIjqSxR4lgu+jAX5RzKosbP7dhinFgRWqr8X19yeGbSpOWID1Snp+EFVVgWFrew2FPhK3Q6w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:aaac4670-3fb2-484d-8286-dc5e46c71e2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:2f54535b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 991bb5a00af211f1a16f0188aa809bee-20260215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1964713205; Sun, 15 Feb 2026 21:47:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Feb 2026 12:47:26 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Feb 2026 12:47:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, Allen Ye <allen.ye@mediatek.com>
Subject: [PATCH v6 3/3] dt-bindings: net: wireless: mt76: clarify backoff limit usage
Date: Sun, 15 Feb 2026 20:47:20 -0800
Message-ID: <87acf1a8ab5642298c67915b3afc41e624b312a7.1771205424.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1771205424.git.ryder.lee@mediatek.com>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1771205424.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_204733_367677_37E1FBD3 
X-CRM114-Status: UNSURE (   8.89  )
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

Clarify the usage of path backoff limit properties in mt76 binding.
Add explicit documentation for old generation (mt7915, mt7916, mt7981,
mt7986) and new generation (mt7990, mt7992, mt7996) devices, including
the difference in beamforming and non-beamforming entries.

Rephrase the paths-ru/paths-ru-bf description to make them more precise.

Co-developed-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v4:
- revise commit message
- use PCI id as the compatible string to replace "connac2/3"

v5: fix missing starting space in comment(comments)
v6: separate commits with their own separate rationale
---
 .../bindings/net/wireless/mediatek,mt76.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 72cc30251..20b868f7d 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -257,6 +257,14 @@ properties:
                       followed by 10 power limit values. The order of the
                       channel resource unit settings is RU26, RU52, RU106,
                       RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                      - For mt7981/mt7986/mt7915/mt7916
+                        - Beamforming entries for BW20~BW160 and OFDM do not
+                          include 1T1ss.
+                        - When 1T1ss is not used, it should be filled with 0.
+                      - For mt7996/mt7992/mt7990
+                        - Beamforming entries for BW20~BW160 and RU include
+                          1T1ss, but OFDM does not include 1T1ss.
+                        - 1T1ss is taken into account, so no need to fill with 0.
                     minItems: 1
                     maxItems: 7
                     items:
@@ -275,6 +283,14 @@ properties:
                       followed by 10 power limit values. The order of the
                       channel resource unit settings is RU26, RU52, RU106,
                       RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                      - For mt7981/mt7986/mt7915/mt7916
+                        - Beamforming entries for BW20~BW160 and OFDM do not
+                          include 1T1ss.
+                        - When 1T1ss is not used, it should be filled with 0.
+                      - For mt7996/mt7992/mt7990
+                        - Beamforming entries for BW20~BW160 and RU include
+                          1T1ss, but OFDM does not include 1T1ss.
+                        - 1T1ss is taken into account, so no need to fill with 0.
                     minItems: 1
                     maxItems: 7
                     items:
-- 
2.45.2


