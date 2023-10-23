Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DFEC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 04:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nBOwBADosCE0laOtnAK0L9ej3kKDQodffYRoyom3d4=; b=sX2IYpc78wc0ZlKmARzCfaVfpM
	2MTb/LHikwczFt38RuLt/jZbqMtBL+utPSNwzvvkdsRhgWHljixSAjSKgQt4Xk+awiyNuUplrhUnJ
	iqxAbIDvmg3aqmNoYQcrYDBoowxi9OVPHNUmAcO+TnwJY2uKGLflF6A027Md237Ub31/wSEK1qCQI
	LeYeCBtTreE3NA4MT1IhLvAeCY2H7QgVJj6mCEbx/fIRqrEUGWR4fDpCb9O4clYwQah3rH8e/34z7
	kTO8rKs5VUDIKlEc1aLXDajrMKZWYm3E+7Nqo3MvwTfEqDqeWRXmmUAtRhIQb6sBJPVBGVZypbQs0
	k2npky5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qumhj-006Oc8-04;
	Mon, 23 Oct 2023 04:38:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qumhY-006OYm-2I;
	Mon, 23 Oct 2023 04:38:06 +0000
X-UUID: f0cdfdf2715d11ee86758d4a7c00f3a0-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5nBOwBADosCE0laOtnAK0L9ej3kKDQodffYRoyom3d4=;
	b=qbpDe39Kbe9erBOql0tHxvYRI8/DitqBpxCcjYtFchJe/1lm2SDX0PrvT3bv9U1KxHP916nFC6oarkCT0b4Kanv1bwbDuWMJhysgZXG0BuT+wKCv/6WAVJjceitT3hpfgpzFHBjleL8gYWhilRNbcvj2kzXKK1PjiPm+pREpGK4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:683688e9-08f3-46d7-bbed-7e812490ef5a,IP:0,U
	RL:0,TC:0,Content:41,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:41
X-CID-META: VersionHash:5f78ec9,CLOUDID:707731d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f0cdfdf2715d11ee86758d4a7c00f3a0-20231022
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 179249380; Sun, 22 Oct 2023 21:37:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:37:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, "Johnson
 Wang" <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 2/9] dt-bindings: mailbox: Add property for CMDQ secure driver
Date: Mon, 23 Oct 2023 12:37:44 +0800
Message-ID: <20231023043751.17114-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.522000-8.000000
X-TMASE-MatchedRID: y/MOm6ldwRIXSulpnju2H6wxbZnudyr7uLwbhNl9B5ULsYGwWRkFSmlF
	7OhYLlctSBg3ErWyNT+PwmjRI+95a5rTfAGXhNOwTVa+L3Zgqc59LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO2i5u/VvsFaHTsYKoZqBjyBCz8kvCpjUFQQyeIABkT72SV6AZY42TeLs2goH+0UPJS5sz
	pSRKsJSjbRPLz0bRf2+uyaDsGpB7/U1sBtGzC0lHZrUbEZipAEiWT09mQz7szw9kH8zAy44aOuV
	Lnx3A74
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.522000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 90C735ACB7A7C027BB46F382C2C4F23A60860207BC61CDEDC5264774F324D8CA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_213804_749414_89CD61FF 
X-CRM114-Status: GOOD (  10.26  )
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

Add mboxes to define a GCE loopping thread as a secure irq handler.
Add mediatek,gce-events to define a GCE event siganl sent from CMDQ
TA driver in secure world as a secure irq.

These 2 properties are required for CMDQ secure driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/mailbox/mediatek,gce-mailbox.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..65fb93bb53b6 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -49,6 +49,16 @@ properties:
     items:
       - const: gce
 
+  mboxes:
+    maxItems: 1
+
+  mediatek,gce-events:
+    description:
+      The event id which is mapping to the specific hardware event signal
+      to gce. The event id is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 required:
   - compatible
   - "#mbox-cells"
-- 
2.18.0


