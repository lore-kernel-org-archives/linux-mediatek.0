Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE87C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:26:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDF8B610C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDF8B610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYiLQUqQf3wJ+LCDVX2XGW0JZShN+EoTyNF5IOHAkFE=; b=qWfl1ZVdudtiwJ
	1BLJXYPCPJ4BbG5XygtLXFyi8v0m2WOdMZxssGTm44N5ywfWCB/rwR9Ib5sEhs395TxaWb3CtyEfj
	C1EllVZbo3oIfkFZPORkzcMrPl7euVWR3/kOBgcSnIXZ9Q7jPLC8EUf7qUVvBsNxUhoATc750MZl4
	3SieP8qwu0to2LP18k0Wo/ptB90rxMp5uqvOc9vKmSdqtecH4Hrr5Mx8N/Os885qEMihY/9kWpypM
	/mQYkKvuKjW2LUfzXyToa2Yd6kypOwZ1KdoTcMtXv8K6l/d6NBCNJRzY46eDjwYdDyIR/vsnxsxK3
	WaGUeEK+Ks7sQKdoqvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGZU-0038WM-PZ; Tue, 15 Jun 2021 21:26:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvn-001lHo-6g; Tue, 15 Jun 2021 17:32:56 +0000
X-UUID: 9e224fc64d2e4565bea085775f9a858c-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TzgPN/47im6B7EqRmjsyTszFSN91w7hOnKknoJWbW9I=; 
 b=cjt8Wr6iNUNd9A01JLizYjcCGA/CKDnojM7N2Vm6Lft0sfaJ4RX3R3CYx5WnyEAov6kGogDZPeoFf4fFu7oGrq4fgJDGOgFkYHv4/EGCacbYKTyAOENEWs5ZxNlKh7HuQXUlY4kFIkkawG3ef9Zui5Lmhyr9NMFr7ElAXUDWIVc=;
X-UUID: 9e224fc64d2e4565bea085775f9a858c-20210615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1564406615; Tue, 15 Jun 2021 10:32:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH 17/27] arm64: dts: mt8195: add merge node
Date: Wed, 16 Jun 2021 01:32:23 +0800
Message-ID: <20210615173233.26682-17-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103255_357925_C80E6FD8 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Jason-JH Lin <jason-jh.lin@mediatek.com>

add merge node

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index f362288ad828..34f7e99d1fd2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1987,6 +1987,14 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 		};
 
+		merge0: disp_vpp_merge0@1c014000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c014000 0 0x1000>;
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
 		smi_common0: smi@1c01b000 {
 			compatible = "mediatek,mt8195-smi-common";
 			mediatek,common-id = <0>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
