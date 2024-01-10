Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609D6C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 06:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vjXmLIHryISHRUtxh9pi1TfFi3d26ZfU2q7c/DnXizk=; b=WVz8r6JWe7GuwlvC5ZfwC60DR/
	hAudJXEgzXvqPHCSmGme9RpkVwxbbuzVibJcmeQQqDuUUXauCKQkjzqqcq0lULm7Xz0xykQQXs+T1
	4fUFJjf7nzCd619kpg34tJJWhJXDXjIvxFgKRKqH3wCk+Dd+c+GSr+OIs3wZYUkjiofXtXIg1+/jm
	koVaDEzFrSHpR5+8olv98fI6xYOQ0T3NxsHs2w1ifogU4SNPBQ01XeeWL6b5sw/v9o9HvQgfRytQX
	dwoAK1GnXm71ELR7B1v9ccJrL9C1zT/6gkdRDVSrW6ENPBq5Mrgk+Gv2KeklnTtKcfstDUsaKE5W9
	qHSeDXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSCD-00AUuC-0Q;
	Wed, 10 Jan 2024 06:36:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSC9-00AUsZ-3A;
	Wed, 10 Jan 2024 06:36:11 +0000
X-UUID: 8877a1aaaf8211eeafd70d0b34820190-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vjXmLIHryISHRUtxh9pi1TfFi3d26ZfU2q7c/DnXizk=;
	b=e2bvmJf6QlTMi0DG0+KpCdyxHsVjVLVxclrIdn3/znMIjcty5AEytCwcqVHOCrPaLFmuRrVelAxB5TC28wD2dzxqDvHpL/sRdb4fN6+fDLQftlhfFvSd4UfQBmRYvdFRoIPpCo9Xxe1G7ze8T6EPhSDNeoFVrdrL4Zi9XCGFzOQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:bf07ee47-e0c3-4284-852c-87d0c62968ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:b2c22f7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8877a1aaaf8211eeafd70d0b34820190-20240109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1680620576; Tue, 09 Jan 2024 23:36:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v2 0/4] Add mediatek,gce-props.yaml for other bindings reference mediatek,gce-events
Date: Wed, 10 Jan 2024 14:35:28 +0800
Message-ID: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_223610_028174_FF6565FA 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since mediatek,gce-events property is a HW event signal to GCE,
it can be used for both mailbox producers and consumers.

Add a new mediatek,gce-props.yaml to define this kind of GCE properties
and move mediatek,gce-events property existed in other bindings
to reference mediatek,gce-props.yaml.

Jason-JH.Lin (4):
  dt-bindings: mailbox: Add mediatek,gce-props.yaml
  dt-bindings: mailbox: mediatek: gce-mailbox: Add reference to
    gce-props.yaml
  dt-bindings: media: mediatek: mdp: Change mediatek,gce-events to
    reference
  dt-bindings: soc: mediatek: Change mediatek,gce-events to refernece

 .../mailbox/mediatek,gce-mailbox.yaml         |  6 ++-
 .../bindings/mailbox/mediatek,gce-props.yaml  | 41 +++++++++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 11 ++---
 .../bindings/media/mediatek,mdp3-rsz.yaml     | 12 ++----
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 12 ++----
 .../bindings/soc/mediatek/mediatek,ccorr.yaml | 12 ++----
 .../bindings/soc/mediatek/mediatek,mutex.yaml | 11 ++---
 .../bindings/soc/mediatek/mediatek,wdma.yaml  | 12 ++----
 8 files changed, 67 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

-- 
2.18.0


