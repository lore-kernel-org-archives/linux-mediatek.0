Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F5DC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcCbFNmFcDjwLfDNroezfdb2otTHOVj9cqaCJYHFNhE=; b=1mHfvRrY2puNoUXSG4Xily/6H5
	FkHAelO0SqcYo42MdCXTXJRhC03iukVSxC0XE61+QqkFvO/4y72S2CJB2LjGlokC0hWQ0zDxl02ww
	2cPiB2YEqy9+2zYTsoIHtg9nuqRrOxvoLlRLvEF+EtpfzjCr4QtfpZrX8T2pd9s0lPKglRQ168Deu
	s5mNLCiVLfwT5QY9fM9iKQO5kefv43R+3C8vEXfkkHsmkJNh8iH9NJN86YLn+hIbmIzC5HLSe7hgM
	MIBdaOism7lQhH6LcKdJijFFZOj4kilhaJcuja3xEhtaZwjzOF59MmDqi5wjIL+sLoN4LbqXR40c0
	3/pDVUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSC1-00AUoN-2O;
	Wed, 10 Jan 2024 06:36:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSBy-00AUmq-2z;
	Wed, 10 Jan 2024 06:36:00 +0000
X-UUID: 812652fcaf8211eeafd70d0b34820190-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lcCbFNmFcDjwLfDNroezfdb2otTHOVj9cqaCJYHFNhE=;
	b=j0ZyMil9PVCSqZ9LqVklLMgmoPOQPflW/GrCgY/CD2t4uhrzcj2lF4MS4c9DuEdwr2r0ETC0ubBhCHIxj+l2zjlXbTJIykGeEnWeWA+VS8Y81By+RDlWMx/z9spEqrXjylBlyafqYLZMR2psiF0E7eS0BHpN29GMgqwCaFPsjAc=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.35,REQID:f48ae767-7370-4dc3-a23c-d32bd6167435,IP:0,U
	RL:25,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
	TION:quarantine,TS:125
X-CID-META: VersionHash:5d391d7,CLOUDID:80ac168e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 812652fcaf8211eeafd70d0b34820190-20240109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 89176522; Tue, 09 Jan 2024 23:35:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jan 2024 14:35:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jan 2024 14:35:33 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 2/4] dt-bindings: mailbox: mediatek: gce-mailbox: Add reference to gce-props.yaml
Date: Wed, 10 Jan 2024 14:35:30 +0800
Message-ID: <20240110063532.14124-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
References: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.735000-8.000000
X-TMASE-MatchedRID: y/MOm6ldwRK5u1dzaqGIEwPZZctd3P4BKhNpTcvbdUJa2Ghz+vIal7l+
	75cRptKm8izX0ZvrybNpuwczjzvbdUBduJGafVsPngIgpj8eDcCbifj2/J/1cS8z+bJ2nm9UKra
	uXd3MZDWHa3kXaoLg85MEyCAdbSnUTBw+1q+L/poFcTh9oTEFS2weV3hBhNXz31op4IqnOD3MfH
	kOT6w0ZV8j6O98Ee9zo7hK7NXLqvRBLAb/FTpmUnQE0HbT5LEft/yYljnuhl10loENhqV3WYc7S
	1VgNXhPQwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.735000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2D8C7380F05ECC953BF4EE69CDC11939361AFA394D3B83209CFBD993FB8E7A102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_223558_967274_2198E9F7 
X-CRM114-Status: GOOD (  10.64  )
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

1. Add "Provider" to the title to make it clearer.
2. Add reference to gce-props.yaml for adding mediatek,gce-events property.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..728dc93117a6 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek Global Command Engine Mailbox
+title: MediaTek Global Command Engine Mailbox Provider
 
 maintainers:
   - Houlong Wei <houlong.wei@mediatek.com>
@@ -57,6 +57,8 @@ required:
   - clocks
 
 allOf:
+  - $ref: mediatek,gce-props.yaml
+
   - if:
       not:
         properties:
@@ -67,7 +69,7 @@ allOf:
       required:
         - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.18.0


