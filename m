Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309EC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 03:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kTgTkueAWh7NER3IUD5AtbXyExYUw57i9W/taVr4hss=; b=DL5roYFOejl8uVjyuGQYiOhwFW
	h1w6vyu38LVjohxa6AAlou1nv2kpxyhhEvuJtjTE5FkLC3qLT00xxlrp9BVD2iJrbKykJj2TeNAyI
	X2QNNSbrhV/IZrTg2yf7GrlOSpfaQIksDlIN4Xj4v9toBhm2w0j3kNlpqmoX4PC6AKI0YaLhvO1je
	eaA5mOcrpW98i8fBnu66lTbt2kxZa+It3HL0Na3fzlNqzXMAnYKkUPhE/ddji+U5s0dE5kNzQW3YV
	9WfeTAfTJJo03umZ/xGf6CHAarPzTwJ5EJcROfR4I8HaXpycJ3ZYhBPSxeYO9eq5z92h0b0RSp9Rj
	oQy8dpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ24p-006IBe-RX; Fri, 16 Sep 2022 03:31:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ24n-006IAB-KV; Fri, 16 Sep 2022 03:31:38 +0000
X-UUID: 6fbae5522f784bee85927744d07e68e1-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kTgTkueAWh7NER3IUD5AtbXyExYUw57i9W/taVr4hss=;
	b=lgXXbQq/UxV7lxi/Y9ce/QYHq/PU6o82w/MM8VGZlBCUYtl8PQlontaT9QBt63RRj8YWXGbxWfYPwjx6ayZTWcSw6bNqpwdCLcl+4VvAZZ/sygbs/Xxr3+ZHJaW7rRHsLAzQLVaZjxibJKBQj9AgctIRDNQfWKMawOgXkTFBlGQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b98b5b15-4158-4029-8aee-fa416be04170,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:97dfd75d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6fbae5522f784bee85927744d07e68e1-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 522377974; Thu, 15 Sep 2022 20:31:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 16 Sep 2022 10:51:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 10:51:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v3 0/4] Add dp-intf and dp nodes
Date: Fri, 16 Sep 2022 10:50:55 +0800
Message-ID: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_203137_701056_6730C0C6 
X-CRM114-Status: UNSURE (   6.60  )
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

This series add MediaTek dp-intf nodes and dp nodes.
This series is based on linux-next-20220915.

Changes for v3:
1. Update commit message for "arm64: dts: mediatek: cherry: Add edptx and dptx support".

Changes for v2:
1. Update commit messages.
2. reorder the place of "status = "disabled";"
3. reorder the place of dp-intf.

Bo-Chen Chen (4):
  arm64: dts: mt8195: Add dp-intf nodes
  arm64: dts: mt8195: Add edptx and dptx nodes
  arm64: dts: mediatek: cherry: Add dp-intf ports
  arm64: dts: mediatek: cherry: Add edptx and dptx support

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 86 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 48 +++++++++++
 2 files changed, 134 insertions(+)

-- 
2.18.0


