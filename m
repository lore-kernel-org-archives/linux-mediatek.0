Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E34EB26F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 18:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wg/Oi6VHdbF/mO8kslgQtkzQWmy64Pp0f5I510coWc=; b=HUL/2TEbmG3YH4pS6mC8wDzzhy
	zTVqpUR0rcDFnc7aaORinELRHZ5HcUXf4dU+V+hY6AaWUbDvCnzhijgGwi9yipZ3gyiCwp75eR0jp
	s9GSfGhpNSDmtLP9NFRdITzm3ZCyzcQaJ7tpF432ec5CLtNDl23IpgV+p2kVuQcW6Q7oNT9+aLeBi
	9yNhdRj89Ssj5GbJxDi92vu3zy3bifky/LjAuL1fKNdw+Y7wTWdlY0JjlHM8pdLxWZr9Lnvo6I5Gl
	hfPPSNN73mosXO0/M/ZxDH5zysmGXkRUG50ehozAM5zPpnLmXPqjxPOl0PkylCRA3opqGgmA5mTLY
	qaudNLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsAq-0000000HNyc-0qHT;
	Tue, 10 Feb 2026 18:09:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsAo-0000000HNxx-1Wgs
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 18:09:19 +0000
X-UUID: 9b0b39f806ab11f1ad39f32c34db0b1c-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1Wg/Oi6VHdbF/mO8kslgQtkzQWmy64Pp0f5I510coWc=;
	b=pUINwEDgHjyyf/lvSt2YxL3zsaM/KrEpnAh5fSPPdgz2KM0+Nq3Frxk46lxZ9uOB/blCIGebsZOS9bcfAGH+7erZ74IVZDVb21MHKiA9BuDfGFDZUg2SyqRd8aoUEZEKyigAtfbHYbpdbP49spH8xrt35FcAskXmwaddMOQaKQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:e65986eb-1bb7-4ef0-b4d1-6d4ac641bab8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:10b58cf0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b0b39f806ab11f1ad39f32c34db0b1c-20260210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1555714238; Tue, 10 Feb 2026 11:09:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Feb 2026 02:09:11 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Feb 2026 02:09:10 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Allen
 Ye <allen.ye@mediatek.com>
Subject: [PATCH v3 2/2] dt-bindings: net: wireless: mt76: clarify backoff limit format
Date: Tue, 10 Feb 2026 10:08:56 -0800
Message-ID: <69521aebefef405bad5117d4d5d5fef4a5dfb7e8.1770746444.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770746444.git.ryder.lee@mediatek.com>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770746444.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_100918_418732_C62695DC 
X-CRM114-Status: UNSURE (   8.78  )
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

Clarify the format of path backoff limit properties in mt76 binding.
Add explicit documentation for connac2 (mt7915, mt7981, mt7986) and
connac3 (mt7990, mt7992, mt7996...) devices, including the difference
in beamforming and non-beamforming entries.

Also reformat the description to make is more precise.

Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Co-developed-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc..4156e1c97 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -252,6 +252,16 @@ properties:
                       followed by 10 power limit values. The order of the
                       channel resource unit settings is RU26, RU52, RU106,
                       RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                      - For connac2
+                        - Beamforming entries for BW20~BW160 and OFDM do not
+                          include 1T1ss.
+                        - When 1T1ss is not used, it should be filled with 0.
+                      - For connac3
+                        - Beamforming entries for BW20~BW160 and RU include
+                          1T1ss, but OFDM does not include 1T1ss.
+                        - 1T1ss is taken into account, so no need to fill with 0.
+                      Non-beamforming and RU entries for both connac2 and
+                      connac3 include 1T1ss.
                     minItems: 1
                     maxItems: 7
                     items:
@@ -270,6 +280,16 @@ properties:
                       followed by 10 power limit values. The order of the
                       channel resource unit settings is RU26, RU52, RU106,
                       RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                      - For connac2
+                        - Beamforming entries for BW20~BW160 and OFDM do not
+                          include 1T1ss.
+                        - When 1T1ss is not used, it should be filled with 0.
+                      - For connac3
+                        - Beamforming entries for BW20~BW160 and RU include
+                          1T1ss, but OFDM does not include 1T1ss.
+                        - 1T1ss is taken into account, so no need to fill with 0.
+                      Non-beamforming and RU entries for both connac2 and
+                      connac3 include 1T1ss.
                     minItems: 1
                     maxItems: 7
                     items:
-- 
2.45.2


